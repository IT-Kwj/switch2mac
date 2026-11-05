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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_61 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _716 = false;
    bool _562 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1800 = as_type<float>(_104);
        out.gl_Position.z = _1800;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1869 = as_type<float>(_140);
        out.gl_Position.z = _1869;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _292 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = 1.0 / _316;
    bool _324 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_292);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _312;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _340 = _292 + _338;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _320;
    float _346 = _296 * _322;
    bool _348 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _350 = isnan(_292);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _308;
    float _362 = _340 * _336;
    bool _364 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _366 = isnan(_292);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_292);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_374;
    float _390 = _388 + 1.0;
    float _392 = _300 * _344;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    bool _398 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _400 = isnan(_292);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _358 * _390;
    float _412 = -_358;
    float _414 = _412 + 1.0;
    float _416 = fma(_396, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = _304 * _360;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = _386 * _414;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = fma(_426, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _440 = fma(_430, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _442 = -_386;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_420, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_436, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = _334 * _444;
    float _456 = -_334;
    float _458 = _456 + 1.0;
    float _460 = fma(_448, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = _408 * _458;
    float _464 = -_408;
    float _466 = _464 + 1.0;
    float _468 = _416 * _462;
    float _470 = _438 * _462;
    float _472 = _440 * _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _480 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_476, _422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _494 = fma(_450, _454, _478);
    float _496 = fma(_460, _454, _480);
    float _498 = fma(_452, _454, _482);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _508 = fma(_486, _422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _510 = fma(_490, _422, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = fma(_492, _432, _494);
    float _518 = fma(_502, _362, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_506, _362, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_514, _362, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_508, _432, _496);
    float _526 = fma(_510, _432, _498);
    float _528 = fma(_518, _410, _516);
    float _530 = fma(_520, _410, _524);
    float _532 = fma(_522, _410, _526);
    float _534 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].x, _528);
    float _536 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].y, _530);
    float _538 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].z, _532);
    bool _540 = !_342;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _560;
    if (!_540)
    {
        float _544 = in.m_51.x;
        float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _548 = _544 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _550 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _552 = _550 * _546;
        float _554 = floor(_552);
        float _556 = -_554;
        float _558 = _552 + _556;
        _560 = _558;
        _562 = true;
    }
    else
    {
        float _564 = float(_88);
        float _566 = 1.0 / _564;
        float _568 = _122 * _566;
        _560 = _568;
    }
    _562 = false;
    float _570 = _560;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _574 = _570 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_570);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _596 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _598 = isnan(_570);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    bool _612 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_570);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = 1.0 / _578;
    float _626 = -_590;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _632 = _606 * _628;
    float _634 = -_606;
    float _636 = _634 + 1.0;
    float _638 = 1.0 / _594;
    float _640 = _610 * _624;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _646 = fma(_640, _574, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _648 = _644 * _638;
    float _650 = _646 * _632;
    float _652 = -_622;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _570 + _656;
    float _660 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[115].x, _650);
    float _662 = _590 * _654;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = in.m_49.x;
    float _670 = in.m_49.y;
    float _672 = in.m_49.z;
    float _674 = fma(_664, _662, _660);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _678 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[117].x, _674);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _688 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _678;
    out.m_53.y = _688;
    out.m_53.z = _684;
    out.m_53.w = _686;
    float _690 = _538 * _672;
    float _692 = _536 * _670;
    float _694 = _534 * _668;
    bool _696 = !_630;
    float _714;
    if (!_696)
    {
        float _698 = in.m_51.x;
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _702 = _698 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_88);
        float _720 = 1.0 / _718;
        float _722 = _122 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = in.m_55.x;
    float _728 = in.m_55.y;
    float _730 = in.m_55.z;
    float _732 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _746 = _742 || _744;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _728);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _730);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _726);
    float _754 = _732 * _748;
    float _756 = _734 * _750;
    float _758 = _736 * _752;
    float _760 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _762 = _754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _764 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _766 = _754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _768 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _762);
    float _772 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _764);
    float _774 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _776 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _768);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _766);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _770);
    float _782 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _784 = _776 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _786 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _778);
    float _788 = _780 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _790 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _774);
    float _792 = _782 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _796 = _784 + _788;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _790);
    float _800 = _754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _802 = _792 + _794;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _796 + _804;
    float _808 = _798 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _800);
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _802 + _812;
    float _816 = _806 * _806;
    float _818 = _808 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _820 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _810);
    float _822 = fma(_814, _814, _816);
    float _824 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[11].x, _818);
    float _826 = _808 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _828 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _830 = sqrt(_822);
    float _832 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[11].z, _824);
    float _834 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[10].x, _826);
    float _836 = _808 + _828;
    float _838 = _832 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _840 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[10].z, _834);
    float _842 = 1.0 / _838;
    float _844 = _840 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _844 + _838;
    bool _848 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _846 * _842;
    float _852 = _850 * 0.5;
    float _854 = _846;
    float _856 = _828;
    float _858 = _800;
    float _860 = _832;
    float _862 = _836;
    float _864 = _838;
    float _866 = _852;
    if (_746)
    {
        _854 = 1.0;
    }
    float _868 = _854;
    float _870 = _868;
    if (!_848)
    {
        _856 = _802;
    }
    float _872 = _856;
    float _874 = _872;
    if (!_848)
    {
        _858 = _796;
    }
    float _876 = _858;
    float _878 = _876;
    if (!_848)
    {
        _860 = _836;
    }
    float _880 = _860;
    bool _882 = !_848;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _830 + _888;
        float _892 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_822);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _914 = fma(_836, _902, _910);
        float _916 = _894 * _912;
        float _918 = fma(_814, _916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_806, _916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _914;
        _874 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _874;
    float _926 = _878;
    if (!_746)
    {
        float _928 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _930 = _928 * 0.15915493667125701904296875;
        float _932 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _934 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _936 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[30].w, _934);
        float _938 = _930 * 6.283185482025146484375;
        float _940 = cos(_938);
        float _942 = _932 * 0.15915493667125701904296875;
        float _944 = _930 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = 1.0 / _940;
        float _950 = _942 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = _946 * _948;
        float _956 = _942 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = _952 * _954;
        float _962 = 1.0 / _936;
        float _964 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _966 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _964;
        float _968 = 1.0 / _960;
        float _970 = 1.0 / _966;
        float _972 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _974 = _962 * _972;
        float _976 = _958 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _980 = fma(_976, _974, _978);
        float _982 = _980 * _970;
        float _984 = precise::clamp(_982, 0.0, 1.0);
        _862 = _942;
        _864 = _970;
        _870 = _984;
    }
    float _986 = _862;
    float _988 = _864;
    float _990 = _870;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _922 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _924 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _926 + _1000;
    float _1004 = _994 * _994;
    float _1006 = fma(_998, _998, _1004);
    float _1008 = fma(_1002, _1002, _1006);
    float _1010 = rsqrt(_1008);
    float _1012 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1014 = _998 * _1012;
    float _1016 = _1002 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = _1018 + _1020;
    float _1024 = sqrt(_1022);
    bool _1026 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1030 = _1024 + _1028;
    float _1032 = _986;
    float _1034 = _1030;
    float _1036 = _994;
    float _1038 = _1014;
    if (_1026)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = _1042;
    if (_1026)
    {
        float _1046 = _1030 * _1042;
        _1034 = _1046;
    }
    float _1048 = _1034;
    if (_1026)
    {
        float _1050 = rsqrt(_1022);
        _1044 = _1050;
    }
    float _1052 = _1044;
    float _1054 = _1052;
    if (_1026)
    {
        float _1056 = _1048 * 0.15915493667125701904296875;
        _866 = _1056;
    }
    float _1058 = _866;
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1062 = _1002;
    if (_1026)
    {
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        _1062 = _1066;
    }
    float _1068 = _1062;
    float _1070 = precise::max(0.0, _1060);
    float _1072 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1074 = _988;
    float _1076 = _1070;
    if (_1026)
    {
        float _1078 = _1058 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1012;
    float _1086 = -_1070;
    float _1088 = fma(_994, _1084, _1086);
    if (_1026)
    {
        float _1090 = _1088 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1090;
    }
    float _1092 = _1036;
    float _1094 = sqrt(_1008);
    float _1096 = _1068;
    float _1098 = _1092;
    if (_1026)
    {
        float _1100 = fma(_1068, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1096 = _1100;
    }
    float _1102 = _1096;
    float _1104 = _1102;
    if (!_1026)
    {
        _1098 = _1088;
    }
    float _1106 = _1098;
    float _1108 = _1106;
    if (_1026)
    {
        float _1110 = _1052 * _1102;
        _542 = _1110;
    }
    float _1112 = _542;
    if (!_1026)
    {
        _1104 = _1018;
    }
    float _1114 = _1104;
    float _1116 = _922 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1118 = _1114;
    float _1120 = _1082;
    if (_1026)
    {
        float _1122 = _1082 + (-1.0);
        _1076 = _1122;
    }
    float _1124 = _1076;
    float _1126 = _1124;
    if (_1026)
    {
        float _1128 = _1014 * _1112;
        _1038 = _1128;
    }
    float _1130 = _1038;
    float _1132 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1116);
    if (_1026)
    {
        float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1134;
    }
    float _1136 = _1054;
    if (!_1026)
    {
        _1126 = _1016;
    }
    float _1138 = _1126;
    float _1140 = _1138;
    if (_1026)
    {
        float _1142 = _1016 * _1112;
        _1140 = _1142;
    }
    float _1144 = _1140;
    if (_1026)
    {
        float _1146 = _1130 * _1130;
        _1118 = _1146;
    }
    float _1148 = _1118;
    if (_1026)
    {
        float _1150 = fma(_1088, _1082, _1136);
        _1108 = _1150;
    }
    float _1152 = _1108;
    if (!_1026)
    {
        _1120 = _1020;
    }
    float _1154 = _1120;
    float _1156 = _1154;
    if (_1026)
    {
        float _1158 = _1144 * _1144;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = fma(_1152, _1152, _1148);
    float _1164 = _1162 + _1160;
    float _1166 = _922 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1170 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1168);
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = _922 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1176 = rsqrt(_1164);
    float _1178 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1180 = -_1172;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1174);
    float _1186 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1188 = _922 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1190 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1184);
    float _1192 = abs(_1182);
    float _1194 = log2(_1192);
    float _1196 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1198 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1188);
    float _1200 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1204 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1198);
    float _1206 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = _1176 * _1152;
    float _1210 = -_1202;
    float _1212 = fma(_1210, _1072, 1.0);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1176 * _1130;
    float _1218 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1132);
    float _1220 = _1176 * _1144;
    float _1222 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1226 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1228 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1230 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1222);
    float _1232 = -_1224;
    float _1234 = fma(_1208, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1232);
    float _1236 = log2(_1212);
    float _1238 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1240 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1242 = -_1220;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1234);
    float _1246 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1248 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1238);
    float _1250 = fma(_1244, -0.5, 0.5);
    float _1252 = exp2(_1226);
    float _1254 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1246);
    float _1256 = fma(_1244, 0.5, 0.5);
    float _1258 = _1208 + 1.0;
    float _1260 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1248);
    float _1262 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1254);
    float _1264 = fma(_1256, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1266 = 1.0 / _1240;
    float _1268 = _1236 * 0.693147182464599609375;
    float _1270 = fma(_1256, _1264, -0.212114393711090087890625);
    float _1272 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1274 = fma(_1256, _1270, 1.570728778839111328125);
    float _1276 = sqrt(_1250);
    float _1278 = -_1208;
    float _1280 = fma(_1252, _1258, _1278);
    float _1282 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1262);
    float _1284 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1260);
    float _1286 = _1282 * _1266;
    float _1288 = _1284 * _1266;
    float _1290 = fma(_1286, 0.5, 0.5);
    float _1292 = fma(_1288, -0.5, 0.5);
    float _1294 = fma(_1280, 0.5, 0.5);
    float _1296 = _1276 * 0.636619746685028076171875;
    float3 _3760 = float3(_1290, _1292, _1272);
    float _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3760, float3(0.0), isnan(_3760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3760, float3(0.0), isnan(_3760)), level(0.0)).x;
    float _1300 = -_1274;
    float _1302 = fma(_1296, _1300, 1.0);
    float3 _3776 = float3(_1290, _1292, _1272);
    float4 _1305 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3776, float3(0.0), isnan(_3776)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3776, float3(0.0), isnan(_3776)), level(0.0)).xyzw;
    float _1307 = _1305.x;
    float _1309 = _1305.y;
    float _1311 = _1305.z;
    float _1313 = _1305.w;
    float2 _3793 = float2(_1302, _1294);
    float3 _1317 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3793, float2(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3793, float2(0.0), isnan(_3793)), level(0.0)).xyz;
    float _1319 = _1317.x;
    float _1321 = _1317.y;
    float _1323 = _1317.z;
    float _1325 = in.m_51.x;
    float _1327 = in.m_51.y;
    float _1329 = in.m_51.z;
    float _1331 = in.m_51.w;
    float _1333 = in.m_57.w;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1337 = _1335 != 0;
    int _1339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1341 = _1339 != 0;
    out.m_59.x = _792;
    out.m_59.y = _808;
    out.m_59.z = _784;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1345 = _1343 != 0;
    out.m_61.x = _924;
    out.m_61.y = _922;
    out.m_61.z = _926;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1349 = _1347 != 0;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1359 = 1.0 / _1353;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1365 = 0.0;
    if (_1341)
    {
        float _1367 = in.m_51.x;
        _1365 = _1367;
    }
    float _1369 = _1365;
    bool _1371 = _1331 > 0.5;
    float _1373 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = -_1333;
    float _1381 = _1379 + 1.0;
    float _1383 = -_1361;
    float _1385 = fma(_1373, 2.0, _1383);
    float _1387 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1389 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1393 = _1333;
    if (_1337)
    {
        float _1395 = _1371 ? _1381 : _1333;
        _1393 = _1395;
    }
    float _1397 = _1393;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = in.m_57.y;
    float _1403 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1363);
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1407 = _724 + _1405;
    float _1409 = fma(_1387, -2.0, _1375);
    float _1411 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1391);
    bool _1413 = _1327 > 0.5;
    float _1415 = _1407 * _1359;
    float _1417 = 1.0 / _1357;
    float _1419 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1403);
    float _1421 = -_122;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1385);
    float _1425 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1389);
    float _1427 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1409);
    float _1429 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1411);
    float _1431 = in.m_57.x;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1435 = _724 + _1433;
    float _1437 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1439;
    float _1443 = 0.0;
    if (_1345)
    {
        float _1445 = in.m_51.z;
        _1443 = _1445;
    }
    float _1447 = _1443;
    float _1449 = _1419 * (-0.15915493667125701904296875);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1451;
    float _1455 = _1435 * _1417;
    float _1457 = -_1401;
    float _1459 = _1457 + 1.0;
    float _1461 = fma(_1441, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1463 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1465 = isnan(_724);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1471 = _1467 || _1469;
    float _1473 = float(_1471);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1477 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1479 = isnan(_724);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = fma(_1453, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1491 = _1401;
    if (_1349)
    {
        float _1493 = _1413 ? _1459 : _1401;
        _1491 = _1493;
    }
    float _1495 = _1491;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1497;
    bool _1501 = _1369 > 0.5;
    bool _1503 = _1501 && _1341;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1509 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1511 = isnan(_724);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = -_1473;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1499, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1527 = fma(_1437, _1495, -0.5);
    float _1529 = 0.0;
    float _1531 = _1431;
    if (_1341)
    {
        _1529 = _1431;
    }
    float _1533 = _1529;
    float _1535 = _1519 * _1523;
    float _1537 = -_1519;
    float _1539 = _1537 + 1.0;
    float _1541 = _1449 * 6.283185482025146484375;
    float _1543 = sin(_1541);
    float _1545 = fma(_1507, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1547 = _1447 > 0.5;
    bool _1549 = _1547 && _1345;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1555 = _1533;
    float _1557 = _1447;
    if (_1503)
    {
        float _1559 = -_1533;
        float _1561 = _1559 + 1.0;
        _1555 = _1561;
    }
    float _1563 = _1555;
    float _1565 = _1487 * _1539;
    if (!_1341)
    {
        _1557 = _1431;
    }
    float _1567 = _1557;
    float _1569 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1571 = _1449 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    float _1575 = _1567;
    if (_1341)
    {
        _1575 = _1563;
    }
    float _1577 = _1575;
    float _1579 = fma(_1553, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1581 = _1489 * _1565;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1587 = _1525 * _1565;
    float _1589 = fma(_1569, _1577, -0.5);
    float _1591 = _1461 * _1565;
    float _1593 = _1543 * _1527;
    float _1595 = -_1487;
    float _1597 = _1595 + 1.0;
    float _1599 = in.m_57.z;
    float _1601 = fma(_1585, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1603 = _990 > 0.0;
    bool _1605 = isnan(_990);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan(0.0);
    bool _1611 = _1607 || _1609;
    float _1613 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1581);
    float _1615 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1587);
    float _1617 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1591);
    float _1619 = _1573 * _1527;
    float _1621 = fma(_1579, _1535, _1613);
    float _1623 = fma(_1545, _1535, _1615);
    float _1625 = fma(_1601, _1535, _1617);
    float _1627 = fma(_1543, _1589, _1619);
    float _1629 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1621);
    float _1631 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1623);
    float _1633 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1625);
    float _1635 = -_1427;
    float _1637 = fma(_1429, _1627, _1635);
    float _1639 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1643 = -_1593;
    float _1645 = fma(_1573, _1589, _1643);
    float _1647 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1651 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1653 = fma(_1425, _1645, _1423);
    float _1655 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1647);
    float _1657 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1659 = _1585;
    if (_1345)
    {
        _1659 = _1599;
    }
    float _1661 = _1659;
    float _1663 = _1653 + 0.5;
    float _1665 = _1637 + 0.5;
    float _1667 = exp2(_1641);
    float _1669 = _1661;
    if (!_1345)
    {
        _1531 = _1599;
    }
    float _1671 = _1531;
    float _1673 = _1671;
    if (_1549)
    {
        float _1675 = -_1661;
        float _1677 = _1675 + 1.0;
        _1669 = _1677;
    }
    float _1679 = _1669;
    float _1681 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1655);
    float _1683 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1685 = _1240 * 0.5;
    float _1687 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1345)
    {
        _1673 = _1679;
    }
    float _1689 = _1673;
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1693 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1681);
    float _1695 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1697 = _1282 + _1240;
    float _1699 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1701 = _1693 + _1240;
    float _1703 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1705 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = -_1667;
    float _1709 = _1707 + 1.0;
    float _1711 = _1699 * _1649;
    float _1713 = _1701 * 0.5;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1717 = _1697 * 0.5;
    float _1719 = fma(_1284, -0.5, _1685);
    float _1721 = _1695 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1723 = -_1715;
    float _1725 = _1723 + 1.0;
    float _1727 = _1639 * _1691;
    out.m_63.x = _1687;
    out.m_63.y = _1703;
    out.m_63.z = _1705;
    out.m_65.x = _1663;
    out.m_65.y = _1665;
    out.m_65.z = _1711;
    out.m_65.w = _1727;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1284;
    out.gl_Position.z = _1693;
    out.gl_Position.w = _1240;
    out.m_67.x = _1717;
    out.m_67.y = _1719;
    out.m_67.z = _1713;
    out.m_67.w = _1240;
    out.m_45.x = _1721;
    float _1729 = _1715 * _1298;
    float _1731 = _1313 * _1729;
    float _1733 = _1313 * _1725;
    float _1735 = _1323 * _1729;
    float _1737 = fma(_1319, _1731, _1307);
    float _1739 = fma(_1321, _1731, _1309);
    float _1741 = fma(_1313, _1735, _1311);
    out.m_69.x = _1737;
    out.m_69.y = _1739;
    out.m_69.z = _1741;
    out.m_69.w = _1733;
    if (_1611)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1743;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _716 = false;
    bool _562 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1800 = as_type<float>(_104);
        out.gl_Position.z = _1800;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1869 = as_type<float>(_140);
        out.gl_Position.z = _1869;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _292 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = 1.0 / _316;
    bool _324 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_292);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _312;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _340 = _292 + _338;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _320;
    float _346 = _296 * _322;
    bool _348 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _350 = isnan(_292);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _308;
    float _362 = _340 * _336;
    bool _364 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _366 = isnan(_292);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_292);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_374;
    float _390 = _388 + 1.0;
    float _392 = _300 * _344;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    bool _398 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _400 = isnan(_292);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _358 * _390;
    float _412 = -_358;
    float _414 = _412 + 1.0;
    float _416 = fma(_396, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = _304 * _360;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = _386 * _414;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = fma(_426, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _440 = fma(_430, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _442 = -_386;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_420, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_436, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = _334 * _444;
    float _456 = -_334;
    float _458 = _456 + 1.0;
    float _460 = fma(_448, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = _408 * _458;
    float _464 = -_408;
    float _466 = _464 + 1.0;
    float _468 = _416 * _462;
    float _470 = _438 * _462;
    float _472 = _440 * _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _480 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_476, _422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _494 = fma(_450, _454, _478);
    float _496 = fma(_460, _454, _480);
    float _498 = fma(_452, _454, _482);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _508 = fma(_486, _422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _510 = fma(_490, _422, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = fma(_492, _432, _494);
    float _518 = fma(_502, _362, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_506, _362, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_514, _362, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_508, _432, _496);
    float _526 = fma(_510, _432, _498);
    float _528 = fma(_518, _410, _516);
    float _530 = fma(_520, _410, _524);
    float _532 = fma(_522, _410, _526);
    float _534 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].x, _528);
    float _536 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].y, _530);
    float _538 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].z, _532);
    bool _540 = !_342;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _560;
    if (!_540)
    {
        float _544 = in.m_51.x;
        float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _548 = _544 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _550 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _552 = _550 * _546;
        float _554 = floor(_552);
        float _556 = -_554;
        float _558 = _552 + _556;
        _560 = _558;
        _562 = true;
    }
    else
    {
        float _564 = float(_88);
        float _566 = 1.0 / _564;
        float _568 = _122 * _566;
        _560 = _568;
    }
    _562 = false;
    float _570 = _560;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _574 = _570 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_570);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _596 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _598 = isnan(_570);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    bool _612 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_570);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = 1.0 / _578;
    float _626 = -_590;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _632 = _606 * _628;
    float _634 = -_606;
    float _636 = _634 + 1.0;
    float _638 = 1.0 / _594;
    float _640 = _610 * _624;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _646 = fma(_640, _574, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _648 = _644 * _638;
    float _650 = _646 * _632;
    float _652 = -_622;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _570 + _656;
    float _660 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[115].x, _650);
    float _662 = _590 * _654;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = in.m_49.x;
    float _670 = in.m_49.y;
    float _672 = in.m_49.z;
    float _674 = fma(_664, _662, _660);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _678 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[117].x, _674);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _688 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _678;
    out.m_53.y = _688;
    out.m_53.z = _684;
    out.m_53.w = _686;
    float _690 = _538 * _672;
    float _692 = _536 * _670;
    float _694 = _534 * _668;
    bool _696 = !_630;
    float _714;
    if (!_696)
    {
        float _698 = in.m_51.x;
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _702 = _698 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_88);
        float _720 = 1.0 / _718;
        float _722 = _122 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = in.m_55.x;
    float _728 = in.m_55.y;
    float _730 = in.m_55.z;
    float _732 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _746 = _742 || _744;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _728);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _730);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _726);
    float _754 = _732 * _748;
    float _756 = _734 * _750;
    float _758 = _736 * _752;
    float _760 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _762 = _754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _764 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _766 = _754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _768 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _762);
    float _772 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _764);
    float _774 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _776 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _768);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _766);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _770);
    float _782 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _784 = _776 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _786 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _778);
    float _788 = _780 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _790 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _774);
    float _792 = _782 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _796 = _784 + _788;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _790);
    float _800 = _754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _802 = _792 + _794;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _796 + _804;
    float _808 = _798 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _800);
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _802 + _812;
    float _816 = _806 * _806;
    float _818 = _808 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _820 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _810);
    float _822 = fma(_814, _814, _816);
    float _824 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[11].x, _818);
    float _826 = _808 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _828 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _830 = sqrt(_822);
    float _832 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[11].z, _824);
    float _834 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[10].x, _826);
    float _836 = _808 + _828;
    float _838 = _832 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _840 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[10].z, _834);
    float _842 = 1.0 / _838;
    float _844 = _840 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _844 + _838;
    bool _848 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _846 * _842;
    float _852 = _850 * 0.5;
    float _854 = _846;
    float _856 = _828;
    float _858 = _800;
    float _860 = _832;
    float _862 = _836;
    float _864 = _838;
    float _866 = _852;
    if (_746)
    {
        _854 = 1.0;
    }
    float _868 = _854;
    float _870 = _868;
    if (!_848)
    {
        _856 = _802;
    }
    float _872 = _856;
    float _874 = _872;
    if (!_848)
    {
        _858 = _796;
    }
    float _876 = _858;
    float _878 = _876;
    if (!_848)
    {
        _860 = _836;
    }
    float _880 = _860;
    bool _882 = !_848;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _830 + _888;
        float _892 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_822);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _914 = fma(_836, _902, _910);
        float _916 = _894 * _912;
        float _918 = fma(_814, _916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_806, _916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _914;
        _874 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _874;
    float _926 = _878;
    if (!_746)
    {
        float _928 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _930 = _928 * 0.15915493667125701904296875;
        float _932 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _934 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _936 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[30].w, _934);
        float _938 = _930 * 6.283185482025146484375;
        float _940 = cos(_938);
        float _942 = _932 * 0.15915493667125701904296875;
        float _944 = _930 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = 1.0 / _940;
        float _950 = _942 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = _946 * _948;
        float _956 = _942 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = _952 * _954;
        float _962 = 1.0 / _936;
        float _964 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _966 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _964;
        float _968 = 1.0 / _960;
        float _970 = 1.0 / _966;
        float _972 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _974 = _962 * _972;
        float _976 = _958 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _980 = fma(_976, _974, _978);
        float _982 = _980 * _970;
        float _984 = precise::clamp(_982, 0.0, 1.0);
        _862 = _942;
        _864 = _970;
        _870 = _984;
    }
    float _986 = _862;
    float _988 = _864;
    float _990 = _870;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _922 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _924 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _926 + _1000;
    float _1004 = _994 * _994;
    float _1006 = fma(_998, _998, _1004);
    float _1008 = fma(_1002, _1002, _1006);
    float _1010 = rsqrt(_1008);
    float _1012 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1014 = _998 * _1012;
    float _1016 = _1002 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = _1018 + _1020;
    float _1024 = sqrt(_1022);
    bool _1026 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1030 = _1024 + _1028;
    float _1032 = _986;
    float _1034 = _1030;
    float _1036 = _994;
    float _1038 = _1014;
    if (_1026)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = _1042;
    if (_1026)
    {
        float _1046 = _1030 * _1042;
        _1034 = _1046;
    }
    float _1048 = _1034;
    if (_1026)
    {
        float _1050 = rsqrt(_1022);
        _1044 = _1050;
    }
    float _1052 = _1044;
    float _1054 = _1052;
    if (_1026)
    {
        float _1056 = _1048 * 0.15915493667125701904296875;
        _866 = _1056;
    }
    float _1058 = _866;
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1062 = _1002;
    if (_1026)
    {
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        _1062 = _1066;
    }
    float _1068 = _1062;
    float _1070 = precise::max(0.0, _1060);
    float _1072 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1074 = _988;
    float _1076 = _1070;
    if (_1026)
    {
        float _1078 = _1058 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1012;
    float _1086 = -_1070;
    float _1088 = fma(_994, _1084, _1086);
    if (_1026)
    {
        float _1090 = _1088 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1090;
    }
    float _1092 = _1036;
    float _1094 = sqrt(_1008);
    float _1096 = _1068;
    float _1098 = _1092;
    if (_1026)
    {
        float _1100 = fma(_1068, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1096 = _1100;
    }
    float _1102 = _1096;
    float _1104 = _1102;
    if (!_1026)
    {
        _1098 = _1088;
    }
    float _1106 = _1098;
    float _1108 = _1106;
    if (_1026)
    {
        float _1110 = _1052 * _1102;
        _542 = _1110;
    }
    float _1112 = _542;
    if (!_1026)
    {
        _1104 = _1018;
    }
    float _1114 = _1104;
    float _1116 = _922 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1118 = _1114;
    float _1120 = _1082;
    if (_1026)
    {
        float _1122 = _1082 + (-1.0);
        _1076 = _1122;
    }
    float _1124 = _1076;
    float _1126 = _1124;
    if (_1026)
    {
        float _1128 = _1014 * _1112;
        _1038 = _1128;
    }
    float _1130 = _1038;
    float _1132 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1116);
    if (_1026)
    {
        float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1134;
    }
    float _1136 = _1054;
    if (!_1026)
    {
        _1126 = _1016;
    }
    float _1138 = _1126;
    float _1140 = _1138;
    if (_1026)
    {
        float _1142 = _1016 * _1112;
        _1140 = _1142;
    }
    float _1144 = _1140;
    if (_1026)
    {
        float _1146 = _1130 * _1130;
        _1118 = _1146;
    }
    float _1148 = _1118;
    if (_1026)
    {
        float _1150 = fma(_1088, _1082, _1136);
        _1108 = _1150;
    }
    float _1152 = _1108;
    if (!_1026)
    {
        _1120 = _1020;
    }
    float _1154 = _1120;
    float _1156 = _1154;
    if (_1026)
    {
        float _1158 = _1144 * _1144;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = fma(_1152, _1152, _1148);
    float _1164 = _1162 + _1160;
    float _1166 = _922 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1170 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1168);
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = _922 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1176 = rsqrt(_1164);
    float _1178 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1180 = -_1172;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1174);
    float _1186 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1188 = _922 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1190 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1184);
    float _1192 = abs(_1182);
    float _1194 = log2(_1192);
    float _1196 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1198 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1188);
    float _1200 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1204 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1198);
    float _1206 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = _1176 * _1152;
    float _1210 = -_1202;
    float _1212 = fma(_1210, _1072, 1.0);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1176 * _1130;
    float _1218 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1132);
    float _1220 = _1176 * _1144;
    float _1222 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1226 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1228 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1230 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1222);
    float _1232 = -_1224;
    float _1234 = fma(_1208, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1232);
    float _1236 = log2(_1212);
    float _1238 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1240 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1242 = -_1220;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1234);
    float _1246 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1248 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1238);
    float _1250 = fma(_1244, -0.5, 0.5);
    float _1252 = exp2(_1226);
    float _1254 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1246);
    float _1256 = fma(_1244, 0.5, 0.5);
    float _1258 = _1208 + 1.0;
    float _1260 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1248);
    float _1262 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1254);
    float _1264 = fma(_1256, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1266 = 1.0 / _1240;
    float _1268 = _1236 * 0.693147182464599609375;
    float _1270 = fma(_1256, _1264, -0.212114393711090087890625);
    float _1272 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1274 = fma(_1256, _1270, 1.570728778839111328125);
    float _1276 = sqrt(_1250);
    float _1278 = -_1208;
    float _1280 = fma(_1252, _1258, _1278);
    float _1282 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1262);
    float _1284 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1260);
    float _1286 = _1282 * _1266;
    float _1288 = _1284 * _1266;
    float _1290 = fma(_1286, 0.5, 0.5);
    float _1292 = fma(_1288, -0.5, 0.5);
    float _1294 = fma(_1280, 0.5, 0.5);
    float _1296 = _1276 * 0.636619746685028076171875;
    float3 _3760 = float3(_1290, _1292, _1272);
    float _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3760, float3(0.0), isnan(_3760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3760, float3(0.0), isnan(_3760)), level(0.0)).x;
    float _1300 = -_1274;
    float _1302 = fma(_1296, _1300, 1.0);
    float3 _3776 = float3(_1290, _1292, _1272);
    float4 _1305 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3776, float3(0.0), isnan(_3776)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3776, float3(0.0), isnan(_3776)), level(0.0)).xyzw;
    float _1307 = _1305.x;
    float _1309 = _1305.y;
    float _1311 = _1305.z;
    float _1313 = _1305.w;
    float2 _3793 = float2(_1302, _1294);
    float3 _1317 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3793, float2(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3793, float2(0.0), isnan(_3793)), level(0.0)).xyz;
    float _1319 = _1317.x;
    float _1321 = _1317.y;
    float _1323 = _1317.z;
    float _1325 = in.m_51.x;
    float _1327 = in.m_51.y;
    float _1329 = in.m_51.z;
    float _1331 = in.m_51.w;
    float _1333 = in.m_57.w;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1337 = _1335 != 0;
    int _1339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1341 = _1339 != 0;
    out.m_59.x = _792;
    out.m_59.y = _808;
    out.m_59.z = _784;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1345 = _1343 != 0;
    out.m_61.x = _924;
    out.m_61.y = _922;
    out.m_61.z = _926;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1349 = _1347 != 0;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1359 = 1.0 / _1353;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1365 = 0.0;
    if (_1341)
    {
        float _1367 = in.m_51.x;
        _1365 = _1367;
    }
    float _1369 = _1365;
    bool _1371 = _1331 > 0.5;
    float _1373 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = -_1333;
    float _1381 = _1379 + 1.0;
    float _1383 = -_1361;
    float _1385 = fma(_1373, 2.0, _1383);
    float _1387 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1389 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1393 = _1333;
    if (_1337)
    {
        float _1395 = _1371 ? _1381 : _1333;
        _1393 = _1395;
    }
    float _1397 = _1393;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = in.m_57.y;
    float _1403 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1363);
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1407 = _724 + _1405;
    float _1409 = fma(_1387, -2.0, _1375);
    float _1411 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1391);
    bool _1413 = _1327 > 0.5;
    float _1415 = _1407 * _1359;
    float _1417 = 1.0 / _1357;
    float _1419 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1403);
    float _1421 = -_122;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1385);
    float _1425 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1389);
    float _1427 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1409);
    float _1429 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1411);
    float _1431 = in.m_57.x;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1435 = _724 + _1433;
    float _1437 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1439;
    float _1443 = 0.0;
    if (_1345)
    {
        float _1445 = in.m_51.z;
        _1443 = _1445;
    }
    float _1447 = _1443;
    float _1449 = _1419 * (-0.15915493667125701904296875);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1451;
    float _1455 = _1435 * _1417;
    float _1457 = -_1401;
    float _1459 = _1457 + 1.0;
    float _1461 = fma(_1441, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1463 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1465 = isnan(_724);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1471 = _1467 || _1469;
    float _1473 = float(_1471);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1477 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1479 = isnan(_724);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = fma(_1453, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1491 = _1401;
    if (_1349)
    {
        float _1493 = _1413 ? _1459 : _1401;
        _1491 = _1493;
    }
    float _1495 = _1491;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1497;
    bool _1501 = _1369 > 0.5;
    bool _1503 = _1501 && _1341;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1509 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1511 = isnan(_724);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = -_1473;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1499, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1527 = fma(_1437, _1495, -0.5);
    float _1529 = 0.0;
    float _1531 = _1431;
    if (_1341)
    {
        _1529 = _1431;
    }
    float _1533 = _1529;
    float _1535 = _1519 * _1523;
    float _1537 = -_1519;
    float _1539 = _1537 + 1.0;
    float _1541 = _1449 * 6.283185482025146484375;
    float _1543 = sin(_1541);
    float _1545 = fma(_1507, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1547 = _1447 > 0.5;
    bool _1549 = _1547 && _1345;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1555 = _1533;
    float _1557 = _1447;
    if (_1503)
    {
        float _1559 = -_1533;
        float _1561 = _1559 + 1.0;
        _1555 = _1561;
    }
    float _1563 = _1555;
    float _1565 = _1487 * _1539;
    if (!_1341)
    {
        _1557 = _1431;
    }
    float _1567 = _1557;
    float _1569 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1571 = _1449 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    float _1575 = _1567;
    if (_1341)
    {
        _1575 = _1563;
    }
    float _1577 = _1575;
    float _1579 = fma(_1553, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1581 = _1489 * _1565;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1587 = _1525 * _1565;
    float _1589 = fma(_1569, _1577, -0.5);
    float _1591 = _1461 * _1565;
    float _1593 = _1543 * _1527;
    float _1595 = -_1487;
    float _1597 = _1595 + 1.0;
    float _1599 = in.m_57.z;
    float _1601 = fma(_1585, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1603 = _990 > 0.0;
    bool _1605 = isnan(_990);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan(0.0);
    bool _1611 = _1607 || _1609;
    float _1613 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1581);
    float _1615 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1587);
    float _1617 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1591);
    float _1619 = _1573 * _1527;
    float _1621 = fma(_1579, _1535, _1613);
    float _1623 = fma(_1545, _1535, _1615);
    float _1625 = fma(_1601, _1535, _1617);
    float _1627 = fma(_1543, _1589, _1619);
    float _1629 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1621);
    float _1631 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1623);
    float _1633 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1625);
    float _1635 = -_1427;
    float _1637 = fma(_1429, _1627, _1635);
    float _1639 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1643 = -_1593;
    float _1645 = fma(_1573, _1589, _1643);
    float _1647 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1651 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1653 = fma(_1425, _1645, _1423);
    float _1655 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1647);
    float _1657 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1659 = _1585;
    if (_1345)
    {
        _1659 = _1599;
    }
    float _1661 = _1659;
    float _1663 = _1653 + 0.5;
    float _1665 = _1637 + 0.5;
    float _1667 = exp2(_1641);
    float _1669 = _1661;
    if (!_1345)
    {
        _1531 = _1599;
    }
    float _1671 = _1531;
    float _1673 = _1671;
    if (_1549)
    {
        float _1675 = -_1661;
        float _1677 = _1675 + 1.0;
        _1669 = _1677;
    }
    float _1679 = _1669;
    float _1681 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1655);
    float _1683 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1685 = _1240 * 0.5;
    float _1687 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1345)
    {
        _1673 = _1679;
    }
    float _1689 = _1673;
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1693 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1681);
    float _1695 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1697 = _1282 + _1240;
    float _1699 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1701 = _1693 + _1240;
    float _1703 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1705 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = -_1667;
    float _1709 = _1707 + 1.0;
    float _1711 = _1699 * _1649;
    float _1713 = _1701 * 0.5;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1717 = _1697 * 0.5;
    float _1719 = fma(_1284, -0.5, _1685);
    float _1721 = _1695 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1723 = -_1715;
    float _1725 = _1723 + 1.0;
    float _1727 = _1639 * _1691;
    out.m_63.x = _1687;
    out.m_63.y = _1703;
    out.m_63.z = _1705;
    out.m_65.x = _1663;
    out.m_65.y = _1665;
    out.m_65.z = _1711;
    out.m_65.w = _1727;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1284;
    out.gl_Position.z = _1693;
    out.gl_Position.w = _1240;
    out.m_67.x = _1717;
    out.m_67.y = _1719;
    out.m_67.z = _1713;
    out.m_67.w = _1240;
    out.m_45.x = _1721;
    float _1729 = _1715 * _1298;
    float _1731 = _1313 * _1729;
    float _1733 = _1313 * _1725;
    float _1735 = _1323 * _1729;
    float _1737 = fma(_1319, _1731, _1307);
    float _1739 = fma(_1321, _1731, _1309);
    float _1741 = fma(_1313, _1735, _1311);
    out.m_69.x = _1737;
    out.m_69.y = _1739;
    out.m_69.z = _1741;
    out.m_69.w = _1733;
    if (_1611)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1743;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _716 = false;
    bool _562 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1800 = as_type<float>(_104);
        out.gl_Position.z = _1800;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1869 = as_type<float>(_140);
        out.gl_Position.z = _1869;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _292 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = 1.0 / _316;
    bool _324 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_292);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _312;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _340 = _292 + _338;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _344 = 1.0 / _320;
    float _346 = _296 * _322;
    bool _348 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _350 = isnan(_292);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _308;
    float _362 = _340 * _336;
    bool _364 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _366 = isnan(_292);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = isnan(_292);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_374;
    float _390 = _388 + 1.0;
    float _392 = _300 * _344;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    bool _398 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _400 = isnan(_292);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _358 * _390;
    float _412 = -_358;
    float _414 = _412 + 1.0;
    float _416 = fma(_396, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = _304 * _360;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = _386 * _414;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = fma(_426, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _440 = fma(_430, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _442 = -_386;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_420, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_436, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = _334 * _444;
    float _456 = -_334;
    float _458 = _456 + 1.0;
    float _460 = fma(_448, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = _408 * _458;
    float _464 = -_408;
    float _466 = _464 + 1.0;
    float _468 = _416 * _462;
    float _470 = _438 * _462;
    float _472 = _440 * _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _480 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_476, _422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _494 = fma(_450, _454, _478);
    float _496 = fma(_460, _454, _480);
    float _498 = fma(_452, _454, _482);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _508 = fma(_486, _422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _510 = fma(_490, _422, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _516 = fma(_492, _432, _494);
    float _518 = fma(_502, _362, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_506, _362, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_514, _362, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_508, _432, _496);
    float _526 = fma(_510, _432, _498);
    float _528 = fma(_518, _410, _516);
    float _530 = fma(_520, _410, _524);
    float _532 = fma(_522, _410, _526);
    float _534 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].x, _528);
    float _536 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].y, _530);
    float _538 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].z, _532);
    bool _540 = !_342;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _560;
    if (!_540)
    {
        float _544 = in.m_51.x;
        float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _548 = _544 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _550 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _552 = _550 * _546;
        float _554 = floor(_552);
        float _556 = -_554;
        float _558 = _552 + _556;
        _560 = _558;
        _562 = true;
    }
    else
    {
        float _564 = float(_88);
        float _566 = 1.0 / _564;
        float _568 = _122 * _566;
        _560 = _568;
    }
    _562 = false;
    float _570 = _560;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _574 = _570 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_570);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _596 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _598 = isnan(_570);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    bool _612 = _570 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_570);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = 1.0 / _578;
    float _626 = -_590;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _632 = _606 * _628;
    float _634 = -_606;
    float _636 = _634 + 1.0;
    float _638 = 1.0 / _594;
    float _640 = _610 * _624;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _646 = fma(_640, _574, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _648 = _644 * _638;
    float _650 = _646 * _632;
    float _652 = -_622;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _570 + _656;
    float _660 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[115].x, _650);
    float _662 = _590 * _654;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = in.m_49.x;
    float _670 = in.m_49.y;
    float _672 = in.m_49.z;
    float _674 = fma(_664, _662, _660);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _678 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[117].x, _674);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _688 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _678;
    out.m_53.y = _688;
    out.m_53.z = _684;
    out.m_53.w = _686;
    float _690 = _538 * _672;
    float _692 = _536 * _670;
    float _694 = _534 * _668;
    bool _696 = !_630;
    float _714;
    if (!_696)
    {
        float _698 = in.m_51.x;
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _702 = _698 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_88);
        float _720 = 1.0 / _718;
        float _722 = _122 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = in.m_55.x;
    float _728 = in.m_55.y;
    float _730 = in.m_55.z;
    float _732 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _746 = _742 || _744;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _728);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _730);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _726);
    float _754 = _732 * _748;
    float _756 = _734 * _750;
    float _758 = _736 * _752;
    float _760 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _762 = _754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _764 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _766 = _754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _768 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _762);
    float _772 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _764);
    float _774 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _776 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _768);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _766);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _770);
    float _782 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _784 = _776 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _786 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _778);
    float _788 = _780 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _790 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _774);
    float _792 = _782 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _796 = _784 + _788;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _790);
    float _800 = _754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _802 = _792 + _794;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _796 + _804;
    float _808 = _798 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _800);
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _802 + _812;
    float _816 = _806 * _806;
    float _818 = _808 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _820 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _810);
    float _822 = fma(_814, _814, _816);
    float _824 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[11].x, _818);
    float _826 = _808 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _828 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _830 = sqrt(_822);
    float _832 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[11].z, _824);
    float _834 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[10].x, _826);
    float _836 = _808 + _828;
    float _838 = _832 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _840 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[10].z, _834);
    float _842 = 1.0 / _838;
    float _844 = _840 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _844 + _838;
    bool _848 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _846 * _842;
    float _852 = _850 * 0.5;
    float _854 = _846;
    float _856 = _828;
    float _858 = _800;
    float _860 = _832;
    float _862 = _836;
    float _864 = _838;
    float _866 = _852;
    if (_746)
    {
        _854 = 1.0;
    }
    float _868 = _854;
    float _870 = _868;
    if (!_848)
    {
        _856 = _802;
    }
    float _872 = _856;
    float _874 = _872;
    if (!_848)
    {
        _858 = _796;
    }
    float _876 = _858;
    float _878 = _876;
    if (!_848)
    {
        _860 = _836;
    }
    float _880 = _860;
    bool _882 = !_848;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _830 + _888;
        float _892 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_822);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _914 = fma(_836, _902, _910);
        float _916 = _894 * _912;
        float _918 = fma(_814, _916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_806, _916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _914;
        _874 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _874;
    float _926 = _878;
    if (!_746)
    {
        float _928 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _930 = _928 * 0.15915493667125701904296875;
        float _932 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _934 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _936 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[30].w, _934);
        float _938 = _930 * 6.283185482025146484375;
        float _940 = cos(_938);
        float _942 = _932 * 0.15915493667125701904296875;
        float _944 = _930 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = 1.0 / _940;
        float _950 = _942 * 6.283185482025146484375;
        float _952 = cos(_950);
        float _954 = _946 * _948;
        float _956 = _942 * 6.283185482025146484375;
        float _958 = sin(_956);
        float _960 = _952 * _954;
        float _962 = 1.0 / _936;
        float _964 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _966 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _964;
        float _968 = 1.0 / _960;
        float _970 = 1.0 / _966;
        float _972 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _974 = _962 * _972;
        float _976 = _958 * _968;
        float _978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _980 = fma(_976, _974, _978);
        float _982 = _980 * _970;
        float _984 = precise::clamp(_982, 0.0, 1.0);
        _862 = _942;
        _864 = _970;
        _870 = _984;
    }
    float _986 = _862;
    float _988 = _864;
    float _990 = _870;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _922 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _924 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _926 + _1000;
    float _1004 = _994 * _994;
    float _1006 = fma(_998, _998, _1004);
    float _1008 = fma(_1002, _1002, _1006);
    float _1010 = rsqrt(_1008);
    float _1012 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1014 = _998 * _1012;
    float _1016 = _1002 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = _1018 + _1020;
    float _1024 = sqrt(_1022);
    bool _1026 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1030 = _1024 + _1028;
    float _1032 = _986;
    float _1034 = _1030;
    float _1036 = _994;
    float _1038 = _1014;
    if (_1026)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = _1042;
    if (_1026)
    {
        float _1046 = _1030 * _1042;
        _1034 = _1046;
    }
    float _1048 = _1034;
    if (_1026)
    {
        float _1050 = rsqrt(_1022);
        _1044 = _1050;
    }
    float _1052 = _1044;
    float _1054 = _1052;
    if (_1026)
    {
        float _1056 = _1048 * 0.15915493667125701904296875;
        _866 = _1056;
    }
    float _1058 = _866;
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1062 = _1002;
    if (_1026)
    {
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        _1062 = _1066;
    }
    float _1068 = _1062;
    float _1070 = precise::max(0.0, _1060);
    float _1072 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1074 = _988;
    float _1076 = _1070;
    if (_1026)
    {
        float _1078 = _1058 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1012;
    float _1086 = -_1070;
    float _1088 = fma(_994, _1084, _1086);
    if (_1026)
    {
        float _1090 = _1088 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1090;
    }
    float _1092 = _1036;
    float _1094 = sqrt(_1008);
    float _1096 = _1068;
    float _1098 = _1092;
    if (_1026)
    {
        float _1100 = fma(_1068, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1096 = _1100;
    }
    float _1102 = _1096;
    float _1104 = _1102;
    if (!_1026)
    {
        _1098 = _1088;
    }
    float _1106 = _1098;
    float _1108 = _1106;
    if (_1026)
    {
        float _1110 = _1052 * _1102;
        _542 = _1110;
    }
    float _1112 = _542;
    if (!_1026)
    {
        _1104 = _1018;
    }
    float _1114 = _1104;
    float _1116 = _922 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1118 = _1114;
    float _1120 = _1082;
    if (_1026)
    {
        float _1122 = _1082 + (-1.0);
        _1076 = _1122;
    }
    float _1124 = _1076;
    float _1126 = _1124;
    if (_1026)
    {
        float _1128 = _1014 * _1112;
        _1038 = _1128;
    }
    float _1130 = _1038;
    float _1132 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1116);
    if (_1026)
    {
        float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1134;
    }
    float _1136 = _1054;
    if (!_1026)
    {
        _1126 = _1016;
    }
    float _1138 = _1126;
    float _1140 = _1138;
    if (_1026)
    {
        float _1142 = _1016 * _1112;
        _1140 = _1142;
    }
    float _1144 = _1140;
    if (_1026)
    {
        float _1146 = _1130 * _1130;
        _1118 = _1146;
    }
    float _1148 = _1118;
    if (_1026)
    {
        float _1150 = fma(_1088, _1082, _1136);
        _1108 = _1150;
    }
    float _1152 = _1108;
    if (!_1026)
    {
        _1120 = _1020;
    }
    float _1154 = _1120;
    float _1156 = _1154;
    if (_1026)
    {
        float _1158 = _1144 * _1144;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = fma(_1152, _1152, _1148);
    float _1164 = _1162 + _1160;
    float _1166 = _922 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1170 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1168);
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = _922 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1176 = rsqrt(_1164);
    float _1178 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1180 = -_1172;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1174);
    float _1186 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1188 = _922 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1190 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1184);
    float _1192 = abs(_1182);
    float _1194 = log2(_1192);
    float _1196 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1198 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1188);
    float _1200 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1204 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1198);
    float _1206 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = _1176 * _1152;
    float _1210 = -_1202;
    float _1212 = fma(_1210, _1072, 1.0);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1216 = _1176 * _1130;
    float _1218 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1132);
    float _1220 = _1176 * _1144;
    float _1222 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1226 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1228 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1230 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1222);
    float _1232 = -_1224;
    float _1234 = fma(_1208, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1232);
    float _1236 = log2(_1212);
    float _1238 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1240 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1242 = -_1220;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1234);
    float _1246 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1248 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1238);
    float _1250 = fma(_1244, -0.5, 0.5);
    float _1252 = exp2(_1226);
    float _1254 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1246);
    float _1256 = fma(_1244, 0.5, 0.5);
    float _1258 = _1208 + 1.0;
    float _1260 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1248);
    float _1262 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1254);
    float _1264 = fma(_1256, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1266 = 1.0 / _1240;
    float _1268 = _1236 * 0.693147182464599609375;
    float _1270 = fma(_1256, _1264, -0.212114393711090087890625);
    float _1272 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1274 = fma(_1256, _1270, 1.570728778839111328125);
    float _1276 = sqrt(_1250);
    float _1278 = -_1208;
    float _1280 = fma(_1252, _1258, _1278);
    float _1282 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1262);
    float _1284 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1260);
    float _1286 = _1282 * _1266;
    float _1288 = _1284 * _1266;
    float _1290 = fma(_1286, 0.5, 0.5);
    float _1292 = fma(_1288, -0.5, 0.5);
    float _1294 = fma(_1280, 0.5, 0.5);
    float _1296 = _1276 * 0.636619746685028076171875;
    float3 _3760 = float3(_1290, _1292, _1272);
    float _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3760, float3(0.0), isnan(_3760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3760, float3(0.0), isnan(_3760)), level(0.0)).x;
    float _1300 = -_1274;
    float _1302 = fma(_1296, _1300, 1.0);
    float3 _3776 = float3(_1290, _1292, _1272);
    float4 _1305 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3776, float3(0.0), isnan(_3776)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3776, float3(0.0), isnan(_3776)), level(0.0)).xyzw;
    float _1307 = _1305.x;
    float _1309 = _1305.y;
    float _1311 = _1305.z;
    float _1313 = _1305.w;
    float2 _3793 = float2(_1302, _1294);
    float3 _1317 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3793, float2(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3793, float2(0.0), isnan(_3793)), level(0.0)).xyz;
    float _1319 = _1317.x;
    float _1321 = _1317.y;
    float _1323 = _1317.z;
    float _1325 = in.m_51.x;
    float _1327 = in.m_51.y;
    float _1329 = in.m_51.z;
    float _1331 = in.m_51.w;
    float _1333 = in.m_57.w;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1337 = _1335 != 0;
    int _1339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1341 = _1339 != 0;
    out.m_59.x = _792;
    out.m_59.y = _808;
    out.m_59.z = _784;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1345 = _1343 != 0;
    out.m_61.x = _924;
    out.m_61.y = _922;
    out.m_61.z = _926;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1349 = _1347 != 0;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1359 = 1.0 / _1353;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1365 = 0.0;
    if (_1341)
    {
        float _1367 = in.m_51.x;
        _1365 = _1367;
    }
    float _1369 = _1365;
    bool _1371 = _1331 > 0.5;
    float _1373 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = -_1333;
    float _1381 = _1379 + 1.0;
    float _1383 = -_1361;
    float _1385 = fma(_1373, 2.0, _1383);
    float _1387 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1389 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1393 = _1333;
    if (_1337)
    {
        float _1395 = _1371 ? _1381 : _1333;
        _1393 = _1395;
    }
    float _1397 = _1393;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = in.m_57.y;
    float _1403 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1363);
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1407 = _724 + _1405;
    float _1409 = fma(_1387, -2.0, _1375);
    float _1411 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1391);
    bool _1413 = _1327 > 0.5;
    float _1415 = _1407 * _1359;
    float _1417 = 1.0 / _1357;
    float _1419 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1403);
    float _1421 = -_122;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1385);
    float _1425 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1389);
    float _1427 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1409);
    float _1429 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1411);
    float _1431 = in.m_57.x;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1435 = _724 + _1433;
    float _1437 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1439;
    float _1443 = 0.0;
    if (_1345)
    {
        float _1445 = in.m_51.z;
        _1443 = _1445;
    }
    float _1447 = _1443;
    float _1449 = _1419 * (-0.15915493667125701904296875);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1451;
    float _1455 = _1435 * _1417;
    float _1457 = -_1401;
    float _1459 = _1457 + 1.0;
    float _1461 = fma(_1441, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1463 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1465 = isnan(_724);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1471 = _1467 || _1469;
    float _1473 = float(_1471);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1477 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1479 = isnan(_724);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = fma(_1453, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1491 = _1401;
    if (_1349)
    {
        float _1493 = _1413 ? _1459 : _1401;
        _1491 = _1493;
    }
    float _1495 = _1491;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1497;
    bool _1501 = _1369 > 0.5;
    bool _1503 = _1501 && _1341;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1509 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1511 = isnan(_724);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = -_1473;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1499, _1415, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1527 = fma(_1437, _1495, -0.5);
    float _1529 = 0.0;
    float _1531 = _1431;
    if (_1341)
    {
        _1529 = _1431;
    }
    float _1533 = _1529;
    float _1535 = _1519 * _1523;
    float _1537 = -_1519;
    float _1539 = _1537 + 1.0;
    float _1541 = _1449 * 6.283185482025146484375;
    float _1543 = sin(_1541);
    float _1545 = fma(_1507, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1547 = _1447 > 0.5;
    bool _1549 = _1547 && _1345;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1555 = _1533;
    float _1557 = _1447;
    if (_1503)
    {
        float _1559 = -_1533;
        float _1561 = _1559 + 1.0;
        _1555 = _1561;
    }
    float _1563 = _1555;
    float _1565 = _1487 * _1539;
    if (!_1341)
    {
        _1557 = _1431;
    }
    float _1567 = _1557;
    float _1569 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1571 = _1449 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    float _1575 = _1567;
    if (_1341)
    {
        _1575 = _1563;
    }
    float _1577 = _1575;
    float _1579 = fma(_1553, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1581 = _1489 * _1565;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1587 = _1525 * _1565;
    float _1589 = fma(_1569, _1577, -0.5);
    float _1591 = _1461 * _1565;
    float _1593 = _1543 * _1527;
    float _1595 = -_1487;
    float _1597 = _1595 + 1.0;
    float _1599 = in.m_57.z;
    float _1601 = fma(_1585, _1455, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1603 = _990 > 0.0;
    bool _1605 = isnan(_990);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan(0.0);
    bool _1611 = _1607 || _1609;
    float _1613 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1581);
    float _1615 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1587);
    float _1617 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1591);
    float _1619 = _1573 * _1527;
    float _1621 = fma(_1579, _1535, _1613);
    float _1623 = fma(_1545, _1535, _1615);
    float _1625 = fma(_1601, _1535, _1617);
    float _1627 = fma(_1543, _1589, _1619);
    float _1629 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1621);
    float _1631 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1623);
    float _1633 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1625);
    float _1635 = -_1427;
    float _1637 = fma(_1429, _1627, _1635);
    float _1639 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1643 = -_1593;
    float _1645 = fma(_1573, _1589, _1643);
    float _1647 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1651 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1653 = fma(_1425, _1645, _1423);
    float _1655 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1647);
    float _1657 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1659 = _1585;
    if (_1345)
    {
        _1659 = _1599;
    }
    float _1661 = _1659;
    float _1663 = _1653 + 0.5;
    float _1665 = _1637 + 0.5;
    float _1667 = exp2(_1641);
    float _1669 = _1661;
    if (!_1345)
    {
        _1531 = _1599;
    }
    float _1671 = _1531;
    float _1673 = _1671;
    if (_1549)
    {
        float _1675 = -_1661;
        float _1677 = _1675 + 1.0;
        _1669 = _1677;
    }
    float _1679 = _1669;
    float _1681 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1655);
    float _1683 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1685 = _1240 * 0.5;
    float _1687 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1345)
    {
        _1673 = _1679;
    }
    float _1689 = _1673;
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1693 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1681);
    float _1695 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1697 = _1282 + _1240;
    float _1699 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1701 = _1693 + _1240;
    float _1703 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1705 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = -_1667;
    float _1709 = _1707 + 1.0;
    float _1711 = _1699 * _1649;
    float _1713 = _1701 * 0.5;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1717 = _1697 * 0.5;
    float _1719 = fma(_1284, -0.5, _1685);
    float _1721 = _1695 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1723 = -_1715;
    float _1725 = _1723 + 1.0;
    float _1727 = _1639 * _1691;
    out.m_63.x = _1687;
    out.m_63.y = _1703;
    out.m_63.z = _1705;
    out.m_65.x = _1663;
    out.m_65.y = _1665;
    out.m_65.z = _1711;
    out.m_65.w = _1727;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1284;
    out.gl_Position.z = _1693;
    out.gl_Position.w = _1240;
    out.m_67.x = _1717;
    out.m_67.y = _1719;
    out.m_67.z = _1713;
    out.m_67.w = _1240;
    out.m_45.x = _1721;
    float _1729 = _1715 * _1298;
    float _1731 = _1313 * _1729;
    float _1733 = _1313 * _1725;
    float _1735 = _1323 * _1729;
    float _1737 = fma(_1319, _1731, _1307);
    float _1739 = fma(_1321, _1731, _1309);
    float _1741 = fma(_1313, _1735, _1311);
    out.m_69.x = _1737;
    out.m_69.y = _1739;
    out.m_69.z = _1741;
    out.m_69.w = _1733;
    if (_1611)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1743;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

