#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2432 = false;
    bool _1086 = false;
    bool _752 = false;
    bool _464 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    float _110 = _108;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_102)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3105 = as_type<float>(_116);
        out.gl_Position.z = _3105;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    int _150 = 0;
    if (_144)
    {
        float _152 = _148 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3175 = as_type<float>(_154);
        out.gl_Position.z = _3175;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_51.w;
    float _158 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = _158;
    if (!_168)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _106 = _186;
    }
    float _188 = _106;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_168;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _158 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _158);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_168;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _158 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _170, _258);
    float _266 = fma(_254, _172, _260);
    float _268 = fma(_254, _174, _262);
    float _270 = fma(_264, _156, _176);
    float _272 = fma(_266, _156, _178);
    float _274 = fma(_268, _156, _180);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _132 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = 1.0 / _340;
    float _360 = -_356;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = _336 * _362;
    float _368 = -_336;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _344;
    float _374 = _308 * _358;
    float _376 = -_320;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _356 * _378;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _324 * _372;
    float _398 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _394 * _366;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _398 * _366;
    float _410 = _400 * _366;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _422 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _424 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_406, _396, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_418, _396, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _432 = fma(_424, _384, _420);
    float _434 = fma(_426, _384, _422);
    float _436 = fma(_428, _384, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_364;
    float _462;
    if (!_444)
    {
        float _446 = in.m_53.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_98);
        float _468 = 1.0 / _466;
        float _470 = _132 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_51.x;
    float _476 = in.m_51.y;
    float _478 = in.m_51.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _482 = _472 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = 1.0 / _486;
    float _502 = 1.0 / _494;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _472 + _504;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _510 = 1.0 / _490;
    float _512 = _442 * _478;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = _472 + _514;
    float _518 = _506 * _500;
    float _520 = _440 * _476;
    bool _522 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _524 = isnan(_472);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _472 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _538;
    float _542 = 1.0 / _498;
    float _544 = _516 * _502;
    bool _546 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _548 = isnan(_472);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -_532;
    float _560 = _558 + 1.0;
    float _562 = fma(_540, _518, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _564 = _438 * _474;
    float _566 = _536 * _510;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _568;
    float _572 = _556 * _560;
    float _574 = -_556;
    float _576 = _574 + 1.0;
    bool _578 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _580 = isnan(_472);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = fma(_570, _518, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _592 = _482 * _542;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _594;
    bool _598 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _600 = isnan(_472);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_596, _518, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _612 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _614 = isnan(_472);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -_608;
    float _626 = _624 + 1.0;
    float _628 = _608 * _576;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _638 = _622 * _626;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = fma(_636, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _650 = fma(_632, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _652 = _588 * _642;
    float _654 = fma(_646, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _656 = -_588;
    float _658 = _656 + 1.0;
    float _660 = _590 * _652;
    float _662 = _562 * _652;
    float _664 = _610 * _652;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _666;
    float _670 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].x, _660);
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].y, _662);
    float _674 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].z, _664);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _680;
    float _684 = fma(_668, _544, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _686 = fma(_648, _638, _670);
    float _688 = fma(_654, _638, _674);
    float _690 = fma(_678, _544, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _692 = fma(_650, _638, _672);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _702 = fma(_682, _544, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _708 = fma(_684, _628, _686);
    float _710 = fma(_696, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _712 = fma(_700, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _714 = fma(_690, _628, _692);
    float _716 = fma(_706, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _718 = fma(_702, _628, _688);
    float _720 = fma(_710, _572, _708);
    float _722 = fma(_712, _572, _714);
    float _724 = fma(_716, _572, _718);
    float _726 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].x, _720);
    float _728 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].y, _722);
    float _730 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].z, _724);
    bool _732 = !_508;
    float _750;
    if (!_732)
    {
        float _734 = in.m_53.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_98);
        float _756 = 1.0 / _754;
        float _758 = _132 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _760 + _762;
    float _766 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _768 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _770 = isnan(_760);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _784 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _796;
    bool _800 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _802 = isnan(_760);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_778;
    float _814 = _812 + 1.0;
    float _816 = 1.0 / _782;
    bool _818 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _820 = isnan(_760);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -_810;
    float _832 = _830 + 1.0;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _838 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _840 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _842 = 1.0 / _836;
    float _844 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _848 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _850 = _798 * _816;
    float _852 = -_794;
    float _854 = _852 + 1.0;
    float _856 = _794 * _814;
    bool _858 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_760);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = fma(_850, _764, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _872 = _810 * _854;
    float _874 = _828 * _832;
    float _876 = -_828;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _884 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _886 = isnan(_760);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = _868 * _878;
    float _898 = -_868;
    float _900 = _898 + 1.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _908 = isnan(_760);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _882;
    float _920 = _894 * _900;
    float _922 = -_894;
    float _924 = _922 + 1.0;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _930 = _916 * _924;
    float _932 = 1.0 / _904;
    float _934 = _928 * _842;
    float _936 = -_916;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _944;
    float _948 = 1.0 / _942;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _954 = _870 * _930;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _958 = _760 + _956;
    float _960 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _966 = 1.0 / _952;
    float _968 = fma(_934, _958, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _970 = _946 * _932;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _974 = _760 + _972;
    float _976 = fma(_968, _920, _960);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _980 = _760 + _978;
    float _982 = fma(_970, _974, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _984 = 1.0 / _964;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _998 = _988 * _918;
    float _1000 = fma(_982, _896, _976);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1004 = _760 + _1002;
    float _1006 = _992 * _966;
    float _1008 = fma(_998, _980, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _1010;
    bool _1014 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _1016 = isnan(_760);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _996 * _948;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1030 = _760 + _1028;
    float _1032 = fma(_1006, _1004, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1034 = fma(_1008, _874, _1000);
    float _1036 = _1012 * _984;
    float _1038 = fma(_1026, _1030, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1040 = -_1024;
    float _1042 = _1040 + 1.0;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1046 = _760 + _1044;
    float _1048 = fma(_1032, _872, _1034);
    float _1050 = _778 * _1042;
    float _1052 = fma(_1036, _1046, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _1054 = fma(_1038, _856, _1048);
    float _1056 = fma(_1052, _1050, _1054);
    float _1058 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[122].x, _1056);
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _844;
    out.m_55.y = _846;
    out.m_55.z = _1058;
    out.m_55.w = _1062;
    bool _1064 = !_848;
    float _1066 = _844;
    float _1084;
    if (!_1064)
    {
        float _1068 = in.m_53.x;
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1072 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1076 = _1074 * _1070;
        float _1078 = floor(_1076);
        float _1080 = -_1078;
        float _1082 = _1076 + _1080;
        _1084 = _1082;
        _1066 = _1076;
        _1086 = true;
    }
    else
    {
        float _1088 = float(_98);
        float _1090 = 1.0 / _1088;
        float _1092 = _132 * _1090;
        _1084 = _1092;
    }
    _1086 = false;
    float _1094 = _1084;
    float _1096 = _1066;
    float _1098 = in.m_53.w;
    float _1100 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1102 = in.m_57.x;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1110 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1100);
    float _1112 = in.m_53.x;
    float _1114 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1116 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1108);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_57.y;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    float _1128 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1132 = _1130 != 0;
    float _1134 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1114);
    float _1136 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1138 = log2(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1142 = _1094 + _1140;
    float _1144 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1128);
    bool _1146 = _1098 > 0.5;
    float _1148 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1158 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1148);
    int _1160 = as_type<int>(_1148);
    float _1162 = _1096;
    float _1164 = _1102;
    if (_1106)
    {
        float _1166 = -_1102;
        float _1168 = _1166 + 1.0;
        _1160 = as_type<int>(_1168);
    }
    int _1170 = _1160;
    float _1172 = 1.0 / _1152;
    bool _1174 = false;
    if (_1106)
    {
        bool _1176 = _1112 > 0.5;
        _1174 = _1176;
    }
    bool _1178 = _1174;
    float _1180 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    if (!_1106)
    {
        _1162 = _1102;
    }
    float _1182 = _1162;
    float _1184 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1158);
    float _1186 = _1182;
    if (_1106)
    {
        float _1188 = _1178 ? as_type<float>(_1170) : _1102;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1134);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1206;
    float _1210 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1116);
    float _1212 = in.m_53.z;
    float _1214 = 1.0 / _1156;
    float _1216 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1110);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1222 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1180);
    float _1224 = _1142 * _1172;
    float _1226 = in.m_53.y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1230 = _1094 + _1228;
    float _1232 = 1.0 / _1208;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1236 = _1094 + _1234;
    float _1238 = _1138 * _132;
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1244 = _1094 + _1242;
    float _1246 = 1.0 / _1220;
    float _1248 = _1230 * _1214;
    float _1250 = -_1122;
    float _1252 = _1250 + 1.0;
    float _1254 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1240);
    int _1256 = 0;
    float _1258 = _1122;
    bool _1260 = _1132;
    if (_1120)
    {
        float _1262 = -_1102;
        float _1264 = _1262 + 1.0;
        _1256 = as_type<int>(_1264);
    }
    int _1266 = _1256;
    float _1268 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1144);
    float _1270 = _1236 * _1232;
    float _1272 = _1212 * 2.0;
    float _1274 = exp2(_1238);
    int _1276 = _1146 ? as_type<int>(_1252) : as_type<int>(_1122);
    float _1278 = _1112 * 2.0;
    bool _1280 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1282 = isnan(1.0);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1288 = _1284 || _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1292 = 1.0 + _1290;
    float _1294 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1254);
    float _1296 = _1244 * _1246;
    float _1298 = _1226 * 2.0;
    float _1300 = floor(_1272);
    float _1302 = _1226 + _1212;
    float _1304 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    bool _1306 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1308 = isnan(_1094);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1302 + (-1.0);
    float _1320 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1222);
    float _1322 = 1.0 / _1292;
    float _1324 = -_1274;
    float _1326 = _1324 + 1.0;
    float _1328 = -_1316;
    float _1330 = _1328 + 1.0;
    float _1332 = _1184 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _1334 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1336 = isnan(_1094);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1348 = floor(_1278);
    float _1350 = _1126 ? as_type<float>(_1276) : _1122;
    float _1352 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1354 = _1226 > 0.5;
    float _1356 = _1112 + _1226;
    float _1358 = -_1344;
    float _1360 = _1358 + 1.0;
    float _1362 = _1304;
    float _1364 = _1346;
    if (_1132)
    {
        float _1366 = _1354 ? _1252 : _1122;
        _1258 = _1366;
    }
    float _1368 = _1258;
    float _1370 = floor(_1298);
    if (_1120)
    {
        bool _1372 = _1212 > 0.5;
        _1260 = _1372;
    }
    bool _1374 = _1260;
    float _1376 = _1356 + (-1.0);
    bool _1378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    float _1388 = _1192 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    if (_1120)
    {
        float _1390 = _1374 ? as_type<float>(_1266) : _1102;
        _1164 = _1390;
    }
    float _1392 = _1164;
    float _1394 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1396 = _1300 > 0.0;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1398;
    bool _1402 = _1300 >= 0.0;
    bool _1404 = isnan(_1300);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = sqrt(_1268);
    float _1414 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1416 = _1386 ? _1326 : 0.0;
    bool _1418 = _1348 >= 0.0;
    bool _1420 = isnan(_1348);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.0);
    bool _1426 = _1422 || _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    if (_1288)
    {
        float _1436 = _1416 * _1322;
        _134 = _1436;
    }
    float _1438 = _134;
    bool _1440 = _1348 > 0.0;
    float _1442 = fma(_1430, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1444 = _1410 ? 0 : 1;
    float _1446 = fma(_1434, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1448 = _1426 ? 0 : 1;
    float _1450 = sqrt(_1320);
    float _1452 = _1412 * _1332;
    bool _1454 = _1370 > 0.0;
    bool _1456 = _1370 >= 0.0;
    bool _1458 = isnan(_1370);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1474 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1476 = isnan(_1094);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = fma(_1468, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1488 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1490 = isnan(_1094);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1472, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1514 = fma(_1502, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1516 = fma(_1506, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1518;
    float _1522 = _1316 * _1510;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1524;
    float _1528 = fma(_1400, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1530 = fma(_1520, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1532 = _1344 * _1330;
    float _1534 = fma(_1526, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1536 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1538 = isnan(_1094);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1556 = sqrt(_1294);
    float _1558 = _1450 * _1304;
    float _1560 = -_1546;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1550, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1566 = _1546 * _1360;
    float _1568 = fma(_1554, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1570 = _1498 * _1562;
    float _1572 = -_1498;
    float _1574 = _1572 + 1.0;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1578 = _1576 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1580 = _1442 * _1570;
    float _1582 = _1514 * _1570;
    float _1584 = _1486 * _1570;
    int _1586 = ~_1444;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1580);
    float _1594 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1582);
    float _1596 = _1556 * _1346;
    int _1598 = _1464 ? 0 : 1;
    float _1600 = fma(_1446, _1566, _1592);
    float _1602 = fma(_1516, _1566, _1594);
    float _1604 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1584);
    float _1606 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = fma(_1530, _1532, _1600);
    bool _1610 = !_1204;
    int _1612 = _1610 ? 0 : 1;
    float _1614 = fma(_1512, _1566, _1604);
    int _1616 = ~_1448;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = fma(_1578, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _1624 = ~_1598;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    float _1630 = fma(_1528, _1532, _1614);
    int _1632 = _1590;
    int _1634 = _1620;
    int _1636 = _1628;
    if (!_1396)
    {
        int _1638 = ~_1444;
        int _1640 = _1638 + 1;
        _1632 = _1640;
    }
    int _1642 = _1632;
    float _1644 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1440)
    {
        int _1646 = ~_1448;
        int _1648 = _1646 + 1;
        _1634 = _1648;
    }
    int _1650 = _1634;
    float _1652 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1454)
    {
        int _1654 = ~_1598;
        int _1656 = _1654 + 1;
        _1636 = _1656;
    }
    int _1658 = _1636;
    float _1660 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    bool _1662 = !_1196;
    int _1664 = _1662 ? 0 : 1;
    float _1666 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1652);
    bool _1668 = !_1200;
    int _1670 = _1668 ? 0 : 1;
    float _1672 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1644);
    int _1674 = abs(_1612);
    float _1676 = fma(_1534, _1532, _1602);
    int _1678 = abs(_1664);
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1666);
    int _1682 = abs(_1670);
    float _1684 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1660);
    float _1686 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1672);
    float _1688 = in.m_59.x;
    float _1690 = in.m_59.y;
    float _1692 = in.m_59.z;
    float _1694 = float(_1678);
    float _1696 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1680);
    float _1698 = float(_1642);
    float _1700 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1684);
    float _1702 = float(_1674);
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1706 = float(_1658);
    float _1708 = _1694 * _1698;
    float _1710 = float(_1682);
    float _1712 = fma(_1564, _1522, _1608);
    float _1714 = float(_1650);
    float _1716 = _1702 * _1706;
    float _1718 = fma(_1622, _1522, _1676);
    float _1720 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1686);
    float _1722 = _1708 * (-2.0);
    float _1724 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = _1704 + _1726;
    float _1730 = _1710 * _1714;
    float _1732 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1712);
    float _1734 = fma(_1394, _1722, _1394);
    float _1736 = fma(_1568, _1522, _1630);
    float _1738 = _1720 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1724 + _1740;
    float _1744 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1748 = fma(_1722, _1688, _1688);
    float _1750 = _1730 * (-2.0);
    float _1752 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1736);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1738 + _1754;
    float _1758 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1744);
    float _1760 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1718);
    float _1762 = fma(_1750, _1690, _1690);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1758);
    float _1768 = _1112 + (-0.5);
    float _1770 = _1226 + (-0.5);
    float _1772 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1774 = fma(_1352, _1750, _1352);
    bool _1776 = _1766 >= 0.0;
    float _1778 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1748);
    float _1780 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1782 = _1728 * _1728;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1786 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1762);
    float _1788 = _1780 * _1746;
    float _1790 = fma(_1742, _1742, _1782);
    float _1792 = _1732 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1794 = _1772 * _1764;
    float _1796 = fma(_1756, _1756, _1790);
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1800 = _1762;
    if (_1776)
    {
        _1800 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1802 = _1800;
    float _1804 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1806 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1808 = _1760 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1810 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1814 = rsqrt(_1796);
    float _1816 = _1414 * _1784;
    float _1818 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1822 = as_type<int>(_1802);
    if (_1776)
    {
        float _1824 = _1802 * 5.0;
        _1822 = as_type<int>(_1824);
    }
    int _1826 = _1822;
    float _1828 = fma(_1734, _1438, _1778);
    if (_1776)
    {
        out.m_47.x = 0.0;
    }
    float _1830 = fma(_1774, _1438, _1786);
    float _1832 = _1804 * _1798;
    out.m_61.x = _1810;
    out.m_61.y = _1818;
    out.m_61.z = _1820;
    out.m_61.w = _1812;
    float _1834 = _1828 * 0.15915493667125701904296875;
    out.m_63.x = _1788;
    out.m_63.y = _1816;
    out.m_63.z = _1832;
    out.m_63.w = _1794;
    float _1836 = _1728 * _1814;
    float _1838 = _1742 * _1814;
    float _1840 = _1838;
    if (_1776)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5919 = as_type<float>(_1826);
        out.gl_Position.z = _5919;
    }
    if (_1776)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1842 = -_1836;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1846 = _1756 * _1814;
    float _1848 = -_1838;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1852 = _1112 + _1212;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1856 = _1844 + _1854;
    float _1858 = -_1846;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1850 + _1862;
    float _1866 = _1852 + (-1.0);
    float _1868 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1872 = _1860 + _1870;
    float _1874 = _1716 * (-2.0);
    float _1876 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1868);
    float _1880 = _1212 + (-0.5);
    float _1882 = -_1836;
    float _1884 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1728);
    float _1886 = -_1838;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1742);
    float _1890 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1878);
    float _1892 = fma(_1874, _1692, _1692);
    float _1894 = fma(_1876, _1874, _1876);
    float _1896 = _1830 * 0.15915493667125701904296875;
    float _1898 = _1834 * 6.283185482025146484375;
    float _1900 = sin(_1898);
    float _1902 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1892);
    bool _1904 = _1890 >= 0.0;
    float _1906 = -_1846;
    float _1908 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1910 = fma(_1894, _1438, _1902);
    float _1912 = _1884 * _1884;
    float _1914 = _1834 * 6.283185482025146484375;
    float _1916 = cos(_1914);
    float _1918 = _1910 * 0.15915493667125701904296875;
    float _1920 = fma(_1888, _1888, _1912);
    float _1922 = fma(_1908, _1908, _1920);
    float _1924 = _1912;
    if (_1904)
    {
        _1924 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1926 = _1924;
    float _1928 = _1896 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    int _1932 = as_type<int>(_1926);
    if (_1904)
    {
        out.m_47.x = 0.0;
    }
    if (_1904)
    {
        float _1934 = _1926 * 5.0;
        _1932 = as_type<int>(_1934);
    }
    int _1936 = _1932;
    float _1938 = _1896 * 6.283185482025146484375;
    float _1940 = cos(_1938);
    if (_1904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6094 = as_type<float>(_1936);
        out.gl_Position.z = _6094;
    }
    float _1942 = _1918 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = sqrt(_1922);
    if (_1904)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1948 = in.m_65.x;
    float _1950 = in.m_65.y;
    float _1952 = in.m_65.z;
    float _1954 = _1918 * 6.283185482025146484375;
    float _1956 = cos(_1954);
    float _1958 = _1900 * _1930;
    float _1960 = _1916 * _1940;
    float _1962 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1964 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1966 = fma(_1944, _1960, _1958);
    float _1968 = fma(_1944, _1958, _1960);
    float _1970 = _1814 * _1946;
    float _1972 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1974 = _1916 * _1930;
    float _1976 = _1900 * _1940;
    float _1978 = _1970 * _1962;
    float _1980 = _1970 * _1964;
    float _1982 = _1970 * _1972;
    float _1984 = _1916 * _1956;
    float _1986 = _1940 * _1956;
    float _1988 = _1900 * _1956;
    float _1990 = _1930 * _1956;
    float _1992 = -_1974;
    float _1994 = fma(_1944, _1976, _1992);
    float _1996 = -_1976;
    float _1998 = fma(_1944, _1974, _1996);
    float _2000 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1948);
    float _2004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1950);
    float _2006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1952);
    float _2008 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2010 = _2002 * _1978;
    float _2012 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2014 = _2004 * _1982;
    float _2016 = _2006 * _1980;
    float _2018 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2020 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2012);
    float _2022 = -_2014;
    float _2024 = _1944 * _2022;
    float _2026 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2028 = -_1944;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2000);
    float _2032 = -_1944;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2008);
    float _2036 = -_1944;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2018);
    float _2040 = fma(_1986, _2010, _2024);
    float _2042 = _1984 * _2014;
    float _2044 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2026);
    float _2046 = _1988 * _2014;
    float _2048 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2050 = fma(_1966, _2010, _2042);
    float _2052 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2044);
    float _2054 = fma(_1994, _2010, _2046);
    bool _2056 = _1950 != 0.0;
    bool _2058 = isnan(_1950);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.0);
    bool _2064 = _2060 || _2062;
    float _2066 = in.m_67.x;
    float _2068 = in.m_67.y;
    float _2070 = in.m_67.z;
    float _2072 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2048);
    float _2074 = fma(_1998, _2016, _2050);
    bool _2076 = _1948 == 0.0;
    bool _2078 = !_2064;
    bool _2080 = _2076 && _2078;
    float _2082 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2020);
    float _2084 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2072);
    float _2086 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2090 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(_1990, _2016, _2040);
    float _2094 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2096 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2098 = _1952 == 0.0;
    bool _2100 = _2098 && _2080;
    float _2102 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    float _2104 = fma(_1968, _2016, _2054);
    float _2106 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    float _2108 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2096);
    float _2110 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    float _2112 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2114 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2106);
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2108);
    float _2118 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2120 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2030);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2124 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2126 = _2016;
    float _2128 = _2030;
    float _2130 = _2122;
    if (_2100)
    {
        _1362 = _2066;
    }
    float _2132 = _1362;
    float _2134 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2034);
    float _2136 = _1724 + _2122;
    float _2138 = _1738 + _2124;
    float _2140 = _2132;
    float _2142 = _2136;
    float _2144 = _2138;
    if (_2100)
    {
        _2126 = _2132;
    }
    float _2146 = _2126;
    float _2148 = in.m_69.x;
    float _2150 = in.m_69.y;
    float _2152 = in.m_69.z;
    float _2154 = in.m_69.w;
    float _2156 = _2146;
    if (!_2100)
    {
        _2140 = _2066;
    }
    float _2158 = _2140;
    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2162 = _2136 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2166 = _2138 + _2164;
    float _2168 = 0.0;
    if (_2100)
    {
        _2168 = _2068;
    }
    float _2170 = _2168;
    float _2172 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2102);
    float _2174 = _2162 * _2162;
    float _2176 = _2166 * _2166;
    float _2178 = _2170;
    float _2180 = _2174;
    float _2182 = _2176;
    if (_2100)
    {
        _1364 = _2070;
    }
    float _2184 = _1364;
    float _2186 = _2184;
    if (!_2100)
    {
        float _2188 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2158);
        _2156 = _2188;
    }
    float _2190 = _2156;
    if (_2100)
    {
        _2128 = _2170;
    }
    float _2192 = _2128;
    float _2194 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2110);
    float _2196 = _2192;
    if (!_2100)
    {
        _2178 = _2068;
    }
    float _2198 = _2178;
    float _2200 = _2174 + _2176;
    if (_2100)
    {
        _2130 = _2184;
    }
    float _2202 = _2130;
    float _2204 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2112);
    float _2206 = _2202;
    if (!_2100)
    {
        _2186 = _2070;
    }
    float _2208 = _2186;
    if (!_2100)
    {
        float _2210 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2198);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = sqrt(_2200);
    float _2216 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2100)
    {
        float _2218 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2208);
        _2206 = _2218;
    }
    float _2220 = _2206;
    float _2222 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2224 = _2120 * _2150;
    float _2226 = _2134 * _2150;
    float _2228 = _2118 * _2150;
    float _2230 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    float _2232 = fma(_2082, _2148, _2224);
    float _2234 = _2152 * _2158;
    float _2236 = _2148 * _2198;
    float _2238 = _2150 * _2208;
    float _2240 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2242 = fma(_2052, _2148, _2226);
    bool _2244 = _2214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2246 = fma(_2084, _2148, _2228);
    float _2248 = -_2234;
    float _2250 = fma(_2148, _2208, _2248);
    float _2252 = -_2236;
    float _2254 = fma(_2150, _2158, _2252);
    float _2256 = -_2238;
    float _2258 = fma(_2152, _2198, _2256);
    float _2260 = _1704 + _2240;
    float _2262 = fma(_2172, _2152, _2232);
    float _2264 = fma(_2194, _2152, _2242);
    float _2266 = fma(_2204, _2152, _2246);
    float _2268 = _2250 * _2154;
    float _2270 = _2258 * _2154;
    float _2272 = _2254 * _2154;
    float _2274 = _2154;
    if (!_2244)
    {
        _2274 = _2260;
    }
    float _2276 = _2274;
    bool _2278 = !_2244;
    float _2280 = _2276;
    if (!_2278)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2286 = _2214 + _2284;
        float _2288 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2290 = rsqrt(_2200);
        float _2292 = _2286 * _2282;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2294 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2294 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        float _2304 = fma(_2298, _2288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2306 = _2290 * _2304;
        float _2308 = _2302 + (-1.0);
        float _2310 = fma(_2162, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2312 = fma(_2166, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2314 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2318 = _2310 + _2316;
        float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2322 = _2312 + _2320;
        float _2324 = fma(_2260, _2302, _2314);
        float _2326 = _2318 * _2318;
        float _2328 = _2322 * _2322;
        _2280 = _2324;
        _2180 = _2326;
        _2182 = _2328;
        _2142 = _2310;
        _2144 = _2312;
    }
    float _2330 = _2280;
    float _2332 = _2180;
    float _2334 = _2182;
    float _2336 = _2142;
    float _2338 = _2144;
    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2342 = _2330 + _2340;
    float _2344 = _2120 * _2212;
    float _2346 = _2134 * _2212;
    float _2348 = _2118 * _2212;
    float _2350 = fma(_2342, _2342, _2332);
    float _2352 = _2268 * _2120;
    float _2354 = _2268 * _2134;
    float _2356 = _2268 * _2118;
    float _2358 = _2350 + _2334;
    float _2360 = fma(_2082, _2190, _2344);
    float _2362 = fma(_2052, _2190, _2346);
    float _2364 = fma(_2270, _2082, _2352);
    float _2366 = fma(_2270, _2052, _2354);
    float _2368 = fma(_2084, _2190, _2348);
    float _2370 = sqrt(_2358);
    float _2372 = fma(_2270, _2084, _2356);
    float _2374 = fma(_2194, _2220, _2362);
    float _2376 = fma(_2272, _2172, _2364);
    float _2378 = fma(_2272, _2194, _2366);
    float _2380 = fma(_2172, _2220, _2360);
    float _2382 = fma(_2204, _2220, _2368);
    float _2384 = fma(_2272, _2204, _2372);
    out.m_71.x = _2262;
    out.m_71.y = _2264;
    out.m_71.z = _2266;
    out.m_73.x = _2380;
    out.m_73.y = _2374;
    out.m_73.z = _2382;
    out.m_75.x = _2376;
    out.m_75.y = _2378;
    out.m_75.z = _2384;
    bool _2386 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2388 = isnan(_2370);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2394 = _2390 || _2392;
    float _2396 = _2368;
    if (!_2394)
    {
        _2396 = 1.0;
    }
    float _2398 = _2396;
    bool _2400 = !_2394;
    float _2402 = _2398;
    if (!_2400)
    {
        bool _2404 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2406 = isnan(_2370);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2412 = _2408 || _2410;
        if (!_2412)
        {
            float _2414 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2416 = _2370 + _2414;
            float _2418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2420 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2426 = 1.0 / _2420;
            float _2428 = _2416 * _2426;
            float _2430 = fma(_2428, _2424, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2402 = _2430;
            _2432 = true;
        }
        else
        {
            bool _2434 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2436 = isnan(_2370);
            bool _2438 = _2434 || _2436;
            bool _2440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2442 = _2438 || _2440;
            if (!_2442)
            {
                float _2444 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2446 = _2370 + _2444;
                float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2450 = _2448 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2454 = _2452 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2456 = 1.0 / _2450;
                float _2458 = _2446 * _2456;
                float _2460 = fma(_2458, _2454, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2402 = _2460;
                _2432 = true;
            }
            else
            {
                _2402 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2432 = false;
    float _2462 = _2402;
    float _2464 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2466 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2470 = _2336 + _2468;
    float _2472 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2464);
    bool _2474 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(0.5);
    bool _2482 = _2478 || _2480;
    float _2484 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2466);
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2488 = _2330 + _2486;
    float _2490 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2472);
    float _2492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2494 = _2338 + _2492;
    float _2496 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2484);
    float _2498 = _2490 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2500 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2502 = fma(_2488, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2504 = fma(_2494, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2506 = 1.0 / _2498;
    float _2508 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2510 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.5);
    bool _2518 = _2514 || _2516;
    float _2520 = -_1838;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2500);
    float _2524 = -_1836;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2502);
    float _2528 = -_1846;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2504);
    float _2532 = _2508 + _2498;
    float _2534 = _2526;
    float _2536 = _2522;
    float _2538 = _2530;
    float _2540 = _2498;
    float _2542 = _2502;
    if (!_2482)
    {
        float _2544 = _1856 * _1856;
        float _2546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2548 = -_1738;
        float _2550 = _2548 + _2504;
        float _2552 = -_1704;
        float _2554 = _2552 + _2502;
        float _2556 = fma(_1864, _1864, _2544);
        float _2558 = fma(_1872, _1872, _2556);
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2562 = sqrt(_2558);
        float _2564 = 1.0 / _1970;
        float _2566 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = precise::min(_2562, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2546;
        float _2572 = -_1724;
        float _2574 = _2572 + _2500;
        float _2576 = _2570 * _2564;
        float _2578 = _2566 * _2576;
        float _2580 = _2550 * _2576;
        float _2582 = fma(_2574, _2578, _1850);
        float _2584 = fma(_2554, _2578, _1844);
        float _2586 = fma(_2566, _2580, _1860);
        _2534 = _2584;
        _2536 = _2582;
        _2538 = _2586;
    }
    float _2588 = _2534;
    float _2590 = _2536;
    float _2592 = _2538;
    if (_2518)
    {
        _2540 = 1.0;
    }
    float _2594 = _2540;
    float _2596 = _2532 * _2506;
    float _2598 = _2596 * 0.5;
    float _2600 = _2594;
    if (!_2518)
    {
        float _2602 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2606 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2604);
        float _2608 = _2602 * 0.15915493667125701904296875;
        float _2610 = _2608 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2616 = _2614 * 0.15915493667125701904296875;
        float _2618 = _2608 * 6.283185482025146484375;
        float _2620 = sin(_2618);
        float _2622 = 1.0 / _2612;
        float _2624 = _2616 * 6.283185482025146484375;
        float _2626 = cos(_2624);
        float _2628 = _2620 * _2622;
        float _2630 = 1.0 / _2606;
        float _2632 = _2626 * _2628;
        float _2634 = _2616 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2640 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2638;
        float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2644 = _2630 * _2642;
        float _2646 = 1.0 / _2632;
        float _2648 = 1.0 / _2640;
        float _2650 = _2636 * _2646;
        float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2654 = fma(_2650, _2644, _2652);
        float _2656 = _2654 * _2648;
        float _2658 = precise::clamp(_2656, 0.0, 1.0);
        _2600 = _2658;
    }
    float _2660 = _2600;
    float _2662 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2664 = _2588 + _2662;
    float _2666 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2668 = _2590 + _2666;
    float _2670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2672 = _2592 + _2670;
    float _2674 = _2664 * _2664;
    float _2676 = fma(_2668, _2668, _2674);
    float _2678 = fma(_2672, _2672, _2676);
    float _2680 = rsqrt(_2678);
    float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2684 = _2668 * _2682;
    float _2686 = _2672 * _2682;
    float _2688 = _2684 * _2684;
    float _2690 = _2686 * _2686;
    float _2692 = _2688 + _2690;
    float _2694 = sqrt(_2692);
    bool _2696 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2700 = _2694 + _2698;
    float _2702 = _2672;
    float _2704 = _2692;
    float _2706 = _2700;
    float _2708 = _2664;
    float _2710 = _2684;
    if (_2696)
    {
        float _2712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2702 = _2712;
    }
    float _2714 = _2702;
    if (_2696)
    {
        float _2716 = rsqrt(_2692);
        _2704 = _2716;
    }
    float _2718 = _2704;
    if (_2696)
    {
        float _2720 = _2700 * _2714;
        _2706 = _2720;
    }
    float _2722 = _2706;
    if (_2696)
    {
        float _2724 = _2722 * 0.15915493667125701904296875;
        _2542 = _2724;
    }
    float _2726 = _2542;
    float _2728 = _2674;
    if (_2696)
    {
        float _2730 = _2726 * 6.283185482025146484375;
        float _2732 = sin(_2730);
        _2728 = _2732;
    }
    float _2734 = _2728;
    float _2736 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2738 = precise::max(0.0, _2736);
    float _2740 = _2680;
    float _2742 = _2736;
    float _2744 = _2738;
    if (_2696)
    {
        float _2746 = _2726 * 6.283185482025146484375;
        float _2748 = cos(_2746);
        _2740 = _2748;
    }
    float _2750 = _2740;
    float _2752 = -_2682;
    float _2754 = -_2738;
    float _2756 = fma(_2664, _2752, _2754);
    if (_2696)
    {
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2742 = _2758;
    }
    float _2760 = _2742;
    float _2762 = _2734;
    float _2764 = _2760;
    if (_2696)
    {
        float _2766 = fma(_2734, _2760, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2708 = _2766;
    }
    float _2768 = _2708;
    float _2770 = _2768;
    if (!_2696)
    {
        _2762 = _2756;
    }
    float _2772 = _2762;
    float _2774 = _2772;
    if (_2696)
    {
        float _2776 = _2750 + (-1.0);
        _2764 = _2776;
    }
    float _2778 = _2764;
    float _2780 = _2778;
    if (_2696)
    {
        float _2782 = _2718 * _2768;
        _1840 = _2782;
    }
    float _2784 = _1840;
    if (!_2696)
    {
        _2770 = _2688;
    }
    float _2786 = _2770;
    float _2788 = sqrt(_2678);
    float _2790 = _2786;
    if (_2696)
    {
        float _2792 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2744 = _2792;
    }
    float _2794 = _2744;
    float _2796 = _2794;
    if (_2696)
    {
        float _2798 = _2684 * _2784;
        _2710 = _2798;
    }
    float _2800 = _2710;
    if (!_2696)
    {
        _2780 = _2686;
    }
    float _2802 = _2780;
    float _2804 = _2802;
    if (_2696)
    {
        float _2806 = _2686 * _2784;
        _2804 = _2806;
    }
    float _2808 = _2804;
    if (_2696)
    {
        float _2810 = fma(_2756, _2750, _2794);
        _2774 = _2810;
    }
    float _2812 = _2774;
    if (_2696)
    {
        float _2814 = _2800 * _2800;
        _2790 = _2814;
    }
    float _2816 = _2790;
    if (!_2696)
    {
        _2796 = _2690;
    }
    float _2818 = _2796;
    float _2820 = _2818;
    if (_2696)
    {
        float _2822 = _2808 * _2808;
        _2820 = _2822;
    }
    float _2824 = _2820;
    float _2826 = fma(_2812, _2812, _2816);
    float _2828 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2830 = _2826 + _2824;
    float _2832 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2836 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2834);
    float _2838 = precise::clamp(_2836, 0.0, 1.0);
    float _2840 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2842 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2832);
    float _2844 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2846 = rsqrt(_2830);
    float _2848 = -_2838;
    float _2850 = _2848 + 1.0;
    float _2852 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2854 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2844);
    float _2856 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2842);
    float _2858 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2852);
    float _2860 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2854);
    float _2862 = _2856 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2864 = abs(_2850);
    float _2866 = log2(_2864);
    float _2868 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2828);
    float _2870 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2858);
    float _2872 = _2860 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2874 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2876 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2868);
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2880 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2882 = _2846 * _2800;
    float _2884 = -_2874;
    float _2886 = fma(_2884, _2840, 1.0);
    float _2888 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2890 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2880);
    float _2892 = _2846 * _2812;
    float _2894 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2896 = _2846 * _2808;
    float _2898 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2890);
    float _2900 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2902 = -_2894;
    float _2904 = fma(_2892, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2902);
    float _2906 = log2(_2886);
    float _2908 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2898);
    float _2910 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2912 = -_2896;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2904);
    float _2916 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2918 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2910);
    float _2920 = fma(_2914, -0.5, 0.5);
    float _2922 = exp2(_2900);
    float _2924 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2916);
    float _2926 = fma(_2914, 0.5, 0.5);
    float _2928 = _2892 + 1.0;
    float _2930 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2918);
    float _2932 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2924);
    float _2934 = fma(_2926, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2936 = 1.0 / _2908;
    float _2938 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2932);
    float _2940 = fma(_2926, _2934, -0.212114393711090087890625);
    float _2942 = _2906 * 0.693147182464599609375;
    float _2944 = fma(_2926, _2940, 1.570728778839111328125);
    float _2946 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2948 = sqrt(_2920);
    float _2950 = -_2892;
    float _2952 = fma(_2922, _2928, _2950);
    float _2954 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2930);
    float _2956 = fma(_2952, 0.5, 0.5);
    float _2958 = _2938 * _2936;
    float _2960 = _2954 * _2936;
    float _2962 = fma(_2958, 0.5, 0.5);
    float _2964 = fma(_2960, -0.5, 0.5);
    float _2966 = _2948 * 0.636619746685028076171875;
    float _2968 = -_2944;
    float _2970 = fma(_2966, _2968, 1.0);
    float3 _7808 = float3(_2962, _2964, _2946);
    float _2972 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7808, float3(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7808, float3(0.0), isnan(_7808)), level(0.0)).x;
    float3 _7819 = float3(_2962, _2964, _2946);
    float4 _2975 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7819, float3(0.0), isnan(_7819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7819, float3(0.0), isnan(_7819)), level(0.0)).xyzw;
    float _2977 = _2975.x;
    float _2979 = _2975.y;
    float _2981 = _2975.z;
    float _2983 = _2975.w;
    float2 _7836 = float2(_2970, _2956);
    float3 _2987 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7836, float2(0.0), isnan(_7836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7836, float2(0.0), isnan(_7836)), level(0.0)).xyz;
    float _2989 = _2987.x;
    float _2991 = _2987.y;
    float _2993 = _2987.z;
    float _2995 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2997 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2999 = _2660 > 0.0;
    bool _3001 = isnan(_2660);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(0.0);
    bool _3007 = _3003 || _3005;
    float _3009 = _2660 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3011 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2997);
    float _3013 = exp2(_2995);
    float _3015 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3011);
    float _3017 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3015);
    float _3019 = _3017 + _2908;
    out.gl_Position.x = _2938;
    out.gl_Position.y = _2954;
    out.gl_Position.z = _3017;
    out.gl_Position.w = _2908;
    float _3021 = _3019 * 0.5;
    float _3023 = -_3013;
    float _3025 = _3023 + 1.0;
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3029 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _3021;
    out.m_77.w = _2908;
    float _3031 = -_3029;
    float _3033 = _3031 + 1.0;
    out.m_47.x = _3027;
    float _3035 = _3029 * _2972;
    float _3037 = _2983 * _3035;
    float _3039 = _2993 * _3035;
    float _3041 = _2983 * _3033;
    float _3043 = fma(_2989, _3037, _2977);
    float _3045 = fma(_2991, _3037, _2979);
    float _3047 = fma(_2983, _3039, _2981);
    out.m_79.x = _3043;
    out.m_79.y = _3045;
    out.m_79.z = _3047;
    out.m_79.w = _3041;
    if (_3007)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3049;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2432 = false;
    bool _1086 = false;
    bool _752 = false;
    bool _464 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    float _110 = _108;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_102)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3105 = as_type<float>(_116);
        out.gl_Position.z = _3105;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    int _150 = 0;
    if (_144)
    {
        float _152 = _148 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3175 = as_type<float>(_154);
        out.gl_Position.z = _3175;
    }
    if (_144)
    {
        return out;
    }
    float _156 = in.m_51.w;
    float _158 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = _158;
    if (!_168)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _106 = _186;
    }
    float _188 = _106;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_168;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _158 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _158);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_168;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _158 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _170, _258);
    float _266 = fma(_254, _172, _260);
    float _268 = fma(_254, _174, _262);
    float _270 = fma(_264, _156, _176);
    float _272 = fma(_266, _156, _178);
    float _274 = fma(_268, _156, _180);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _132 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = 1.0 / _340;
    float _360 = -_356;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = _336 * _362;
    float _368 = -_336;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _344;
    float _374 = _308 * _358;
    float _376 = -_320;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _356 * _378;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _324 * _372;
    float _398 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _394 * _366;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _398 * _366;
    float _410 = _400 * _366;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _422 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _424 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_406, _396, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_418, _396, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _432 = fma(_424, _384, _420);
    float _434 = fma(_426, _384, _422);
    float _436 = fma(_428, _384, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_364;
    float _462;
    if (!_444)
    {
        float _446 = in.m_53.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_98);
        float _468 = 1.0 / _466;
        float _470 = _132 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_51.x;
    float _476 = in.m_51.y;
    float _478 = in.m_51.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _482 = _472 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = 1.0 / _486;
    float _502 = 1.0 / _494;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _472 + _504;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _510 = 1.0 / _490;
    float _512 = _442 * _478;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = _472 + _514;
    float _518 = _506 * _500;
    float _520 = _440 * _476;
    bool _522 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _524 = isnan(_472);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _472 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _538;
    float _542 = 1.0 / _498;
    float _544 = _516 * _502;
    bool _546 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _548 = isnan(_472);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -_532;
    float _560 = _558 + 1.0;
    float _562 = fma(_540, _518, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _564 = _438 * _474;
    float _566 = _536 * _510;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _568;
    float _572 = _556 * _560;
    float _574 = -_556;
    float _576 = _574 + 1.0;
    bool _578 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _580 = isnan(_472);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = fma(_570, _518, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _592 = _482 * _542;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _594;
    bool _598 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _600 = isnan(_472);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_596, _518, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _612 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _614 = isnan(_472);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -_608;
    float _626 = _624 + 1.0;
    float _628 = _608 * _576;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _638 = _622 * _626;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = fma(_636, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _650 = fma(_632, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _652 = _588 * _642;
    float _654 = fma(_646, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _656 = -_588;
    float _658 = _656 + 1.0;
    float _660 = _590 * _652;
    float _662 = _562 * _652;
    float _664 = _610 * _652;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _666;
    float _670 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].x, _660);
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].y, _662);
    float _674 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].z, _664);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _680;
    float _684 = fma(_668, _544, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _686 = fma(_648, _638, _670);
    float _688 = fma(_654, _638, _674);
    float _690 = fma(_678, _544, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _692 = fma(_650, _638, _672);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _702 = fma(_682, _544, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _708 = fma(_684, _628, _686);
    float _710 = fma(_696, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _712 = fma(_700, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _714 = fma(_690, _628, _692);
    float _716 = fma(_706, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _718 = fma(_702, _628, _688);
    float _720 = fma(_710, _572, _708);
    float _722 = fma(_712, _572, _714);
    float _724 = fma(_716, _572, _718);
    float _726 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].x, _720);
    float _728 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].y, _722);
    float _730 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].z, _724);
    bool _732 = !_508;
    float _750;
    if (!_732)
    {
        float _734 = in.m_53.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_98);
        float _756 = 1.0 / _754;
        float _758 = _132 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _760 + _762;
    float _766 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _768 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _770 = isnan(_760);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _784 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _796;
    bool _800 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _802 = isnan(_760);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_778;
    float _814 = _812 + 1.0;
    float _816 = 1.0 / _782;
    bool _818 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _820 = isnan(_760);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -_810;
    float _832 = _830 + 1.0;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _838 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _840 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _842 = 1.0 / _836;
    float _844 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _848 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _850 = _798 * _816;
    float _852 = -_794;
    float _854 = _852 + 1.0;
    float _856 = _794 * _814;
    bool _858 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_760);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = fma(_850, _764, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _872 = _810 * _854;
    float _874 = _828 * _832;
    float _876 = -_828;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _884 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _886 = isnan(_760);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = _868 * _878;
    float _898 = -_868;
    float _900 = _898 + 1.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _908 = isnan(_760);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _882;
    float _920 = _894 * _900;
    float _922 = -_894;
    float _924 = _922 + 1.0;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _930 = _916 * _924;
    float _932 = 1.0 / _904;
    float _934 = _928 * _842;
    float _936 = -_916;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _944;
    float _948 = 1.0 / _942;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _954 = _870 * _930;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _958 = _760 + _956;
    float _960 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _966 = 1.0 / _952;
    float _968 = fma(_934, _958, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _970 = _946 * _932;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _974 = _760 + _972;
    float _976 = fma(_968, _920, _960);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _980 = _760 + _978;
    float _982 = fma(_970, _974, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _984 = 1.0 / _964;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _998 = _988 * _918;
    float _1000 = fma(_982, _896, _976);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1004 = _760 + _1002;
    float _1006 = _992 * _966;
    float _1008 = fma(_998, _980, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _1010;
    bool _1014 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _1016 = isnan(_760);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _996 * _948;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1030 = _760 + _1028;
    float _1032 = fma(_1006, _1004, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1034 = fma(_1008, _874, _1000);
    float _1036 = _1012 * _984;
    float _1038 = fma(_1026, _1030, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1040 = -_1024;
    float _1042 = _1040 + 1.0;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1046 = _760 + _1044;
    float _1048 = fma(_1032, _872, _1034);
    float _1050 = _778 * _1042;
    float _1052 = fma(_1036, _1046, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _1054 = fma(_1038, _856, _1048);
    float _1056 = fma(_1052, _1050, _1054);
    float _1058 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[122].x, _1056);
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _844;
    out.m_55.y = _846;
    out.m_55.z = _1058;
    out.m_55.w = _1062;
    bool _1064 = !_848;
    float _1066 = _844;
    float _1084;
    if (!_1064)
    {
        float _1068 = in.m_53.x;
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1072 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1076 = _1074 * _1070;
        float _1078 = floor(_1076);
        float _1080 = -_1078;
        float _1082 = _1076 + _1080;
        _1084 = _1082;
        _1066 = _1076;
        _1086 = true;
    }
    else
    {
        float _1088 = float(_98);
        float _1090 = 1.0 / _1088;
        float _1092 = _132 * _1090;
        _1084 = _1092;
    }
    _1086 = false;
    float _1094 = _1084;
    float _1096 = _1066;
    float _1098 = in.m_53.w;
    float _1100 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1102 = in.m_57.x;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1110 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1100);
    float _1112 = in.m_53.x;
    float _1114 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1116 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1108);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_57.y;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    float _1128 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1132 = _1130 != 0;
    float _1134 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1114);
    float _1136 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1138 = log2(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1142 = _1094 + _1140;
    float _1144 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1128);
    bool _1146 = _1098 > 0.5;
    float _1148 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1158 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1148);
    int _1160 = as_type<int>(_1148);
    float _1162 = _1096;
    float _1164 = _1102;
    if (_1106)
    {
        float _1166 = -_1102;
        float _1168 = _1166 + 1.0;
        _1160 = as_type<int>(_1168);
    }
    int _1170 = _1160;
    float _1172 = 1.0 / _1152;
    bool _1174 = false;
    if (_1106)
    {
        bool _1176 = _1112 > 0.5;
        _1174 = _1176;
    }
    bool _1178 = _1174;
    float _1180 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    if (!_1106)
    {
        _1162 = _1102;
    }
    float _1182 = _1162;
    float _1184 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1158);
    float _1186 = _1182;
    if (_1106)
    {
        float _1188 = _1178 ? as_type<float>(_1170) : _1102;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1134);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1206;
    float _1210 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1116);
    float _1212 = in.m_53.z;
    float _1214 = 1.0 / _1156;
    float _1216 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1110);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1222 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1180);
    float _1224 = _1142 * _1172;
    float _1226 = in.m_53.y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1230 = _1094 + _1228;
    float _1232 = 1.0 / _1208;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1236 = _1094 + _1234;
    float _1238 = _1138 * _132;
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1244 = _1094 + _1242;
    float _1246 = 1.0 / _1220;
    float _1248 = _1230 * _1214;
    float _1250 = -_1122;
    float _1252 = _1250 + 1.0;
    float _1254 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1240);
    int _1256 = 0;
    float _1258 = _1122;
    bool _1260 = _1132;
    if (_1120)
    {
        float _1262 = -_1102;
        float _1264 = _1262 + 1.0;
        _1256 = as_type<int>(_1264);
    }
    int _1266 = _1256;
    float _1268 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1144);
    float _1270 = _1236 * _1232;
    float _1272 = _1212 * 2.0;
    float _1274 = exp2(_1238);
    int _1276 = _1146 ? as_type<int>(_1252) : as_type<int>(_1122);
    float _1278 = _1112 * 2.0;
    bool _1280 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1282 = isnan(1.0);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1288 = _1284 || _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1292 = 1.0 + _1290;
    float _1294 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1254);
    float _1296 = _1244 * _1246;
    float _1298 = _1226 * 2.0;
    float _1300 = floor(_1272);
    float _1302 = _1226 + _1212;
    float _1304 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    bool _1306 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1308 = isnan(_1094);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1302 + (-1.0);
    float _1320 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1222);
    float _1322 = 1.0 / _1292;
    float _1324 = -_1274;
    float _1326 = _1324 + 1.0;
    float _1328 = -_1316;
    float _1330 = _1328 + 1.0;
    float _1332 = _1184 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _1334 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1336 = isnan(_1094);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1348 = floor(_1278);
    float _1350 = _1126 ? as_type<float>(_1276) : _1122;
    float _1352 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1354 = _1226 > 0.5;
    float _1356 = _1112 + _1226;
    float _1358 = -_1344;
    float _1360 = _1358 + 1.0;
    float _1362 = _1304;
    float _1364 = _1346;
    if (_1132)
    {
        float _1366 = _1354 ? _1252 : _1122;
        _1258 = _1366;
    }
    float _1368 = _1258;
    float _1370 = floor(_1298);
    if (_1120)
    {
        bool _1372 = _1212 > 0.5;
        _1260 = _1372;
    }
    bool _1374 = _1260;
    float _1376 = _1356 + (-1.0);
    bool _1378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    float _1388 = _1192 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    if (_1120)
    {
        float _1390 = _1374 ? as_type<float>(_1266) : _1102;
        _1164 = _1390;
    }
    float _1392 = _1164;
    float _1394 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1396 = _1300 > 0.0;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1398;
    bool _1402 = _1300 >= 0.0;
    bool _1404 = isnan(_1300);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = sqrt(_1268);
    float _1414 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1416 = _1386 ? _1326 : 0.0;
    bool _1418 = _1348 >= 0.0;
    bool _1420 = isnan(_1348);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.0);
    bool _1426 = _1422 || _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    if (_1288)
    {
        float _1436 = _1416 * _1322;
        _134 = _1436;
    }
    float _1438 = _134;
    bool _1440 = _1348 > 0.0;
    float _1442 = fma(_1430, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1444 = _1410 ? 0 : 1;
    float _1446 = fma(_1434, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1448 = _1426 ? 0 : 1;
    float _1450 = sqrt(_1320);
    float _1452 = _1412 * _1332;
    bool _1454 = _1370 > 0.0;
    bool _1456 = _1370 >= 0.0;
    bool _1458 = isnan(_1370);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1474 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1476 = isnan(_1094);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = fma(_1468, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1488 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1490 = isnan(_1094);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1472, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1514 = fma(_1502, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1516 = fma(_1506, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1518;
    float _1522 = _1316 * _1510;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1524;
    float _1528 = fma(_1400, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1530 = fma(_1520, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1532 = _1344 * _1330;
    float _1534 = fma(_1526, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1536 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1538 = isnan(_1094);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1556 = sqrt(_1294);
    float _1558 = _1450 * _1304;
    float _1560 = -_1546;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1550, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1566 = _1546 * _1360;
    float _1568 = fma(_1554, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1570 = _1498 * _1562;
    float _1572 = -_1498;
    float _1574 = _1572 + 1.0;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1578 = _1576 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1580 = _1442 * _1570;
    float _1582 = _1514 * _1570;
    float _1584 = _1486 * _1570;
    int _1586 = ~_1444;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1580);
    float _1594 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1582);
    float _1596 = _1556 * _1346;
    int _1598 = _1464 ? 0 : 1;
    float _1600 = fma(_1446, _1566, _1592);
    float _1602 = fma(_1516, _1566, _1594);
    float _1604 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1584);
    float _1606 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = fma(_1530, _1532, _1600);
    bool _1610 = !_1204;
    int _1612 = _1610 ? 0 : 1;
    float _1614 = fma(_1512, _1566, _1604);
    int _1616 = ~_1448;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = fma(_1578, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _1624 = ~_1598;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    float _1630 = fma(_1528, _1532, _1614);
    int _1632 = _1590;
    int _1634 = _1620;
    int _1636 = _1628;
    if (!_1396)
    {
        int _1638 = ~_1444;
        int _1640 = _1638 + 1;
        _1632 = _1640;
    }
    int _1642 = _1632;
    float _1644 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1440)
    {
        int _1646 = ~_1448;
        int _1648 = _1646 + 1;
        _1634 = _1648;
    }
    int _1650 = _1634;
    float _1652 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1454)
    {
        int _1654 = ~_1598;
        int _1656 = _1654 + 1;
        _1636 = _1656;
    }
    int _1658 = _1636;
    float _1660 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    bool _1662 = !_1196;
    int _1664 = _1662 ? 0 : 1;
    float _1666 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1652);
    bool _1668 = !_1200;
    int _1670 = _1668 ? 0 : 1;
    float _1672 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1644);
    int _1674 = abs(_1612);
    float _1676 = fma(_1534, _1532, _1602);
    int _1678 = abs(_1664);
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1666);
    int _1682 = abs(_1670);
    float _1684 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1660);
    float _1686 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1672);
    float _1688 = in.m_59.x;
    float _1690 = in.m_59.y;
    float _1692 = in.m_59.z;
    float _1694 = float(_1678);
    float _1696 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1680);
    float _1698 = float(_1642);
    float _1700 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1684);
    float _1702 = float(_1674);
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1706 = float(_1658);
    float _1708 = _1694 * _1698;
    float _1710 = float(_1682);
    float _1712 = fma(_1564, _1522, _1608);
    float _1714 = float(_1650);
    float _1716 = _1702 * _1706;
    float _1718 = fma(_1622, _1522, _1676);
    float _1720 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1686);
    float _1722 = _1708 * (-2.0);
    float _1724 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = _1704 + _1726;
    float _1730 = _1710 * _1714;
    float _1732 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1712);
    float _1734 = fma(_1394, _1722, _1394);
    float _1736 = fma(_1568, _1522, _1630);
    float _1738 = _1720 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1724 + _1740;
    float _1744 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1748 = fma(_1722, _1688, _1688);
    float _1750 = _1730 * (-2.0);
    float _1752 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1736);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1738 + _1754;
    float _1758 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1744);
    float _1760 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1718);
    float _1762 = fma(_1750, _1690, _1690);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1758);
    float _1768 = _1112 + (-0.5);
    float _1770 = _1226 + (-0.5);
    float _1772 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1774 = fma(_1352, _1750, _1352);
    bool _1776 = _1766 >= 0.0;
    float _1778 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1748);
    float _1780 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1782 = _1728 * _1728;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1786 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1762);
    float _1788 = _1780 * _1746;
    float _1790 = fma(_1742, _1742, _1782);
    float _1792 = _1732 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1794 = _1772 * _1764;
    float _1796 = fma(_1756, _1756, _1790);
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1800 = _1762;
    if (_1776)
    {
        _1800 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1802 = _1800;
    float _1804 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1806 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1808 = _1760 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1810 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1814 = rsqrt(_1796);
    float _1816 = _1414 * _1784;
    float _1818 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1822 = as_type<int>(_1802);
    if (_1776)
    {
        float _1824 = _1802 * 5.0;
        _1822 = as_type<int>(_1824);
    }
    int _1826 = _1822;
    float _1828 = fma(_1734, _1438, _1778);
    if (_1776)
    {
        out.m_47.x = 0.0;
    }
    float _1830 = fma(_1774, _1438, _1786);
    float _1832 = _1804 * _1798;
    out.m_61.x = _1810;
    out.m_61.y = _1818;
    out.m_61.z = _1820;
    out.m_61.w = _1812;
    float _1834 = _1828 * 0.15915493667125701904296875;
    out.m_63.x = _1788;
    out.m_63.y = _1816;
    out.m_63.z = _1832;
    out.m_63.w = _1794;
    float _1836 = _1728 * _1814;
    float _1838 = _1742 * _1814;
    float _1840 = _1838;
    if (_1776)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5919 = as_type<float>(_1826);
        out.gl_Position.z = _5919;
    }
    if (_1776)
    {
        return out;
    }
    float _1842 = -_1836;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1846 = _1756 * _1814;
    float _1848 = -_1838;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1852 = _1112 + _1212;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1856 = _1844 + _1854;
    float _1858 = -_1846;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1850 + _1862;
    float _1866 = _1852 + (-1.0);
    float _1868 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1872 = _1860 + _1870;
    float _1874 = _1716 * (-2.0);
    float _1876 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1868);
    float _1880 = _1212 + (-0.5);
    float _1882 = -_1836;
    float _1884 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1728);
    float _1886 = -_1838;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1742);
    float _1890 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1878);
    float _1892 = fma(_1874, _1692, _1692);
    float _1894 = fma(_1876, _1874, _1876);
    float _1896 = _1830 * 0.15915493667125701904296875;
    float _1898 = _1834 * 6.283185482025146484375;
    float _1900 = sin(_1898);
    float _1902 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1892);
    bool _1904 = _1890 >= 0.0;
    float _1906 = -_1846;
    float _1908 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1910 = fma(_1894, _1438, _1902);
    float _1912 = _1884 * _1884;
    float _1914 = _1834 * 6.283185482025146484375;
    float _1916 = cos(_1914);
    float _1918 = _1910 * 0.15915493667125701904296875;
    float _1920 = fma(_1888, _1888, _1912);
    float _1922 = fma(_1908, _1908, _1920);
    float _1924 = _1912;
    if (_1904)
    {
        _1924 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1926 = _1924;
    float _1928 = _1896 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    int _1932 = as_type<int>(_1926);
    if (_1904)
    {
        out.m_47.x = 0.0;
    }
    if (_1904)
    {
        float _1934 = _1926 * 5.0;
        _1932 = as_type<int>(_1934);
    }
    int _1936 = _1932;
    float _1938 = _1896 * 6.283185482025146484375;
    float _1940 = cos(_1938);
    if (_1904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6094 = as_type<float>(_1936);
        out.gl_Position.z = _6094;
    }
    float _1942 = _1918 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = sqrt(_1922);
    if (_1904)
    {
        return out;
    }
    float _1948 = in.m_65.x;
    float _1950 = in.m_65.y;
    float _1952 = in.m_65.z;
    float _1954 = _1918 * 6.283185482025146484375;
    float _1956 = cos(_1954);
    float _1958 = _1900 * _1930;
    float _1960 = _1916 * _1940;
    float _1962 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1964 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1966 = fma(_1944, _1960, _1958);
    float _1968 = fma(_1944, _1958, _1960);
    float _1970 = _1814 * _1946;
    float _1972 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1974 = _1916 * _1930;
    float _1976 = _1900 * _1940;
    float _1978 = _1970 * _1962;
    float _1980 = _1970 * _1964;
    float _1982 = _1970 * _1972;
    float _1984 = _1916 * _1956;
    float _1986 = _1940 * _1956;
    float _1988 = _1900 * _1956;
    float _1990 = _1930 * _1956;
    float _1992 = -_1974;
    float _1994 = fma(_1944, _1976, _1992);
    float _1996 = -_1976;
    float _1998 = fma(_1944, _1974, _1996);
    float _2000 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1948);
    float _2004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1950);
    float _2006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1952);
    float _2008 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2010 = _2002 * _1978;
    float _2012 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2014 = _2004 * _1982;
    float _2016 = _2006 * _1980;
    float _2018 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2020 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2012);
    float _2022 = -_2014;
    float _2024 = _1944 * _2022;
    float _2026 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2028 = -_1944;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2000);
    float _2032 = -_1944;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2008);
    float _2036 = -_1944;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2018);
    float _2040 = fma(_1986, _2010, _2024);
    float _2042 = _1984 * _2014;
    float _2044 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2026);
    float _2046 = _1988 * _2014;
    float _2048 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2050 = fma(_1966, _2010, _2042);
    float _2052 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2044);
    float _2054 = fma(_1994, _2010, _2046);
    bool _2056 = _1950 != 0.0;
    bool _2058 = isnan(_1950);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.0);
    bool _2064 = _2060 || _2062;
    float _2066 = in.m_67.x;
    float _2068 = in.m_67.y;
    float _2070 = in.m_67.z;
    float _2072 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2048);
    float _2074 = fma(_1998, _2016, _2050);
    bool _2076 = _1948 == 0.0;
    bool _2078 = !_2064;
    bool _2080 = _2076 && _2078;
    float _2082 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2020);
    float _2084 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2072);
    float _2086 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2090 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(_1990, _2016, _2040);
    float _2094 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2096 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2098 = _1952 == 0.0;
    bool _2100 = _2098 && _2080;
    float _2102 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    float _2104 = fma(_1968, _2016, _2054);
    float _2106 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    float _2108 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2096);
    float _2110 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    float _2112 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2114 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2106);
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2108);
    float _2118 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2120 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2030);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2124 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2126 = _2016;
    float _2128 = _2030;
    float _2130 = _2122;
    if (_2100)
    {
        _1362 = _2066;
    }
    float _2132 = _1362;
    float _2134 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2034);
    float _2136 = _1724 + _2122;
    float _2138 = _1738 + _2124;
    float _2140 = _2132;
    float _2142 = _2136;
    float _2144 = _2138;
    if (_2100)
    {
        _2126 = _2132;
    }
    float _2146 = _2126;
    float _2148 = in.m_69.x;
    float _2150 = in.m_69.y;
    float _2152 = in.m_69.z;
    float _2154 = in.m_69.w;
    float _2156 = _2146;
    if (!_2100)
    {
        _2140 = _2066;
    }
    float _2158 = _2140;
    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2162 = _2136 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2166 = _2138 + _2164;
    float _2168 = 0.0;
    if (_2100)
    {
        _2168 = _2068;
    }
    float _2170 = _2168;
    float _2172 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2102);
    float _2174 = _2162 * _2162;
    float _2176 = _2166 * _2166;
    float _2178 = _2170;
    float _2180 = _2174;
    float _2182 = _2176;
    if (_2100)
    {
        _1364 = _2070;
    }
    float _2184 = _1364;
    float _2186 = _2184;
    if (!_2100)
    {
        float _2188 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2158);
        _2156 = _2188;
    }
    float _2190 = _2156;
    if (_2100)
    {
        _2128 = _2170;
    }
    float _2192 = _2128;
    float _2194 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2110);
    float _2196 = _2192;
    if (!_2100)
    {
        _2178 = _2068;
    }
    float _2198 = _2178;
    float _2200 = _2174 + _2176;
    if (_2100)
    {
        _2130 = _2184;
    }
    float _2202 = _2130;
    float _2204 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2112);
    float _2206 = _2202;
    if (!_2100)
    {
        _2186 = _2070;
    }
    float _2208 = _2186;
    if (!_2100)
    {
        float _2210 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2198);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = sqrt(_2200);
    float _2216 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2100)
    {
        float _2218 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2208);
        _2206 = _2218;
    }
    float _2220 = _2206;
    float _2222 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2224 = _2120 * _2150;
    float _2226 = _2134 * _2150;
    float _2228 = _2118 * _2150;
    float _2230 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    float _2232 = fma(_2082, _2148, _2224);
    float _2234 = _2152 * _2158;
    float _2236 = _2148 * _2198;
    float _2238 = _2150 * _2208;
    float _2240 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2242 = fma(_2052, _2148, _2226);
    bool _2244 = _2214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2246 = fma(_2084, _2148, _2228);
    float _2248 = -_2234;
    float _2250 = fma(_2148, _2208, _2248);
    float _2252 = -_2236;
    float _2254 = fma(_2150, _2158, _2252);
    float _2256 = -_2238;
    float _2258 = fma(_2152, _2198, _2256);
    float _2260 = _1704 + _2240;
    float _2262 = fma(_2172, _2152, _2232);
    float _2264 = fma(_2194, _2152, _2242);
    float _2266 = fma(_2204, _2152, _2246);
    float _2268 = _2250 * _2154;
    float _2270 = _2258 * _2154;
    float _2272 = _2254 * _2154;
    float _2274 = _2154;
    if (!_2244)
    {
        _2274 = _2260;
    }
    float _2276 = _2274;
    bool _2278 = !_2244;
    float _2280 = _2276;
    if (!_2278)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2286 = _2214 + _2284;
        float _2288 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2290 = rsqrt(_2200);
        float _2292 = _2286 * _2282;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2294 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2294 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        float _2304 = fma(_2298, _2288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2306 = _2290 * _2304;
        float _2308 = _2302 + (-1.0);
        float _2310 = fma(_2162, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2312 = fma(_2166, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2314 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2318 = _2310 + _2316;
        float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2322 = _2312 + _2320;
        float _2324 = fma(_2260, _2302, _2314);
        float _2326 = _2318 * _2318;
        float _2328 = _2322 * _2322;
        _2280 = _2324;
        _2180 = _2326;
        _2182 = _2328;
        _2142 = _2310;
        _2144 = _2312;
    }
    float _2330 = _2280;
    float _2332 = _2180;
    float _2334 = _2182;
    float _2336 = _2142;
    float _2338 = _2144;
    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2342 = _2330 + _2340;
    float _2344 = _2120 * _2212;
    float _2346 = _2134 * _2212;
    float _2348 = _2118 * _2212;
    float _2350 = fma(_2342, _2342, _2332);
    float _2352 = _2268 * _2120;
    float _2354 = _2268 * _2134;
    float _2356 = _2268 * _2118;
    float _2358 = _2350 + _2334;
    float _2360 = fma(_2082, _2190, _2344);
    float _2362 = fma(_2052, _2190, _2346);
    float _2364 = fma(_2270, _2082, _2352);
    float _2366 = fma(_2270, _2052, _2354);
    float _2368 = fma(_2084, _2190, _2348);
    float _2370 = sqrt(_2358);
    float _2372 = fma(_2270, _2084, _2356);
    float _2374 = fma(_2194, _2220, _2362);
    float _2376 = fma(_2272, _2172, _2364);
    float _2378 = fma(_2272, _2194, _2366);
    float _2380 = fma(_2172, _2220, _2360);
    float _2382 = fma(_2204, _2220, _2368);
    float _2384 = fma(_2272, _2204, _2372);
    out.m_71.x = _2262;
    out.m_71.y = _2264;
    out.m_71.z = _2266;
    out.m_73.x = _2380;
    out.m_73.y = _2374;
    out.m_73.z = _2382;
    out.m_75.x = _2376;
    out.m_75.y = _2378;
    out.m_75.z = _2384;
    bool _2386 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2388 = isnan(_2370);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2394 = _2390 || _2392;
    float _2396 = _2368;
    if (!_2394)
    {
        _2396 = 1.0;
    }
    float _2398 = _2396;
    bool _2400 = !_2394;
    float _2402 = _2398;
    if (!_2400)
    {
        bool _2404 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2406 = isnan(_2370);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2412 = _2408 || _2410;
        if (!_2412)
        {
            float _2414 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2416 = _2370 + _2414;
            float _2418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2420 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2426 = 1.0 / _2420;
            float _2428 = _2416 * _2426;
            float _2430 = fma(_2428, _2424, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2402 = _2430;
            _2432 = true;
        }
        else
        {
            bool _2434 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2436 = isnan(_2370);
            bool _2438 = _2434 || _2436;
            bool _2440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2442 = _2438 || _2440;
            if (!_2442)
            {
                float _2444 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2446 = _2370 + _2444;
                float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2450 = _2448 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2454 = _2452 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2456 = 1.0 / _2450;
                float _2458 = _2446 * _2456;
                float _2460 = fma(_2458, _2454, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2402 = _2460;
                _2432 = true;
            }
            else
            {
                _2402 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2432 = false;
    float _2462 = _2402;
    float _2464 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2466 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2470 = _2336 + _2468;
    float _2472 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2464);
    bool _2474 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(0.5);
    bool _2482 = _2478 || _2480;
    float _2484 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2466);
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2488 = _2330 + _2486;
    float _2490 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2472);
    float _2492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2494 = _2338 + _2492;
    float _2496 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2484);
    float _2498 = _2490 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2500 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2502 = fma(_2488, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2504 = fma(_2494, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2506 = 1.0 / _2498;
    float _2508 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2510 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.5);
    bool _2518 = _2514 || _2516;
    float _2520 = -_1838;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2500);
    float _2524 = -_1836;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2502);
    float _2528 = -_1846;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2504);
    float _2532 = _2508 + _2498;
    float _2534 = _2526;
    float _2536 = _2522;
    float _2538 = _2530;
    float _2540 = _2498;
    float _2542 = _2502;
    if (!_2482)
    {
        float _2544 = _1856 * _1856;
        float _2546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2548 = -_1738;
        float _2550 = _2548 + _2504;
        float _2552 = -_1704;
        float _2554 = _2552 + _2502;
        float _2556 = fma(_1864, _1864, _2544);
        float _2558 = fma(_1872, _1872, _2556);
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2562 = sqrt(_2558);
        float _2564 = 1.0 / _1970;
        float _2566 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = precise::min(_2562, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2546;
        float _2572 = -_1724;
        float _2574 = _2572 + _2500;
        float _2576 = _2570 * _2564;
        float _2578 = _2566 * _2576;
        float _2580 = _2550 * _2576;
        float _2582 = fma(_2574, _2578, _1850);
        float _2584 = fma(_2554, _2578, _1844);
        float _2586 = fma(_2566, _2580, _1860);
        _2534 = _2584;
        _2536 = _2582;
        _2538 = _2586;
    }
    float _2588 = _2534;
    float _2590 = _2536;
    float _2592 = _2538;
    if (_2518)
    {
        _2540 = 1.0;
    }
    float _2594 = _2540;
    float _2596 = _2532 * _2506;
    float _2598 = _2596 * 0.5;
    float _2600 = _2594;
    if (!_2518)
    {
        float _2602 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2606 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2604);
        float _2608 = _2602 * 0.15915493667125701904296875;
        float _2610 = _2608 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2616 = _2614 * 0.15915493667125701904296875;
        float _2618 = _2608 * 6.283185482025146484375;
        float _2620 = sin(_2618);
        float _2622 = 1.0 / _2612;
        float _2624 = _2616 * 6.283185482025146484375;
        float _2626 = cos(_2624);
        float _2628 = _2620 * _2622;
        float _2630 = 1.0 / _2606;
        float _2632 = _2626 * _2628;
        float _2634 = _2616 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2640 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2638;
        float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2644 = _2630 * _2642;
        float _2646 = 1.0 / _2632;
        float _2648 = 1.0 / _2640;
        float _2650 = _2636 * _2646;
        float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2654 = fma(_2650, _2644, _2652);
        float _2656 = _2654 * _2648;
        float _2658 = precise::clamp(_2656, 0.0, 1.0);
        _2600 = _2658;
    }
    float _2660 = _2600;
    float _2662 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2664 = _2588 + _2662;
    float _2666 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2668 = _2590 + _2666;
    float _2670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2672 = _2592 + _2670;
    float _2674 = _2664 * _2664;
    float _2676 = fma(_2668, _2668, _2674);
    float _2678 = fma(_2672, _2672, _2676);
    float _2680 = rsqrt(_2678);
    float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2684 = _2668 * _2682;
    float _2686 = _2672 * _2682;
    float _2688 = _2684 * _2684;
    float _2690 = _2686 * _2686;
    float _2692 = _2688 + _2690;
    float _2694 = sqrt(_2692);
    bool _2696 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2700 = _2694 + _2698;
    float _2702 = _2672;
    float _2704 = _2692;
    float _2706 = _2700;
    float _2708 = _2664;
    float _2710 = _2684;
    if (_2696)
    {
        float _2712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2702 = _2712;
    }
    float _2714 = _2702;
    if (_2696)
    {
        float _2716 = rsqrt(_2692);
        _2704 = _2716;
    }
    float _2718 = _2704;
    if (_2696)
    {
        float _2720 = _2700 * _2714;
        _2706 = _2720;
    }
    float _2722 = _2706;
    if (_2696)
    {
        float _2724 = _2722 * 0.15915493667125701904296875;
        _2542 = _2724;
    }
    float _2726 = _2542;
    float _2728 = _2674;
    if (_2696)
    {
        float _2730 = _2726 * 6.283185482025146484375;
        float _2732 = sin(_2730);
        _2728 = _2732;
    }
    float _2734 = _2728;
    float _2736 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2738 = precise::max(0.0, _2736);
    float _2740 = _2680;
    float _2742 = _2736;
    float _2744 = _2738;
    if (_2696)
    {
        float _2746 = _2726 * 6.283185482025146484375;
        float _2748 = cos(_2746);
        _2740 = _2748;
    }
    float _2750 = _2740;
    float _2752 = -_2682;
    float _2754 = -_2738;
    float _2756 = fma(_2664, _2752, _2754);
    if (_2696)
    {
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2742 = _2758;
    }
    float _2760 = _2742;
    float _2762 = _2734;
    float _2764 = _2760;
    if (_2696)
    {
        float _2766 = fma(_2734, _2760, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2708 = _2766;
    }
    float _2768 = _2708;
    float _2770 = _2768;
    if (!_2696)
    {
        _2762 = _2756;
    }
    float _2772 = _2762;
    float _2774 = _2772;
    if (_2696)
    {
        float _2776 = _2750 + (-1.0);
        _2764 = _2776;
    }
    float _2778 = _2764;
    float _2780 = _2778;
    if (_2696)
    {
        float _2782 = _2718 * _2768;
        _1840 = _2782;
    }
    float _2784 = _1840;
    if (!_2696)
    {
        _2770 = _2688;
    }
    float _2786 = _2770;
    float _2788 = sqrt(_2678);
    float _2790 = _2786;
    if (_2696)
    {
        float _2792 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2744 = _2792;
    }
    float _2794 = _2744;
    float _2796 = _2794;
    if (_2696)
    {
        float _2798 = _2684 * _2784;
        _2710 = _2798;
    }
    float _2800 = _2710;
    if (!_2696)
    {
        _2780 = _2686;
    }
    float _2802 = _2780;
    float _2804 = _2802;
    if (_2696)
    {
        float _2806 = _2686 * _2784;
        _2804 = _2806;
    }
    float _2808 = _2804;
    if (_2696)
    {
        float _2810 = fma(_2756, _2750, _2794);
        _2774 = _2810;
    }
    float _2812 = _2774;
    if (_2696)
    {
        float _2814 = _2800 * _2800;
        _2790 = _2814;
    }
    float _2816 = _2790;
    if (!_2696)
    {
        _2796 = _2690;
    }
    float _2818 = _2796;
    float _2820 = _2818;
    if (_2696)
    {
        float _2822 = _2808 * _2808;
        _2820 = _2822;
    }
    float _2824 = _2820;
    float _2826 = fma(_2812, _2812, _2816);
    float _2828 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2830 = _2826 + _2824;
    float _2832 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2836 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2834);
    float _2838 = precise::clamp(_2836, 0.0, 1.0);
    float _2840 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2842 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2832);
    float _2844 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2846 = rsqrt(_2830);
    float _2848 = -_2838;
    float _2850 = _2848 + 1.0;
    float _2852 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2854 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2844);
    float _2856 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2842);
    float _2858 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2852);
    float _2860 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2854);
    float _2862 = _2856 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2864 = abs(_2850);
    float _2866 = log2(_2864);
    float _2868 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2828);
    float _2870 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2858);
    float _2872 = _2860 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2874 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2876 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2868);
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2880 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2882 = _2846 * _2800;
    float _2884 = -_2874;
    float _2886 = fma(_2884, _2840, 1.0);
    float _2888 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2890 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2880);
    float _2892 = _2846 * _2812;
    float _2894 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2896 = _2846 * _2808;
    float _2898 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2890);
    float _2900 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2902 = -_2894;
    float _2904 = fma(_2892, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2902);
    float _2906 = log2(_2886);
    float _2908 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2898);
    float _2910 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2912 = -_2896;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2904);
    float _2916 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2918 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2910);
    float _2920 = fma(_2914, -0.5, 0.5);
    float _2922 = exp2(_2900);
    float _2924 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2916);
    float _2926 = fma(_2914, 0.5, 0.5);
    float _2928 = _2892 + 1.0;
    float _2930 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2918);
    float _2932 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2924);
    float _2934 = fma(_2926, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2936 = 1.0 / _2908;
    float _2938 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2932);
    float _2940 = fma(_2926, _2934, -0.212114393711090087890625);
    float _2942 = _2906 * 0.693147182464599609375;
    float _2944 = fma(_2926, _2940, 1.570728778839111328125);
    float _2946 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2948 = sqrt(_2920);
    float _2950 = -_2892;
    float _2952 = fma(_2922, _2928, _2950);
    float _2954 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2930);
    float _2956 = fma(_2952, 0.5, 0.5);
    float _2958 = _2938 * _2936;
    float _2960 = _2954 * _2936;
    float _2962 = fma(_2958, 0.5, 0.5);
    float _2964 = fma(_2960, -0.5, 0.5);
    float _2966 = _2948 * 0.636619746685028076171875;
    float _2968 = -_2944;
    float _2970 = fma(_2966, _2968, 1.0);
    float3 _7808 = float3(_2962, _2964, _2946);
    float _2972 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7808, float3(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7808, float3(0.0), isnan(_7808)), level(0.0)).x;
    float3 _7819 = float3(_2962, _2964, _2946);
    float4 _2975 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7819, float3(0.0), isnan(_7819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7819, float3(0.0), isnan(_7819)), level(0.0)).xyzw;
    float _2977 = _2975.x;
    float _2979 = _2975.y;
    float _2981 = _2975.z;
    float _2983 = _2975.w;
    float2 _7836 = float2(_2970, _2956);
    float3 _2987 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7836, float2(0.0), isnan(_7836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7836, float2(0.0), isnan(_7836)), level(0.0)).xyz;
    float _2989 = _2987.x;
    float _2991 = _2987.y;
    float _2993 = _2987.z;
    float _2995 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2997 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2999 = _2660 > 0.0;
    bool _3001 = isnan(_2660);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(0.0);
    bool _3007 = _3003 || _3005;
    float _3009 = _2660 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3011 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2997);
    float _3013 = exp2(_2995);
    float _3015 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3011);
    float _3017 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3015);
    float _3019 = _3017 + _2908;
    out.gl_Position.x = _2938;
    out.gl_Position.y = _2954;
    out.gl_Position.z = _3017;
    out.gl_Position.w = _2908;
    float _3021 = _3019 * 0.5;
    float _3023 = -_3013;
    float _3025 = _3023 + 1.0;
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3029 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _3021;
    out.m_77.w = _2908;
    float _3031 = -_3029;
    float _3033 = _3031 + 1.0;
    out.m_47.x = _3027;
    float _3035 = _3029 * _2972;
    float _3037 = _2983 * _3035;
    float _3039 = _2993 * _3035;
    float _3041 = _2983 * _3033;
    float _3043 = fma(_2989, _3037, _2977);
    float _3045 = fma(_2991, _3037, _2979);
    float _3047 = fma(_2983, _3039, _2981);
    out.m_79.x = _3043;
    out.m_79.y = _3045;
    out.m_79.z = _3047;
    out.m_79.w = _3041;
    if (_3007)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3049;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2432 = false;
    bool _1086 = false;
    bool _752 = false;
    bool _464 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    float _110 = _108;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_102)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3105 = as_type<float>(_116);
        out.gl_Position.z = _3105;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    int _150 = 0;
    if (_144)
    {
        float _152 = _148 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3175 = as_type<float>(_154);
        out.gl_Position.z = _3175;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_51.w;
    float _158 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = _158;
    if (!_168)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _106 = _186;
    }
    float _188 = _106;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_168;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _158 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _158);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_168;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _158 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _170, _258);
    float _266 = fma(_254, _172, _260);
    float _268 = fma(_254, _174, _262);
    float _270 = fma(_264, _156, _176);
    float _272 = fma(_266, _156, _178);
    float _274 = fma(_268, _156, _180);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _132 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = 1.0 / _340;
    float _360 = -_356;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = _336 * _362;
    float _368 = -_336;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _344;
    float _374 = _308 * _358;
    float _376 = -_320;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _356 * _378;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _324 * _372;
    float _398 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _394 * _366;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _398 * _366;
    float _410 = _400 * _366;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _422 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _424 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_406, _396, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_418, _396, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _432 = fma(_424, _384, _420);
    float _434 = fma(_426, _384, _422);
    float _436 = fma(_428, _384, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_364;
    float _462;
    if (!_444)
    {
        float _446 = in.m_53.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_98);
        float _468 = 1.0 / _466;
        float _470 = _132 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_51.x;
    float _476 = in.m_51.y;
    float _478 = in.m_51.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _482 = _472 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = 1.0 / _486;
    float _502 = 1.0 / _494;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _472 + _504;
    bool _508 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _510 = 1.0 / _490;
    float _512 = _442 * _478;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _516 = _472 + _514;
    float _518 = _506 * _500;
    float _520 = _440 * _476;
    bool _522 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _524 = isnan(_472);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _472 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _538;
    float _542 = 1.0 / _498;
    float _544 = _516 * _502;
    bool _546 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _548 = isnan(_472);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -_532;
    float _560 = _558 + 1.0;
    float _562 = fma(_540, _518, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _564 = _438 * _474;
    float _566 = _536 * _510;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _568;
    float _572 = _556 * _560;
    float _574 = -_556;
    float _576 = _574 + 1.0;
    bool _578 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _580 = isnan(_472);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = fma(_570, _518, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _592 = _482 * _542;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _594;
    bool _598 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _600 = isnan(_472);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = fma(_596, _518, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _612 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _614 = isnan(_472);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -_608;
    float _626 = _624 + 1.0;
    float _628 = _608 * _576;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _638 = _622 * _626;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = fma(_636, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _650 = fma(_632, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _652 = _588 * _642;
    float _654 = fma(_646, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _656 = -_588;
    float _658 = _656 + 1.0;
    float _660 = _590 * _652;
    float _662 = _562 * _652;
    float _664 = _610 * _652;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _666;
    float _670 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].x, _660);
    float _672 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].y, _662);
    float _674 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[107].z, _664);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _680;
    float _684 = fma(_668, _544, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _686 = fma(_648, _638, _670);
    float _688 = fma(_654, _638, _674);
    float _690 = fma(_678, _544, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _692 = fma(_650, _638, _672);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _702 = fma(_682, _544, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _708 = fma(_684, _628, _686);
    float _710 = fma(_696, _592, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _712 = fma(_700, _592, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _714 = fma(_690, _628, _692);
    float _716 = fma(_706, _592, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _718 = fma(_702, _628, _688);
    float _720 = fma(_710, _572, _708);
    float _722 = fma(_712, _572, _714);
    float _724 = fma(_716, _572, _718);
    float _726 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].x, _720);
    float _728 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].y, _722);
    float _730 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].z, _724);
    bool _732 = !_508;
    float _750;
    if (!_732)
    {
        float _734 = in.m_53.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_98);
        float _756 = 1.0 / _754;
        float _758 = _132 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _764 = _760 + _762;
    float _766 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _768 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _770 = isnan(_760);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _784 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _796;
    bool _800 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _802 = isnan(_760);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_778;
    float _814 = _812 + 1.0;
    float _816 = 1.0 / _782;
    bool _818 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _820 = isnan(_760);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -_810;
    float _832 = _830 + 1.0;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _838 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _840 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _842 = 1.0 / _836;
    float _844 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _848 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _850 = _798 * _816;
    float _852 = -_794;
    float _854 = _852 + 1.0;
    float _856 = _794 * _814;
    bool _858 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_760);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = fma(_850, _764, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _872 = _810 * _854;
    float _874 = _828 * _832;
    float _876 = -_828;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _884 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _886 = isnan(_760);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = _868 * _878;
    float _898 = -_868;
    float _900 = _898 + 1.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _908 = isnan(_760);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _882;
    float _920 = _894 * _900;
    float _922 = -_894;
    float _924 = _922 + 1.0;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _930 = _916 * _924;
    float _932 = 1.0 / _904;
    float _934 = _928 * _842;
    float _936 = -_916;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _944;
    float _948 = 1.0 / _942;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _954 = _870 * _930;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _958 = _760 + _956;
    float _960 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _966 = 1.0 / _952;
    float _968 = fma(_934, _958, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _970 = _946 * _932;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _974 = _760 + _972;
    float _976 = fma(_968, _920, _960);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _980 = _760 + _978;
    float _982 = fma(_970, _974, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _984 = 1.0 / _964;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _998 = _988 * _918;
    float _1000 = fma(_982, _896, _976);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1004 = _760 + _1002;
    float _1006 = _992 * _966;
    float _1008 = fma(_998, _980, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _1010;
    bool _1014 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _1016 = isnan(_760);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _996 * _948;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1030 = _760 + _1028;
    float _1032 = fma(_1006, _1004, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1034 = fma(_1008, _874, _1000);
    float _1036 = _1012 * _984;
    float _1038 = fma(_1026, _1030, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _1040 = -_1024;
    float _1042 = _1040 + 1.0;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _1046 = _760 + _1044;
    float _1048 = fma(_1032, _872, _1034);
    float _1050 = _778 * _1042;
    float _1052 = fma(_1036, _1046, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _1054 = fma(_1038, _856, _1048);
    float _1056 = fma(_1052, _1050, _1054);
    float _1058 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[122].x, _1056);
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _844;
    out.m_55.y = _846;
    out.m_55.z = _1058;
    out.m_55.w = _1062;
    bool _1064 = !_848;
    float _1066 = _844;
    float _1084;
    if (!_1064)
    {
        float _1068 = in.m_53.x;
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1072 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1076 = _1074 * _1070;
        float _1078 = floor(_1076);
        float _1080 = -_1078;
        float _1082 = _1076 + _1080;
        _1084 = _1082;
        _1066 = _1076;
        _1086 = true;
    }
    else
    {
        float _1088 = float(_98);
        float _1090 = 1.0 / _1088;
        float _1092 = _132 * _1090;
        _1084 = _1092;
    }
    _1086 = false;
    float _1094 = _1084;
    float _1096 = _1066;
    float _1098 = in.m_53.w;
    float _1100 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1102 = in.m_57.x;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1106 = _1104 != 0;
    float _1108 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1110 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1100);
    float _1112 = in.m_53.x;
    float _1114 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1116 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1108);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_57.y;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    float _1128 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1132 = _1130 != 0;
    float _1134 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1114);
    float _1136 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1138 = log2(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1142 = _1094 + _1140;
    float _1144 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1128);
    bool _1146 = _1098 > 0.5;
    float _1148 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1158 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1148);
    int _1160 = as_type<int>(_1148);
    float _1162 = _1096;
    float _1164 = _1102;
    if (_1106)
    {
        float _1166 = -_1102;
        float _1168 = _1166 + 1.0;
        _1160 = as_type<int>(_1168);
    }
    int _1170 = _1160;
    float _1172 = 1.0 / _1152;
    bool _1174 = false;
    if (_1106)
    {
        bool _1176 = _1112 > 0.5;
        _1174 = _1176;
    }
    bool _1178 = _1174;
    float _1180 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    if (!_1106)
    {
        _1162 = _1102;
    }
    float _1182 = _1162;
    float _1184 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1158);
    float _1186 = _1182;
    if (_1106)
    {
        float _1188 = _1178 ? as_type<float>(_1170) : _1102;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1134);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1206;
    float _1210 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1116);
    float _1212 = in.m_53.z;
    float _1214 = 1.0 / _1156;
    float _1216 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1110);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1220 = _1218 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1222 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1180);
    float _1224 = _1142 * _1172;
    float _1226 = in.m_53.y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1230 = _1094 + _1228;
    float _1232 = 1.0 / _1208;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1236 = _1094 + _1234;
    float _1238 = _1138 * _132;
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1244 = _1094 + _1242;
    float _1246 = 1.0 / _1220;
    float _1248 = _1230 * _1214;
    float _1250 = -_1122;
    float _1252 = _1250 + 1.0;
    float _1254 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1240);
    int _1256 = 0;
    float _1258 = _1122;
    bool _1260 = _1132;
    if (_1120)
    {
        float _1262 = -_1102;
        float _1264 = _1262 + 1.0;
        _1256 = as_type<int>(_1264);
    }
    int _1266 = _1256;
    float _1268 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1144);
    float _1270 = _1236 * _1232;
    float _1272 = _1212 * 2.0;
    float _1274 = exp2(_1238);
    int _1276 = _1146 ? as_type<int>(_1252) : as_type<int>(_1122);
    float _1278 = _1112 * 2.0;
    bool _1280 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1282 = isnan(1.0);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1288 = _1284 || _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1292 = 1.0 + _1290;
    float _1294 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1254);
    float _1296 = _1244 * _1246;
    float _1298 = _1226 * 2.0;
    float _1300 = floor(_1272);
    float _1302 = _1226 + _1212;
    float _1304 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    bool _1306 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1308 = isnan(_1094);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1302 + (-1.0);
    float _1320 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1222);
    float _1322 = 1.0 / _1292;
    float _1324 = -_1274;
    float _1326 = _1324 + 1.0;
    float _1328 = -_1316;
    float _1330 = _1328 + 1.0;
    float _1332 = _1184 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    bool _1334 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1336 = isnan(_1094);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1348 = floor(_1278);
    float _1350 = _1126 ? as_type<float>(_1276) : _1122;
    float _1352 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1354 = _1226 > 0.5;
    float _1356 = _1112 + _1226;
    float _1358 = -_1344;
    float _1360 = _1358 + 1.0;
    float _1362 = _1304;
    float _1364 = _1346;
    if (_1132)
    {
        float _1366 = _1354 ? _1252 : _1122;
        _1258 = _1366;
    }
    float _1368 = _1258;
    float _1370 = floor(_1298);
    if (_1120)
    {
        bool _1372 = _1212 > 0.5;
        _1260 = _1372;
    }
    bool _1374 = _1260;
    float _1376 = _1356 + (-1.0);
    bool _1378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    float _1388 = _1192 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    if (_1120)
    {
        float _1390 = _1374 ? as_type<float>(_1266) : _1102;
        _1164 = _1390;
    }
    float _1392 = _1164;
    float _1394 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1396 = _1300 > 0.0;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1398;
    bool _1402 = _1300 >= 0.0;
    bool _1404 = isnan(_1300);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = sqrt(_1268);
    float _1414 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1416 = _1386 ? _1326 : 0.0;
    bool _1418 = _1348 >= 0.0;
    bool _1420 = isnan(_1348);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.0);
    bool _1426 = _1422 || _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    if (_1288)
    {
        float _1436 = _1416 * _1322;
        _134 = _1436;
    }
    float _1438 = _134;
    bool _1440 = _1348 > 0.0;
    float _1442 = fma(_1430, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1444 = _1410 ? 0 : 1;
    float _1446 = fma(_1434, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _1448 = _1426 ? 0 : 1;
    float _1450 = sqrt(_1320);
    float _1452 = _1412 * _1332;
    bool _1454 = _1370 > 0.0;
    bool _1456 = _1370 >= 0.0;
    bool _1458 = isnan(_1370);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1474 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1476 = isnan(_1094);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = fma(_1468, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1488 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1490 = isnan(_1094);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_1472, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1514 = fma(_1502, _1224, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1516 = fma(_1506, _1248, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1518;
    float _1522 = _1316 * _1510;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1524;
    float _1528 = fma(_1400, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1530 = fma(_1520, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1532 = _1344 * _1330;
    float _1534 = fma(_1526, _1270, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1536 = _1094 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1538 = isnan(_1094);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1556 = sqrt(_1294);
    float _1558 = _1450 * _1304;
    float _1560 = -_1546;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1550, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1566 = _1546 * _1360;
    float _1568 = fma(_1554, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1570 = _1498 * _1562;
    float _1572 = -_1498;
    float _1574 = _1572 + 1.0;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1578 = _1576 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1580 = _1442 * _1570;
    float _1582 = _1514 * _1570;
    float _1584 = _1486 * _1570;
    int _1586 = ~_1444;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1580);
    float _1594 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1582);
    float _1596 = _1556 * _1346;
    int _1598 = _1464 ? 0 : 1;
    float _1600 = fma(_1446, _1566, _1592);
    float _1602 = fma(_1516, _1566, _1594);
    float _1604 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1584);
    float _1606 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = fma(_1530, _1532, _1600);
    bool _1610 = !_1204;
    int _1612 = _1610 ? 0 : 1;
    float _1614 = fma(_1512, _1566, _1604);
    int _1616 = ~_1448;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = fma(_1578, _1296, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _1624 = ~_1598;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    float _1630 = fma(_1528, _1532, _1614);
    int _1632 = _1590;
    int _1634 = _1620;
    int _1636 = _1628;
    if (!_1396)
    {
        int _1638 = ~_1444;
        int _1640 = _1638 + 1;
        _1632 = _1640;
    }
    int _1642 = _1632;
    float _1644 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1440)
    {
        int _1646 = ~_1448;
        int _1648 = _1646 + 1;
        _1634 = _1648;
    }
    int _1650 = _1634;
    float _1652 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1454)
    {
        int _1654 = ~_1598;
        int _1656 = _1654 + 1;
        _1636 = _1656;
    }
    int _1658 = _1636;
    float _1660 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    bool _1662 = !_1196;
    int _1664 = _1662 ? 0 : 1;
    float _1666 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1652);
    bool _1668 = !_1200;
    int _1670 = _1668 ? 0 : 1;
    float _1672 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1644);
    int _1674 = abs(_1612);
    float _1676 = fma(_1534, _1532, _1602);
    int _1678 = abs(_1664);
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1666);
    int _1682 = abs(_1670);
    float _1684 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1660);
    float _1686 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1672);
    float _1688 = in.m_59.x;
    float _1690 = in.m_59.y;
    float _1692 = in.m_59.z;
    float _1694 = float(_1678);
    float _1696 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1680);
    float _1698 = float(_1642);
    float _1700 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1684);
    float _1702 = float(_1674);
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1706 = float(_1658);
    float _1708 = _1694 * _1698;
    float _1710 = float(_1682);
    float _1712 = fma(_1564, _1522, _1608);
    float _1714 = float(_1650);
    float _1716 = _1702 * _1706;
    float _1718 = fma(_1622, _1522, _1676);
    float _1720 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1686);
    float _1722 = _1708 * (-2.0);
    float _1724 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = _1704 + _1726;
    float _1730 = _1710 * _1714;
    float _1732 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1712);
    float _1734 = fma(_1394, _1722, _1394);
    float _1736 = fma(_1568, _1522, _1630);
    float _1738 = _1720 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1724 + _1740;
    float _1744 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1748 = fma(_1722, _1688, _1688);
    float _1750 = _1730 * (-2.0);
    float _1752 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1736);
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1738 + _1754;
    float _1758 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1744);
    float _1760 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1718);
    float _1762 = fma(_1750, _1690, _1690);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1758);
    float _1768 = _1112 + (-0.5);
    float _1770 = _1226 + (-0.5);
    float _1772 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1774 = fma(_1352, _1750, _1352);
    bool _1776 = _1766 >= 0.0;
    float _1778 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1748);
    float _1780 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1782 = _1728 * _1728;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1786 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1762);
    float _1788 = _1780 * _1746;
    float _1790 = fma(_1742, _1742, _1782);
    float _1792 = _1732 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1794 = _1772 * _1764;
    float _1796 = fma(_1756, _1756, _1790);
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1800 = _1762;
    if (_1776)
    {
        _1800 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1802 = _1800;
    float _1804 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1806 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1808 = _1760 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1810 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1814 = rsqrt(_1796);
    float _1816 = _1414 * _1784;
    float _1818 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1822 = as_type<int>(_1802);
    if (_1776)
    {
        float _1824 = _1802 * 5.0;
        _1822 = as_type<int>(_1824);
    }
    int _1826 = _1822;
    float _1828 = fma(_1734, _1438, _1778);
    if (_1776)
    {
        out.m_47.x = 0.0;
    }
    float _1830 = fma(_1774, _1438, _1786);
    float _1832 = _1804 * _1798;
    out.m_61.x = _1810;
    out.m_61.y = _1818;
    out.m_61.z = _1820;
    out.m_61.w = _1812;
    float _1834 = _1828 * 0.15915493667125701904296875;
    out.m_63.x = _1788;
    out.m_63.y = _1816;
    out.m_63.z = _1832;
    out.m_63.w = _1794;
    float _1836 = _1728 * _1814;
    float _1838 = _1742 * _1814;
    float _1840 = _1838;
    if (_1776)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5919 = as_type<float>(_1826);
        out.gl_Position.z = _5919;
    }
    if (_1776)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1842 = -_1836;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1846 = _1756 * _1814;
    float _1848 = -_1838;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1852 = _1112 + _1212;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1856 = _1844 + _1854;
    float _1858 = -_1846;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1850 + _1862;
    float _1866 = _1852 + (-1.0);
    float _1868 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1872 = _1860 + _1870;
    float _1874 = _1716 * (-2.0);
    float _1876 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1878 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1868);
    float _1880 = _1212 + (-0.5);
    float _1882 = -_1836;
    float _1884 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1728);
    float _1886 = -_1838;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1742);
    float _1890 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1878);
    float _1892 = fma(_1874, _1692, _1692);
    float _1894 = fma(_1876, _1874, _1876);
    float _1896 = _1830 * 0.15915493667125701904296875;
    float _1898 = _1834 * 6.283185482025146484375;
    float _1900 = sin(_1898);
    float _1902 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1892);
    bool _1904 = _1890 >= 0.0;
    float _1906 = -_1846;
    float _1908 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1910 = fma(_1894, _1438, _1902);
    float _1912 = _1884 * _1884;
    float _1914 = _1834 * 6.283185482025146484375;
    float _1916 = cos(_1914);
    float _1918 = _1910 * 0.15915493667125701904296875;
    float _1920 = fma(_1888, _1888, _1912);
    float _1922 = fma(_1908, _1908, _1920);
    float _1924 = _1912;
    if (_1904)
    {
        _1924 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1926 = _1924;
    float _1928 = _1896 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    int _1932 = as_type<int>(_1926);
    if (_1904)
    {
        out.m_47.x = 0.0;
    }
    if (_1904)
    {
        float _1934 = _1926 * 5.0;
        _1932 = as_type<int>(_1934);
    }
    int _1936 = _1932;
    float _1938 = _1896 * 6.283185482025146484375;
    float _1940 = cos(_1938);
    if (_1904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6094 = as_type<float>(_1936);
        out.gl_Position.z = _6094;
    }
    float _1942 = _1918 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = sqrt(_1922);
    if (_1904)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1948 = in.m_65.x;
    float _1950 = in.m_65.y;
    float _1952 = in.m_65.z;
    float _1954 = _1918 * 6.283185482025146484375;
    float _1956 = cos(_1954);
    float _1958 = _1900 * _1930;
    float _1960 = _1916 * _1940;
    float _1962 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1964 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1966 = fma(_1944, _1960, _1958);
    float _1968 = fma(_1944, _1958, _1960);
    float _1970 = _1814 * _1946;
    float _1972 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1974 = _1916 * _1930;
    float _1976 = _1900 * _1940;
    float _1978 = _1970 * _1962;
    float _1980 = _1970 * _1964;
    float _1982 = _1970 * _1972;
    float _1984 = _1916 * _1956;
    float _1986 = _1940 * _1956;
    float _1988 = _1900 * _1956;
    float _1990 = _1930 * _1956;
    float _1992 = -_1974;
    float _1994 = fma(_1944, _1976, _1992);
    float _1996 = -_1976;
    float _1998 = fma(_1944, _1974, _1996);
    float _2000 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1948);
    float _2004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1950);
    float _2006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1952);
    float _2008 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2010 = _2002 * _1978;
    float _2012 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2014 = _2004 * _1982;
    float _2016 = _2006 * _1980;
    float _2018 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2020 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2012);
    float _2022 = -_2014;
    float _2024 = _1944 * _2022;
    float _2026 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2028 = -_1944;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2000);
    float _2032 = -_1944;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2008);
    float _2036 = -_1944;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2018);
    float _2040 = fma(_1986, _2010, _2024);
    float _2042 = _1984 * _2014;
    float _2044 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2026);
    float _2046 = _1988 * _2014;
    float _2048 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2050 = fma(_1966, _2010, _2042);
    float _2052 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2044);
    float _2054 = fma(_1994, _2010, _2046);
    bool _2056 = _1950 != 0.0;
    bool _2058 = isnan(_1950);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.0);
    bool _2064 = _2060 || _2062;
    float _2066 = in.m_67.x;
    float _2068 = in.m_67.y;
    float _2070 = in.m_67.z;
    float _2072 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2048);
    float _2074 = fma(_1998, _2016, _2050);
    bool _2076 = _1948 == 0.0;
    bool _2078 = !_2064;
    bool _2080 = _2076 && _2078;
    float _2082 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2020);
    float _2084 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2072);
    float _2086 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2090 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(_1990, _2016, _2040);
    float _2094 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2096 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2098 = _1952 == 0.0;
    bool _2100 = _2098 && _2080;
    float _2102 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    float _2104 = fma(_1968, _2016, _2054);
    float _2106 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    float _2108 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2096);
    float _2110 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    float _2112 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2114 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2106);
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2108);
    float _2118 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2120 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2030);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2124 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2126 = _2016;
    float _2128 = _2030;
    float _2130 = _2122;
    if (_2100)
    {
        _1362 = _2066;
    }
    float _2132 = _1362;
    float _2134 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2034);
    float _2136 = _1724 + _2122;
    float _2138 = _1738 + _2124;
    float _2140 = _2132;
    float _2142 = _2136;
    float _2144 = _2138;
    if (_2100)
    {
        _2126 = _2132;
    }
    float _2146 = _2126;
    float _2148 = in.m_69.x;
    float _2150 = in.m_69.y;
    float _2152 = in.m_69.z;
    float _2154 = in.m_69.w;
    float _2156 = _2146;
    if (!_2100)
    {
        _2140 = _2066;
    }
    float _2158 = _2140;
    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2162 = _2136 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2166 = _2138 + _2164;
    float _2168 = 0.0;
    if (_2100)
    {
        _2168 = _2068;
    }
    float _2170 = _2168;
    float _2172 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2102);
    float _2174 = _2162 * _2162;
    float _2176 = _2166 * _2166;
    float _2178 = _2170;
    float _2180 = _2174;
    float _2182 = _2176;
    if (_2100)
    {
        _1364 = _2070;
    }
    float _2184 = _1364;
    float _2186 = _2184;
    if (!_2100)
    {
        float _2188 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2158);
        _2156 = _2188;
    }
    float _2190 = _2156;
    if (_2100)
    {
        _2128 = _2170;
    }
    float _2192 = _2128;
    float _2194 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2110);
    float _2196 = _2192;
    if (!_2100)
    {
        _2178 = _2068;
    }
    float _2198 = _2178;
    float _2200 = _2174 + _2176;
    if (_2100)
    {
        _2130 = _2184;
    }
    float _2202 = _2130;
    float _2204 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2112);
    float _2206 = _2202;
    if (!_2100)
    {
        _2186 = _2070;
    }
    float _2208 = _2186;
    if (!_2100)
    {
        float _2210 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2198);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = sqrt(_2200);
    float _2216 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2100)
    {
        float _2218 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2208);
        _2206 = _2218;
    }
    float _2220 = _2206;
    float _2222 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2224 = _2120 * _2150;
    float _2226 = _2134 * _2150;
    float _2228 = _2118 * _2150;
    float _2230 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    float _2232 = fma(_2082, _2148, _2224);
    float _2234 = _2152 * _2158;
    float _2236 = _2148 * _2198;
    float _2238 = _2150 * _2208;
    float _2240 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2242 = fma(_2052, _2148, _2226);
    bool _2244 = _2214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2246 = fma(_2084, _2148, _2228);
    float _2248 = -_2234;
    float _2250 = fma(_2148, _2208, _2248);
    float _2252 = -_2236;
    float _2254 = fma(_2150, _2158, _2252);
    float _2256 = -_2238;
    float _2258 = fma(_2152, _2198, _2256);
    float _2260 = _1704 + _2240;
    float _2262 = fma(_2172, _2152, _2232);
    float _2264 = fma(_2194, _2152, _2242);
    float _2266 = fma(_2204, _2152, _2246);
    float _2268 = _2250 * _2154;
    float _2270 = _2258 * _2154;
    float _2272 = _2254 * _2154;
    float _2274 = _2154;
    if (!_2244)
    {
        _2274 = _2260;
    }
    float _2276 = _2274;
    bool _2278 = !_2244;
    float _2280 = _2276;
    if (!_2278)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2286 = _2214 + _2284;
        float _2288 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2290 = rsqrt(_2200);
        float _2292 = _2286 * _2282;
        float _2294 = _2292 * 0.15915493667125701904296875;
        float _2296 = _2294 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2294 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        float _2304 = fma(_2298, _2288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2306 = _2290 * _2304;
        float _2308 = _2302 + (-1.0);
        float _2310 = fma(_2162, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2312 = fma(_2166, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2314 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2318 = _2310 + _2316;
        float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2322 = _2312 + _2320;
        float _2324 = fma(_2260, _2302, _2314);
        float _2326 = _2318 * _2318;
        float _2328 = _2322 * _2322;
        _2280 = _2324;
        _2180 = _2326;
        _2182 = _2328;
        _2142 = _2310;
        _2144 = _2312;
    }
    float _2330 = _2280;
    float _2332 = _2180;
    float _2334 = _2182;
    float _2336 = _2142;
    float _2338 = _2144;
    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2342 = _2330 + _2340;
    float _2344 = _2120 * _2212;
    float _2346 = _2134 * _2212;
    float _2348 = _2118 * _2212;
    float _2350 = fma(_2342, _2342, _2332);
    float _2352 = _2268 * _2120;
    float _2354 = _2268 * _2134;
    float _2356 = _2268 * _2118;
    float _2358 = _2350 + _2334;
    float _2360 = fma(_2082, _2190, _2344);
    float _2362 = fma(_2052, _2190, _2346);
    float _2364 = fma(_2270, _2082, _2352);
    float _2366 = fma(_2270, _2052, _2354);
    float _2368 = fma(_2084, _2190, _2348);
    float _2370 = sqrt(_2358);
    float _2372 = fma(_2270, _2084, _2356);
    float _2374 = fma(_2194, _2220, _2362);
    float _2376 = fma(_2272, _2172, _2364);
    float _2378 = fma(_2272, _2194, _2366);
    float _2380 = fma(_2172, _2220, _2360);
    float _2382 = fma(_2204, _2220, _2368);
    float _2384 = fma(_2272, _2204, _2372);
    out.m_71.x = _2262;
    out.m_71.y = _2264;
    out.m_71.z = _2266;
    out.m_73.x = _2380;
    out.m_73.y = _2374;
    out.m_73.z = _2382;
    out.m_75.x = _2376;
    out.m_75.y = _2378;
    out.m_75.z = _2384;
    bool _2386 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2388 = isnan(_2370);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2394 = _2390 || _2392;
    float _2396 = _2368;
    if (!_2394)
    {
        _2396 = 1.0;
    }
    float _2398 = _2396;
    bool _2400 = !_2394;
    float _2402 = _2398;
    if (!_2400)
    {
        bool _2404 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2406 = isnan(_2370);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2412 = _2408 || _2410;
        if (!_2412)
        {
            float _2414 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2416 = _2370 + _2414;
            float _2418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2420 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2426 = 1.0 / _2420;
            float _2428 = _2416 * _2426;
            float _2430 = fma(_2428, _2424, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2402 = _2430;
            _2432 = true;
        }
        else
        {
            bool _2434 = _2370 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2436 = isnan(_2370);
            bool _2438 = _2434 || _2436;
            bool _2440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2442 = _2438 || _2440;
            if (!_2442)
            {
                float _2444 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2446 = _2370 + _2444;
                float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2450 = _2448 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2454 = _2452 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2456 = 1.0 / _2450;
                float _2458 = _2446 * _2456;
                float _2460 = fma(_2458, _2454, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2402 = _2460;
                _2432 = true;
            }
            else
            {
                _2402 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2432 = false;
    float _2462 = _2402;
    float _2464 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2466 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2470 = _2336 + _2468;
    float _2472 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2464);
    bool _2474 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(0.5);
    bool _2482 = _2478 || _2480;
    float _2484 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2466);
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2488 = _2330 + _2486;
    float _2490 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2472);
    float _2492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2494 = _2338 + _2492;
    float _2496 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2484);
    float _2498 = _2490 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2500 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2502 = fma(_2488, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2504 = fma(_2494, _2462, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2506 = 1.0 / _2498;
    float _2508 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2510 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.5);
    bool _2518 = _2514 || _2516;
    float _2520 = -_1838;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2500);
    float _2524 = -_1836;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2502);
    float _2528 = -_1846;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2504);
    float _2532 = _2508 + _2498;
    float _2534 = _2526;
    float _2536 = _2522;
    float _2538 = _2530;
    float _2540 = _2498;
    float _2542 = _2502;
    if (!_2482)
    {
        float _2544 = _1856 * _1856;
        float _2546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2548 = -_1738;
        float _2550 = _2548 + _2504;
        float _2552 = -_1704;
        float _2554 = _2552 + _2502;
        float _2556 = fma(_1864, _1864, _2544);
        float _2558 = fma(_1872, _1872, _2556);
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2562 = sqrt(_2558);
        float _2564 = 1.0 / _1970;
        float _2566 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = precise::min(_2562, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2546;
        float _2572 = -_1724;
        float _2574 = _2572 + _2500;
        float _2576 = _2570 * _2564;
        float _2578 = _2566 * _2576;
        float _2580 = _2550 * _2576;
        float _2582 = fma(_2574, _2578, _1850);
        float _2584 = fma(_2554, _2578, _1844);
        float _2586 = fma(_2566, _2580, _1860);
        _2534 = _2584;
        _2536 = _2582;
        _2538 = _2586;
    }
    float _2588 = _2534;
    float _2590 = _2536;
    float _2592 = _2538;
    if (_2518)
    {
        _2540 = 1.0;
    }
    float _2594 = _2540;
    float _2596 = _2532 * _2506;
    float _2598 = _2596 * 0.5;
    float _2600 = _2594;
    if (!_2518)
    {
        float _2602 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2606 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2604);
        float _2608 = _2602 * 0.15915493667125701904296875;
        float _2610 = _2608 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2616 = _2614 * 0.15915493667125701904296875;
        float _2618 = _2608 * 6.283185482025146484375;
        float _2620 = sin(_2618);
        float _2622 = 1.0 / _2612;
        float _2624 = _2616 * 6.283185482025146484375;
        float _2626 = cos(_2624);
        float _2628 = _2620 * _2622;
        float _2630 = 1.0 / _2606;
        float _2632 = _2626 * _2628;
        float _2634 = _2616 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2640 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2638;
        float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2644 = _2630 * _2642;
        float _2646 = 1.0 / _2632;
        float _2648 = 1.0 / _2640;
        float _2650 = _2636 * _2646;
        float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2654 = fma(_2650, _2644, _2652);
        float _2656 = _2654 * _2648;
        float _2658 = precise::clamp(_2656, 0.0, 1.0);
        _2600 = _2658;
    }
    float _2660 = _2600;
    float _2662 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2664 = _2588 + _2662;
    float _2666 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2668 = _2590 + _2666;
    float _2670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2672 = _2592 + _2670;
    float _2674 = _2664 * _2664;
    float _2676 = fma(_2668, _2668, _2674);
    float _2678 = fma(_2672, _2672, _2676);
    float _2680 = rsqrt(_2678);
    float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2684 = _2668 * _2682;
    float _2686 = _2672 * _2682;
    float _2688 = _2684 * _2684;
    float _2690 = _2686 * _2686;
    float _2692 = _2688 + _2690;
    float _2694 = sqrt(_2692);
    bool _2696 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2700 = _2694 + _2698;
    float _2702 = _2672;
    float _2704 = _2692;
    float _2706 = _2700;
    float _2708 = _2664;
    float _2710 = _2684;
    if (_2696)
    {
        float _2712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2702 = _2712;
    }
    float _2714 = _2702;
    if (_2696)
    {
        float _2716 = rsqrt(_2692);
        _2704 = _2716;
    }
    float _2718 = _2704;
    if (_2696)
    {
        float _2720 = _2700 * _2714;
        _2706 = _2720;
    }
    float _2722 = _2706;
    if (_2696)
    {
        float _2724 = _2722 * 0.15915493667125701904296875;
        _2542 = _2724;
    }
    float _2726 = _2542;
    float _2728 = _2674;
    if (_2696)
    {
        float _2730 = _2726 * 6.283185482025146484375;
        float _2732 = sin(_2730);
        _2728 = _2732;
    }
    float _2734 = _2728;
    float _2736 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2738 = precise::max(0.0, _2736);
    float _2740 = _2680;
    float _2742 = _2736;
    float _2744 = _2738;
    if (_2696)
    {
        float _2746 = _2726 * 6.283185482025146484375;
        float _2748 = cos(_2746);
        _2740 = _2748;
    }
    float _2750 = _2740;
    float _2752 = -_2682;
    float _2754 = -_2738;
    float _2756 = fma(_2664, _2752, _2754);
    if (_2696)
    {
        float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2742 = _2758;
    }
    float _2760 = _2742;
    float _2762 = _2734;
    float _2764 = _2760;
    if (_2696)
    {
        float _2766 = fma(_2734, _2760, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2708 = _2766;
    }
    float _2768 = _2708;
    float _2770 = _2768;
    if (!_2696)
    {
        _2762 = _2756;
    }
    float _2772 = _2762;
    float _2774 = _2772;
    if (_2696)
    {
        float _2776 = _2750 + (-1.0);
        _2764 = _2776;
    }
    float _2778 = _2764;
    float _2780 = _2778;
    if (_2696)
    {
        float _2782 = _2718 * _2768;
        _1840 = _2782;
    }
    float _2784 = _1840;
    if (!_2696)
    {
        _2770 = _2688;
    }
    float _2786 = _2770;
    float _2788 = sqrt(_2678);
    float _2790 = _2786;
    if (_2696)
    {
        float _2792 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2744 = _2792;
    }
    float _2794 = _2744;
    float _2796 = _2794;
    if (_2696)
    {
        float _2798 = _2684 * _2784;
        _2710 = _2798;
    }
    float _2800 = _2710;
    if (!_2696)
    {
        _2780 = _2686;
    }
    float _2802 = _2780;
    float _2804 = _2802;
    if (_2696)
    {
        float _2806 = _2686 * _2784;
        _2804 = _2806;
    }
    float _2808 = _2804;
    if (_2696)
    {
        float _2810 = fma(_2756, _2750, _2794);
        _2774 = _2810;
    }
    float _2812 = _2774;
    if (_2696)
    {
        float _2814 = _2800 * _2800;
        _2790 = _2814;
    }
    float _2816 = _2790;
    if (!_2696)
    {
        _2796 = _2690;
    }
    float _2818 = _2796;
    float _2820 = _2818;
    if (_2696)
    {
        float _2822 = _2808 * _2808;
        _2820 = _2822;
    }
    float _2824 = _2820;
    float _2826 = fma(_2812, _2812, _2816);
    float _2828 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2830 = _2826 + _2824;
    float _2832 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2836 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2834);
    float _2838 = precise::clamp(_2836, 0.0, 1.0);
    float _2840 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2842 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2832);
    float _2844 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2846 = rsqrt(_2830);
    float _2848 = -_2838;
    float _2850 = _2848 + 1.0;
    float _2852 = _2588 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2854 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2844);
    float _2856 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2842);
    float _2858 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2852);
    float _2860 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2854);
    float _2862 = _2856 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2864 = abs(_2850);
    float _2866 = log2(_2864);
    float _2868 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2828);
    float _2870 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2858);
    float _2872 = _2860 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2874 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2876 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2868);
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2880 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2882 = _2846 * _2800;
    float _2884 = -_2874;
    float _2886 = fma(_2884, _2840, 1.0);
    float _2888 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2890 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2880);
    float _2892 = _2846 * _2812;
    float _2894 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2896 = _2846 * _2808;
    float _2898 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2890);
    float _2900 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2902 = -_2894;
    float _2904 = fma(_2892, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2902);
    float _2906 = log2(_2886);
    float _2908 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2898);
    float _2910 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2912 = -_2896;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2904);
    float _2916 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2918 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2910);
    float _2920 = fma(_2914, -0.5, 0.5);
    float _2922 = exp2(_2900);
    float _2924 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2916);
    float _2926 = fma(_2914, 0.5, 0.5);
    float _2928 = _2892 + 1.0;
    float _2930 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2918);
    float _2932 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2924);
    float _2934 = fma(_2926, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2936 = 1.0 / _2908;
    float _2938 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2932);
    float _2940 = fma(_2926, _2934, -0.212114393711090087890625);
    float _2942 = _2906 * 0.693147182464599609375;
    float _2944 = fma(_2926, _2940, 1.570728778839111328125);
    float _2946 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2948 = sqrt(_2920);
    float _2950 = -_2892;
    float _2952 = fma(_2922, _2928, _2950);
    float _2954 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2930);
    float _2956 = fma(_2952, 0.5, 0.5);
    float _2958 = _2938 * _2936;
    float _2960 = _2954 * _2936;
    float _2962 = fma(_2958, 0.5, 0.5);
    float _2964 = fma(_2960, -0.5, 0.5);
    float _2966 = _2948 * 0.636619746685028076171875;
    float _2968 = -_2944;
    float _2970 = fma(_2966, _2968, 1.0);
    float3 _7808 = float3(_2962, _2964, _2946);
    float _2972 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7808, float3(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7808, float3(0.0), isnan(_7808)), level(0.0)).x;
    float3 _7819 = float3(_2962, _2964, _2946);
    float4 _2975 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7819, float3(0.0), isnan(_7819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7819, float3(0.0), isnan(_7819)), level(0.0)).xyzw;
    float _2977 = _2975.x;
    float _2979 = _2975.y;
    float _2981 = _2975.z;
    float _2983 = _2975.w;
    float2 _7836 = float2(_2970, _2956);
    float3 _2987 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7836, float2(0.0), isnan(_7836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7836, float2(0.0), isnan(_7836)), level(0.0)).xyz;
    float _2989 = _2987.x;
    float _2991 = _2987.y;
    float _2993 = _2987.z;
    float _2995 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2997 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2999 = _2660 > 0.0;
    bool _3001 = isnan(_2660);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(0.0);
    bool _3007 = _3003 || _3005;
    float _3009 = _2660 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3011 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2997);
    float _3013 = exp2(_2995);
    float _3015 = fma(_2862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3011);
    float _3017 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3015);
    float _3019 = _3017 + _2908;
    out.gl_Position.x = _2938;
    out.gl_Position.y = _2954;
    out.gl_Position.z = _3017;
    out.gl_Position.w = _2908;
    float _3021 = _3019 * 0.5;
    float _3023 = -_3013;
    float _3025 = _3023 + 1.0;
    float _3027 = _3009 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3029 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _3021;
    out.m_77.w = _2908;
    float _3031 = -_3029;
    float _3033 = _3031 + 1.0;
    out.m_47.x = _3027;
    float _3035 = _3029 * _2972;
    float _3037 = _2983 * _3035;
    float _3039 = _2993 * _3035;
    float _3041 = _2983 * _3033;
    float _3043 = fma(_2989, _3037, _2977);
    float _3045 = fma(_2991, _3037, _2979);
    float _3047 = fma(_2983, _3039, _2981);
    out.m_79.x = _3043;
    out.m_79.y = _3045;
    out.m_79.z = _3047;
    out.m_79.w = _3041;
    if (_3007)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3049;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

