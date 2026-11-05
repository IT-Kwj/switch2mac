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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1875 = false;
    bool _712 = false;
    bool _586 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_116);
        out.gl_Position.z = _2159;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    if (_130)
    {
        float _138 = float(_102);
        _136 = _138;
    }
    float _140 = _136;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = 0.0;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    float _152 = _150;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _154 = _150 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2228 = as_type<float>(_156);
        out.gl_Position.z = _2228;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.w;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = _160;
    if (!_170)
    {
        float _186 = _160 * _160;
        float _188 = _186 * 0.5;
        _152 = _188;
    }
    float _190 = _152;
    float _192 = _190;
    if (!_170)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_170;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _160 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _160);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_170;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _160 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _172, _260);
    float _268 = fma(_256, _174, _262);
    float _270 = fma(_256, _176, _264);
    float _272 = fma(_266, _158, _178);
    float _274 = fma(_268, _158, _180);
    float _276 = fma(_270, _158, _182);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_53.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_102);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _306 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _306 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _336 = 1.0 / _326;
    bool _338 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_306);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _322;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _358 = 1.0 / _330;
    float _360 = _318 * _336;
    bool _362 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _364 = isnan(_306);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _334;
    float _376 = _310 * _350;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _306 + _378;
    bool _382 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _384 = isnan(_306);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_354, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _314 * _358;
    float _398 = -_392;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_404, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _380 * _374;
    bool _410 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _412 = isnan(_306);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    bool _422 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_306);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = -_420;
    float _440 = _438 + 1.0;
    float _442 = _420 * _400;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = fma(_436, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = _372 * _440;
    float _452 = -_372;
    float _454 = _452 + 1.0;
    float _456 = fma(_446, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = -_432;
    float _460 = _458 + 1.0;
    float _462 = _432 * _454;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = _348 * _460;
    float _474 = -_348;
    float _476 = _474 + 1.0;
    float _478 = fma(_466, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _480 = fma(_470, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = _456 * _472;
    float _484 = _394 * _472;
    float _486 = _406 * _472;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _496;
    float _500 = in.m_51.x;
    float _502 = in.m_51.y;
    float _504 = in.m_51.z;
    float _506 = fma(_490, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _508 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _482);
    float _510 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _512 = fma(_494, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _514 = fma(_498, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _486);
    float _518 = fma(_448, _462, _508);
    float _520 = fma(_478, _462, _510);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = fma(_480, _462, _516);
    float _536 = fma(_524, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_528, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _540 = fma(_532, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_512, _450, _518);
    float _544 = fma(_506, _450, _520);
    float _546 = fma(_514, _450, _534);
    float _548 = fma(_536, _442, _542);
    float _550 = fma(_538, _442, _544);
    float _552 = fma(_540, _442, _546);
    float _554 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].x, _548);
    float _556 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].y, _550);
    float _558 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].z, _552);
    float _560 = _554 * _500;
    float _562 = _556 * _502;
    float _564 = _558 * _504;
    bool _566 = !_356;
    float _584;
    if (!_566)
    {
        float _568 = in.m_53.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_102);
        float _590 = 1.0 / _588;
        float _592 = _134 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _598 = _594 + _596;
    bool _600 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _602 = isnan(_594);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _612;
    bool _616 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _618 = isnan(_594);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_610;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _632;
    float _636 = 1.0 / _614;
    bool _638 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _640 = _626 * _630;
    float _642 = -_626;
    float _644 = _642 + 1.0;
    float _646 = _598 * _636;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _648;
    float _652 = fma(_634, _646, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _654;
    float _658 = fma(_650, _646, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _660 = _652 * _640;
    float _662 = fma(_656, _646, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _664 = _658 * _640;
    float _666 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].x, _660);
    float _668 = _662 * _640;
    float _670 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].x, _666);
    float _672 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].y, _668);
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].z, _664);
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].y, _672);
    float _680 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].z, _674);
    float _682 = _678 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _692 = !_638;
    float _710;
    if (!_692)
    {
        float _694 = in.m_53.x;
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        float _714 = float(_102);
        float _716 = 1.0 / _714;
        float _718 = _134 * _716;
        _710 = _718;
    }
    _712 = false;
    float _720 = _710;
    float _722 = in.m_55.x;
    float _724 = in.m_55.y;
    float _726 = in.m_55.z;
    float _728 = in.m_55.w;
    float _730 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _732 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = in.m_57.x;
    float _736 = in.m_57.y;
    float _738 = in.m_57.z;
    float _740 = in.m_57.w;
    float _742 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = in.m_59.x;
    float _746 = in.m_59.y;
    float _748 = in.m_59.z;
    float _750 = in.m_59.w;
    float _752 = in.m_53.x;
    float _754 = in.m_53.y;
    float _756 = _274 * _724;
    float _758 = _274 * _736;
    float _760 = fma(_272, _722, _756);
    float _762 = _274 * _746;
    float _764 = fma(_272, _734, _758);
    float _766 = fma(_276, _726, _760);
    float _768 = fma(_272, _744, _762);
    float _770 = fma(_276, _738, _764);
    float _772 = _766 + _728;
    float _774 = fma(_276, _748, _768);
    float _776 = _770 + _740;
    float _778 = -_772;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _782 = _774 + _750;
    float _784 = -_776;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = _780 * _780;
    float _790 = -_782;
    float _792 = _790 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _796 = fma(_786, _786, _788);
    float _798 = _752 * 6.283185482025146484375;
    float _800 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _794);
    float _802 = fma(_792, _792, _796);
    float _804 = _798 * 0.15915493667125701904296875;
    float _806 = rsqrt(_802);
    float _808 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _800);
    float _810 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _812 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _814 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _810);
    float _816 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _812);
    float _818 = _804 * 6.283185482025146484375;
    float _820 = sin(_818);
    float _822 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _814);
    float _824 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _816);
    float _826 = _786 * _806;
    float _828 = _792 * _806;
    float _830 = _780 * _806;
    float _832 = _804 * 6.283185482025146484375;
    float _834 = cos(_832);
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _838 = _826 * _836;
    float _840 = in.m_61.x;
    float _842 = in.m_61.y;
    float _844 = in.m_61.z;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _848 = -_838;
    float _850 = fma(_828, _846, _848);
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _854 = _830 * _852;
    float _856 = rsqrt(_808);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _860 = _828 * _858;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = -_854;
    float _866 = fma(_826, _862, _864);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _870 = -_860;
    float _872 = fma(_830, _868, _870);
    bool _874 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _876 = isnan(0.5);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _882 = _878 || _880;
    float _884 = rsqrt(_822);
    float _886 = _850 * _850;
    float _888 = fma(_872, _872, _886);
    float _890 = rsqrt(_824);
    float _892 = fma(_866, _866, _888);
    float _894 = _820 * _842;
    float _896 = _834 * _842;
    float _898 = -_894;
    float _900 = fma(_834, _840, _898);
    float _902 = fma(_820, _840, _896);
    float _904 = rsqrt(_892);
    float _906 = _900 * _856;
    float _908 = _902 * _884;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _906);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _914 = _890 * _844;
    float _916 = _732 * _910;
    float _918 = _730 * _912;
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _914);
    float _922 = _872 * _904;
    float _924 = _850 * _904;
    float _926 = _866 * _904;
    float _928 = _742 * _920;
    float _930 = _830 * _922;
    float _932 = _828 * _924;
    float _934 = _826 * _926;
    float _936 = -_930;
    float _938 = fma(_826, _924, _936);
    float _940 = -_932;
    float _942 = fma(_830, _926, _940);
    float _944 = -_934;
    float _946 = fma(_828, _922, _944);
    float _948 = _918 * _938;
    float _950 = _918 * _942;
    float _952 = fma(_916, _926, _948);
    float _954 = fma(_916, _922, _950);
    float _956 = fma(_928, _828, _952);
    float _958 = fma(_928, _826, _954);
    float _960 = fma(0.0500000007450580596923828125, _752, 0.0500000007450580596923828125);
    float _962 = _782 + _956;
    float _964 = _776 + _958;
    float _966 = _134 * _960;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _970 = _962 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _974 = _964 + _972;
    float _976 = _966 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _978 = _970 * _970;
    float _980 = fma(_976, _976, _976);
    float _982 = fma(_974, _974, _978);
    float _984 = _918 * _946;
    float _986 = sqrt(_982);
    float _988 = fma(_916, _924, _984);
    float _990 = fma(_928, _830, _988);
    float _992 = _772 + _990;
    float _994 = -_980;
    float _996 = _992 + _994;
    bool _998 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1000 = _992;
    float _1002 = _964;
    float _1004 = _980;
    float _1006 = _996;
    float _1008 = _962;
    if (!_998)
    {
        _1000 = _964;
    }
    float _1010 = _1000;
    float _1012 = _1010;
    if (!_998)
    {
        _1002 = _962;
    }
    float _1014 = _1002;
    float _1016 = _1014;
    if (!_998)
    {
        _1004 = _996;
    }
    float _1018 = _1004;
    bool _1020 = !_998;
    float _1022 = _1018;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1028 = _986 + _1026;
        float _1030 = _996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = _1028 * _1024;
        float _1034 = rsqrt(_982);
        float _1036 = _1032 * 0.15915493667125701904296875;
        float _1038 = _1036 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1040 + (-1.0);
        float _1048 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = fma(_1044, _1030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1052 = fma(_996, _1040, _1048);
        float _1054 = _1034 * _1050;
        float _1056 = fma(_974, _1054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1058 = fma(_970, _1054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1012 = _1056;
        _1016 = _1058;
        _1022 = _1052;
    }
    float _1060 = _1012;
    float _1062 = _1016;
    float _1064 = _1022;
    float _1066 = _1064;
    float _1068 = _1060;
    float _1070 = _1062;
    if (!_882)
    {
        float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1074 = _772 + _1072;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1078 = _776 + _1076;
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1082 = -_776;
        float _1084 = _1082 + _1060;
        float _1086 = _1074 * _1074;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1090 = _782 + _1088;
        float _1092 = -_782;
        float _1094 = _1092 + _1062;
        float _1096 = fma(_1078, _1078, _1086);
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1100 = fma(_1090, _1090, _1096);
        float _1102 = sqrt(_1100);
        float _1104 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1106 = precise::min(_1102, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1108 = _1106 * _1098;
        float _1110 = _1104 * _1108;
        float _1112 = -_772;
        float _1114 = _1112 + _1064;
        float _1116 = fma(_1084, _1110, _776);
        float _1118 = fma(_1114, _1110, _772);
        float _1120 = fma(_1094, _1110, _782);
        _1066 = _1118;
        _1068 = _1116;
        _1070 = _1120;
        _1006 = _1080;
    }
    float _1122 = _1066;
    float _1124 = _1068;
    float _1126 = _1070;
    float _1128 = _1006;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1132 = _1122 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1136 = _1124 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1140 = _1126 + _1138;
    float _1142 = _1132 * _1132;
    float _1144 = fma(_1136, _1136, _1142);
    float _1146 = fma(_1140, _1140, _1144);
    float _1148 = rsqrt(_1146);
    float _1150 = sqrt(_1146);
    float _1152 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1154 = _1136 * _1152;
    float _1156 = _1140 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 * _1156;
    float _1162 = _1158 + _1160;
    float _1164 = sqrt(_1162);
    bool _1166 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1164 + _1168;
    float _1172 = _1140;
    float _1174 = _1128;
    float _1176 = _1170;
    float _1178 = _1152;
    if (_1166)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1172 = _1180;
    }
    float _1182 = _1172;
    if (_1166)
    {
        float _1184 = rsqrt(_1162);
        _1174 = _1184;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (_1166)
    {
        float _1190 = _1170 * _1182;
        _1176 = _1190;
    }
    float _1192 = _1176;
    if (_1166)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1008 = _1194;
    }
    float _1196 = _1008;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1200 = _1148;
    if (_1166)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1200 = _1204;
    }
    float _1206 = _1200;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1142;
    float _1214 = _1210;
    float _1216 = _1208;
    if (_1166)
    {
        float _1218 = _1196 * 6.283185482025146484375;
        float _1220 = cos(_1218);
        _1212 = _1220;
    }
    float _1222 = _1212;
    float _1224 = -_1152;
    float _1226 = -_1210;
    float _1228 = fma(_1132, _1224, _1226);
    float _1230 = _1228;
    if (_1166)
    {
        float _1232 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1232;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    float _1238 = _1206;
    if (_1166)
    {
        float _1240 = fma(_1206, _1234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1236 = _1240;
    }
    float _1242 = _1236;
    float _1244 = _1242;
    if (!_1166)
    {
        _1238 = _1154;
    }
    float _1246 = _1238;
    float _1248 = _1246;
    float _1250 = _1222;
    if (_1166)
    {
        float _1252 = _1222 + (-1.0);
        _1216 = _1252;
    }
    float _1254 = _1216;
    float _1256 = _1254;
    if (_1166)
    {
        float _1258 = _1186 * _1242;
        _1178 = _1258;
    }
    float _1260 = _1178;
    if (!_1166)
    {
        _1244 = _1158;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1166)
    {
        float _1266 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1188 = _1266;
    }
    float _1268 = _1188;
    if (_1166)
    {
        float _1270 = _1154 * _1260;
        _1248 = _1270;
    }
    float _1272 = _1248;
    if (!_1166)
    {
        _1256 = _1156;
    }
    float _1274 = _1256;
    float _1276 = _1274;
    if (_1166)
    {
        float _1278 = _1156 * _1260;
        _1276 = _1278;
    }
    float _1280 = _1276;
    if (_1166)
    {
        float _1282 = fma(_1228, _1222, _1268);
        _1230 = _1282;
    }
    float _1284 = _1230;
    if (_1166)
    {
        float _1286 = _1272 * _1272;
        _1264 = _1286;
    }
    float _1288 = _1264;
    if (!_1166)
    {
        _1250 = _1160;
    }
    float _1290 = _1250;
    float _1292 = _1290;
    if (_1166)
    {
        float _1294 = _1280 * _1280;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = fma(_1284, _1284, _1288);
    float _1302 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1304 = _1300 + _1296;
    float _1306 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1310 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1308);
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1302);
    float _1316 = rsqrt(_1304);
    float _1318 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1320 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1306);
    float _1322 = -_1312;
    float _1324 = _1322 + 1.0;
    float _1326 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1318);
    float _1330 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1320);
    float _1332 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1334 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1336 = abs(_1324);
    float _1338 = log2(_1336);
    float _1340 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1328);
    float _1342 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = _1316 * _1272;
    float _1354 = _1316 * _1280;
    float _1356 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1358 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    float _1360 = _1316 * _1284;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = -_1346;
    float _1366 = fma(_1364, _1198, 1.0);
    float _1368 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1358);
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = -_1362;
    float _1374 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1372);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1378 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1368);
    float _1380 = log2(_1366);
    float _1382 = -_1354;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1374);
    float _1386 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1390 = fma(_1384, -0.5, 0.5);
    float _1392 = fma(_1384, 0.5, 0.5);
    float _1394 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1396 = exp2(_1376);
    float _1398 = _1360 + 1.0;
    float _1400 = fma(_1392, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1394);
    float _1404 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1388);
    float _1406 = 1.0 / _1378;
    float _1408 = _1380 * 0.693147182464599609375;
    float _1410 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1412 = sqrt(_1390);
    float _1414 = -_1360;
    float _1416 = fma(_1396, _1398, _1414);
    float _1418 = fma(_1392, _1400, -0.212114393711090087890625);
    float _1420 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1422 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1404);
    float _1424 = fma(_1392, _1418, 1.570728778839111328125);
    float _1426 = _1420 * _1406;
    float _1428 = _1422 * _1406;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1412 * 0.636619746685028076171875;
    float3 _4285 = float3(_1430, _1432, _1410);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4285, float3(0.0), isnan(_4285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4285, float3(0.0), isnan(_4285)), level(0.0)).x;
    float _1438 = -_1424;
    float _1440 = fma(_1434, _1438, 1.0);
    float _1442 = fma(_1416, 0.5, 0.5);
    float3 _4303 = float3(_1430, _1432, _1410);
    float4 _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4303, float3(0.0), isnan(_4303)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4303, float3(0.0), isnan(_4303)), level(0.0)).xyzw;
    float _1447 = _1445.x;
    float _1449 = _1445.y;
    float _1451 = _1445.z;
    float _1453 = _1445.w;
    float2 _4320 = float2(_1440, _1442);
    float3 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4320, float2(0.0), isnan(_4320)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4320, float2(0.0), isnan(_4320)), level(0.0)).xyz;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = in.m_63.x;
    float _1467 = in.m_63.y;
    float _1469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_65.x = _686;
    out.m_65.y = _688;
    out.m_65.z = _690;
    bool _1471 = _752 > 0.5;
    float _1473 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1475 = _754 > 0.5;
    float _1477 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1479 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _1124;
    out.m_67.y = _1122;
    out.m_67.z = _1126;
    float _1481 = exp2(_1473);
    float _1483 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1479);
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1487 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1489 = _732 * _1465;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1491;
    float _1495 = _730 * _1467;
    float _1497 = 1.0 / _1493;
    float _1499 = -_1481;
    float _1501 = _1499 + 1.0;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1511 = _1509 != 0;
    float _1513 = -_1503;
    float _1515 = fma(_1477, 2.0, _1513);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1521 = -_134;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1515);
    float _1525 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1517);
    float _1527 = fma(_1487, -2.0, _1485);
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1531 = -_1489;
    float _1533 = _1531 + 1.0;
    float _1535 = -_1495;
    float _1537 = _1535 + 1.0;
    float _1539 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1525);
    float _1541 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1529);
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1545 = _720 + _1543;
    float _1547 = _1489;
    float _1549 = _1495;
    float _1551 = _1378;
    float _1553 = _1422;
    if (_1507)
    {
        float _1555 = _1471 ? _1533 : _1489;
        _1547 = _1555;
    }
    float _1557 = _1547;
    float _1559 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1511)
    {
        float _1561 = _1475 ? _1537 : _1495;
        _1549 = _1561;
    }
    float _1563 = _1549;
    float _1565 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1541);
    float _1567 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1569 = fma(_1559, _1557, -0.5);
    float _1571 = _1545 * _1497;
    float _1573 = fma(_1567, _1563, -0.5);
    float _1575 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1527);
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1581;
    bool _1585 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1587 = isnan(_720);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1593 = _1589 || _1591;
    float _1595 = float(_1593);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1597;
    bool _1601 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1603 = isnan(_720);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = fma(_1579, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1615 = fma(_1583, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1617 = fma(_1599, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1619 = -_1575;
    float _1621 = fma(_1565, _1573, _1619);
    float _1623 = -_1595;
    float _1625 = _1623 + 1.0;
    float _1627 = in.m_69.x;
    float _1629 = in.m_69.y;
    float _1631 = in.m_69.z;
    bool _1633 = _908 != 0.0;
    bool _1635 = isnan(_908);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    float _1643 = fma(_1539, _1569, _1523);
    float _1645 = _1611 * _1625;
    float _1647 = -_1611;
    float _1649 = _1647 + 1.0;
    bool _1651 = _906 == 0.0;
    bool _1653 = !_1641;
    bool _1655 = _1651 && _1653;
    float _1657 = _1643 + 0.5;
    float _1659 = _1613 * _1645;
    float _1661 = _1615 * _1645;
    float _1663 = _1617 * _1645;
    bool _1665 = _914 == 0.0;
    bool _1667 = _1665 && _1655;
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1659);
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1661);
    float _1673 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1663);
    float _1675 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1677 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1669);
    float _1679 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1671);
    float _1681 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1673);
    float _1683 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1675);
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1687 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1691 = _1621 + 0.5;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1629;
    float _1697 = _1627;
    float _1699 = _1631;
    float _1701 = _1683;
    if (!_1667)
    {
        float _1703 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1629);
        _1695 = _1703;
    }
    float _1705 = _1695;
    float _1707 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1667)
    {
        float _1711 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1627);
        _1697 = _1711;
    }
    float _1713 = _1697;
    float _1715 = _942 * _1705;
    float _1717 = _946 * _1705;
    float _1719 = _938 * _1705;
    out.m_71.x = _1693;
    out.m_71.y = _1707;
    out.m_71.z = _1709;
    float _1721 = fma(_922, _1713, _1715);
    if (!_1667)
    {
        float _1723 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1631);
        _1699 = _1723;
    }
    float _1725 = _1699;
    float _1727 = fma(_926, _1713, _1719);
    float _1729 = _1683 + _1378;
    float _1731 = fma(_924, _1713, _1717);
    out.m_73.x = _1657;
    out.m_73.y = _1691;
    float _1733 = fma(_826, _1725, _1721);
    bool _1735 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1737 = isnan(_1150);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1743 = _1739 || _1741;
    float _1745 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1747 = _1729 * 0.5;
    float _1749 = fma(_830, _1725, _1731);
    float _1751 = fma(_828, _1725, _1727);
    out.gl_Position.x = _1420;
    out.gl_Position.y = _1422;
    out.gl_Position.z = _1683;
    out.gl_Position.w = _1378;
    out.m_75.x = _1733;
    out.m_75.y = _1749;
    out.m_75.z = _1751;
    out.m_77.z = _1747;
    out.m_77.w = _1378;
    float _1753 = _1747;
    float _1755 = _1420;
    if (!_1743)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1757 = _1551;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1743)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1763 = _1701;
    float _1765 = _1763;
    float _1767 = _1763;
    if (!_1743)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1769 = _1753;
    float _1771 = _1769;
    float _1773 = _1769;
    if (!_1743)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1775 = _1553;
    float _1777 = _1775;
    float _1779 = _1775;
    if (!_1743)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1781 = _1755;
    float _1783 = _1745 * _1436;
    float _1785 = -_1745;
    float _1787 = _1785 + 1.0;
    float _1789 = _1453 * _1783;
    float _1791 = _1453 * _1787;
    float _1793 = _1463 * _1783;
    float _1795 = fma(_1459, _1789, _1447);
    float _1797 = fma(_1461, _1789, _1449);
    float _1799 = _1789;
    float _1801 = _1781;
    float _1803 = _1781;
    if (!_1743)
    {
        _1799 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1805 = _1799;
    float _1807 = fma(_1453, _1793, _1451);
    out.m_79.x = _1795;
    out.m_79.y = _1797;
    out.m_79.z = _1807;
    out.m_79.w = _1791;
    bool _1809 = !_1743;
    float _1811 = _1805;
    float _1813 = _1805;
    if (!_1809)
    {
        bool _1815 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1817 = isnan(_1150);
        bool _1819 = _1815 || _1817;
        bool _1821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1823 = _1819 || _1821;
        if (!_1823)
        {
            float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1827 = _1150 + _1825;
            float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1829;
            float _1833 = 1.0 / _1831;
            float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1837 = _1835 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1841 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1849 = _1847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1853 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1855 = _1827 * _1833;
            float _1857 = precise::clamp(_1855, 0.0, 1.0);
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1863 = fma(_1857, _1837, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1865 = fma(_1857, _1861, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1867 = fma(_1857, _1841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1869 = fma(_1857, _1845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1871 = fma(_1857, _1849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1873 = fma(_1857, _1853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1773 = _1865;
            _1779 = _1871;
            _1813 = _1863;
            _1767 = _1869;
            _1761 = _1867;
            _1803 = _1873;
            _1875 = true;
        }
        else
        {
            bool _1877 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1879 = isnan(_1150);
            bool _1881 = _1877 || _1879;
            bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1885 = _1881 || _1883;
            if (!_1885)
            {
                _1811 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1887 = _1811;
            _1813 = _1887;
            if (!_1885)
            {
                _1771 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1889 = _1771;
            _1773 = _1889;
            if (!_1885)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1891 = _1759;
            _1761 = _1891;
            if (!_1885)
            {
                _1765 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1893 = _1765;
            _1767 = _1893;
            if (!_1885)
            {
                _1777 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1895 = _1777;
            _1779 = _1895;
            if (!_1885)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1897 = _1801;
            bool _1899 = !_1885;
            _1803 = _1897;
            if (!_1899)
            {
                bool _1901 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1903 = isnan(_1150);
                bool _1905 = _1901 || _1903;
                bool _1907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1909 = _1905 || _1907;
                if (!_1909)
                {
                    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1913 = _1150 + _1911;
                    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1915;
                    float _1919 = 1.0 / _1917;
                    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1941 = _1913 * _1919;
                    float _1943 = precise::clamp(_1941, 0.0, 1.0);
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1949 = fma(_1943, _1923, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1951 = fma(_1943, _1947, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1953 = fma(_1943, _1927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1955 = fma(_1943, _1931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1957 = fma(_1943, _1935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1959 = fma(_1943, _1939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1773 = _1951;
                    _1779 = _1957;
                    _1813 = _1949;
                    _1767 = _1955;
                    _1761 = _1953;
                    _1803 = _1959;
                    _1875 = true;
                }
                else
                {
                    _1773 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1779 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1813 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1767 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1875 = false;
    float _1961 = _1773;
    float _1963 = _1779;
    float _1965 = _1813;
    float _1967 = _1767;
    float _1969 = _1761;
    float _1971 = _1803;
    float _1973 = fma(_1749, -0.5, 0.5);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = -_1961;
    float _1979 = _1977 + _1963;
    float _1981 = -_1965;
    float _1983 = _1981 + _1967;
    float _1985 = -_1969;
    float _1987 = _1985 + _1971;
    bool _1989 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1991 = fma(_1975, _1979, _1961);
    float _1993 = fma(_1975, _1983, _1965);
    float _1995 = fma(_1975, _1987, _1969);
    float _1997 = _1991 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _1999 = fma(_1993, 0.298911988735198974609375, _1997);
    float _2001 = fma(_1995, 0.114477999508380889892578125, _1999);
    float _2003 = -_2001;
    float _2005 = _1993 + _2003;
    float _2007 = -_2001;
    float _2009 = _1991 + _2007;
    float _2011 = -_2001;
    float _2013 = _1995 + _2011;
    float _2015 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2017 = fma(_2005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    float _2019 = fma(_2009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    float _2021 = fma(_2013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    out.m_47.x = _2015;
    out.m_83.x = _2017;
    out.m_83.y = _2019;
    out.m_83.z = _2021;
    if (!_1989)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2023 = -_1122;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2027 = -_1124;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2031 = -_1126;
    float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2035 = _2025 * _2025;
    float _2037 = fma(_2029, _2029, _2035);
    float _2039 = fma(_2033, _2033, _2037);
    float _2041 = sqrt(_2039);
    float _2043 = rsqrt(_2039);
    float _2045 = -_2041;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2051 = precise::clamp(_2049, 0.0, 1.0);
    float _2053 = _2029 * _2043;
    float _2055 = _2025 * _2043;
    float _2057 = abs(_2051);
    float _2059 = log2(_2057);
    float _2061 = _2033 * _2043;
    float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2065 = _1749 * _2055;
    float _2067 = -_2055;
    float _2069 = -_2063;
    float _2071 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2069);
    float _2073 = fma(_1733, _2053, _2065);
    float _2075 = -_2061;
    float _2077 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2071);
    float _2079 = fma(_1751, _2061, _2073);
    float _2081 = precise::clamp(_2079, 0.0, 1.0);
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2085 = _2077 + _2083;
    float _2087 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2089 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2091 = precise::clamp(_2089, 0.0, 1.0);
    float _2093 = exp2(_2087);
    float _2095 = _2093 * _2091;
    float _2097 = _2081 * _2095;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2101 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2103 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2099;
    out.m_81.y = _2101;
    out.m_81.z = _2103;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1875 = false;
    bool _712 = false;
    bool _586 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_116);
        out.gl_Position.z = _2159;
    }
    if (!_106)
    {
        return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    if (_130)
    {
        float _138 = float(_102);
        _136 = _138;
    }
    float _140 = _136;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = 0.0;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    float _152 = _150;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _154 = _150 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2228 = as_type<float>(_156);
        out.gl_Position.z = _2228;
    }
    if (_146)
    {
        return out;
    }
    float _158 = in.m_51.w;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = _160;
    if (!_170)
    {
        float _186 = _160 * _160;
        float _188 = _186 * 0.5;
        _152 = _188;
    }
    float _190 = _152;
    float _192 = _190;
    if (!_170)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_170;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _160 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _160);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_170;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _160 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _172, _260);
    float _268 = fma(_256, _174, _262);
    float _270 = fma(_256, _176, _264);
    float _272 = fma(_266, _158, _178);
    float _274 = fma(_268, _158, _180);
    float _276 = fma(_270, _158, _182);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_53.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_102);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _306 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _306 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _336 = 1.0 / _326;
    bool _338 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_306);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _322;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _358 = 1.0 / _330;
    float _360 = _318 * _336;
    bool _362 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _364 = isnan(_306);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _334;
    float _376 = _310 * _350;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _306 + _378;
    bool _382 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _384 = isnan(_306);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_354, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _314 * _358;
    float _398 = -_392;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_404, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _380 * _374;
    bool _410 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _412 = isnan(_306);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    bool _422 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_306);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = -_420;
    float _440 = _438 + 1.0;
    float _442 = _420 * _400;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = fma(_436, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = _372 * _440;
    float _452 = -_372;
    float _454 = _452 + 1.0;
    float _456 = fma(_446, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = -_432;
    float _460 = _458 + 1.0;
    float _462 = _432 * _454;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = _348 * _460;
    float _474 = -_348;
    float _476 = _474 + 1.0;
    float _478 = fma(_466, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _480 = fma(_470, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = _456 * _472;
    float _484 = _394 * _472;
    float _486 = _406 * _472;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _496;
    float _500 = in.m_51.x;
    float _502 = in.m_51.y;
    float _504 = in.m_51.z;
    float _506 = fma(_490, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _508 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _482);
    float _510 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _512 = fma(_494, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _514 = fma(_498, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _486);
    float _518 = fma(_448, _462, _508);
    float _520 = fma(_478, _462, _510);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = fma(_480, _462, _516);
    float _536 = fma(_524, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_528, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _540 = fma(_532, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_512, _450, _518);
    float _544 = fma(_506, _450, _520);
    float _546 = fma(_514, _450, _534);
    float _548 = fma(_536, _442, _542);
    float _550 = fma(_538, _442, _544);
    float _552 = fma(_540, _442, _546);
    float _554 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].x, _548);
    float _556 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].y, _550);
    float _558 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].z, _552);
    float _560 = _554 * _500;
    float _562 = _556 * _502;
    float _564 = _558 * _504;
    bool _566 = !_356;
    float _584;
    if (!_566)
    {
        float _568 = in.m_53.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_102);
        float _590 = 1.0 / _588;
        float _592 = _134 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _598 = _594 + _596;
    bool _600 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _602 = isnan(_594);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _612;
    bool _616 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _618 = isnan(_594);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_610;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _632;
    float _636 = 1.0 / _614;
    bool _638 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _640 = _626 * _630;
    float _642 = -_626;
    float _644 = _642 + 1.0;
    float _646 = _598 * _636;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _648;
    float _652 = fma(_634, _646, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _654;
    float _658 = fma(_650, _646, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _660 = _652 * _640;
    float _662 = fma(_656, _646, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _664 = _658 * _640;
    float _666 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].x, _660);
    float _668 = _662 * _640;
    float _670 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].x, _666);
    float _672 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].y, _668);
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].z, _664);
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].y, _672);
    float _680 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].z, _674);
    float _682 = _678 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _692 = !_638;
    float _710;
    if (!_692)
    {
        float _694 = in.m_53.x;
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        float _714 = float(_102);
        float _716 = 1.0 / _714;
        float _718 = _134 * _716;
        _710 = _718;
    }
    _712 = false;
    float _720 = _710;
    float _722 = in.m_55.x;
    float _724 = in.m_55.y;
    float _726 = in.m_55.z;
    float _728 = in.m_55.w;
    float _730 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _732 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = in.m_57.x;
    float _736 = in.m_57.y;
    float _738 = in.m_57.z;
    float _740 = in.m_57.w;
    float _742 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = in.m_59.x;
    float _746 = in.m_59.y;
    float _748 = in.m_59.z;
    float _750 = in.m_59.w;
    float _752 = in.m_53.x;
    float _754 = in.m_53.y;
    float _756 = _274 * _724;
    float _758 = _274 * _736;
    float _760 = fma(_272, _722, _756);
    float _762 = _274 * _746;
    float _764 = fma(_272, _734, _758);
    float _766 = fma(_276, _726, _760);
    float _768 = fma(_272, _744, _762);
    float _770 = fma(_276, _738, _764);
    float _772 = _766 + _728;
    float _774 = fma(_276, _748, _768);
    float _776 = _770 + _740;
    float _778 = -_772;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _782 = _774 + _750;
    float _784 = -_776;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = _780 * _780;
    float _790 = -_782;
    float _792 = _790 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _796 = fma(_786, _786, _788);
    float _798 = _752 * 6.283185482025146484375;
    float _800 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _794);
    float _802 = fma(_792, _792, _796);
    float _804 = _798 * 0.15915493667125701904296875;
    float _806 = rsqrt(_802);
    float _808 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _800);
    float _810 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _812 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _814 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _810);
    float _816 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _812);
    float _818 = _804 * 6.283185482025146484375;
    float _820 = sin(_818);
    float _822 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _814);
    float _824 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _816);
    float _826 = _786 * _806;
    float _828 = _792 * _806;
    float _830 = _780 * _806;
    float _832 = _804 * 6.283185482025146484375;
    float _834 = cos(_832);
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _838 = _826 * _836;
    float _840 = in.m_61.x;
    float _842 = in.m_61.y;
    float _844 = in.m_61.z;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _848 = -_838;
    float _850 = fma(_828, _846, _848);
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _854 = _830 * _852;
    float _856 = rsqrt(_808);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _860 = _828 * _858;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = -_854;
    float _866 = fma(_826, _862, _864);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _870 = -_860;
    float _872 = fma(_830, _868, _870);
    bool _874 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _876 = isnan(0.5);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _882 = _878 || _880;
    float _884 = rsqrt(_822);
    float _886 = _850 * _850;
    float _888 = fma(_872, _872, _886);
    float _890 = rsqrt(_824);
    float _892 = fma(_866, _866, _888);
    float _894 = _820 * _842;
    float _896 = _834 * _842;
    float _898 = -_894;
    float _900 = fma(_834, _840, _898);
    float _902 = fma(_820, _840, _896);
    float _904 = rsqrt(_892);
    float _906 = _900 * _856;
    float _908 = _902 * _884;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _906);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _914 = _890 * _844;
    float _916 = _732 * _910;
    float _918 = _730 * _912;
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _914);
    float _922 = _872 * _904;
    float _924 = _850 * _904;
    float _926 = _866 * _904;
    float _928 = _742 * _920;
    float _930 = _830 * _922;
    float _932 = _828 * _924;
    float _934 = _826 * _926;
    float _936 = -_930;
    float _938 = fma(_826, _924, _936);
    float _940 = -_932;
    float _942 = fma(_830, _926, _940);
    float _944 = -_934;
    float _946 = fma(_828, _922, _944);
    float _948 = _918 * _938;
    float _950 = _918 * _942;
    float _952 = fma(_916, _926, _948);
    float _954 = fma(_916, _922, _950);
    float _956 = fma(_928, _828, _952);
    float _958 = fma(_928, _826, _954);
    float _960 = fma(0.0500000007450580596923828125, _752, 0.0500000007450580596923828125);
    float _962 = _782 + _956;
    float _964 = _776 + _958;
    float _966 = _134 * _960;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _970 = _962 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _974 = _964 + _972;
    float _976 = _966 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _978 = _970 * _970;
    float _980 = fma(_976, _976, _976);
    float _982 = fma(_974, _974, _978);
    float _984 = _918 * _946;
    float _986 = sqrt(_982);
    float _988 = fma(_916, _924, _984);
    float _990 = fma(_928, _830, _988);
    float _992 = _772 + _990;
    float _994 = -_980;
    float _996 = _992 + _994;
    bool _998 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1000 = _992;
    float _1002 = _964;
    float _1004 = _980;
    float _1006 = _996;
    float _1008 = _962;
    if (!_998)
    {
        _1000 = _964;
    }
    float _1010 = _1000;
    float _1012 = _1010;
    if (!_998)
    {
        _1002 = _962;
    }
    float _1014 = _1002;
    float _1016 = _1014;
    if (!_998)
    {
        _1004 = _996;
    }
    float _1018 = _1004;
    bool _1020 = !_998;
    float _1022 = _1018;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1028 = _986 + _1026;
        float _1030 = _996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = _1028 * _1024;
        float _1034 = rsqrt(_982);
        float _1036 = _1032 * 0.15915493667125701904296875;
        float _1038 = _1036 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1040 + (-1.0);
        float _1048 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = fma(_1044, _1030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1052 = fma(_996, _1040, _1048);
        float _1054 = _1034 * _1050;
        float _1056 = fma(_974, _1054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1058 = fma(_970, _1054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1012 = _1056;
        _1016 = _1058;
        _1022 = _1052;
    }
    float _1060 = _1012;
    float _1062 = _1016;
    float _1064 = _1022;
    float _1066 = _1064;
    float _1068 = _1060;
    float _1070 = _1062;
    if (!_882)
    {
        float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1074 = _772 + _1072;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1078 = _776 + _1076;
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1082 = -_776;
        float _1084 = _1082 + _1060;
        float _1086 = _1074 * _1074;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1090 = _782 + _1088;
        float _1092 = -_782;
        float _1094 = _1092 + _1062;
        float _1096 = fma(_1078, _1078, _1086);
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1100 = fma(_1090, _1090, _1096);
        float _1102 = sqrt(_1100);
        float _1104 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1106 = precise::min(_1102, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1108 = _1106 * _1098;
        float _1110 = _1104 * _1108;
        float _1112 = -_772;
        float _1114 = _1112 + _1064;
        float _1116 = fma(_1084, _1110, _776);
        float _1118 = fma(_1114, _1110, _772);
        float _1120 = fma(_1094, _1110, _782);
        _1066 = _1118;
        _1068 = _1116;
        _1070 = _1120;
        _1006 = _1080;
    }
    float _1122 = _1066;
    float _1124 = _1068;
    float _1126 = _1070;
    float _1128 = _1006;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1132 = _1122 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1136 = _1124 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1140 = _1126 + _1138;
    float _1142 = _1132 * _1132;
    float _1144 = fma(_1136, _1136, _1142);
    float _1146 = fma(_1140, _1140, _1144);
    float _1148 = rsqrt(_1146);
    float _1150 = sqrt(_1146);
    float _1152 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1154 = _1136 * _1152;
    float _1156 = _1140 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 * _1156;
    float _1162 = _1158 + _1160;
    float _1164 = sqrt(_1162);
    bool _1166 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1164 + _1168;
    float _1172 = _1140;
    float _1174 = _1128;
    float _1176 = _1170;
    float _1178 = _1152;
    if (_1166)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1172 = _1180;
    }
    float _1182 = _1172;
    if (_1166)
    {
        float _1184 = rsqrt(_1162);
        _1174 = _1184;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (_1166)
    {
        float _1190 = _1170 * _1182;
        _1176 = _1190;
    }
    float _1192 = _1176;
    if (_1166)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1008 = _1194;
    }
    float _1196 = _1008;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1200 = _1148;
    if (_1166)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1200 = _1204;
    }
    float _1206 = _1200;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1142;
    float _1214 = _1210;
    float _1216 = _1208;
    if (_1166)
    {
        float _1218 = _1196 * 6.283185482025146484375;
        float _1220 = cos(_1218);
        _1212 = _1220;
    }
    float _1222 = _1212;
    float _1224 = -_1152;
    float _1226 = -_1210;
    float _1228 = fma(_1132, _1224, _1226);
    float _1230 = _1228;
    if (_1166)
    {
        float _1232 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1232;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    float _1238 = _1206;
    if (_1166)
    {
        float _1240 = fma(_1206, _1234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1236 = _1240;
    }
    float _1242 = _1236;
    float _1244 = _1242;
    if (!_1166)
    {
        _1238 = _1154;
    }
    float _1246 = _1238;
    float _1248 = _1246;
    float _1250 = _1222;
    if (_1166)
    {
        float _1252 = _1222 + (-1.0);
        _1216 = _1252;
    }
    float _1254 = _1216;
    float _1256 = _1254;
    if (_1166)
    {
        float _1258 = _1186 * _1242;
        _1178 = _1258;
    }
    float _1260 = _1178;
    if (!_1166)
    {
        _1244 = _1158;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1166)
    {
        float _1266 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1188 = _1266;
    }
    float _1268 = _1188;
    if (_1166)
    {
        float _1270 = _1154 * _1260;
        _1248 = _1270;
    }
    float _1272 = _1248;
    if (!_1166)
    {
        _1256 = _1156;
    }
    float _1274 = _1256;
    float _1276 = _1274;
    if (_1166)
    {
        float _1278 = _1156 * _1260;
        _1276 = _1278;
    }
    float _1280 = _1276;
    if (_1166)
    {
        float _1282 = fma(_1228, _1222, _1268);
        _1230 = _1282;
    }
    float _1284 = _1230;
    if (_1166)
    {
        float _1286 = _1272 * _1272;
        _1264 = _1286;
    }
    float _1288 = _1264;
    if (!_1166)
    {
        _1250 = _1160;
    }
    float _1290 = _1250;
    float _1292 = _1290;
    if (_1166)
    {
        float _1294 = _1280 * _1280;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = fma(_1284, _1284, _1288);
    float _1302 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1304 = _1300 + _1296;
    float _1306 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1310 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1308);
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1302);
    float _1316 = rsqrt(_1304);
    float _1318 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1320 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1306);
    float _1322 = -_1312;
    float _1324 = _1322 + 1.0;
    float _1326 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1318);
    float _1330 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1320);
    float _1332 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1334 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1336 = abs(_1324);
    float _1338 = log2(_1336);
    float _1340 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1328);
    float _1342 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = _1316 * _1272;
    float _1354 = _1316 * _1280;
    float _1356 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1358 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    float _1360 = _1316 * _1284;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = -_1346;
    float _1366 = fma(_1364, _1198, 1.0);
    float _1368 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1358);
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = -_1362;
    float _1374 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1372);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1378 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1368);
    float _1380 = log2(_1366);
    float _1382 = -_1354;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1374);
    float _1386 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1390 = fma(_1384, -0.5, 0.5);
    float _1392 = fma(_1384, 0.5, 0.5);
    float _1394 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1396 = exp2(_1376);
    float _1398 = _1360 + 1.0;
    float _1400 = fma(_1392, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1394);
    float _1404 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1388);
    float _1406 = 1.0 / _1378;
    float _1408 = _1380 * 0.693147182464599609375;
    float _1410 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1412 = sqrt(_1390);
    float _1414 = -_1360;
    float _1416 = fma(_1396, _1398, _1414);
    float _1418 = fma(_1392, _1400, -0.212114393711090087890625);
    float _1420 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1422 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1404);
    float _1424 = fma(_1392, _1418, 1.570728778839111328125);
    float _1426 = _1420 * _1406;
    float _1428 = _1422 * _1406;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1412 * 0.636619746685028076171875;
    float3 _4285 = float3(_1430, _1432, _1410);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4285, float3(0.0), isnan(_4285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4285, float3(0.0), isnan(_4285)), level(0.0)).x;
    float _1438 = -_1424;
    float _1440 = fma(_1434, _1438, 1.0);
    float _1442 = fma(_1416, 0.5, 0.5);
    float3 _4303 = float3(_1430, _1432, _1410);
    float4 _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4303, float3(0.0), isnan(_4303)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4303, float3(0.0), isnan(_4303)), level(0.0)).xyzw;
    float _1447 = _1445.x;
    float _1449 = _1445.y;
    float _1451 = _1445.z;
    float _1453 = _1445.w;
    float2 _4320 = float2(_1440, _1442);
    float3 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4320, float2(0.0), isnan(_4320)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4320, float2(0.0), isnan(_4320)), level(0.0)).xyz;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = in.m_63.x;
    float _1467 = in.m_63.y;
    float _1469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_65.x = _686;
    out.m_65.y = _688;
    out.m_65.z = _690;
    bool _1471 = _752 > 0.5;
    float _1473 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1475 = _754 > 0.5;
    float _1477 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1479 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _1124;
    out.m_67.y = _1122;
    out.m_67.z = _1126;
    float _1481 = exp2(_1473);
    float _1483 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1479);
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1487 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1489 = _732 * _1465;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1491;
    float _1495 = _730 * _1467;
    float _1497 = 1.0 / _1493;
    float _1499 = -_1481;
    float _1501 = _1499 + 1.0;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1511 = _1509 != 0;
    float _1513 = -_1503;
    float _1515 = fma(_1477, 2.0, _1513);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1521 = -_134;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1515);
    float _1525 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1517);
    float _1527 = fma(_1487, -2.0, _1485);
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1531 = -_1489;
    float _1533 = _1531 + 1.0;
    float _1535 = -_1495;
    float _1537 = _1535 + 1.0;
    float _1539 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1525);
    float _1541 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1529);
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1545 = _720 + _1543;
    float _1547 = _1489;
    float _1549 = _1495;
    float _1551 = _1378;
    float _1553 = _1422;
    if (_1507)
    {
        float _1555 = _1471 ? _1533 : _1489;
        _1547 = _1555;
    }
    float _1557 = _1547;
    float _1559 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1511)
    {
        float _1561 = _1475 ? _1537 : _1495;
        _1549 = _1561;
    }
    float _1563 = _1549;
    float _1565 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1541);
    float _1567 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1569 = fma(_1559, _1557, -0.5);
    float _1571 = _1545 * _1497;
    float _1573 = fma(_1567, _1563, -0.5);
    float _1575 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1527);
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1581;
    bool _1585 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1587 = isnan(_720);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1593 = _1589 || _1591;
    float _1595 = float(_1593);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1597;
    bool _1601 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1603 = isnan(_720);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = fma(_1579, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1615 = fma(_1583, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1617 = fma(_1599, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1619 = -_1575;
    float _1621 = fma(_1565, _1573, _1619);
    float _1623 = -_1595;
    float _1625 = _1623 + 1.0;
    float _1627 = in.m_69.x;
    float _1629 = in.m_69.y;
    float _1631 = in.m_69.z;
    bool _1633 = _908 != 0.0;
    bool _1635 = isnan(_908);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    float _1643 = fma(_1539, _1569, _1523);
    float _1645 = _1611 * _1625;
    float _1647 = -_1611;
    float _1649 = _1647 + 1.0;
    bool _1651 = _906 == 0.0;
    bool _1653 = !_1641;
    bool _1655 = _1651 && _1653;
    float _1657 = _1643 + 0.5;
    float _1659 = _1613 * _1645;
    float _1661 = _1615 * _1645;
    float _1663 = _1617 * _1645;
    bool _1665 = _914 == 0.0;
    bool _1667 = _1665 && _1655;
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1659);
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1661);
    float _1673 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1663);
    float _1675 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1677 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1669);
    float _1679 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1671);
    float _1681 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1673);
    float _1683 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1675);
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1687 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1691 = _1621 + 0.5;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1629;
    float _1697 = _1627;
    float _1699 = _1631;
    float _1701 = _1683;
    if (!_1667)
    {
        float _1703 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1629);
        _1695 = _1703;
    }
    float _1705 = _1695;
    float _1707 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1667)
    {
        float _1711 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1627);
        _1697 = _1711;
    }
    float _1713 = _1697;
    float _1715 = _942 * _1705;
    float _1717 = _946 * _1705;
    float _1719 = _938 * _1705;
    out.m_71.x = _1693;
    out.m_71.y = _1707;
    out.m_71.z = _1709;
    float _1721 = fma(_922, _1713, _1715);
    if (!_1667)
    {
        float _1723 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1631);
        _1699 = _1723;
    }
    float _1725 = _1699;
    float _1727 = fma(_926, _1713, _1719);
    float _1729 = _1683 + _1378;
    float _1731 = fma(_924, _1713, _1717);
    out.m_73.x = _1657;
    out.m_73.y = _1691;
    float _1733 = fma(_826, _1725, _1721);
    bool _1735 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1737 = isnan(_1150);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1743 = _1739 || _1741;
    float _1745 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1747 = _1729 * 0.5;
    float _1749 = fma(_830, _1725, _1731);
    float _1751 = fma(_828, _1725, _1727);
    out.gl_Position.x = _1420;
    out.gl_Position.y = _1422;
    out.gl_Position.z = _1683;
    out.gl_Position.w = _1378;
    out.m_75.x = _1733;
    out.m_75.y = _1749;
    out.m_75.z = _1751;
    out.m_77.z = _1747;
    out.m_77.w = _1378;
    float _1753 = _1747;
    float _1755 = _1420;
    if (!_1743)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1757 = _1551;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1743)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1763 = _1701;
    float _1765 = _1763;
    float _1767 = _1763;
    if (!_1743)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1769 = _1753;
    float _1771 = _1769;
    float _1773 = _1769;
    if (!_1743)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1775 = _1553;
    float _1777 = _1775;
    float _1779 = _1775;
    if (!_1743)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1781 = _1755;
    float _1783 = _1745 * _1436;
    float _1785 = -_1745;
    float _1787 = _1785 + 1.0;
    float _1789 = _1453 * _1783;
    float _1791 = _1453 * _1787;
    float _1793 = _1463 * _1783;
    float _1795 = fma(_1459, _1789, _1447);
    float _1797 = fma(_1461, _1789, _1449);
    float _1799 = _1789;
    float _1801 = _1781;
    float _1803 = _1781;
    if (!_1743)
    {
        _1799 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1805 = _1799;
    float _1807 = fma(_1453, _1793, _1451);
    out.m_79.x = _1795;
    out.m_79.y = _1797;
    out.m_79.z = _1807;
    out.m_79.w = _1791;
    bool _1809 = !_1743;
    float _1811 = _1805;
    float _1813 = _1805;
    if (!_1809)
    {
        bool _1815 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1817 = isnan(_1150);
        bool _1819 = _1815 || _1817;
        bool _1821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1823 = _1819 || _1821;
        if (!_1823)
        {
            float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1827 = _1150 + _1825;
            float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1829;
            float _1833 = 1.0 / _1831;
            float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1837 = _1835 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1841 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1849 = _1847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1853 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1855 = _1827 * _1833;
            float _1857 = precise::clamp(_1855, 0.0, 1.0);
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1863 = fma(_1857, _1837, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1865 = fma(_1857, _1861, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1867 = fma(_1857, _1841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1869 = fma(_1857, _1845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1871 = fma(_1857, _1849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1873 = fma(_1857, _1853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1773 = _1865;
            _1779 = _1871;
            _1813 = _1863;
            _1767 = _1869;
            _1761 = _1867;
            _1803 = _1873;
            _1875 = true;
        }
        else
        {
            bool _1877 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1879 = isnan(_1150);
            bool _1881 = _1877 || _1879;
            bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1885 = _1881 || _1883;
            if (!_1885)
            {
                _1811 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1887 = _1811;
            _1813 = _1887;
            if (!_1885)
            {
                _1771 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1889 = _1771;
            _1773 = _1889;
            if (!_1885)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1891 = _1759;
            _1761 = _1891;
            if (!_1885)
            {
                _1765 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1893 = _1765;
            _1767 = _1893;
            if (!_1885)
            {
                _1777 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1895 = _1777;
            _1779 = _1895;
            if (!_1885)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1897 = _1801;
            bool _1899 = !_1885;
            _1803 = _1897;
            if (!_1899)
            {
                bool _1901 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1903 = isnan(_1150);
                bool _1905 = _1901 || _1903;
                bool _1907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1909 = _1905 || _1907;
                if (!_1909)
                {
                    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1913 = _1150 + _1911;
                    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1915;
                    float _1919 = 1.0 / _1917;
                    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1941 = _1913 * _1919;
                    float _1943 = precise::clamp(_1941, 0.0, 1.0);
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1949 = fma(_1943, _1923, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1951 = fma(_1943, _1947, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1953 = fma(_1943, _1927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1955 = fma(_1943, _1931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1957 = fma(_1943, _1935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1959 = fma(_1943, _1939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1773 = _1951;
                    _1779 = _1957;
                    _1813 = _1949;
                    _1767 = _1955;
                    _1761 = _1953;
                    _1803 = _1959;
                    _1875 = true;
                }
                else
                {
                    _1773 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1779 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1813 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1767 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1875 = false;
    float _1961 = _1773;
    float _1963 = _1779;
    float _1965 = _1813;
    float _1967 = _1767;
    float _1969 = _1761;
    float _1971 = _1803;
    float _1973 = fma(_1749, -0.5, 0.5);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = -_1961;
    float _1979 = _1977 + _1963;
    float _1981 = -_1965;
    float _1983 = _1981 + _1967;
    float _1985 = -_1969;
    float _1987 = _1985 + _1971;
    bool _1989 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1991 = fma(_1975, _1979, _1961);
    float _1993 = fma(_1975, _1983, _1965);
    float _1995 = fma(_1975, _1987, _1969);
    float _1997 = _1991 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _1999 = fma(_1993, 0.298911988735198974609375, _1997);
    float _2001 = fma(_1995, 0.114477999508380889892578125, _1999);
    float _2003 = -_2001;
    float _2005 = _1993 + _2003;
    float _2007 = -_2001;
    float _2009 = _1991 + _2007;
    float _2011 = -_2001;
    float _2013 = _1995 + _2011;
    float _2015 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2017 = fma(_2005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    float _2019 = fma(_2009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    float _2021 = fma(_2013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    out.m_47.x = _2015;
    out.m_83.x = _2017;
    out.m_83.y = _2019;
    out.m_83.z = _2021;
    if (!_1989)
    {
        return out;
    }
    float _2023 = -_1122;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2027 = -_1124;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2031 = -_1126;
    float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2035 = _2025 * _2025;
    float _2037 = fma(_2029, _2029, _2035);
    float _2039 = fma(_2033, _2033, _2037);
    float _2041 = sqrt(_2039);
    float _2043 = rsqrt(_2039);
    float _2045 = -_2041;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2051 = precise::clamp(_2049, 0.0, 1.0);
    float _2053 = _2029 * _2043;
    float _2055 = _2025 * _2043;
    float _2057 = abs(_2051);
    float _2059 = log2(_2057);
    float _2061 = _2033 * _2043;
    float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2065 = _1749 * _2055;
    float _2067 = -_2055;
    float _2069 = -_2063;
    float _2071 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2069);
    float _2073 = fma(_1733, _2053, _2065);
    float _2075 = -_2061;
    float _2077 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2071);
    float _2079 = fma(_1751, _2061, _2073);
    float _2081 = precise::clamp(_2079, 0.0, 1.0);
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2085 = _2077 + _2083;
    float _2087 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2089 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2091 = precise::clamp(_2089, 0.0, 1.0);
    float _2093 = exp2(_2087);
    float _2095 = _2093 * _2091;
    float _2097 = _2081 * _2095;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2101 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2103 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2099;
    out.m_81.y = _2101;
    out.m_81.z = _2103;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1875 = false;
    bool _712 = false;
    bool _586 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_116);
        out.gl_Position.z = _2159;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    if (_130)
    {
        float _138 = float(_102);
        _136 = _138;
    }
    float _140 = _136;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = 0.0;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    float _152 = _150;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _154 = _150 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2228 = as_type<float>(_156);
        out.gl_Position.z = _2228;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.w;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = _160;
    if (!_170)
    {
        float _186 = _160 * _160;
        float _188 = _186 * 0.5;
        _152 = _188;
    }
    float _190 = _152;
    float _192 = _190;
    if (!_170)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_170;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _160 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _160);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_170;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _160 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _172, _260);
    float _268 = fma(_256, _174, _262);
    float _270 = fma(_256, _176, _264);
    float _272 = fma(_266, _158, _178);
    float _274 = fma(_268, _158, _180);
    float _276 = fma(_270, _158, _182);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_53.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_102);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _306 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _306 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _336 = 1.0 / _326;
    bool _338 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_306);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _322;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _358 = 1.0 / _330;
    float _360 = _318 * _336;
    bool _362 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _364 = isnan(_306);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _334;
    float _376 = _310 * _350;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _306 + _378;
    bool _382 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _384 = isnan(_306);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_354, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _314 * _358;
    float _398 = -_392;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_404, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _380 * _374;
    bool _410 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _412 = isnan(_306);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    bool _422 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_306);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = -_420;
    float _440 = _438 + 1.0;
    float _442 = _420 * _400;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = fma(_436, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = _372 * _440;
    float _452 = -_372;
    float _454 = _452 + 1.0;
    float _456 = fma(_446, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = -_432;
    float _460 = _458 + 1.0;
    float _462 = _432 * _454;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = _348 * _460;
    float _474 = -_348;
    float _476 = _474 + 1.0;
    float _478 = fma(_466, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _480 = fma(_470, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = _456 * _472;
    float _484 = _394 * _472;
    float _486 = _406 * _472;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _496;
    float _500 = in.m_51.x;
    float _502 = in.m_51.y;
    float _504 = in.m_51.z;
    float _506 = fma(_490, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _508 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _482);
    float _510 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _512 = fma(_494, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _514 = fma(_498, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _486);
    float _518 = fma(_448, _462, _508);
    float _520 = fma(_478, _462, _510);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = fma(_480, _462, _516);
    float _536 = fma(_524, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_528, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _540 = fma(_532, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_512, _450, _518);
    float _544 = fma(_506, _450, _520);
    float _546 = fma(_514, _450, _534);
    float _548 = fma(_536, _442, _542);
    float _550 = fma(_538, _442, _544);
    float _552 = fma(_540, _442, _546);
    float _554 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].x, _548);
    float _556 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].y, _550);
    float _558 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[147].z, _552);
    float _560 = _554 * _500;
    float _562 = _556 * _502;
    float _564 = _558 * _504;
    bool _566 = !_356;
    float _584;
    if (!_566)
    {
        float _568 = in.m_53.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_102);
        float _590 = 1.0 / _588;
        float _592 = _134 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _598 = _594 + _596;
    bool _600 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _602 = isnan(_594);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _612;
    bool _616 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _618 = isnan(_594);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -_610;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _632;
    float _636 = 1.0 / _614;
    bool _638 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _640 = _626 * _630;
    float _642 = -_626;
    float _644 = _642 + 1.0;
    float _646 = _598 * _636;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _648;
    float _652 = fma(_634, _646, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _654;
    float _658 = fma(_650, _646, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _660 = _652 * _640;
    float _662 = fma(_656, _646, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _664 = _658 * _640;
    float _666 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].x, _660);
    float _668 = _662 * _640;
    float _670 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].x, _666);
    float _672 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].y, _668);
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[107].z, _664);
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].y, _672);
    float _680 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[108].z, _674);
    float _682 = _678 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _692 = !_638;
    float _710;
    if (!_692)
    {
        float _694 = in.m_53.x;
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        float _714 = float(_102);
        float _716 = 1.0 / _714;
        float _718 = _134 * _716;
        _710 = _718;
    }
    _712 = false;
    float _720 = _710;
    float _722 = in.m_55.x;
    float _724 = in.m_55.y;
    float _726 = in.m_55.z;
    float _728 = in.m_55.w;
    float _730 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _732 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = in.m_57.x;
    float _736 = in.m_57.y;
    float _738 = in.m_57.z;
    float _740 = in.m_57.w;
    float _742 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = in.m_59.x;
    float _746 = in.m_59.y;
    float _748 = in.m_59.z;
    float _750 = in.m_59.w;
    float _752 = in.m_53.x;
    float _754 = in.m_53.y;
    float _756 = _274 * _724;
    float _758 = _274 * _736;
    float _760 = fma(_272, _722, _756);
    float _762 = _274 * _746;
    float _764 = fma(_272, _734, _758);
    float _766 = fma(_276, _726, _760);
    float _768 = fma(_272, _744, _762);
    float _770 = fma(_276, _738, _764);
    float _772 = _766 + _728;
    float _774 = fma(_276, _748, _768);
    float _776 = _770 + _740;
    float _778 = -_772;
    float _780 = _778 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _782 = _774 + _750;
    float _784 = -_776;
    float _786 = _784 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _788 = _780 * _780;
    float _790 = -_782;
    float _792 = _790 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _796 = fma(_786, _786, _788);
    float _798 = _752 * 6.283185482025146484375;
    float _800 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _794);
    float _802 = fma(_792, _792, _796);
    float _804 = _798 * 0.15915493667125701904296875;
    float _806 = rsqrt(_802);
    float _808 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _800);
    float _810 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _812 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _814 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _810);
    float _816 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _812);
    float _818 = _804 * 6.283185482025146484375;
    float _820 = sin(_818);
    float _822 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _814);
    float _824 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _816);
    float _826 = _786 * _806;
    float _828 = _792 * _806;
    float _830 = _780 * _806;
    float _832 = _804 * 6.283185482025146484375;
    float _834 = cos(_832);
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _838 = _826 * _836;
    float _840 = in.m_61.x;
    float _842 = in.m_61.y;
    float _844 = in.m_61.z;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _848 = -_838;
    float _850 = fma(_828, _846, _848);
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _854 = _830 * _852;
    float _856 = rsqrt(_808);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _860 = _828 * _858;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = -_854;
    float _866 = fma(_826, _862, _864);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _870 = -_860;
    float _872 = fma(_830, _868, _870);
    bool _874 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _876 = isnan(0.5);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _882 = _878 || _880;
    float _884 = rsqrt(_822);
    float _886 = _850 * _850;
    float _888 = fma(_872, _872, _886);
    float _890 = rsqrt(_824);
    float _892 = fma(_866, _866, _888);
    float _894 = _820 * _842;
    float _896 = _834 * _842;
    float _898 = -_894;
    float _900 = fma(_834, _840, _898);
    float _902 = fma(_820, _840, _896);
    float _904 = rsqrt(_892);
    float _906 = _900 * _856;
    float _908 = _902 * _884;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _906);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _908);
    float _914 = _890 * _844;
    float _916 = _732 * _910;
    float _918 = _730 * _912;
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _914);
    float _922 = _872 * _904;
    float _924 = _850 * _904;
    float _926 = _866 * _904;
    float _928 = _742 * _920;
    float _930 = _830 * _922;
    float _932 = _828 * _924;
    float _934 = _826 * _926;
    float _936 = -_930;
    float _938 = fma(_826, _924, _936);
    float _940 = -_932;
    float _942 = fma(_830, _926, _940);
    float _944 = -_934;
    float _946 = fma(_828, _922, _944);
    float _948 = _918 * _938;
    float _950 = _918 * _942;
    float _952 = fma(_916, _926, _948);
    float _954 = fma(_916, _922, _950);
    float _956 = fma(_928, _828, _952);
    float _958 = fma(_928, _826, _954);
    float _960 = fma(0.0500000007450580596923828125, _752, 0.0500000007450580596923828125);
    float _962 = _782 + _956;
    float _964 = _776 + _958;
    float _966 = _134 * _960;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _970 = _962 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _974 = _964 + _972;
    float _976 = _966 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _978 = _970 * _970;
    float _980 = fma(_976, _976, _976);
    float _982 = fma(_974, _974, _978);
    float _984 = _918 * _946;
    float _986 = sqrt(_982);
    float _988 = fma(_916, _924, _984);
    float _990 = fma(_928, _830, _988);
    float _992 = _772 + _990;
    float _994 = -_980;
    float _996 = _992 + _994;
    bool _998 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1000 = _992;
    float _1002 = _964;
    float _1004 = _980;
    float _1006 = _996;
    float _1008 = _962;
    if (!_998)
    {
        _1000 = _964;
    }
    float _1010 = _1000;
    float _1012 = _1010;
    if (!_998)
    {
        _1002 = _962;
    }
    float _1014 = _1002;
    float _1016 = _1014;
    if (!_998)
    {
        _1004 = _996;
    }
    float _1018 = _1004;
    bool _1020 = !_998;
    float _1022 = _1018;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1028 = _986 + _1026;
        float _1030 = _996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = _1028 * _1024;
        float _1034 = rsqrt(_982);
        float _1036 = _1032 * 0.15915493667125701904296875;
        float _1038 = _1036 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1040 + (-1.0);
        float _1048 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = fma(_1044, _1030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1052 = fma(_996, _1040, _1048);
        float _1054 = _1034 * _1050;
        float _1056 = fma(_974, _1054, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1058 = fma(_970, _1054, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1012 = _1056;
        _1016 = _1058;
        _1022 = _1052;
    }
    float _1060 = _1012;
    float _1062 = _1016;
    float _1064 = _1022;
    float _1066 = _1064;
    float _1068 = _1060;
    float _1070 = _1062;
    if (!_882)
    {
        float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1074 = _772 + _1072;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1078 = _776 + _1076;
        float _1080 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1082 = -_776;
        float _1084 = _1082 + _1060;
        float _1086 = _1074 * _1074;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1090 = _782 + _1088;
        float _1092 = -_782;
        float _1094 = _1092 + _1062;
        float _1096 = fma(_1078, _1078, _1086);
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1100 = fma(_1090, _1090, _1096);
        float _1102 = sqrt(_1100);
        float _1104 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1106 = precise::min(_1102, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1108 = _1106 * _1098;
        float _1110 = _1104 * _1108;
        float _1112 = -_772;
        float _1114 = _1112 + _1064;
        float _1116 = fma(_1084, _1110, _776);
        float _1118 = fma(_1114, _1110, _772);
        float _1120 = fma(_1094, _1110, _782);
        _1066 = _1118;
        _1068 = _1116;
        _1070 = _1120;
        _1006 = _1080;
    }
    float _1122 = _1066;
    float _1124 = _1068;
    float _1126 = _1070;
    float _1128 = _1006;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1132 = _1122 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1136 = _1124 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1140 = _1126 + _1138;
    float _1142 = _1132 * _1132;
    float _1144 = fma(_1136, _1136, _1142);
    float _1146 = fma(_1140, _1140, _1144);
    float _1148 = rsqrt(_1146);
    float _1150 = sqrt(_1146);
    float _1152 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1154 = _1136 * _1152;
    float _1156 = _1140 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 * _1156;
    float _1162 = _1158 + _1160;
    float _1164 = sqrt(_1162);
    bool _1166 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1164 + _1168;
    float _1172 = _1140;
    float _1174 = _1128;
    float _1176 = _1170;
    float _1178 = _1152;
    if (_1166)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1172 = _1180;
    }
    float _1182 = _1172;
    if (_1166)
    {
        float _1184 = rsqrt(_1162);
        _1174 = _1184;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (_1166)
    {
        float _1190 = _1170 * _1182;
        _1176 = _1190;
    }
    float _1192 = _1176;
    if (_1166)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1008 = _1194;
    }
    float _1196 = _1008;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1200 = _1148;
    if (_1166)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1200 = _1204;
    }
    float _1206 = _1200;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1142;
    float _1214 = _1210;
    float _1216 = _1208;
    if (_1166)
    {
        float _1218 = _1196 * 6.283185482025146484375;
        float _1220 = cos(_1218);
        _1212 = _1220;
    }
    float _1222 = _1212;
    float _1224 = -_1152;
    float _1226 = -_1210;
    float _1228 = fma(_1132, _1224, _1226);
    float _1230 = _1228;
    if (_1166)
    {
        float _1232 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1232;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    float _1238 = _1206;
    if (_1166)
    {
        float _1240 = fma(_1206, _1234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1236 = _1240;
    }
    float _1242 = _1236;
    float _1244 = _1242;
    if (!_1166)
    {
        _1238 = _1154;
    }
    float _1246 = _1238;
    float _1248 = _1246;
    float _1250 = _1222;
    if (_1166)
    {
        float _1252 = _1222 + (-1.0);
        _1216 = _1252;
    }
    float _1254 = _1216;
    float _1256 = _1254;
    if (_1166)
    {
        float _1258 = _1186 * _1242;
        _1178 = _1258;
    }
    float _1260 = _1178;
    if (!_1166)
    {
        _1244 = _1158;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1166)
    {
        float _1266 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1188 = _1266;
    }
    float _1268 = _1188;
    if (_1166)
    {
        float _1270 = _1154 * _1260;
        _1248 = _1270;
    }
    float _1272 = _1248;
    if (!_1166)
    {
        _1256 = _1156;
    }
    float _1274 = _1256;
    float _1276 = _1274;
    if (_1166)
    {
        float _1278 = _1156 * _1260;
        _1276 = _1278;
    }
    float _1280 = _1276;
    if (_1166)
    {
        float _1282 = fma(_1228, _1222, _1268);
        _1230 = _1282;
    }
    float _1284 = _1230;
    if (_1166)
    {
        float _1286 = _1272 * _1272;
        _1264 = _1286;
    }
    float _1288 = _1264;
    if (!_1166)
    {
        _1250 = _1160;
    }
    float _1290 = _1250;
    float _1292 = _1290;
    if (_1166)
    {
        float _1294 = _1280 * _1280;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = fma(_1284, _1284, _1288);
    float _1302 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1304 = _1300 + _1296;
    float _1306 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1310 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1308);
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1302);
    float _1316 = rsqrt(_1304);
    float _1318 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1320 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1306);
    float _1322 = -_1312;
    float _1324 = _1322 + 1.0;
    float _1326 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1318);
    float _1330 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1320);
    float _1332 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1334 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1336 = abs(_1324);
    float _1338 = log2(_1336);
    float _1340 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1328);
    float _1342 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = _1316 * _1272;
    float _1354 = _1316 * _1280;
    float _1356 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1358 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    float _1360 = _1316 * _1284;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = -_1346;
    float _1366 = fma(_1364, _1198, 1.0);
    float _1368 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1358);
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = -_1362;
    float _1374 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1372);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1378 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1368);
    float _1380 = log2(_1366);
    float _1382 = -_1354;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1374);
    float _1386 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1390 = fma(_1384, -0.5, 0.5);
    float _1392 = fma(_1384, 0.5, 0.5);
    float _1394 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1396 = exp2(_1376);
    float _1398 = _1360 + 1.0;
    float _1400 = fma(_1392, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1394);
    float _1404 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1388);
    float _1406 = 1.0 / _1378;
    float _1408 = _1380 * 0.693147182464599609375;
    float _1410 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1412 = sqrt(_1390);
    float _1414 = -_1360;
    float _1416 = fma(_1396, _1398, _1414);
    float _1418 = fma(_1392, _1400, -0.212114393711090087890625);
    float _1420 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1422 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1404);
    float _1424 = fma(_1392, _1418, 1.570728778839111328125);
    float _1426 = _1420 * _1406;
    float _1428 = _1422 * _1406;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1412 * 0.636619746685028076171875;
    float3 _4285 = float3(_1430, _1432, _1410);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4285, float3(0.0), isnan(_4285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4285, float3(0.0), isnan(_4285)), level(0.0)).x;
    float _1438 = -_1424;
    float _1440 = fma(_1434, _1438, 1.0);
    float _1442 = fma(_1416, 0.5, 0.5);
    float3 _4303 = float3(_1430, _1432, _1410);
    float4 _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4303, float3(0.0), isnan(_4303)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4303, float3(0.0), isnan(_4303)), level(0.0)).xyzw;
    float _1447 = _1445.x;
    float _1449 = _1445.y;
    float _1451 = _1445.z;
    float _1453 = _1445.w;
    float2 _4320 = float2(_1440, _1442);
    float3 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4320, float2(0.0), isnan(_4320)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4320, float2(0.0), isnan(_4320)), level(0.0)).xyz;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = in.m_63.x;
    float _1467 = in.m_63.y;
    float _1469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_65.x = _686;
    out.m_65.y = _688;
    out.m_65.z = _690;
    bool _1471 = _752 > 0.5;
    float _1473 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1475 = _754 > 0.5;
    float _1477 = _752 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1479 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _1124;
    out.m_67.y = _1122;
    out.m_67.z = _1126;
    float _1481 = exp2(_1473);
    float _1483 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1479);
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1487 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1489 = _732 * _1465;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1491;
    float _1495 = _730 * _1467;
    float _1497 = 1.0 / _1493;
    float _1499 = -_1481;
    float _1501 = _1499 + 1.0;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1511 = _1509 != 0;
    float _1513 = -_1503;
    float _1515 = fma(_1477, 2.0, _1513);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1521 = -_134;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1515);
    float _1525 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1517);
    float _1527 = fma(_1487, -2.0, _1485);
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1531 = -_1489;
    float _1533 = _1531 + 1.0;
    float _1535 = -_1495;
    float _1537 = _1535 + 1.0;
    float _1539 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1525);
    float _1541 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1529);
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1545 = _720 + _1543;
    float _1547 = _1489;
    float _1549 = _1495;
    float _1551 = _1378;
    float _1553 = _1422;
    if (_1507)
    {
        float _1555 = _1471 ? _1533 : _1489;
        _1547 = _1555;
    }
    float _1557 = _1547;
    float _1559 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1511)
    {
        float _1561 = _1475 ? _1537 : _1495;
        _1549 = _1561;
    }
    float _1563 = _1549;
    float _1565 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1541);
    float _1567 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1569 = fma(_1559, _1557, -0.5);
    float _1571 = _1545 * _1497;
    float _1573 = fma(_1567, _1563, -0.5);
    float _1575 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1527);
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1581;
    bool _1585 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1587 = isnan(_720);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1593 = _1589 || _1591;
    float _1595 = float(_1593);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1597;
    bool _1601 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1603 = isnan(_720);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = fma(_1579, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1615 = fma(_1583, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1617 = fma(_1599, _1571, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1619 = -_1575;
    float _1621 = fma(_1565, _1573, _1619);
    float _1623 = -_1595;
    float _1625 = _1623 + 1.0;
    float _1627 = in.m_69.x;
    float _1629 = in.m_69.y;
    float _1631 = in.m_69.z;
    bool _1633 = _908 != 0.0;
    bool _1635 = isnan(_908);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    float _1643 = fma(_1539, _1569, _1523);
    float _1645 = _1611 * _1625;
    float _1647 = -_1611;
    float _1649 = _1647 + 1.0;
    bool _1651 = _906 == 0.0;
    bool _1653 = !_1641;
    bool _1655 = _1651 && _1653;
    float _1657 = _1643 + 0.5;
    float _1659 = _1613 * _1645;
    float _1661 = _1615 * _1645;
    float _1663 = _1617 * _1645;
    bool _1665 = _914 == 0.0;
    bool _1667 = _1665 && _1655;
    float _1669 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1659);
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1661);
    float _1673 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1663);
    float _1675 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1677 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1669);
    float _1679 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1671);
    float _1681 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1673);
    float _1683 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1675);
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1687 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1691 = _1621 + 0.5;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1629;
    float _1697 = _1627;
    float _1699 = _1631;
    float _1701 = _1683;
    if (!_1667)
    {
        float _1703 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1629);
        _1695 = _1703;
    }
    float _1705 = _1695;
    float _1707 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1667)
    {
        float _1711 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1627);
        _1697 = _1711;
    }
    float _1713 = _1697;
    float _1715 = _942 * _1705;
    float _1717 = _946 * _1705;
    float _1719 = _938 * _1705;
    out.m_71.x = _1693;
    out.m_71.y = _1707;
    out.m_71.z = _1709;
    float _1721 = fma(_922, _1713, _1715);
    if (!_1667)
    {
        float _1723 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1631);
        _1699 = _1723;
    }
    float _1725 = _1699;
    float _1727 = fma(_926, _1713, _1719);
    float _1729 = _1683 + _1378;
    float _1731 = fma(_924, _1713, _1717);
    out.m_73.x = _1657;
    out.m_73.y = _1691;
    float _1733 = fma(_826, _1725, _1721);
    bool _1735 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1737 = isnan(_1150);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1743 = _1739 || _1741;
    float _1745 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1747 = _1729 * 0.5;
    float _1749 = fma(_830, _1725, _1731);
    float _1751 = fma(_828, _1725, _1727);
    out.gl_Position.x = _1420;
    out.gl_Position.y = _1422;
    out.gl_Position.z = _1683;
    out.gl_Position.w = _1378;
    out.m_75.x = _1733;
    out.m_75.y = _1749;
    out.m_75.z = _1751;
    out.m_77.z = _1747;
    out.m_77.w = _1378;
    float _1753 = _1747;
    float _1755 = _1420;
    if (!_1743)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1757 = _1551;
    float _1759 = _1757;
    float _1761 = _1757;
    if (!_1743)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1763 = _1701;
    float _1765 = _1763;
    float _1767 = _1763;
    if (!_1743)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1769 = _1753;
    float _1771 = _1769;
    float _1773 = _1769;
    if (!_1743)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1775 = _1553;
    float _1777 = _1775;
    float _1779 = _1775;
    if (!_1743)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1781 = _1755;
    float _1783 = _1745 * _1436;
    float _1785 = -_1745;
    float _1787 = _1785 + 1.0;
    float _1789 = _1453 * _1783;
    float _1791 = _1453 * _1787;
    float _1793 = _1463 * _1783;
    float _1795 = fma(_1459, _1789, _1447);
    float _1797 = fma(_1461, _1789, _1449);
    float _1799 = _1789;
    float _1801 = _1781;
    float _1803 = _1781;
    if (!_1743)
    {
        _1799 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1805 = _1799;
    float _1807 = fma(_1453, _1793, _1451);
    out.m_79.x = _1795;
    out.m_79.y = _1797;
    out.m_79.z = _1807;
    out.m_79.w = _1791;
    bool _1809 = !_1743;
    float _1811 = _1805;
    float _1813 = _1805;
    if (!_1809)
    {
        bool _1815 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1817 = isnan(_1150);
        bool _1819 = _1815 || _1817;
        bool _1821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1823 = _1819 || _1821;
        if (!_1823)
        {
            float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1827 = _1150 + _1825;
            float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1829;
            float _1833 = 1.0 / _1831;
            float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1837 = _1835 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1841 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1849 = _1847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1853 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1855 = _1827 * _1833;
            float _1857 = precise::clamp(_1855, 0.0, 1.0);
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1863 = fma(_1857, _1837, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1865 = fma(_1857, _1861, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1867 = fma(_1857, _1841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1869 = fma(_1857, _1845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1871 = fma(_1857, _1849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1873 = fma(_1857, _1853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1773 = _1865;
            _1779 = _1871;
            _1813 = _1863;
            _1767 = _1869;
            _1761 = _1867;
            _1803 = _1873;
            _1875 = true;
        }
        else
        {
            bool _1877 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1879 = isnan(_1150);
            bool _1881 = _1877 || _1879;
            bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1885 = _1881 || _1883;
            if (!_1885)
            {
                _1811 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1887 = _1811;
            _1813 = _1887;
            if (!_1885)
            {
                _1771 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1889 = _1771;
            _1773 = _1889;
            if (!_1885)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1891 = _1759;
            _1761 = _1891;
            if (!_1885)
            {
                _1765 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1893 = _1765;
            _1767 = _1893;
            if (!_1885)
            {
                _1777 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1895 = _1777;
            _1779 = _1895;
            if (!_1885)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1897 = _1801;
            bool _1899 = !_1885;
            _1803 = _1897;
            if (!_1899)
            {
                bool _1901 = _1150 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1903 = isnan(_1150);
                bool _1905 = _1901 || _1903;
                bool _1907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1909 = _1905 || _1907;
                if (!_1909)
                {
                    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1913 = _1150 + _1911;
                    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1915;
                    float _1919 = 1.0 / _1917;
                    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1927 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1939 = _1937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1941 = _1913 * _1919;
                    float _1943 = precise::clamp(_1941, 0.0, 1.0);
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1949 = fma(_1943, _1923, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1951 = fma(_1943, _1947, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1953 = fma(_1943, _1927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1955 = fma(_1943, _1931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1957 = fma(_1943, _1935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1959 = fma(_1943, _1939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1773 = _1951;
                    _1779 = _1957;
                    _1813 = _1949;
                    _1767 = _1955;
                    _1761 = _1953;
                    _1803 = _1959;
                    _1875 = true;
                }
                else
                {
                    _1773 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1779 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1813 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1767 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1875 = false;
    float _1961 = _1773;
    float _1963 = _1779;
    float _1965 = _1813;
    float _1967 = _1767;
    float _1969 = _1761;
    float _1971 = _1803;
    float _1973 = fma(_1749, -0.5, 0.5);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = -_1961;
    float _1979 = _1977 + _1963;
    float _1981 = -_1965;
    float _1983 = _1981 + _1967;
    float _1985 = -_1969;
    float _1987 = _1985 + _1971;
    bool _1989 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1991 = fma(_1975, _1979, _1961);
    float _1993 = fma(_1975, _1983, _1965);
    float _1995 = fma(_1975, _1987, _1969);
    float _1997 = _1991 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _1999 = fma(_1993, 0.298911988735198974609375, _1997);
    float _2001 = fma(_1995, 0.114477999508380889892578125, _1999);
    float _2003 = -_2001;
    float _2005 = _1993 + _2003;
    float _2007 = -_2001;
    float _2009 = _1991 + _2007;
    float _2011 = -_2001;
    float _2013 = _1995 + _2011;
    float _2015 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2017 = fma(_2005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    float _2019 = fma(_2009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    float _2021 = fma(_2013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2001);
    out.m_47.x = _2015;
    out.m_83.x = _2017;
    out.m_83.y = _2019;
    out.m_83.z = _2021;
    if (!_1989)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2023 = -_1122;
    float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2027 = -_1124;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2031 = -_1126;
    float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2035 = _2025 * _2025;
    float _2037 = fma(_2029, _2029, _2035);
    float _2039 = fma(_2033, _2033, _2037);
    float _2041 = sqrt(_2039);
    float _2043 = rsqrt(_2039);
    float _2045 = -_2041;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2051 = precise::clamp(_2049, 0.0, 1.0);
    float _2053 = _2029 * _2043;
    float _2055 = _2025 * _2043;
    float _2057 = abs(_2051);
    float _2059 = log2(_2057);
    float _2061 = _2033 * _2043;
    float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2065 = _1749 * _2055;
    float _2067 = -_2055;
    float _2069 = -_2063;
    float _2071 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2069);
    float _2073 = fma(_1733, _2053, _2065);
    float _2075 = -_2061;
    float _2077 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2071);
    float _2079 = fma(_1751, _2061, _2073);
    float _2081 = precise::clamp(_2079, 0.0, 1.0);
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2085 = _2077 + _2083;
    float _2087 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2089 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2091 = precise::clamp(_2089, 0.0, 1.0);
    float _2093 = exp2(_2087);
    float _2095 = _2093 * _2091;
    float _2097 = _2081 * _2095;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2101 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2103 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2099;
    out.m_81.y = _2101;
    out.m_81.z = _2103;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

