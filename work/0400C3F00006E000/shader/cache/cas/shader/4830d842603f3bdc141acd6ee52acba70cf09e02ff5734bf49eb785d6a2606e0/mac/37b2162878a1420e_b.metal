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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2063 = false;
    bool _590 = false;
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
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2543 = as_type<float>(_114);
        out.gl_Position.z = _2543;
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
        _108 = _136;
    }
    float _138 = _108;
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
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_152);
        out.gl_Position.z = _2613;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
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
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
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
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _344;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _340;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _376;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _324 * _362;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _428 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _426);
    float _436 = fma(_428, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_374;
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
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = _472 + _480;
    bool _484 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _486 = isnan(_472);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _498;
    float _502 = 1.0 / _500;
    float _504 = _442 * _478;
    float _506 = _440 * _476;
    float _508 = -_494;
    float _510 = _508 + 1.0;
    float _512 = _482 * _502;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _514;
    bool _518 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _520 = isnan(_472);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _530;
    float _534 = _438 * _474;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _536;
    float _540 = fma(_516, _512, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = _528 * _510;
    float _544 = fma(_532, _512, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _546 = fma(_538, _512, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = _540 * _542;
    float _554 = _544 * _542;
    float _556 = _546 * _542;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _564 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].x, _558);
    float _566 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].y, _560);
    float _568 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].z, _562);
    bool _570 = !_496;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_98);
        float _594 = 1.0 / _592;
        float _596 = _132 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _602 = int(_600);
    float _604 = in.m_53.w;
    float _606 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = in.m_53.x;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _612 = _610 != 0;
    float _614 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _616 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _618 = int(_616);
    float _620 = in.m_55.y;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _624 = 1.0 + _622;
    float _626 = in.m_53.y;
    float _628 = float(_602);
    float _630 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _632 = log2(_630);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    bool _634 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = float(uint(_618));
    float _646 = 1.0 / _628;
    bool _648 = _604 > 0.5;
    float _650 = float(_618);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = 1.0 / _644;
    float _660 = _632 * _132;
    float _662 = _608 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _664 = -_620;
    float _666 = _664 + 1.0;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _672 = _670 != 0;
    float _674 = -_652;
    float _676 = fma(_662, 2.0, _674);
    float _678 = _626 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _680 = exp2(_660);
    float _682 = _646 * _132;
    int _684 = _648 ? as_type<int>(_666) : as_type<int>(_620);
    float _686 = fma(_678, -2.0, _668);
    bool _688 = _626 > 0.5;
    float _690 = _650 * _132;
    float _692 = -_132;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _676);
    float _696 = trunc(_682);
    int _698 = int(_696);
    float _700 = _672 ? as_type<float>(_684) : _620;
    float _702 = _608 * 2.0;
    float _704 = _620;
    float _706 = _650;
    if (_656)
    {
        float _708 = _688 ? _666 : _620;
        _704 = _708;
    }
    float _710 = _704;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _686);
    int _716 = as_type<int>(_658) + (-2);
    float _718 = 1.0 / _624;
    float _720 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    float _722 = -_680;
    float _724 = _722 + 1.0;
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _738 = _626 * 2.0;
    float _740 = _734 ? _724 : 0.0;
    float _742 = floor(_702);
    float _744 = float(uint(_698));
    float _746 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[78].w, _736);
    float _748 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _720);
    int _750 = ~_618;
    int _752 = _750 + 1;
    float _754 = as_type<float>(_716) * _744;
    float _756 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _746);
    int _758 = as_type<int>(_710);
    if (_642)
    {
        float _760 = _740 * _718;
        _134 = _760;
    }
    float _762 = _134;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _774 = _772 != 0;
    float _776 = trunc(_754);
    float _778 = precise::max(_776, 0.0);
    uint _781 = uint(_778);
    bool _783 = !_612;
    float _785 = _783 ? 7.345489978790283203125 : 1.0;
    float _787 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _791 = _789 != 0;
    bool _793 = !_770;
    int _795 = _793 ? 0 : 1;
    float _797 = _785 * _608;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _801 = _799 != 0;
    float _803 = floor(_738);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    bool _809 = _742 >= 0.0;
    bool _811 = isnan(_742);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _821 = _819 != 0;
    float _823 = floor(_797);
    int _825 = _817 ? 0 : 1;
    float _827 = in.m_59.x;
    float _829 = in.m_59.y;
    float _831 = in.m_59.z;
    bool _833 = _742 > 0.0;
    int _835 = _752 * int(_781);
    int _837 = _835 + _698;
    float _839 = in.m_53.z;
    float _841 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _845 = float(uint(_837));
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _787);
    float _853 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    int _855 = ~_825;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    float _861 = as_type<float>(_716) * _845;
    float _863 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _843);
    float _865 = 1.0 / _849;
    int _867 = _859;
    if (!_833)
    {
        int _869 = ~_825;
        int _871 = _869 + 1;
        _867 = _871;
    }
    int _873 = _867;
    float _875 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _851);
    bool _877 = _803 >= 0.0;
    bool _879 = isnan(_803);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    float _887 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _853);
    float _889 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _863);
    float _891 = trunc(_861);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    float _897 = float(_98);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _903 = _885 ? 0 : 1;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    bool _907 = _803 > 0.0;
    float _909 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _911 = 1.0 / _901;
    float _913 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _915 = _606 * _905;
    float _917 = float(_698);
    float _919 = -_823;
    float _921 = _797 + _919;
    float _923 = _909 * _913;
    float _925 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _831);
    bool _927 = !_766;
    int _929 = _927 ? 0 : 1;
    float _931 = 1.0 / _897;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _933;
    int _937 = int(_781) + int(_895);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _943 = ~_618;
    int _945 = _943 + 1;
    float _947 = _935 * _865;
    float _949 = _839 * 2.0;
    float _951 = _614 * _925;
    float _953 = _941 * _911;
    int _955 = ~_903;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = _921 * _650;
    int _963 = _959;
    if (!_907)
    {
        int _965 = ~_903;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = _608 + _626;
    float _973 = floor(_949);
    int _975 = _945 * _937;
    int _977 = _975 + _698;
    bool _979 = !_774;
    int _981 = _979 ? 0 : 1;
    float _983 = _971 + (-1.0);
    bool _985 = _917 >= _650;
    bool _987 = isnan(_917);
    bool _989 = _985 || _987;
    bool _991 = isnan(_650);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = _626 + _839;
    bool _999 = uint(_977) >= uint(_618);
    float _1001 = _608 + _839;
    bool _1003 = !_791;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = _690 * _931;
    float _1009 = trunc(_995);
    int _1011 = int(_1009);
    bool _1013 = !_999;
    int _1015 = _1013 ? 0 : (-1);
    float _1017 = _1001 + (-1.0);
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1029 = _1027 != 0;
    float _1031 = _997 + (-1.0);
    int _1033 = ~_937;
    int _1035 = _1033 + _1015;
    int _1037 = _1035 + 1;
    float _1039 = in.m_55.x;
    bool _1041 = _973 >= 0.0;
    bool _1043 = isnan(_973);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _626 + (-0.5);
    int _1053 = _618 * _1037;
    int _1055 = _1053 + _698;
    bool _1057 = !_1021;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1063 = _598 + _1061;
    int _1065 = _1049 ? 0 : 1;
    float _1067 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1069 = _973 > 0.0;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1073 = _598 + _1071;
    bool _1075 = _618 == 0;
    float _1077 = fma(_953, _1063, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1079 = ~_1011;
    int _1081 = _1079 + 1;
    int _1083 = _1081 + 1;
    float _1085 = fma(_947, _1073, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1087 = !_1075;
    int _1089 = _1087 ? _1055 : (-1);
    int _1091 = _618 + (-1);
    int _1093 = _1089 * _1083;
    float _1095 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1097 = ~_1065;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    int _1103 = _1011 * _1091;
    int _1105 = _1103 + _1093;
    int _1107 = _1101;
    float _1109 = _1039;
    if (!_1069)
    {
        int _1111 = ~_1065;
        int _1113 = _1111 + 1;
        _1107 = _1113;
    }
    int _1115 = _1107;
    float _1117 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1119 = in.m_61.x;
    float _1121 = in.m_61.y;
    float _1123 = in.m_61.z;
    int _1125 = abs(_795);
    float _1127 = trunc(_961);
    int _1129 = int(_1127);
    bool _1131 = !_1025;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = abs(_1059);
    int _1137 = _1105 * _1125;
    float _1139 = float(_873);
    int _1141 = abs(_929);
    float _1143 = trunc(_1007);
    int _1145 = int(_1143);
    int _1147 = abs(_1133);
    float _1149 = float(_1115);
    float _1151 = float(_1135);
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1155 = _1153 != 0;
    int _1157 = abs(_981);
    float _1159 = _1151 * _1149;
    float _1161 = float(_1147);
    int _1163 = abs(_1005);
    int _1165 = _1145 * _1141;
    int _1167 = _1165 + _1137;
    bool _1169 = !_1155;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = _1159 * (-2.0);
    float _1175 = _1161 * _1139;
    float _1177 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1179 = _1129 * _1163;
    int _1181 = _1179 + _698;
    int _1183 = abs(_1171);
    float _1185 = fma(_1067, _1173, _1067);
    float _1187 = fma(_1173, _1119, _1119);
    float _1189 = _1177 * _608;
    int _1191 = _1181 * _1157;
    int _1193 = _1191 + _1167;
    bool _1195 = _1155;
    if (_807)
    {
        bool _1197 = _608 > 0.5;
        _1195 = _1197;
    }
    bool _1199 = _1195;
    float _1201 = _608 + (-0.5);
    float _1203 = float(uint(_1181));
    int _1205 = _1129 * _1183;
    int _1207 = _1205 + _1193;
    bool _1209 = !_1029;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1187);
    float _1215 = in.m_63.x;
    float _1217 = in.m_63.y;
    float _1219 = in.m_63.z;
    float _1221 = as_type<float>(_716) * _1203;
    float _1223 = float(uint(_1207));
    float _1225 = _1175 * (-2.0);
    int _1227 = abs(_1211);
    float _1229 = fma(_1185, _762, _1213);
    float _1231 = float(_969);
    float _1233 = as_type<float>(_716) * _1223;
    bool _1235 = _829 != 0.0;
    bool _1237 = isnan(_829);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.0);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_1225, _1121, _1121);
    float _1247 = float(_1227);
    float _1249 = fma(_1095, _1225, _1095);
    bool _1251 = _827 == 0.0;
    bool _1253 = !_1243;
    bool _1255 = _1251 && _1253;
    float _1257 = trunc(_1233);
    float _1259 = precise::max(_1257, 0.0);
    uint _1261 = uint(_1259);
    int _1263 = ~_618;
    int _1265 = _1263 + 1;
    float _1267 = _1247 * _1231;
    bool _1269 = _831 == 0.0;
    bool _1271 = _1269 && _1255;
    float _1273 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1245);
    float _1275 = _1267 * (-2.0);
    float _1277 = _1229 * 0.15915493667125701904296875;
    float _1279 = fma(_1249, _762, _1273);
    bool _1281 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1283 = isnan(_598);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = fma(_1275, _1123, _1123);
    float _1295 = trunc(_1221);
    float _1297 = precise::max(_1295, 0.0);
    uint _1299 = uint(_1297);
    float _1301 = fma(_1117, _1275, _1117);
    int _1303 = ~_618;
    int _1305 = _1303 + 1;
    float _1307 = _1279 * 0.15915493667125701904296875;
    bool _1309 = _1271;
    if (!_807)
    {
        _706 = _1039;
    }
    float _1311 = _706;
    int _1313 = _1265 * int(_1261);
    int _1315 = _1313 + _1207;
    float _1317 = _1219;
    float _1319 = _1215;
    float _1321 = _1217;
    float _1323 = _1311;
    if (!_1271)
    {
        float _1325 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1317 = _1325;
    }
    float _1327 = _1317;
    bool _1329 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1331 = isnan(_598);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    if (!_1271)
    {
        float _1341 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1319 = _1341;
    }
    float _1343 = _1319;
    bool _1345 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1347 = isnan(_598);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    if (!_1271)
    {
        float _1357 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1217);
        _1321 = _1357;
    }
    float _1359 = _1321;
    float _1361 = float(uint(_1315));
    float _1363 = -_1339;
    float _1365 = _1363 + 1.0;
    if (_821)
    {
        bool _1367 = _839 > 0.5;
        _1309 = _1367;
    }
    bool _1369 = _1309;
    float _1371 = -_1355;
    float _1373 = _1371 + 1.0;
    float _1375 = _839 + (-0.5);
    float _1377 = as_type<float>(_716) * _1361;
    float _1379 = _1355 * _1365;
    float _1381 = _1291 * _1373;
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1293);
    int _1385 = as_type<int>(_1373);
    if (_807)
    {
        float _1387 = -_1039;
        float _1389 = _1387 + 1.0;
        _1385 = as_type<int>(_1389);
    }
    int _1391 = _1385;
    float _1393 = -_1291;
    float _1395 = _1393 + 1.0;
    float _1397 = trunc(_1377);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    float _1403 = _1085 * _1381;
    float _1405 = fma(_1301, _762, _1383);
    float _1407 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _710, -0.5);
    if (_821)
    {
        float _1409 = -_1039;
        float _1411 = _1409 + 1.0;
        _758 = as_type<int>(_1411);
    }
    int _1413 = _758;
    if (_807)
    {
        float _1415 = _1199 ? as_type<float>(_1391) : _1039;
        _1323 = _1415;
    }
    float _1417 = _1323;
    float _1419 = _1405 * 0.15915493667125701904296875;
    float _1421 = _1277 * 6.283185482025146484375;
    float _1423 = sin(_1421);
    if (_821)
    {
        float _1425 = _1369 ? as_type<float>(_1413) : _1039;
        _1109 = _1425;
    }
    float _1427 = _1109;
    float _1429 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1403);
    int _1431 = ~_618;
    int _1433 = _1431 + 1;
    int _1435 = _1305 * int(_1299);
    int _1437 = _1435 + _1181;
    float _1439 = fma(_1077, _1379, _1429);
    float _1441 = -_714;
    float _1443 = fma(_756, _1407, _1441);
    float _1445 = _1277 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    int _1449 = int(_1261) + int(_1401);
    float _1451 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1453 = float(uint(_1437));
    float _1455 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1439);
    int _1457 = _1433 * _1449;
    int _1459 = _1457 + _1207;
    float _1461 = fma(_748, _1451, _694);
    float _1463 = _1307 * 6.283185482025146484375;
    float _1465 = cos(_1463);
    float _1467 = as_type<float>(_716) * _1453;
    bool _1469 = uint(_1459) >= uint(_618);
    float _1471 = _1419 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1307 * 6.283185482025146484375;
    float _1477 = sin(_1475);
    float _1479 = _1423 * _1465;
    float _1481 = _1447 * _1465;
    float _1483 = _1419 * 6.283185482025146484375;
    float _1485 = sin(_1483);
    float _1487 = _1465 * _1473;
    bool _1489 = !_1469;
    int _1491 = _1489 ? 0 : (-1);
    float _1493 = _1447 * _1473;
    int _1495 = ~_1449;
    int _1497 = _1495 + _1491;
    int _1499 = _1497 + 1;
    float _1501 = _1423 * _1477;
    float _1503 = _1423 * _1473;
    float _1505 = _1447 * _1477;
    float _1507 = _1477 * _1473;
    int _1509 = _618 * _1499;
    int _1511 = _1509 + _1207;
    float _1513 = trunc(_1467);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    float _1519 = -_1505;
    float _1521 = fma(_1485, _1479, _1519);
    float _1523 = -_1479;
    float _1525 = fma(_1485, _1505, _1523);
    float _1527 = -_923;
    float _1529 = _1485 * _1527;
    float _1531 = -_1359;
    float _1533 = _1485 * _1531;
    float _1535 = fma(_1485, _1481, _1501);
    float _1537 = fma(_1485, _1501, _1481);
    float _1539 = fma(_1487, _915, _1529);
    float _1541 = _1493 * _923;
    float _1543 = fma(_1487, _1343, _1533);
    float _1545 = _1503 * _923;
    bool _1547 = !_1075;
    int _1549 = _1547 ? _1511 : (-1);
    float _1551 = _1493 * _1359;
    float _1553 = _1503 * _1359;
    float _1555 = fma(_1535, _915, _1541);
    float _1557 = fma(_1521, _915, _1545);
    int _1559 = _1549 >> 31;
    float _1561 = fma(_1535, _1343, _1551);
    int _1563 = ~_618;
    int _1565 = _1563 + 1;
    float _1567 = fma(_1521, _1343, _1553);
    int _1569 = _1559 & 3;
    float _1571 = fma(_1507, _951, _1539);
    int _1573 = int(_1299) + int(_1517);
    float _1575 = fma(_1525, _951, _1555);
    int _1577 = _1549 + _1569;
    float _1579 = fma(_1537, _951, _1557);
    float _1581 = fma(_1507, _1327, _1543);
    int _1583 = _1577 >> 2;
    float _1585 = fma(_1525, _1327, _1561);
    float _1587 = fma(_1537, _1327, _1567);
    int _1589 = _1565 * _1573;
    int _1591 = _1589 + _1181;
    int _1593 = _1583 << 4;
    int _1595 = _1593 + 368;
    float _1597 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1599 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1601 = _887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1603 = uint(_1591) >= uint(_618);
    float _1605 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1597);
    uint _1607 = uint(int(uint(_1595) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[int(_1617)][_1619];
    float _1623 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1599);
    bool _1625 = !_1603;
    int _1627 = _1625 ? 0 : (-1);
    float _1629 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1605);
    float _1631 = _889 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1633 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1623);
    int _1635 = _1549 & 3;
    bool _1637 = _1635 != 0;
    float _1639 = _1601 + _1629;
    int _1641 = _1595 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[int(_1653)][_1655];
    int _1659 = ~_1573;
    int _1661 = _1659 + _1627;
    int _1663 = _1661 + 1;
    float _1665 = _1631 + _1633;
    bool _1667 = uint(_1635) > 1u;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1639 + _1669;
    int _1673 = _1549 & 3;
    bool _1675 = _1673 != 0;
    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1679 = _1665 + _1677;
    float _1681 = trunc(_1189);
    int _1683 = int(_1681);
    float _1685 = _1671 * _1671;
    int _1687 = _1675 ? 0 : 1;
    float _1689 = _1679 * _1679;
    float _1691 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1693 = _1635 != 3;
    float _1695 = _1685 + _1689;
    bool _1697 = uint(_1635) >= 2u;
    float _1699 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1691);
    int _1701 = ~_1687;
    int _1703 = _1701 + 1;
    int _1705 = _1703 + 1;
    float _1707 = sqrt(_1695);
    int _1709 = _1705;
    float _1711 = _1685;
    float _1713 = _1689;
    float _1715 = _1455;
    float _1717 = _1587;
    if (!_1667)
    {
        int _1719 = ~_1687;
        int _1721 = _1719 + 1;
        _1709 = _1721;
    }
    int _1723 = _1709;
    float _1725 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1699);
    int _1727 = _1697 ? 0 : 1;
    bool _1729 = !_1637;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = abs(_1723);
    float _1735 = _875 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1737 = ~_1727;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = abs(_1731);
    float _1745 = _1735 + _1725;
    int _1747 = _1741;
    if (_1693)
    {
        int _1749 = ~_1727;
        int _1751 = _1749 + 1;
        _1747 = _1751;
    }
    int _1753 = _1747;
    int _1755 = _1683 << 4;
    int _1757 = _1755 + 1968;
    int _1759 = abs(_1753);
    int _1761 = _1757 + 8;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[int(_1765)][_1767];
    int _1771 = ~_1733;
    int _1773 = _1771 + 1;
    int _1775 = _1773 + 1;
    bool _1777 = _1635 != 3;
    int _1779 = _1775 * as_type<int>(_1621);
    bool _1781 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _1783 = uint(int(uint(_1757) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[int(_1793)][_1795];
    bool _1799 = !_801;
    int _1801 = _1799 ? 0 : 1;
    bool _1803 = !_1777;
    int _1805 = _1803 ? 0 : (-1);
    int _1807 = ~_1759;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    int _1813 = ~_1743;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1817 * as_type<int>(_1613);
    int _1821 = _1819 + _1779;
    int _1823 = abs(_1801);
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1827 = abs(_1805);
    int _1829 = _1811 * as_type<int>(_1649);
    int _1831 = _1829 + _1821;
    float _1833 = _1649;
    float _1835 = as_type<float>(_1821);
    float _1837 = as_type<float>(_1827);
    if (!_1781)
    {
        _1833 = _1639;
    }
    float _1839 = _1833;
    int _1841 = ~_1827;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    float _1847 = _1839;
    if (!_1781)
    {
        _1835 = _1665;
    }
    float _1849 = _1835;
    float _1851 = _1849;
    if (!_1781)
    {
        _1837 = _1745;
    }
    float _1853 = _1837;
    bool _1855 = !_1781;
    float _1857 = _1853;
    if (!_1855)
    {
        float _1859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1863 = _1707 + _1861;
        float _1865 = rsqrt(_1695);
        float _1867 = _1863 * _1859;
        float _1869 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1871 = _1867 * 0.15915493667125701904296875;
        float _1873 = _1871 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = _1871 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = fma(_1875, _1869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1865 * _1881;
        float _1885 = fma(_1671, _1883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1887 = _1879 + (-1.0);
        float _1889 = fma(_1679, _1883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1893 = _1885 + _1891;
        float _1895 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1899 = _1889 + _1897;
        float _1901 = _1893 * _1893;
        float _1903 = fma(_1745, _1879, _1895);
        float _1905 = _1899 * _1899;
        _1857 = _1903;
        _1711 = _1901;
        _1713 = _1905;
        _1847 = _1885;
        _1851 = _1889;
    }
    float _1907 = _1857;
    float _1909 = _1711;
    float _1911 = _1713;
    float _1913 = _1847;
    float _1915 = _1851;
    int _1917 = ~_1823;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    int _1923 = _1845 * as_type<int>(_1657);
    int _1925 = _1923 + _1831;
    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1929 = _1907 + _1927;
    int _1931 = _618 * _1663;
    int _1933 = _1931 + _1181;
    float _1935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1937 = _1925 * _1921;
    float _1939 = fma(_1929, _1929, _1909);
    float _1941 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1943 = !_1075;
    int _1945 = _1943 ? _1933 : (-1);
    float _1947 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1949 = _1939 + _1911;
    float _1951 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1953 = _1769 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1955 = _1945 * _1823;
    int _1957 = _1955 + _1937;
    float _1959 = _1797 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1961 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1941);
    float _1963 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1947);
    float _1965 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1951);
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _700 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = sqrt(_1949);
    float _1973 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1975 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1977 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1979 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1981 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1983 = _1969 * _1825;
    float _1985 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1961);
    float _1987 = _1973 * _1935;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1997 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1999 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2001 = _1443 + 0.5;
    float _2003 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2005 = _1461 + 0.5;
    float _2007 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1963);
    float _2009 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1965);
    float _2011 = float(_1957);
    out.m_65.x = _1997;
    out.m_65.y = _1967;
    out.m_65.z = _1999;
    out.m_65.w = _1995;
    bool _2013 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2015 = isnan(_1971);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2021 = _2017 || _2019;
    out.m_67.x = _1989;
    out.m_67.y = _1991;
    out.m_67.z = _1993;
    out.m_67.w = _2003;
    out.m_69.x = _2005;
    out.m_69.y = _2001;
    out.m_69.z = _1987;
    out.m_69.w = _1983;
    out.m_71.x = _1985;
    out.m_71.y = _2007;
    out.m_71.z = _2009;
    float _2023 = _1989;
    float _2025 = _1985;
    float _2027 = _1963;
    if (!_2021)
    {
        _1715 = 1.0;
    }
    float _2029 = _1715;
    out.m_73.x = _2011;
    bool _2031 = !_2021;
    float _2033 = _2029;
    if (!_2031)
    {
        bool _2035 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2037 = isnan(_1971);
        bool _2039 = _2035 || _2037;
        bool _2041 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2043 = _2039 || _2041;
        if (!_2043)
        {
            float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2047 = _1971 + _2045;
            float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2051 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2055 = _2053 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2057 = 1.0 / _2051;
            float _2059 = _2047 * _2057;
            float _2061 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2033 = _2061;
            _2023 = _2057;
            _2063 = true;
        }
        else
        {
            bool _2065 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2067 = isnan(_1971);
            bool _2069 = _2065 || _2067;
            bool _2071 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2073 = _2069 || _2071;
            if (!_2073)
            {
                float _2075 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2077 = _1971 + _2075;
                float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2081 = _2079 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2085 = _2083 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2087 = 1.0 / _2081;
                float _2089 = _2077 * _2087;
                float _2091 = fma(_2089, _2085, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2033 = _2091;
                _2023 = _2087;
                _2063 = true;
            }
            else
            {
                _2033 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2063 = false;
    float _2093 = _2033;
    float _2095 = _2023;
    float _2097 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2099 = _1907 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2103 = _1913 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2107 = _1915 + _2105;
    float _2109 = fma(_2099, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2111 = fma(_2103, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2113 = fma(_2107, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2117 = _2109 + _2115;
    float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2121 = _2111 + _2119;
    float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2125 = _2113 + _2123;
    float _2127 = _2117 * _2117;
    float _2129 = fma(_2121, _2121, _2127);
    float _2131 = fma(_2125, _2125, _2129);
    float _2133 = rsqrt(_2131);
    float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2137 = _2121 * _2135;
    float _2139 = _2125 * _2135;
    float _2141 = _2137 * _2137;
    float _2143 = _2139 * _2139;
    float _2145 = _2141 + _2143;
    float _2147 = sqrt(_2145);
    bool _2149 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2153 = _2147 + _2151;
    float _2155 = _2095;
    float _2157 = _2153;
    float _2159 = _2135;
    float _2161 = _2137;
    if (_2149)
    {
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2163;
    }
    float _2165 = _2155;
    if (_2149)
    {
        float _2167 = rsqrt(_2145);
        _1717 = _2167;
    }
    float _2169 = _1717;
    float _2171 = _2169;
    if (_2149)
    {
        float _2173 = _2153 * _2165;
        _2157 = _2173;
    }
    float _2175 = _2157;
    if (_2149)
    {
        float _2177 = _2175 * 0.15915493667125701904296875;
        _2025 = _2177;
    }
    float _2179 = _2025;
    float _2181 = _2003;
    if (_2149)
    {
        float _2183 = _2179 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        _2181 = _2185;
    }
    float _2187 = _2181;
    float _2189 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2191 = precise::max(0.0, _2189);
    float _2193 = _1915;
    float _2195 = _2191;
    float _2197 = _2189;
    if (_2149)
    {
        float _2199 = _2179 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        _2193 = _2201;
    }
    float _2203 = _2193;
    float _2205 = -_2135;
    float _2207 = -_2191;
    float _2209 = fma(_2117, _2205, _2207);
    if (_2149)
    {
        float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2211;
    }
    float _2213 = _2195;
    float _2215 = sqrt(_2131);
    float _2217 = _2187;
    float _2219 = _2213;
    if (_2149)
    {
        float _2221 = fma(_2187, _2213, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = _2223;
    if (!_2149)
    {
        _2219 = _2143;
    }
    float _2227 = _2219;
    float _2229 = _2227;
    if (_2149)
    {
        float _2231 = _2203 + (-1.0);
        _2197 = _2231;
    }
    float _2233 = _2197;
    float _2235 = _2233;
    if (_2149)
    {
        float _2237 = _2169 * _2223;
        _2027 = _2237;
    }
    float _2239 = _2027;
    if (!_2149)
    {
        _2171 = _2209;
    }
    float _2241 = _2171;
    float _2243 = _2241;
    if (_2149)
    {
        float _2245 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2159 = _2245;
    }
    float _2247 = _2159;
    if (_2149)
    {
        float _2249 = _2137 * _2239;
        _2161 = _2249;
    }
    float _2251 = _2161;
    if (!_2149)
    {
        _2225 = _2139;
    }
    float _2253 = _2225;
    float _2255 = _2253;
    if (_2149)
    {
        float _2257 = _2139 * _2239;
        _2255 = _2257;
    }
    float _2259 = _2255;
    if (!_2149)
    {
        _2235 = _2141;
    }
    float _2261 = _2235;
    float _2263 = _2261;
    if (_2149)
    {
        float _2265 = fma(_2209, _2203, _2247);
        _2243 = _2265;
    }
    float _2267 = _2243;
    if (_2149)
    {
        float _2269 = _2251 * _2251;
        _2263 = _2269;
    }
    float _2271 = _2263;
    if (_2149)
    {
        float _2273 = _2259 * _2259;
        _2229 = _2273;
    }
    float _2275 = _2229;
    float _2277 = fma(_2267, _2267, _2271);
    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2281 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2279);
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = _2277 + _2275;
    float _2287 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2289 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2291 = -_2283;
    float _2293 = _2291 + 1.0;
    float _2295 = rsqrt(_2285);
    float _2297 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2287);
    float _2299 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2301 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2303 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2289);
    float _2305 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2297);
    float _2307 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2299);
    float _2309 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2311 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2303);
    float _2313 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2315 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2307);
    float _2317 = abs(_2293);
    float _2319 = log2(_2317);
    float _2321 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2301);
    float _2323 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2325 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2327 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2329 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2321);
    float _2331 = _2295 * _2251;
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2335 = -_2327;
    float _2337 = fma(_2335, _2309, 1.0);
    float _2339 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2341 = _2295 * _2267;
    float _2343 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2345 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2333);
    float _2347 = _2295 * _2259;
    float _2349 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2351 = -_2343;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2351);
    float _2355 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2357 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2345);
    float _2359 = log2(_2337);
    float _2361 = -_2347;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2353);
    float _2365 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2367 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2357);
    float _2369 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2349);
    float _2371 = fma(_2363, -0.5, 0.5);
    float _2373 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2365);
    float _2375 = exp2(_2355);
    float _2377 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2369);
    float _2379 = fma(_2363, 0.5, 0.5);
    float _2381 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2373);
    float _2383 = fma(_2379, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2385 = 1.0 / _2367;
    float _2387 = _2341 + 1.0;
    float _2389 = fma(_2379, _2383, -0.212114393711090087890625);
    float _2391 = _2359 * 0.693147182464599609375;
    float _2393 = fma(_2379, _2389, 1.570728778839111328125);
    float _2395 = sqrt(_2371);
    float _2397 = -_2341;
    float _2399 = fma(_2375, _2387, _2397);
    float _2401 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2377);
    float _2403 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2381);
    float _2405 = fma(_2399, 0.5, 0.5);
    float _2407 = _2401 * _2385;
    float _2409 = _2403 * _2385;
    float _2411 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2413 = fma(_2407, 0.5, 0.5);
    float _2415 = fma(_2409, -0.5, 0.5);
    float _2417 = _2395 * 0.636619746685028076171875;
    float3 _6122 = float3(_2413, _2415, _2411);
    float _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6122, float3(0.0), isnan(_6122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6122, float3(0.0), isnan(_6122)), level(0.0)).x;
    float3 _6133 = float3(_2413, _2415, _2411);
    float4 _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6133, float3(0.0), isnan(_6133)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6133, float3(0.0), isnan(_6133)), level(0.0)).xyzw;
    float _2424 = _2422.x;
    float _2426 = _2422.y;
    float _2428 = _2422.z;
    float _2430 = _2422.w;
    float _2432 = -_2393;
    float _2434 = fma(_2417, _2432, 1.0);
    float2 _6155 = float2(_2434, _2405);
    float3 _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6155, float2(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6155, float2(0.0), isnan(_6155)), level(0.0)).xyz;
    float _2440 = _2438.x;
    float _2442 = _2438.y;
    float _2444 = _2438.z;
    float _2446 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2448 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2121;
    out.m_75.y = _2117;
    out.m_75.z = _2125;
    float _2450 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2448);
    float _2452 = exp2(_2446);
    float _2454 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2450);
    float _2456 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2454);
    float _2458 = _2456 + _2367;
    out.gl_Position.x = _2401;
    out.gl_Position.y = _2403;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2367;
    float _2460 = _2458 * 0.5;
    float _2462 = -_2452;
    float _2464 = _2462 + 1.0;
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2468 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.z = _2460;
    out.m_77.w = _2367;
    out.m_47.x = _2468;
    float _2470 = _2466 * _2419;
    float _2472 = -_2466;
    float _2474 = _2472 + 1.0;
    float _2476 = _2430 * _2470;
    float _2478 = _2444 * _2470;
    float _2480 = fma(_2440, _2476, _2424);
    float _2482 = fma(_2442, _2476, _2426);
    float _2484 = _2430 * _2474;
    float _2486 = fma(_2430, _2478, _2428);
    out.m_79.x = _2480;
    out.m_79.y = _2482;
    out.m_79.z = _2486;
    out.m_79.w = _2484;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2063 = false;
    bool _590 = false;
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
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2543 = as_type<float>(_114);
        out.gl_Position.z = _2543;
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
        _108 = _136;
    }
    float _138 = _108;
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
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_152);
        out.gl_Position.z = _2613;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
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
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
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
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _344;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _340;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _376;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _324 * _362;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _428 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _426);
    float _436 = fma(_428, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_374;
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
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = _472 + _480;
    bool _484 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _486 = isnan(_472);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _498;
    float _502 = 1.0 / _500;
    float _504 = _442 * _478;
    float _506 = _440 * _476;
    float _508 = -_494;
    float _510 = _508 + 1.0;
    float _512 = _482 * _502;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _514;
    bool _518 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _520 = isnan(_472);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _530;
    float _534 = _438 * _474;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _536;
    float _540 = fma(_516, _512, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = _528 * _510;
    float _544 = fma(_532, _512, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _546 = fma(_538, _512, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = _540 * _542;
    float _554 = _544 * _542;
    float _556 = _546 * _542;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _564 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].x, _558);
    float _566 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].y, _560);
    float _568 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].z, _562);
    bool _570 = !_496;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_98);
        float _594 = 1.0 / _592;
        float _596 = _132 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _602 = int(_600);
    float _604 = in.m_53.w;
    float _606 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = in.m_53.x;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _612 = _610 != 0;
    float _614 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _616 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _618 = int(_616);
    float _620 = in.m_55.y;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _624 = 1.0 + _622;
    float _626 = in.m_53.y;
    float _628 = float(_602);
    float _630 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _632 = log2(_630);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    bool _634 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = float(uint(_618));
    float _646 = 1.0 / _628;
    bool _648 = _604 > 0.5;
    float _650 = float(_618);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = 1.0 / _644;
    float _660 = _632 * _132;
    float _662 = _608 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _664 = -_620;
    float _666 = _664 + 1.0;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _672 = _670 != 0;
    float _674 = -_652;
    float _676 = fma(_662, 2.0, _674);
    float _678 = _626 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _680 = exp2(_660);
    float _682 = _646 * _132;
    int _684 = _648 ? as_type<int>(_666) : as_type<int>(_620);
    float _686 = fma(_678, -2.0, _668);
    bool _688 = _626 > 0.5;
    float _690 = _650 * _132;
    float _692 = -_132;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _676);
    float _696 = trunc(_682);
    int _698 = int(_696);
    float _700 = _672 ? as_type<float>(_684) : _620;
    float _702 = _608 * 2.0;
    float _704 = _620;
    float _706 = _650;
    if (_656)
    {
        float _708 = _688 ? _666 : _620;
        _704 = _708;
    }
    float _710 = _704;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _686);
    int _716 = as_type<int>(_658) + (-2);
    float _718 = 1.0 / _624;
    float _720 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    float _722 = -_680;
    float _724 = _722 + 1.0;
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _738 = _626 * 2.0;
    float _740 = _734 ? _724 : 0.0;
    float _742 = floor(_702);
    float _744 = float(uint(_698));
    float _746 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[78].w, _736);
    float _748 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _720);
    int _750 = ~_618;
    int _752 = _750 + 1;
    float _754 = as_type<float>(_716) * _744;
    float _756 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _746);
    int _758 = as_type<int>(_710);
    if (_642)
    {
        float _760 = _740 * _718;
        _134 = _760;
    }
    float _762 = _134;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _774 = _772 != 0;
    float _776 = trunc(_754);
    float _778 = precise::max(_776, 0.0);
    uint _781 = uint(_778);
    bool _783 = !_612;
    float _785 = _783 ? 7.345489978790283203125 : 1.0;
    float _787 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _791 = _789 != 0;
    bool _793 = !_770;
    int _795 = _793 ? 0 : 1;
    float _797 = _785 * _608;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _801 = _799 != 0;
    float _803 = floor(_738);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    bool _809 = _742 >= 0.0;
    bool _811 = isnan(_742);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _821 = _819 != 0;
    float _823 = floor(_797);
    int _825 = _817 ? 0 : 1;
    float _827 = in.m_59.x;
    float _829 = in.m_59.y;
    float _831 = in.m_59.z;
    bool _833 = _742 > 0.0;
    int _835 = _752 * int(_781);
    int _837 = _835 + _698;
    float _839 = in.m_53.z;
    float _841 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _845 = float(uint(_837));
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _787);
    float _853 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    int _855 = ~_825;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    float _861 = as_type<float>(_716) * _845;
    float _863 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _843);
    float _865 = 1.0 / _849;
    int _867 = _859;
    if (!_833)
    {
        int _869 = ~_825;
        int _871 = _869 + 1;
        _867 = _871;
    }
    int _873 = _867;
    float _875 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _851);
    bool _877 = _803 >= 0.0;
    bool _879 = isnan(_803);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    float _887 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _853);
    float _889 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _863);
    float _891 = trunc(_861);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    float _897 = float(_98);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _903 = _885 ? 0 : 1;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    bool _907 = _803 > 0.0;
    float _909 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _911 = 1.0 / _901;
    float _913 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _915 = _606 * _905;
    float _917 = float(_698);
    float _919 = -_823;
    float _921 = _797 + _919;
    float _923 = _909 * _913;
    float _925 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _831);
    bool _927 = !_766;
    int _929 = _927 ? 0 : 1;
    float _931 = 1.0 / _897;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _933;
    int _937 = int(_781) + int(_895);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _943 = ~_618;
    int _945 = _943 + 1;
    float _947 = _935 * _865;
    float _949 = _839 * 2.0;
    float _951 = _614 * _925;
    float _953 = _941 * _911;
    int _955 = ~_903;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = _921 * _650;
    int _963 = _959;
    if (!_907)
    {
        int _965 = ~_903;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = _608 + _626;
    float _973 = floor(_949);
    int _975 = _945 * _937;
    int _977 = _975 + _698;
    bool _979 = !_774;
    int _981 = _979 ? 0 : 1;
    float _983 = _971 + (-1.0);
    bool _985 = _917 >= _650;
    bool _987 = isnan(_917);
    bool _989 = _985 || _987;
    bool _991 = isnan(_650);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = _626 + _839;
    bool _999 = uint(_977) >= uint(_618);
    float _1001 = _608 + _839;
    bool _1003 = !_791;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = _690 * _931;
    float _1009 = trunc(_995);
    int _1011 = int(_1009);
    bool _1013 = !_999;
    int _1015 = _1013 ? 0 : (-1);
    float _1017 = _1001 + (-1.0);
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1029 = _1027 != 0;
    float _1031 = _997 + (-1.0);
    int _1033 = ~_937;
    int _1035 = _1033 + _1015;
    int _1037 = _1035 + 1;
    float _1039 = in.m_55.x;
    bool _1041 = _973 >= 0.0;
    bool _1043 = isnan(_973);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _626 + (-0.5);
    int _1053 = _618 * _1037;
    int _1055 = _1053 + _698;
    bool _1057 = !_1021;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1063 = _598 + _1061;
    int _1065 = _1049 ? 0 : 1;
    float _1067 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1069 = _973 > 0.0;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1073 = _598 + _1071;
    bool _1075 = _618 == 0;
    float _1077 = fma(_953, _1063, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1079 = ~_1011;
    int _1081 = _1079 + 1;
    int _1083 = _1081 + 1;
    float _1085 = fma(_947, _1073, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1087 = !_1075;
    int _1089 = _1087 ? _1055 : (-1);
    int _1091 = _618 + (-1);
    int _1093 = _1089 * _1083;
    float _1095 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1097 = ~_1065;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    int _1103 = _1011 * _1091;
    int _1105 = _1103 + _1093;
    int _1107 = _1101;
    float _1109 = _1039;
    if (!_1069)
    {
        int _1111 = ~_1065;
        int _1113 = _1111 + 1;
        _1107 = _1113;
    }
    int _1115 = _1107;
    float _1117 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1119 = in.m_61.x;
    float _1121 = in.m_61.y;
    float _1123 = in.m_61.z;
    int _1125 = abs(_795);
    float _1127 = trunc(_961);
    int _1129 = int(_1127);
    bool _1131 = !_1025;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = abs(_1059);
    int _1137 = _1105 * _1125;
    float _1139 = float(_873);
    int _1141 = abs(_929);
    float _1143 = trunc(_1007);
    int _1145 = int(_1143);
    int _1147 = abs(_1133);
    float _1149 = float(_1115);
    float _1151 = float(_1135);
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1155 = _1153 != 0;
    int _1157 = abs(_981);
    float _1159 = _1151 * _1149;
    float _1161 = float(_1147);
    int _1163 = abs(_1005);
    int _1165 = _1145 * _1141;
    int _1167 = _1165 + _1137;
    bool _1169 = !_1155;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = _1159 * (-2.0);
    float _1175 = _1161 * _1139;
    float _1177 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1179 = _1129 * _1163;
    int _1181 = _1179 + _698;
    int _1183 = abs(_1171);
    float _1185 = fma(_1067, _1173, _1067);
    float _1187 = fma(_1173, _1119, _1119);
    float _1189 = _1177 * _608;
    int _1191 = _1181 * _1157;
    int _1193 = _1191 + _1167;
    bool _1195 = _1155;
    if (_807)
    {
        bool _1197 = _608 > 0.5;
        _1195 = _1197;
    }
    bool _1199 = _1195;
    float _1201 = _608 + (-0.5);
    float _1203 = float(uint(_1181));
    int _1205 = _1129 * _1183;
    int _1207 = _1205 + _1193;
    bool _1209 = !_1029;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1187);
    float _1215 = in.m_63.x;
    float _1217 = in.m_63.y;
    float _1219 = in.m_63.z;
    float _1221 = as_type<float>(_716) * _1203;
    float _1223 = float(uint(_1207));
    float _1225 = _1175 * (-2.0);
    int _1227 = abs(_1211);
    float _1229 = fma(_1185, _762, _1213);
    float _1231 = float(_969);
    float _1233 = as_type<float>(_716) * _1223;
    bool _1235 = _829 != 0.0;
    bool _1237 = isnan(_829);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.0);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_1225, _1121, _1121);
    float _1247 = float(_1227);
    float _1249 = fma(_1095, _1225, _1095);
    bool _1251 = _827 == 0.0;
    bool _1253 = !_1243;
    bool _1255 = _1251 && _1253;
    float _1257 = trunc(_1233);
    float _1259 = precise::max(_1257, 0.0);
    uint _1261 = uint(_1259);
    int _1263 = ~_618;
    int _1265 = _1263 + 1;
    float _1267 = _1247 * _1231;
    bool _1269 = _831 == 0.0;
    bool _1271 = _1269 && _1255;
    float _1273 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1245);
    float _1275 = _1267 * (-2.0);
    float _1277 = _1229 * 0.15915493667125701904296875;
    float _1279 = fma(_1249, _762, _1273);
    bool _1281 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1283 = isnan(_598);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = fma(_1275, _1123, _1123);
    float _1295 = trunc(_1221);
    float _1297 = precise::max(_1295, 0.0);
    uint _1299 = uint(_1297);
    float _1301 = fma(_1117, _1275, _1117);
    int _1303 = ~_618;
    int _1305 = _1303 + 1;
    float _1307 = _1279 * 0.15915493667125701904296875;
    bool _1309 = _1271;
    if (!_807)
    {
        _706 = _1039;
    }
    float _1311 = _706;
    int _1313 = _1265 * int(_1261);
    int _1315 = _1313 + _1207;
    float _1317 = _1219;
    float _1319 = _1215;
    float _1321 = _1217;
    float _1323 = _1311;
    if (!_1271)
    {
        float _1325 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1317 = _1325;
    }
    float _1327 = _1317;
    bool _1329 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1331 = isnan(_598);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    if (!_1271)
    {
        float _1341 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1319 = _1341;
    }
    float _1343 = _1319;
    bool _1345 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1347 = isnan(_598);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    if (!_1271)
    {
        float _1357 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1217);
        _1321 = _1357;
    }
    float _1359 = _1321;
    float _1361 = float(uint(_1315));
    float _1363 = -_1339;
    float _1365 = _1363 + 1.0;
    if (_821)
    {
        bool _1367 = _839 > 0.5;
        _1309 = _1367;
    }
    bool _1369 = _1309;
    float _1371 = -_1355;
    float _1373 = _1371 + 1.0;
    float _1375 = _839 + (-0.5);
    float _1377 = as_type<float>(_716) * _1361;
    float _1379 = _1355 * _1365;
    float _1381 = _1291 * _1373;
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1293);
    int _1385 = as_type<int>(_1373);
    if (_807)
    {
        float _1387 = -_1039;
        float _1389 = _1387 + 1.0;
        _1385 = as_type<int>(_1389);
    }
    int _1391 = _1385;
    float _1393 = -_1291;
    float _1395 = _1393 + 1.0;
    float _1397 = trunc(_1377);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    float _1403 = _1085 * _1381;
    float _1405 = fma(_1301, _762, _1383);
    float _1407 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _710, -0.5);
    if (_821)
    {
        float _1409 = -_1039;
        float _1411 = _1409 + 1.0;
        _758 = as_type<int>(_1411);
    }
    int _1413 = _758;
    if (_807)
    {
        float _1415 = _1199 ? as_type<float>(_1391) : _1039;
        _1323 = _1415;
    }
    float _1417 = _1323;
    float _1419 = _1405 * 0.15915493667125701904296875;
    float _1421 = _1277 * 6.283185482025146484375;
    float _1423 = sin(_1421);
    if (_821)
    {
        float _1425 = _1369 ? as_type<float>(_1413) : _1039;
        _1109 = _1425;
    }
    float _1427 = _1109;
    float _1429 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1403);
    int _1431 = ~_618;
    int _1433 = _1431 + 1;
    int _1435 = _1305 * int(_1299);
    int _1437 = _1435 + _1181;
    float _1439 = fma(_1077, _1379, _1429);
    float _1441 = -_714;
    float _1443 = fma(_756, _1407, _1441);
    float _1445 = _1277 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    int _1449 = int(_1261) + int(_1401);
    float _1451 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1453 = float(uint(_1437));
    float _1455 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1439);
    int _1457 = _1433 * _1449;
    int _1459 = _1457 + _1207;
    float _1461 = fma(_748, _1451, _694);
    float _1463 = _1307 * 6.283185482025146484375;
    float _1465 = cos(_1463);
    float _1467 = as_type<float>(_716) * _1453;
    bool _1469 = uint(_1459) >= uint(_618);
    float _1471 = _1419 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1307 * 6.283185482025146484375;
    float _1477 = sin(_1475);
    float _1479 = _1423 * _1465;
    float _1481 = _1447 * _1465;
    float _1483 = _1419 * 6.283185482025146484375;
    float _1485 = sin(_1483);
    float _1487 = _1465 * _1473;
    bool _1489 = !_1469;
    int _1491 = _1489 ? 0 : (-1);
    float _1493 = _1447 * _1473;
    int _1495 = ~_1449;
    int _1497 = _1495 + _1491;
    int _1499 = _1497 + 1;
    float _1501 = _1423 * _1477;
    float _1503 = _1423 * _1473;
    float _1505 = _1447 * _1477;
    float _1507 = _1477 * _1473;
    int _1509 = _618 * _1499;
    int _1511 = _1509 + _1207;
    float _1513 = trunc(_1467);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    float _1519 = -_1505;
    float _1521 = fma(_1485, _1479, _1519);
    float _1523 = -_1479;
    float _1525 = fma(_1485, _1505, _1523);
    float _1527 = -_923;
    float _1529 = _1485 * _1527;
    float _1531 = -_1359;
    float _1533 = _1485 * _1531;
    float _1535 = fma(_1485, _1481, _1501);
    float _1537 = fma(_1485, _1501, _1481);
    float _1539 = fma(_1487, _915, _1529);
    float _1541 = _1493 * _923;
    float _1543 = fma(_1487, _1343, _1533);
    float _1545 = _1503 * _923;
    bool _1547 = !_1075;
    int _1549 = _1547 ? _1511 : (-1);
    float _1551 = _1493 * _1359;
    float _1553 = _1503 * _1359;
    float _1555 = fma(_1535, _915, _1541);
    float _1557 = fma(_1521, _915, _1545);
    int _1559 = _1549 >> 31;
    float _1561 = fma(_1535, _1343, _1551);
    int _1563 = ~_618;
    int _1565 = _1563 + 1;
    float _1567 = fma(_1521, _1343, _1553);
    int _1569 = _1559 & 3;
    float _1571 = fma(_1507, _951, _1539);
    int _1573 = int(_1299) + int(_1517);
    float _1575 = fma(_1525, _951, _1555);
    int _1577 = _1549 + _1569;
    float _1579 = fma(_1537, _951, _1557);
    float _1581 = fma(_1507, _1327, _1543);
    int _1583 = _1577 >> 2;
    float _1585 = fma(_1525, _1327, _1561);
    float _1587 = fma(_1537, _1327, _1567);
    int _1589 = _1565 * _1573;
    int _1591 = _1589 + _1181;
    int _1593 = _1583 << 4;
    int _1595 = _1593 + 368;
    float _1597 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1599 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1601 = _887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1603 = uint(_1591) >= uint(_618);
    float _1605 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1597);
    uint _1607 = uint(int(uint(_1595) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[int(_1617)][_1619];
    float _1623 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1599);
    bool _1625 = !_1603;
    int _1627 = _1625 ? 0 : (-1);
    float _1629 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1605);
    float _1631 = _889 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1633 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1623);
    int _1635 = _1549 & 3;
    bool _1637 = _1635 != 0;
    float _1639 = _1601 + _1629;
    int _1641 = _1595 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[int(_1653)][_1655];
    int _1659 = ~_1573;
    int _1661 = _1659 + _1627;
    int _1663 = _1661 + 1;
    float _1665 = _1631 + _1633;
    bool _1667 = uint(_1635) > 1u;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1639 + _1669;
    int _1673 = _1549 & 3;
    bool _1675 = _1673 != 0;
    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1679 = _1665 + _1677;
    float _1681 = trunc(_1189);
    int _1683 = int(_1681);
    float _1685 = _1671 * _1671;
    int _1687 = _1675 ? 0 : 1;
    float _1689 = _1679 * _1679;
    float _1691 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1693 = _1635 != 3;
    float _1695 = _1685 + _1689;
    bool _1697 = uint(_1635) >= 2u;
    float _1699 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1691);
    int _1701 = ~_1687;
    int _1703 = _1701 + 1;
    int _1705 = _1703 + 1;
    float _1707 = sqrt(_1695);
    int _1709 = _1705;
    float _1711 = _1685;
    float _1713 = _1689;
    float _1715 = _1455;
    float _1717 = _1587;
    if (!_1667)
    {
        int _1719 = ~_1687;
        int _1721 = _1719 + 1;
        _1709 = _1721;
    }
    int _1723 = _1709;
    float _1725 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1699);
    int _1727 = _1697 ? 0 : 1;
    bool _1729 = !_1637;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = abs(_1723);
    float _1735 = _875 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1737 = ~_1727;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = abs(_1731);
    float _1745 = _1735 + _1725;
    int _1747 = _1741;
    if (_1693)
    {
        int _1749 = ~_1727;
        int _1751 = _1749 + 1;
        _1747 = _1751;
    }
    int _1753 = _1747;
    int _1755 = _1683 << 4;
    int _1757 = _1755 + 1968;
    int _1759 = abs(_1753);
    int _1761 = _1757 + 8;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[int(_1765)][_1767];
    int _1771 = ~_1733;
    int _1773 = _1771 + 1;
    int _1775 = _1773 + 1;
    bool _1777 = _1635 != 3;
    int _1779 = _1775 * as_type<int>(_1621);
    bool _1781 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _1783 = uint(int(uint(_1757) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[int(_1793)][_1795];
    bool _1799 = !_801;
    int _1801 = _1799 ? 0 : 1;
    bool _1803 = !_1777;
    int _1805 = _1803 ? 0 : (-1);
    int _1807 = ~_1759;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    int _1813 = ~_1743;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1817 * as_type<int>(_1613);
    int _1821 = _1819 + _1779;
    int _1823 = abs(_1801);
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1827 = abs(_1805);
    int _1829 = _1811 * as_type<int>(_1649);
    int _1831 = _1829 + _1821;
    float _1833 = _1649;
    float _1835 = as_type<float>(_1821);
    float _1837 = as_type<float>(_1827);
    if (!_1781)
    {
        _1833 = _1639;
    }
    float _1839 = _1833;
    int _1841 = ~_1827;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    float _1847 = _1839;
    if (!_1781)
    {
        _1835 = _1665;
    }
    float _1849 = _1835;
    float _1851 = _1849;
    if (!_1781)
    {
        _1837 = _1745;
    }
    float _1853 = _1837;
    bool _1855 = !_1781;
    float _1857 = _1853;
    if (!_1855)
    {
        float _1859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1863 = _1707 + _1861;
        float _1865 = rsqrt(_1695);
        float _1867 = _1863 * _1859;
        float _1869 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1871 = _1867 * 0.15915493667125701904296875;
        float _1873 = _1871 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = _1871 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = fma(_1875, _1869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1865 * _1881;
        float _1885 = fma(_1671, _1883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1887 = _1879 + (-1.0);
        float _1889 = fma(_1679, _1883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1893 = _1885 + _1891;
        float _1895 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1899 = _1889 + _1897;
        float _1901 = _1893 * _1893;
        float _1903 = fma(_1745, _1879, _1895);
        float _1905 = _1899 * _1899;
        _1857 = _1903;
        _1711 = _1901;
        _1713 = _1905;
        _1847 = _1885;
        _1851 = _1889;
    }
    float _1907 = _1857;
    float _1909 = _1711;
    float _1911 = _1713;
    float _1913 = _1847;
    float _1915 = _1851;
    int _1917 = ~_1823;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    int _1923 = _1845 * as_type<int>(_1657);
    int _1925 = _1923 + _1831;
    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1929 = _1907 + _1927;
    int _1931 = _618 * _1663;
    int _1933 = _1931 + _1181;
    float _1935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1937 = _1925 * _1921;
    float _1939 = fma(_1929, _1929, _1909);
    float _1941 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1943 = !_1075;
    int _1945 = _1943 ? _1933 : (-1);
    float _1947 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1949 = _1939 + _1911;
    float _1951 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1953 = _1769 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1955 = _1945 * _1823;
    int _1957 = _1955 + _1937;
    float _1959 = _1797 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1961 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1941);
    float _1963 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1947);
    float _1965 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1951);
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _700 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = sqrt(_1949);
    float _1973 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1975 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1977 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1979 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1981 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1983 = _1969 * _1825;
    float _1985 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1961);
    float _1987 = _1973 * _1935;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1997 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1999 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2001 = _1443 + 0.5;
    float _2003 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2005 = _1461 + 0.5;
    float _2007 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1963);
    float _2009 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1965);
    float _2011 = float(_1957);
    out.m_65.x = _1997;
    out.m_65.y = _1967;
    out.m_65.z = _1999;
    out.m_65.w = _1995;
    bool _2013 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2015 = isnan(_1971);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2021 = _2017 || _2019;
    out.m_67.x = _1989;
    out.m_67.y = _1991;
    out.m_67.z = _1993;
    out.m_67.w = _2003;
    out.m_69.x = _2005;
    out.m_69.y = _2001;
    out.m_69.z = _1987;
    out.m_69.w = _1983;
    out.m_71.x = _1985;
    out.m_71.y = _2007;
    out.m_71.z = _2009;
    float _2023 = _1989;
    float _2025 = _1985;
    float _2027 = _1963;
    if (!_2021)
    {
        _1715 = 1.0;
    }
    float _2029 = _1715;
    out.m_73.x = _2011;
    bool _2031 = !_2021;
    float _2033 = _2029;
    if (!_2031)
    {
        bool _2035 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2037 = isnan(_1971);
        bool _2039 = _2035 || _2037;
        bool _2041 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2043 = _2039 || _2041;
        if (!_2043)
        {
            float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2047 = _1971 + _2045;
            float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2051 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2055 = _2053 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2057 = 1.0 / _2051;
            float _2059 = _2047 * _2057;
            float _2061 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2033 = _2061;
            _2023 = _2057;
            _2063 = true;
        }
        else
        {
            bool _2065 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2067 = isnan(_1971);
            bool _2069 = _2065 || _2067;
            bool _2071 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2073 = _2069 || _2071;
            if (!_2073)
            {
                float _2075 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2077 = _1971 + _2075;
                float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2081 = _2079 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2085 = _2083 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2087 = 1.0 / _2081;
                float _2089 = _2077 * _2087;
                float _2091 = fma(_2089, _2085, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2033 = _2091;
                _2023 = _2087;
                _2063 = true;
            }
            else
            {
                _2033 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2063 = false;
    float _2093 = _2033;
    float _2095 = _2023;
    float _2097 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2099 = _1907 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2103 = _1913 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2107 = _1915 + _2105;
    float _2109 = fma(_2099, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2111 = fma(_2103, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2113 = fma(_2107, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2117 = _2109 + _2115;
    float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2121 = _2111 + _2119;
    float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2125 = _2113 + _2123;
    float _2127 = _2117 * _2117;
    float _2129 = fma(_2121, _2121, _2127);
    float _2131 = fma(_2125, _2125, _2129);
    float _2133 = rsqrt(_2131);
    float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2137 = _2121 * _2135;
    float _2139 = _2125 * _2135;
    float _2141 = _2137 * _2137;
    float _2143 = _2139 * _2139;
    float _2145 = _2141 + _2143;
    float _2147 = sqrt(_2145);
    bool _2149 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2153 = _2147 + _2151;
    float _2155 = _2095;
    float _2157 = _2153;
    float _2159 = _2135;
    float _2161 = _2137;
    if (_2149)
    {
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2163;
    }
    float _2165 = _2155;
    if (_2149)
    {
        float _2167 = rsqrt(_2145);
        _1717 = _2167;
    }
    float _2169 = _1717;
    float _2171 = _2169;
    if (_2149)
    {
        float _2173 = _2153 * _2165;
        _2157 = _2173;
    }
    float _2175 = _2157;
    if (_2149)
    {
        float _2177 = _2175 * 0.15915493667125701904296875;
        _2025 = _2177;
    }
    float _2179 = _2025;
    float _2181 = _2003;
    if (_2149)
    {
        float _2183 = _2179 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        _2181 = _2185;
    }
    float _2187 = _2181;
    float _2189 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2191 = precise::max(0.0, _2189);
    float _2193 = _1915;
    float _2195 = _2191;
    float _2197 = _2189;
    if (_2149)
    {
        float _2199 = _2179 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        _2193 = _2201;
    }
    float _2203 = _2193;
    float _2205 = -_2135;
    float _2207 = -_2191;
    float _2209 = fma(_2117, _2205, _2207);
    if (_2149)
    {
        float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2211;
    }
    float _2213 = _2195;
    float _2215 = sqrt(_2131);
    float _2217 = _2187;
    float _2219 = _2213;
    if (_2149)
    {
        float _2221 = fma(_2187, _2213, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = _2223;
    if (!_2149)
    {
        _2219 = _2143;
    }
    float _2227 = _2219;
    float _2229 = _2227;
    if (_2149)
    {
        float _2231 = _2203 + (-1.0);
        _2197 = _2231;
    }
    float _2233 = _2197;
    float _2235 = _2233;
    if (_2149)
    {
        float _2237 = _2169 * _2223;
        _2027 = _2237;
    }
    float _2239 = _2027;
    if (!_2149)
    {
        _2171 = _2209;
    }
    float _2241 = _2171;
    float _2243 = _2241;
    if (_2149)
    {
        float _2245 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2159 = _2245;
    }
    float _2247 = _2159;
    if (_2149)
    {
        float _2249 = _2137 * _2239;
        _2161 = _2249;
    }
    float _2251 = _2161;
    if (!_2149)
    {
        _2225 = _2139;
    }
    float _2253 = _2225;
    float _2255 = _2253;
    if (_2149)
    {
        float _2257 = _2139 * _2239;
        _2255 = _2257;
    }
    float _2259 = _2255;
    if (!_2149)
    {
        _2235 = _2141;
    }
    float _2261 = _2235;
    float _2263 = _2261;
    if (_2149)
    {
        float _2265 = fma(_2209, _2203, _2247);
        _2243 = _2265;
    }
    float _2267 = _2243;
    if (_2149)
    {
        float _2269 = _2251 * _2251;
        _2263 = _2269;
    }
    float _2271 = _2263;
    if (_2149)
    {
        float _2273 = _2259 * _2259;
        _2229 = _2273;
    }
    float _2275 = _2229;
    float _2277 = fma(_2267, _2267, _2271);
    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2281 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2279);
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = _2277 + _2275;
    float _2287 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2289 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2291 = -_2283;
    float _2293 = _2291 + 1.0;
    float _2295 = rsqrt(_2285);
    float _2297 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2287);
    float _2299 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2301 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2303 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2289);
    float _2305 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2297);
    float _2307 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2299);
    float _2309 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2311 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2303);
    float _2313 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2315 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2307);
    float _2317 = abs(_2293);
    float _2319 = log2(_2317);
    float _2321 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2301);
    float _2323 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2325 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2327 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2329 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2321);
    float _2331 = _2295 * _2251;
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2335 = -_2327;
    float _2337 = fma(_2335, _2309, 1.0);
    float _2339 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2341 = _2295 * _2267;
    float _2343 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2345 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2333);
    float _2347 = _2295 * _2259;
    float _2349 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2351 = -_2343;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2351);
    float _2355 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2357 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2345);
    float _2359 = log2(_2337);
    float _2361 = -_2347;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2353);
    float _2365 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2367 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2357);
    float _2369 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2349);
    float _2371 = fma(_2363, -0.5, 0.5);
    float _2373 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2365);
    float _2375 = exp2(_2355);
    float _2377 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2369);
    float _2379 = fma(_2363, 0.5, 0.5);
    float _2381 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2373);
    float _2383 = fma(_2379, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2385 = 1.0 / _2367;
    float _2387 = _2341 + 1.0;
    float _2389 = fma(_2379, _2383, -0.212114393711090087890625);
    float _2391 = _2359 * 0.693147182464599609375;
    float _2393 = fma(_2379, _2389, 1.570728778839111328125);
    float _2395 = sqrt(_2371);
    float _2397 = -_2341;
    float _2399 = fma(_2375, _2387, _2397);
    float _2401 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2377);
    float _2403 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2381);
    float _2405 = fma(_2399, 0.5, 0.5);
    float _2407 = _2401 * _2385;
    float _2409 = _2403 * _2385;
    float _2411 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2413 = fma(_2407, 0.5, 0.5);
    float _2415 = fma(_2409, -0.5, 0.5);
    float _2417 = _2395 * 0.636619746685028076171875;
    float3 _6122 = float3(_2413, _2415, _2411);
    float _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6122, float3(0.0), isnan(_6122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6122, float3(0.0), isnan(_6122)), level(0.0)).x;
    float3 _6133 = float3(_2413, _2415, _2411);
    float4 _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6133, float3(0.0), isnan(_6133)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6133, float3(0.0), isnan(_6133)), level(0.0)).xyzw;
    float _2424 = _2422.x;
    float _2426 = _2422.y;
    float _2428 = _2422.z;
    float _2430 = _2422.w;
    float _2432 = -_2393;
    float _2434 = fma(_2417, _2432, 1.0);
    float2 _6155 = float2(_2434, _2405);
    float3 _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6155, float2(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6155, float2(0.0), isnan(_6155)), level(0.0)).xyz;
    float _2440 = _2438.x;
    float _2442 = _2438.y;
    float _2444 = _2438.z;
    float _2446 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2448 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2121;
    out.m_75.y = _2117;
    out.m_75.z = _2125;
    float _2450 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2448);
    float _2452 = exp2(_2446);
    float _2454 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2450);
    float _2456 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2454);
    float _2458 = _2456 + _2367;
    out.gl_Position.x = _2401;
    out.gl_Position.y = _2403;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2367;
    float _2460 = _2458 * 0.5;
    float _2462 = -_2452;
    float _2464 = _2462 + 1.0;
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2468 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.z = _2460;
    out.m_77.w = _2367;
    out.m_47.x = _2468;
    float _2470 = _2466 * _2419;
    float _2472 = -_2466;
    float _2474 = _2472 + 1.0;
    float _2476 = _2430 * _2470;
    float _2478 = _2444 * _2470;
    float _2480 = fma(_2440, _2476, _2424);
    float _2482 = fma(_2442, _2476, _2426);
    float _2484 = _2430 * _2474;
    float _2486 = fma(_2430, _2478, _2428);
    out.m_79.x = _2480;
    out.m_79.y = _2482;
    out.m_79.z = _2486;
    out.m_79.w = _2484;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2063 = false;
    bool _590 = false;
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
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2543 = as_type<float>(_114);
        out.gl_Position.z = _2543;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _108 = _136;
    }
    float _138 = _108;
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
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_152);
        out.gl_Position.z = _2613;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
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
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
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
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _344;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _340;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _376;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _324 * _362;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _428 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _426);
    float _436 = fma(_428, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_374;
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
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = _472 + _480;
    bool _484 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _486 = isnan(_472);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _498;
    float _502 = 1.0 / _500;
    float _504 = _442 * _478;
    float _506 = _440 * _476;
    float _508 = -_494;
    float _510 = _508 + 1.0;
    float _512 = _482 * _502;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _514;
    bool _518 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _520 = isnan(_472);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _530;
    float _534 = _438 * _474;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _536;
    float _540 = fma(_516, _512, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = _528 * _510;
    float _544 = fma(_532, _512, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _546 = fma(_538, _512, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = _540 * _542;
    float _554 = _544 * _542;
    float _556 = _546 * _542;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _564 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].x, _558);
    float _566 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].y, _560);
    float _568 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[108].z, _562);
    bool _570 = !_496;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_98);
        float _594 = 1.0 / _592;
        float _596 = _132 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _602 = int(_600);
    float _604 = in.m_53.w;
    float _606 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = in.m_53.x;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _612 = _610 != 0;
    float _614 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _616 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _618 = int(_616);
    float _620 = in.m_55.y;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _624 = 1.0 + _622;
    float _626 = in.m_53.y;
    float _628 = float(_602);
    float _630 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _632 = log2(_630);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    bool _634 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = float(uint(_618));
    float _646 = 1.0 / _628;
    bool _648 = _604 > 0.5;
    float _650 = float(_618);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = 1.0 / _644;
    float _660 = _632 * _132;
    float _662 = _608 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _664 = -_620;
    float _666 = _664 + 1.0;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _672 = _670 != 0;
    float _674 = -_652;
    float _676 = fma(_662, 2.0, _674);
    float _678 = _626 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _680 = exp2(_660);
    float _682 = _646 * _132;
    int _684 = _648 ? as_type<int>(_666) : as_type<int>(_620);
    float _686 = fma(_678, -2.0, _668);
    bool _688 = _626 > 0.5;
    float _690 = _650 * _132;
    float _692 = -_132;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _676);
    float _696 = trunc(_682);
    int _698 = int(_696);
    float _700 = _672 ? as_type<float>(_684) : _620;
    float _702 = _608 * 2.0;
    float _704 = _620;
    float _706 = _650;
    if (_656)
    {
        float _708 = _688 ? _666 : _620;
        _704 = _708;
    }
    float _710 = _704;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _686);
    int _716 = as_type<int>(_658) + (-2);
    float _718 = 1.0 / _624;
    float _720 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    float _722 = -_680;
    float _724 = _722 + 1.0;
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _738 = _626 * 2.0;
    float _740 = _734 ? _724 : 0.0;
    float _742 = floor(_702);
    float _744 = float(uint(_698));
    float _746 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[78].w, _736);
    float _748 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _720);
    int _750 = ~_618;
    int _752 = _750 + 1;
    float _754 = as_type<float>(_716) * _744;
    float _756 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _746);
    int _758 = as_type<int>(_710);
    if (_642)
    {
        float _760 = _740 * _718;
        _134 = _760;
    }
    float _762 = _134;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _774 = _772 != 0;
    float _776 = trunc(_754);
    float _778 = precise::max(_776, 0.0);
    uint _781 = uint(_778);
    bool _783 = !_612;
    float _785 = _783 ? 7.345489978790283203125 : 1.0;
    float _787 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _791 = _789 != 0;
    bool _793 = !_770;
    int _795 = _793 ? 0 : 1;
    float _797 = _785 * _608;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _801 = _799 != 0;
    float _803 = floor(_738);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    bool _809 = _742 >= 0.0;
    bool _811 = isnan(_742);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _821 = _819 != 0;
    float _823 = floor(_797);
    int _825 = _817 ? 0 : 1;
    float _827 = in.m_59.x;
    float _829 = in.m_59.y;
    float _831 = in.m_59.z;
    bool _833 = _742 > 0.0;
    int _835 = _752 * int(_781);
    int _837 = _835 + _698;
    float _839 = in.m_53.z;
    float _841 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _843 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _845 = float(uint(_837));
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _787);
    float _853 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _841);
    int _855 = ~_825;
    int _857 = _855 + 1;
    int _859 = _857 + 1;
    float _861 = as_type<float>(_716) * _845;
    float _863 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _843);
    float _865 = 1.0 / _849;
    int _867 = _859;
    if (!_833)
    {
        int _869 = ~_825;
        int _871 = _869 + 1;
        _867 = _871;
    }
    int _873 = _867;
    float _875 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _851);
    bool _877 = _803 >= 0.0;
    bool _879 = isnan(_803);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    float _887 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _853);
    float _889 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _863);
    float _891 = trunc(_861);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    float _897 = float(_98);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _903 = _885 ? 0 : 1;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    bool _907 = _803 > 0.0;
    float _909 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _911 = 1.0 / _901;
    float _913 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _915 = _606 * _905;
    float _917 = float(_698);
    float _919 = -_823;
    float _921 = _797 + _919;
    float _923 = _909 * _913;
    float _925 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _831);
    bool _927 = !_766;
    int _929 = _927 ? 0 : 1;
    float _931 = 1.0 / _897;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _933;
    int _937 = int(_781) + int(_895);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _943 = ~_618;
    int _945 = _943 + 1;
    float _947 = _935 * _865;
    float _949 = _839 * 2.0;
    float _951 = _614 * _925;
    float _953 = _941 * _911;
    int _955 = ~_903;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = _921 * _650;
    int _963 = _959;
    if (!_907)
    {
        int _965 = ~_903;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = _608 + _626;
    float _973 = floor(_949);
    int _975 = _945 * _937;
    int _977 = _975 + _698;
    bool _979 = !_774;
    int _981 = _979 ? 0 : 1;
    float _983 = _971 + (-1.0);
    bool _985 = _917 >= _650;
    bool _987 = isnan(_917);
    bool _989 = _985 || _987;
    bool _991 = isnan(_650);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = _626 + _839;
    bool _999 = uint(_977) >= uint(_618);
    float _1001 = _608 + _839;
    bool _1003 = !_791;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = _690 * _931;
    float _1009 = trunc(_995);
    int _1011 = int(_1009);
    bool _1013 = !_999;
    int _1015 = _1013 ? 0 : (-1);
    float _1017 = _1001 + (-1.0);
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1029 = _1027 != 0;
    float _1031 = _997 + (-1.0);
    int _1033 = ~_937;
    int _1035 = _1033 + _1015;
    int _1037 = _1035 + 1;
    float _1039 = in.m_55.x;
    bool _1041 = _973 >= 0.0;
    bool _1043 = isnan(_973);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _626 + (-0.5);
    int _1053 = _618 * _1037;
    int _1055 = _1053 + _698;
    bool _1057 = !_1021;
    int _1059 = _1057 ? 0 : 1;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1063 = _598 + _1061;
    int _1065 = _1049 ? 0 : 1;
    float _1067 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1069 = _973 > 0.0;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1073 = _598 + _1071;
    bool _1075 = _618 == 0;
    float _1077 = fma(_953, _1063, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1079 = ~_1011;
    int _1081 = _1079 + 1;
    int _1083 = _1081 + 1;
    float _1085 = fma(_947, _1073, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1087 = !_1075;
    int _1089 = _1087 ? _1055 : (-1);
    int _1091 = _618 + (-1);
    int _1093 = _1089 * _1083;
    float _1095 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1097 = ~_1065;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    int _1103 = _1011 * _1091;
    int _1105 = _1103 + _1093;
    int _1107 = _1101;
    float _1109 = _1039;
    if (!_1069)
    {
        int _1111 = ~_1065;
        int _1113 = _1111 + 1;
        _1107 = _1113;
    }
    int _1115 = _1107;
    float _1117 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1119 = in.m_61.x;
    float _1121 = in.m_61.y;
    float _1123 = in.m_61.z;
    int _1125 = abs(_795);
    float _1127 = trunc(_961);
    int _1129 = int(_1127);
    bool _1131 = !_1025;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = abs(_1059);
    int _1137 = _1105 * _1125;
    float _1139 = float(_873);
    int _1141 = abs(_929);
    float _1143 = trunc(_1007);
    int _1145 = int(_1143);
    int _1147 = abs(_1133);
    float _1149 = float(_1115);
    float _1151 = float(_1135);
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1155 = _1153 != 0;
    int _1157 = abs(_981);
    float _1159 = _1151 * _1149;
    float _1161 = float(_1147);
    int _1163 = abs(_1005);
    int _1165 = _1145 * _1141;
    int _1167 = _1165 + _1137;
    bool _1169 = !_1155;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = _1159 * (-2.0);
    float _1175 = _1161 * _1139;
    float _1177 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1179 = _1129 * _1163;
    int _1181 = _1179 + _698;
    int _1183 = abs(_1171);
    float _1185 = fma(_1067, _1173, _1067);
    float _1187 = fma(_1173, _1119, _1119);
    float _1189 = _1177 * _608;
    int _1191 = _1181 * _1157;
    int _1193 = _1191 + _1167;
    bool _1195 = _1155;
    if (_807)
    {
        bool _1197 = _608 > 0.5;
        _1195 = _1197;
    }
    bool _1199 = _1195;
    float _1201 = _608 + (-0.5);
    float _1203 = float(uint(_1181));
    int _1205 = _1129 * _1183;
    int _1207 = _1205 + _1193;
    bool _1209 = !_1029;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1187);
    float _1215 = in.m_63.x;
    float _1217 = in.m_63.y;
    float _1219 = in.m_63.z;
    float _1221 = as_type<float>(_716) * _1203;
    float _1223 = float(uint(_1207));
    float _1225 = _1175 * (-2.0);
    int _1227 = abs(_1211);
    float _1229 = fma(_1185, _762, _1213);
    float _1231 = float(_969);
    float _1233 = as_type<float>(_716) * _1223;
    bool _1235 = _829 != 0.0;
    bool _1237 = isnan(_829);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.0);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_1225, _1121, _1121);
    float _1247 = float(_1227);
    float _1249 = fma(_1095, _1225, _1095);
    bool _1251 = _827 == 0.0;
    bool _1253 = !_1243;
    bool _1255 = _1251 && _1253;
    float _1257 = trunc(_1233);
    float _1259 = precise::max(_1257, 0.0);
    uint _1261 = uint(_1259);
    int _1263 = ~_618;
    int _1265 = _1263 + 1;
    float _1267 = _1247 * _1231;
    bool _1269 = _831 == 0.0;
    bool _1271 = _1269 && _1255;
    float _1273 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1245);
    float _1275 = _1267 * (-2.0);
    float _1277 = _1229 * 0.15915493667125701904296875;
    float _1279 = fma(_1249, _762, _1273);
    bool _1281 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1283 = isnan(_598);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = fma(_1275, _1123, _1123);
    float _1295 = trunc(_1221);
    float _1297 = precise::max(_1295, 0.0);
    uint _1299 = uint(_1297);
    float _1301 = fma(_1117, _1275, _1117);
    int _1303 = ~_618;
    int _1305 = _1303 + 1;
    float _1307 = _1279 * 0.15915493667125701904296875;
    bool _1309 = _1271;
    if (!_807)
    {
        _706 = _1039;
    }
    float _1311 = _706;
    int _1313 = _1265 * int(_1261);
    int _1315 = _1313 + _1207;
    float _1317 = _1219;
    float _1319 = _1215;
    float _1321 = _1217;
    float _1323 = _1311;
    if (!_1271)
    {
        float _1325 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1317 = _1325;
    }
    float _1327 = _1317;
    bool _1329 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1331 = isnan(_598);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    if (!_1271)
    {
        float _1341 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1319 = _1341;
    }
    float _1343 = _1319;
    bool _1345 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1347 = isnan(_598);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    if (!_1271)
    {
        float _1357 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1217);
        _1321 = _1357;
    }
    float _1359 = _1321;
    float _1361 = float(uint(_1315));
    float _1363 = -_1339;
    float _1365 = _1363 + 1.0;
    if (_821)
    {
        bool _1367 = _839 > 0.5;
        _1309 = _1367;
    }
    bool _1369 = _1309;
    float _1371 = -_1355;
    float _1373 = _1371 + 1.0;
    float _1375 = _839 + (-0.5);
    float _1377 = as_type<float>(_716) * _1361;
    float _1379 = _1355 * _1365;
    float _1381 = _1291 * _1373;
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1293);
    int _1385 = as_type<int>(_1373);
    if (_807)
    {
        float _1387 = -_1039;
        float _1389 = _1387 + 1.0;
        _1385 = as_type<int>(_1389);
    }
    int _1391 = _1385;
    float _1393 = -_1291;
    float _1395 = _1393 + 1.0;
    float _1397 = trunc(_1377);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    float _1403 = _1085 * _1381;
    float _1405 = fma(_1301, _762, _1383);
    float _1407 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _710, -0.5);
    if (_821)
    {
        float _1409 = -_1039;
        float _1411 = _1409 + 1.0;
        _758 = as_type<int>(_1411);
    }
    int _1413 = _758;
    if (_807)
    {
        float _1415 = _1199 ? as_type<float>(_1391) : _1039;
        _1323 = _1415;
    }
    float _1417 = _1323;
    float _1419 = _1405 * 0.15915493667125701904296875;
    float _1421 = _1277 * 6.283185482025146484375;
    float _1423 = sin(_1421);
    if (_821)
    {
        float _1425 = _1369 ? as_type<float>(_1413) : _1039;
        _1109 = _1425;
    }
    float _1427 = _1109;
    float _1429 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1403);
    int _1431 = ~_618;
    int _1433 = _1431 + 1;
    int _1435 = _1305 * int(_1299);
    int _1437 = _1435 + _1181;
    float _1439 = fma(_1077, _1379, _1429);
    float _1441 = -_714;
    float _1443 = fma(_756, _1407, _1441);
    float _1445 = _1277 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    int _1449 = int(_1261) + int(_1401);
    float _1451 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1453 = float(uint(_1437));
    float _1455 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1439);
    int _1457 = _1433 * _1449;
    int _1459 = _1457 + _1207;
    float _1461 = fma(_748, _1451, _694);
    float _1463 = _1307 * 6.283185482025146484375;
    float _1465 = cos(_1463);
    float _1467 = as_type<float>(_716) * _1453;
    bool _1469 = uint(_1459) >= uint(_618);
    float _1471 = _1419 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1307 * 6.283185482025146484375;
    float _1477 = sin(_1475);
    float _1479 = _1423 * _1465;
    float _1481 = _1447 * _1465;
    float _1483 = _1419 * 6.283185482025146484375;
    float _1485 = sin(_1483);
    float _1487 = _1465 * _1473;
    bool _1489 = !_1469;
    int _1491 = _1489 ? 0 : (-1);
    float _1493 = _1447 * _1473;
    int _1495 = ~_1449;
    int _1497 = _1495 + _1491;
    int _1499 = _1497 + 1;
    float _1501 = _1423 * _1477;
    float _1503 = _1423 * _1473;
    float _1505 = _1447 * _1477;
    float _1507 = _1477 * _1473;
    int _1509 = _618 * _1499;
    int _1511 = _1509 + _1207;
    float _1513 = trunc(_1467);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    float _1519 = -_1505;
    float _1521 = fma(_1485, _1479, _1519);
    float _1523 = -_1479;
    float _1525 = fma(_1485, _1505, _1523);
    float _1527 = -_923;
    float _1529 = _1485 * _1527;
    float _1531 = -_1359;
    float _1533 = _1485 * _1531;
    float _1535 = fma(_1485, _1481, _1501);
    float _1537 = fma(_1485, _1501, _1481);
    float _1539 = fma(_1487, _915, _1529);
    float _1541 = _1493 * _923;
    float _1543 = fma(_1487, _1343, _1533);
    float _1545 = _1503 * _923;
    bool _1547 = !_1075;
    int _1549 = _1547 ? _1511 : (-1);
    float _1551 = _1493 * _1359;
    float _1553 = _1503 * _1359;
    float _1555 = fma(_1535, _915, _1541);
    float _1557 = fma(_1521, _915, _1545);
    int _1559 = _1549 >> 31;
    float _1561 = fma(_1535, _1343, _1551);
    int _1563 = ~_618;
    int _1565 = _1563 + 1;
    float _1567 = fma(_1521, _1343, _1553);
    int _1569 = _1559 & 3;
    float _1571 = fma(_1507, _951, _1539);
    int _1573 = int(_1299) + int(_1517);
    float _1575 = fma(_1525, _951, _1555);
    int _1577 = _1549 + _1569;
    float _1579 = fma(_1537, _951, _1557);
    float _1581 = fma(_1507, _1327, _1543);
    int _1583 = _1577 >> 2;
    float _1585 = fma(_1525, _1327, _1561);
    float _1587 = fma(_1537, _1327, _1567);
    int _1589 = _1565 * _1573;
    int _1591 = _1589 + _1181;
    int _1593 = _1583 << 4;
    int _1595 = _1593 + 368;
    float _1597 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1599 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1601 = _887 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1603 = uint(_1591) >= uint(_618);
    float _1605 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1597);
    uint _1607 = uint(int(uint(_1595) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[int(_1617)][_1619];
    float _1623 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1599);
    bool _1625 = !_1603;
    int _1627 = _1625 ? 0 : (-1);
    float _1629 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1605);
    float _1631 = _889 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1633 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1623);
    int _1635 = _1549 & 3;
    bool _1637 = _1635 != 0;
    float _1639 = _1601 + _1629;
    int _1641 = _1595 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[int(_1653)][_1655];
    int _1659 = ~_1573;
    int _1661 = _1659 + _1627;
    int _1663 = _1661 + 1;
    float _1665 = _1631 + _1633;
    bool _1667 = uint(_1635) > 1u;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1639 + _1669;
    int _1673 = _1549 & 3;
    bool _1675 = _1673 != 0;
    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1679 = _1665 + _1677;
    float _1681 = trunc(_1189);
    int _1683 = int(_1681);
    float _1685 = _1671 * _1671;
    int _1687 = _1675 ? 0 : 1;
    float _1689 = _1679 * _1679;
    float _1691 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1693 = _1635 != 3;
    float _1695 = _1685 + _1689;
    bool _1697 = uint(_1635) >= 2u;
    float _1699 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1691);
    int _1701 = ~_1687;
    int _1703 = _1701 + 1;
    int _1705 = _1703 + 1;
    float _1707 = sqrt(_1695);
    int _1709 = _1705;
    float _1711 = _1685;
    float _1713 = _1689;
    float _1715 = _1455;
    float _1717 = _1587;
    if (!_1667)
    {
        int _1719 = ~_1687;
        int _1721 = _1719 + 1;
        _1709 = _1721;
    }
    int _1723 = _1709;
    float _1725 = fma(_1579, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1699);
    int _1727 = _1697 ? 0 : 1;
    bool _1729 = !_1637;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = abs(_1723);
    float _1735 = _875 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1737 = ~_1727;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = abs(_1731);
    float _1745 = _1735 + _1725;
    int _1747 = _1741;
    if (_1693)
    {
        int _1749 = ~_1727;
        int _1751 = _1749 + 1;
        _1747 = _1751;
    }
    int _1753 = _1747;
    int _1755 = _1683 << 4;
    int _1757 = _1755 + 1968;
    int _1759 = abs(_1753);
    int _1761 = _1757 + 8;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[int(_1765)][_1767];
    int _1771 = ~_1733;
    int _1773 = _1771 + 1;
    int _1775 = _1773 + 1;
    bool _1777 = _1635 != 3;
    int _1779 = _1775 * as_type<int>(_1621);
    bool _1781 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _1783 = uint(int(uint(_1757) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[int(_1793)][_1795];
    bool _1799 = !_801;
    int _1801 = _1799 ? 0 : 1;
    bool _1803 = !_1777;
    int _1805 = _1803 ? 0 : (-1);
    int _1807 = ~_1759;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    int _1813 = ~_1743;
    int _1815 = _1813 + 1;
    int _1817 = _1815 + 1;
    int _1819 = _1817 * as_type<int>(_1613);
    int _1821 = _1819 + _1779;
    int _1823 = abs(_1801);
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1827 = abs(_1805);
    int _1829 = _1811 * as_type<int>(_1649);
    int _1831 = _1829 + _1821;
    float _1833 = _1649;
    float _1835 = as_type<float>(_1821);
    float _1837 = as_type<float>(_1827);
    if (!_1781)
    {
        _1833 = _1639;
    }
    float _1839 = _1833;
    int _1841 = ~_1827;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    float _1847 = _1839;
    if (!_1781)
    {
        _1835 = _1665;
    }
    float _1849 = _1835;
    float _1851 = _1849;
    if (!_1781)
    {
        _1837 = _1745;
    }
    float _1853 = _1837;
    bool _1855 = !_1781;
    float _1857 = _1853;
    if (!_1855)
    {
        float _1859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1863 = _1707 + _1861;
        float _1865 = rsqrt(_1695);
        float _1867 = _1863 * _1859;
        float _1869 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1871 = _1867 * 0.15915493667125701904296875;
        float _1873 = _1871 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = _1871 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = fma(_1875, _1869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1883 = _1865 * _1881;
        float _1885 = fma(_1671, _1883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1887 = _1879 + (-1.0);
        float _1889 = fma(_1679, _1883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1893 = _1885 + _1891;
        float _1895 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1899 = _1889 + _1897;
        float _1901 = _1893 * _1893;
        float _1903 = fma(_1745, _1879, _1895);
        float _1905 = _1899 * _1899;
        _1857 = _1903;
        _1711 = _1901;
        _1713 = _1905;
        _1847 = _1885;
        _1851 = _1889;
    }
    float _1907 = _1857;
    float _1909 = _1711;
    float _1911 = _1713;
    float _1913 = _1847;
    float _1915 = _1851;
    int _1917 = ~_1823;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    int _1923 = _1845 * as_type<int>(_1657);
    int _1925 = _1923 + _1831;
    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1929 = _1907 + _1927;
    int _1931 = _618 * _1663;
    int _1933 = _1931 + _1181;
    float _1935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1937 = _1925 * _1921;
    float _1939 = fma(_1929, _1929, _1909);
    float _1941 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1943 = !_1075;
    int _1945 = _1943 ? _1933 : (-1);
    float _1947 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1949 = _1939 + _1911;
    float _1951 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1953 = _1769 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1955 = _1945 * _1823;
    int _1957 = _1955 + _1937;
    float _1959 = _1797 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1961 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1941);
    float _1963 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1947);
    float _1965 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1951);
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _700 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = sqrt(_1949);
    float _1973 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1975 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1977 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1979 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1981 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1983 = _1969 * _1825;
    float _1985 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1961);
    float _1987 = _1973 * _1935;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1997 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1999 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2001 = _1443 + 0.5;
    float _2003 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2005 = _1461 + 0.5;
    float _2007 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1963);
    float _2009 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1965);
    float _2011 = float(_1957);
    out.m_65.x = _1997;
    out.m_65.y = _1967;
    out.m_65.z = _1999;
    out.m_65.w = _1995;
    bool _2013 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2015 = isnan(_1971);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2021 = _2017 || _2019;
    out.m_67.x = _1989;
    out.m_67.y = _1991;
    out.m_67.z = _1993;
    out.m_67.w = _2003;
    out.m_69.x = _2005;
    out.m_69.y = _2001;
    out.m_69.z = _1987;
    out.m_69.w = _1983;
    out.m_71.x = _1985;
    out.m_71.y = _2007;
    out.m_71.z = _2009;
    float _2023 = _1989;
    float _2025 = _1985;
    float _2027 = _1963;
    if (!_2021)
    {
        _1715 = 1.0;
    }
    float _2029 = _1715;
    out.m_73.x = _2011;
    bool _2031 = !_2021;
    float _2033 = _2029;
    if (!_2031)
    {
        bool _2035 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2037 = isnan(_1971);
        bool _2039 = _2035 || _2037;
        bool _2041 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2043 = _2039 || _2041;
        if (!_2043)
        {
            float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2047 = _1971 + _2045;
            float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2051 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2055 = _2053 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2057 = 1.0 / _2051;
            float _2059 = _2047 * _2057;
            float _2061 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2033 = _2061;
            _2023 = _2057;
            _2063 = true;
        }
        else
        {
            bool _2065 = _1971 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2067 = isnan(_1971);
            bool _2069 = _2065 || _2067;
            bool _2071 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2073 = _2069 || _2071;
            if (!_2073)
            {
                float _2075 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2077 = _1971 + _2075;
                float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2081 = _2079 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2085 = _2083 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2087 = 1.0 / _2081;
                float _2089 = _2077 * _2087;
                float _2091 = fma(_2089, _2085, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2033 = _2091;
                _2023 = _2087;
                _2063 = true;
            }
            else
            {
                _2033 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2063 = false;
    float _2093 = _2033;
    float _2095 = _2023;
    float _2097 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2099 = _1907 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2103 = _1913 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2107 = _1915 + _2105;
    float _2109 = fma(_2099, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2111 = fma(_2103, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2113 = fma(_2107, _2093, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2117 = _2109 + _2115;
    float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2121 = _2111 + _2119;
    float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2125 = _2113 + _2123;
    float _2127 = _2117 * _2117;
    float _2129 = fma(_2121, _2121, _2127);
    float _2131 = fma(_2125, _2125, _2129);
    float _2133 = rsqrt(_2131);
    float _2135 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2137 = _2121 * _2135;
    float _2139 = _2125 * _2135;
    float _2141 = _2137 * _2137;
    float _2143 = _2139 * _2139;
    float _2145 = _2141 + _2143;
    float _2147 = sqrt(_2145);
    bool _2149 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2153 = _2147 + _2151;
    float _2155 = _2095;
    float _2157 = _2153;
    float _2159 = _2135;
    float _2161 = _2137;
    if (_2149)
    {
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2163;
    }
    float _2165 = _2155;
    if (_2149)
    {
        float _2167 = rsqrt(_2145);
        _1717 = _2167;
    }
    float _2169 = _1717;
    float _2171 = _2169;
    if (_2149)
    {
        float _2173 = _2153 * _2165;
        _2157 = _2173;
    }
    float _2175 = _2157;
    if (_2149)
    {
        float _2177 = _2175 * 0.15915493667125701904296875;
        _2025 = _2177;
    }
    float _2179 = _2025;
    float _2181 = _2003;
    if (_2149)
    {
        float _2183 = _2179 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        _2181 = _2185;
    }
    float _2187 = _2181;
    float _2189 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2191 = precise::max(0.0, _2189);
    float _2193 = _1915;
    float _2195 = _2191;
    float _2197 = _2189;
    if (_2149)
    {
        float _2199 = _2179 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        _2193 = _2201;
    }
    float _2203 = _2193;
    float _2205 = -_2135;
    float _2207 = -_2191;
    float _2209 = fma(_2117, _2205, _2207);
    if (_2149)
    {
        float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2211;
    }
    float _2213 = _2195;
    float _2215 = sqrt(_2131);
    float _2217 = _2187;
    float _2219 = _2213;
    if (_2149)
    {
        float _2221 = fma(_2187, _2213, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = _2223;
    if (!_2149)
    {
        _2219 = _2143;
    }
    float _2227 = _2219;
    float _2229 = _2227;
    if (_2149)
    {
        float _2231 = _2203 + (-1.0);
        _2197 = _2231;
    }
    float _2233 = _2197;
    float _2235 = _2233;
    if (_2149)
    {
        float _2237 = _2169 * _2223;
        _2027 = _2237;
    }
    float _2239 = _2027;
    if (!_2149)
    {
        _2171 = _2209;
    }
    float _2241 = _2171;
    float _2243 = _2241;
    if (_2149)
    {
        float _2245 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2159 = _2245;
    }
    float _2247 = _2159;
    if (_2149)
    {
        float _2249 = _2137 * _2239;
        _2161 = _2249;
    }
    float _2251 = _2161;
    if (!_2149)
    {
        _2225 = _2139;
    }
    float _2253 = _2225;
    float _2255 = _2253;
    if (_2149)
    {
        float _2257 = _2139 * _2239;
        _2255 = _2257;
    }
    float _2259 = _2255;
    if (!_2149)
    {
        _2235 = _2141;
    }
    float _2261 = _2235;
    float _2263 = _2261;
    if (_2149)
    {
        float _2265 = fma(_2209, _2203, _2247);
        _2243 = _2265;
    }
    float _2267 = _2243;
    if (_2149)
    {
        float _2269 = _2251 * _2251;
        _2263 = _2269;
    }
    float _2271 = _2263;
    if (_2149)
    {
        float _2273 = _2259 * _2259;
        _2229 = _2273;
    }
    float _2275 = _2229;
    float _2277 = fma(_2267, _2267, _2271);
    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2281 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2279);
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    float _2285 = _2277 + _2275;
    float _2287 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2289 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2291 = -_2283;
    float _2293 = _2291 + 1.0;
    float _2295 = rsqrt(_2285);
    float _2297 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2287);
    float _2299 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2301 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2303 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2289);
    float _2305 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2297);
    float _2307 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2299);
    float _2309 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2311 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2303);
    float _2313 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2315 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2307);
    float _2317 = abs(_2293);
    float _2319 = log2(_2317);
    float _2321 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2301);
    float _2323 = _2311 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2325 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2327 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2329 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2321);
    float _2331 = _2295 * _2251;
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2335 = -_2327;
    float _2337 = fma(_2335, _2309, 1.0);
    float _2339 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2341 = _2295 * _2267;
    float _2343 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2345 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2333);
    float _2347 = _2295 * _2259;
    float _2349 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2351 = -_2343;
    float _2353 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2351);
    float _2355 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2357 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2345);
    float _2359 = log2(_2337);
    float _2361 = -_2347;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2353);
    float _2365 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2367 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2357);
    float _2369 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2349);
    float _2371 = fma(_2363, -0.5, 0.5);
    float _2373 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2365);
    float _2375 = exp2(_2355);
    float _2377 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2369);
    float _2379 = fma(_2363, 0.5, 0.5);
    float _2381 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2373);
    float _2383 = fma(_2379, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2385 = 1.0 / _2367;
    float _2387 = _2341 + 1.0;
    float _2389 = fma(_2379, _2383, -0.212114393711090087890625);
    float _2391 = _2359 * 0.693147182464599609375;
    float _2393 = fma(_2379, _2389, 1.570728778839111328125);
    float _2395 = sqrt(_2371);
    float _2397 = -_2341;
    float _2399 = fma(_2375, _2387, _2397);
    float _2401 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2377);
    float _2403 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2381);
    float _2405 = fma(_2399, 0.5, 0.5);
    float _2407 = _2401 * _2385;
    float _2409 = _2403 * _2385;
    float _2411 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2413 = fma(_2407, 0.5, 0.5);
    float _2415 = fma(_2409, -0.5, 0.5);
    float _2417 = _2395 * 0.636619746685028076171875;
    float3 _6122 = float3(_2413, _2415, _2411);
    float _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6122, float3(0.0), isnan(_6122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6122, float3(0.0), isnan(_6122)), level(0.0)).x;
    float3 _6133 = float3(_2413, _2415, _2411);
    float4 _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6133, float3(0.0), isnan(_6133)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6133, float3(0.0), isnan(_6133)), level(0.0)).xyzw;
    float _2424 = _2422.x;
    float _2426 = _2422.y;
    float _2428 = _2422.z;
    float _2430 = _2422.w;
    float _2432 = -_2393;
    float _2434 = fma(_2417, _2432, 1.0);
    float2 _6155 = float2(_2434, _2405);
    float3 _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6155, float2(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6155, float2(0.0), isnan(_6155)), level(0.0)).xyz;
    float _2440 = _2438.x;
    float _2442 = _2438.y;
    float _2444 = _2438.z;
    float _2446 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2448 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2121;
    out.m_75.y = _2117;
    out.m_75.z = _2125;
    float _2450 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2448);
    float _2452 = exp2(_2446);
    float _2454 = fma(_2313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2450);
    float _2456 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2454);
    float _2458 = _2456 + _2367;
    out.gl_Position.x = _2401;
    out.gl_Position.y = _2403;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2367;
    float _2460 = _2458 * 0.5;
    float _2462 = -_2452;
    float _2464 = _2462 + 1.0;
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2468 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.z = _2460;
    out.m_77.w = _2367;
    out.m_47.x = _2468;
    float _2470 = _2466 * _2419;
    float _2472 = -_2466;
    float _2474 = _2472 + 1.0;
    float _2476 = _2430 * _2470;
    float _2478 = _2444 * _2470;
    float _2480 = fma(_2440, _2476, _2424);
    float _2482 = fma(_2442, _2476, _2426);
    float _2484 = _2430 * _2474;
    float _2486 = fma(_2430, _2478, _2428);
    out.m_79.x = _2480;
    out.m_79.y = _2482;
    out.m_79.z = _2486;
    out.m_79.w = _2484;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

