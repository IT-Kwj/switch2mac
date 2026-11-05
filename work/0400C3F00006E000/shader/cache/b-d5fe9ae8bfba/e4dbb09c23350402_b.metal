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
    float4 m_67 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _706 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    float _114 = _112;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2616 = as_type<float>(_120);
        out.gl_Position.z = _2616;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_102);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2686 = as_type<float>(_158);
        out.gl_Position.z = _2686;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_49.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _284 = _276;
    float _302;
    if (!_282)
    {
        float _286 = in.m_51.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_102);
        float _308 = 1.0 / _306;
        float _310 = _138 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _330 = 1.0 / _316;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _324;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _312 + _348;
    float _352 = 1.0 / _328;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = _350 * _330;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _360 = _312 + _358;
    bool _362 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _364 = isnan(_312);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _312 + _376;
    float _380 = 1.0 / _338;
    bool _382 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _384 = isnan(_312);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = _378 * _340;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _398 = _312 + _396;
    bool _400 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _402 = isnan(_312);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = 1.0 / _320;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _416 = _312 + _414;
    float _418 = _416 * _352;
    float _420 = 1.0 / _334;
    float _422 = _398 * _380;
    bool _424 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _426 = isnan(_312);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = fma(_438, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _444 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _446 = isnan(_312);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _460 = _312 + _458;
    float _462 = _360 * _420;
    float _464 = -_410;
    float _466 = _464 + 1.0;
    out.m_53.x = _346;
    out.m_53.y = _374;
    out.m_53.z = _456;
    float _468 = _460 * _412;
    float _470 = _392 * _466;
    float _472 = -_392;
    float _474 = _472 + 1.0;
    float _476 = _434 * _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _486;
    float _490 = fma(_480, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _492 = fma(_484, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_488, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _496 = -_434;
    float _498 = _496 + 1.0;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -_454;
    float _510 = _508 + 1.0;
    float _512 = _454 * _498;
    bool _514 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _516 = isnan(_312);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = fma(_502, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _528 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _530 = isnan(_312);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _372 * _510;
    float _542 = -_372;
    float _544 = _542 + 1.0;
    float _546 = fma(_506, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = _538 * _544;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = _524 * _550;
    float _564 = -_524;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = fma(_556, _462, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _574 = _440 * _562;
    float _576 = _490 * _562;
    float _578 = _494 * _562;
    float _580 = fma(_560, _462, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _574);
    float _584 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    float _586 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _578);
    float _588 = fma(_526, _552, _582);
    float _590 = fma(_492, _552, _584);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _600 = fma(_570, _462, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _606 = fma(_546, _552, _586);
    float _608 = fma(_572, _540, _588);
    float _610 = fma(_594, _422, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _612 = fma(_598, _422, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _614 = fma(_580, _540, _590);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = fma(_604, _422, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _622;
    float _626 = fma(_600, _540, _606);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _628;
    float _632 = fma(_618, _468, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_610, _512, _608);
    float _636 = fma(_612, _512, _614);
    float _638 = fma(_624, _468, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _640 = fma(_620, _512, _626);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = fma(_630, _468, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_632, _476, _634);
    float _658 = fma(_644, _418, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _660 = fma(_648, _418, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = fma(_638, _476, _636);
    float _664 = fma(_654, _418, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _666 = fma(_650, _476, _640);
    float _668 = fma(_658, _470, _656);
    float _670 = fma(_660, _470, _662);
    float _672 = fma(_664, _470, _666);
    float _674 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].x, _668);
    float _676 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].y, _670);
    float _678 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].z, _672);
    bool _680 = !_344;
    int _682 = as_type<int>(_670);
    int _684 = as_type<int>(_664);
    float _686 = _644;
    float _704;
    if (!_680)
    {
        float _688 = in.m_51.x;
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _696 = _694 * _690;
        float _698 = floor(_696);
        float _700 = -_698;
        float _702 = _696 + _700;
        _704 = _702;
        _706 = true;
    }
    else
    {
        float _708 = float(_102);
        float _710 = 1.0 / _708;
        float _712 = _138 * _710;
        _110 = _708;
        _704 = _712;
    }
    _706 = false;
    float _714 = _110;
    float _716 = _704;
    float _718 = in.m_51.y;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _726 = _648;
    if (_722)
    {
        float _728 = in.m_51.x;
        _726 = _728;
    }
    float _730 = _726;
    if (_722)
    {
        _682 = 0;
    }
    int _732 = _682;
    int _734 = _732;
    if (_722)
    {
        _684 = 0;
    }
    int _736 = _684;
    float _738 = _714;
    int _740 = _736;
    if (_722)
    {
        float _742 = in.m_51.z;
        _738 = _742;
    }
    float _744 = _738;
    float _746 = _718 * 2.0;
    float _748 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _750 = fma(_748, -2.0, _724);
    float _752 = floor(_746);
    float _754 = _748;
    if (_722)
    {
        _754 = _718;
    }
    float _756 = _754;
    float _758 = _756;
    float _760 = _730;
    if (_722)
    {
        _686 = _730;
    }
    float _762 = _686;
    bool _764 = _752 >= 0.0;
    bool _766 = isnan(_752);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    bool _774 = _752 > 0.0;
    int _776 = _772 ? 0 : 1;
    int _778 = as_type<int>(_752);
    float _780 = _744;
    float _782 = _762;
    if (_722)
    {
        _778 = as_type<int>(_744);
    }
    int _784 = _778;
    int _786 = _784;
    if (!_722)
    {
        float _788 = in.m_51.x;
        float _790 = _718 * 3.1415927410125732421875;
        float _792 = in.m_51.z;
        float _794 = _790 * 0.15915493667125701904296875;
        float _796 = _794 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = _788 * 3.1415927410125732421875;
        float _802 = _800 * 0.15915493667125701904296875;
        float _804 = _792 * 3.1415927410125732421875;
        float _806 = _804 * 0.15915493667125701904296875;
        float _808 = _802 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = sin(_812);
        _780 = _792;
        _734 = 1;
        _758 = _798;
        _740 = 2;
        _760 = _788;
        _782 = _810;
        _786 = as_type<int>(_814);
    }
    float _816 = _780;
    int _818 = _734;
    float _820 = _758;
    int _822 = _740;
    float _824 = _760;
    float _826 = _782;
    int _828 = _786;
    float _830 = _816 * 2.0;
    bool _832 = _818 != 1;
    float _834 = _820 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _836 = _822 != 2;
    float _838 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _750);
    float _840 = floor(_830);
    int _842 = ~_776;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    float _862 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _864 = _846;
    if (!_774)
    {
        int _866 = ~_776;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _874 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _876 = -_848;
    float _878 = fma(_862, 2.0, _876);
    float _880 = -_872;
    float _882 = fma(_874, 2.0, _880);
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _886 = _824 + _816;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _892 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _884);
    float _894 = _886 + (-1.0);
    float _896 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[93].w, _888);
    bool _898 = !_832;
    float _900 = _898 ? _820 : _826;
    float _902 = fma(_834, -2.0, _890);
    bool _904 = !_832;
    float _906 = _904 ? as_type<float>(_828) : _820;
    float _908 = _718 + _824;
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _912 = _824 * 2.0;
    bool _914 = _840 > 0.0;
    float _916 = _908 + (-1.0);
    bool _918 = _840 >= 0.0;
    bool _920 = isnan(_840);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = floor(_912);
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _932 = -_138;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _940 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[98].z, _936);
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _944 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[98].w, _938);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _948 = _900 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _950 = _906 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _952 = _900;
    float _954 = _948;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _958 = _906;
    float _960 = as_type<float>(_870);
    bool _962 = _914;
    if (!_832)
    {
        _952 = _824;
    }
    float _964 = _952;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _968 = -_942;
    float _970 = fma(_948, 2.0, _968);
    float _972 = fma(_950, -2.0, _946);
    float _974 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _892);
    float _976 = _964;
    if (!_832)
    {
        _954 = _718;
    }
    float _978 = _954;
    float _980 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _896);
    float _982 = _978;
    if (_832)
    {
        _976 = _816;
    }
    float _984 = _976;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (!_832)
    {
        _956 = _978;
    }
    float _988 = _956;
    float _990 = -_138;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[91].x, _882);
    float _994 = _988;
    if (_832)
    {
        _982 = _824;
    }
    float _996 = _982;
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[84].z, _986);
    bool _1000 = !_860;
    float _1002 = _1000 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1004 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _902);
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[83].z, _966);
    float _1008 = _1002;
    if (!_832)
    {
        _958 = _816;
    }
    float _1010 = _958;
    float _1012 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[97].z, _940);
    int _1014 = abs(as_type<int>(_1002));
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1018 = float(_870);
    float _1020 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[96].y, _972);
    float _1022 = _1010;
    if (!_832)
    {
        _960 = _1010;
    }
    float _1024 = _960;
    int _1026 = _926 ? 0 : 1;
    float _1028 = _1024;
    if (_832)
    {
        _1022 = _718;
    }
    float _1030 = _1022;
    float _1032 = float(_1014);
    int _1034 = ~_1026;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1016);
    int _1042 = _1038;
    if (_832)
    {
        _994 = _824;
    }
    float _1044 = _994;
    float _1046 = _1032 * _1018;
    if (!_914)
    {
        int _1048 = ~_1026;
        int _1050 = _1048 + 1;
        _1042 = _1050;
    }
    int _1052 = _1042;
    float _1054 = in.m_55.x;
    float _1056 = in.m_55.y;
    float _1058 = in.m_55.z;
    bool _1060 = !_852;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1066 = _928 > 0.0;
    float _1068 = _1046 * (-2.0);
    int _1070 = abs(_1062);
    bool _1072 = _928 >= 0.0;
    bool _1074 = isnan(_928);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1084 = log2(_1082);
    float _1086 = fma(_910, _1068, _910);
    int _1088 = _1080 ? 0 : 1;
    float _1090 = _928;
    if (_832)
    {
        _1028 = _718;
    }
    float _1092 = _1028;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_836)
    {
        _1008 = _718;
    }
    float _1096 = _1008;
    float _1098 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1100 = ~_1088;
    int _1102 = _1100 + 1;
    int _1104 = _1102 + 1;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1108 = _1096;
    int _1110 = _1104;
    if (!_836)
    {
        _1108 = _824;
    }
    float _1112 = _1108;
    float _1114 = -_1094;
    float _1116 = fma(_1064, 2.0, _1114);
    float _1118 = fma(_1098, -2.0, _1106);
    if (!_1066)
    {
        int _1120 = ~_1088;
        int _1122 = _1120 + 1;
        _1110 = _1122;
    }
    int _1124 = _1110;
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_836)
    {
        _1090 = _824;
    }
    float _1130 = _1090;
    float _1132 = _1084 * _138;
    float _1134 = _1130;
    if (!_836)
    {
        _1134 = _816;
    }
    float _1136 = _1134;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1140 = float(_1070);
    float _1142 = fma(_1126, -2.0, _1128);
    float _1144 = _816 + (-0.5);
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1148 = fma(_1068, _1058, _1058);
    float _1150 = exp2(_1132);
    float _1152 = float(_1052);
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1158 = _1140 * _1152;
    float _1160 = -_1138;
    float _1162 = fma(_1146, 2.0, _1160);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1166 = 1.0 + _1164;
    float _1168 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1156);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1172 = !_856;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = 1.0 / _1166;
    float _1178 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1170);
    float _1180 = _1158 * (-2.0);
    bool _1182 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1184 = isnan(1.0);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1190 = _1186 || _1188;
    float _1192 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    int _1194 = abs(_1174);
    float _1196 = -_1150;
    float _1198 = _1196 + 1.0;
    bool _1200 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1208 = _1204 || _1206;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = float(_1194);
    float _1216 = fma(_1180, _1054, _1054);
    float _1218 = float(_1124);
    float _1220 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    float _1222 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1210);
    float _1224 = _1208 ? _1198 : 0.0;
    float _1226 = _718 + _816;
    float _1228 = _1214 * _1218;
    float _1230 = _824 + (-0.5);
    float _1232 = -_138;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[96].x, _970);
    float _1236 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1220);
    float _1238 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1168);
    float _1240 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1222);
    float _1242 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[97].w, _944);
    float _1244 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _998);
    float _1246 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1006);
    float _1248 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1040);
    float _1250 = -_138;
    float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1116);
    float _1254 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1118);
    float _1256 = -_138;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1162);
    float _1260 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1142);
    bool _1262 = _1190;
    int _1264 = as_type<int>(_1192);
    if (_1190)
    {
        float _1266 = _1224 * _1176;
        _140 = _1266;
    }
    float _1268 = _140;
    float _1270 = _1226 + (-1.0);
    float _1272 = _1228 * (-2.0);
    float _1274 = fma(_930, _1180, _930);
    float _1276 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1216);
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1280 = in.m_49.x;
    float _1282 = in.m_49.y;
    float _1284 = in.m_49.z;
    float _1286 = fma(_1272, _1056, _1056);
    float _1288 = _718 + (-0.5);
    float _1290 = fma(_1274, _1268, _1276);
    float _1292 = fma(_1278, _1272, _1278);
    float _1294 = in.m_57.x;
    float _1296 = in.m_57.y;
    float _1298 = in.m_57.z;
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1286);
    float _1302 = fma(_1086, _1268, _1154);
    float _1304 = _1290 * 0.15915493667125701904296875;
    float _1306 = fma(_1292, _1268, _1300);
    float _1308 = _1302 * 0.15915493667125701904296875;
    float _1310 = _1304 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1306 * 0.15915493667125701904296875;
    float _1316 = _1314 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _678 * _1284;
    float _1322 = _676 * _1282;
    float _1324 = _674 * _1280;
    float _1326 = _1314 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1296);
    float _1332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1298);
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1294);
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1342 = _1334 * _1330;
    float _1344 = _1308 * 6.283185482025146484375;
    float _1346 = cos(_1344);
    float _1348 = _1336 * _1332;
    float _1350 = _1312 * _1318;
    float _1352 = _1340 * _1338;
    float _1354 = _1304 * 6.283185482025146484375;
    float _1356 = sin(_1354);
    float _1358 = _1312 * _1328;
    float _1360 = _1308 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = _1312 * _1346;
    float _1366 = _1364 * _1342;
    float _1368 = _1356 * _1318;
    float _1370 = _1356 * _1328;
    float _1372 = _1356 * _1346;
    float _1374 = _1328 * _1346;
    float _1376 = _1318 * _1346;
    float _1378 = _1372 * _1342;
    float _1380 = fma(_1362, _1358, _1368);
    float _1382 = -_1350;
    float _1384 = fma(_1362, _1370, _1382);
    float _1386 = -_1370;
    float _1388 = fma(_1362, _1350, _1386);
    float _1390 = -_1342;
    float _1392 = _1362 * _1390;
    float _1394 = fma(_1380, _1352, _1366);
    float _1396 = fma(_1362, _1368, _1358);
    float _1398 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1400 = fma(_1374, _1352, _1392);
    float _1402 = fma(_1388, _1348, _1394);
    float _1404 = fma(_1384, _1352, _1378);
    float _1406 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1408 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1398);
    float _1410 = fma(_1376, _1348, _1400);
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1396, _1348, _1404);
    float _1416 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1406);
    float _1418 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1408);
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1424 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1416);
    float _1426 = _1418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1420);
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1434 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1428);
    float _1438 = _1426 + _1430;
    float _1440 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1434);
    float _1442 = _1432 + _1436;
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1446 = _1438 + _1444;
    float _1448 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1450 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1440);
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1454 = _1442 + _1452;
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1448);
    float _1460 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = fma(_1454, _1454, _1456);
    float _1464 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1458);
    float _1466 = sqrt(_1462);
    float _1468 = _1460 + _1464;
    bool _1470 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1460;
    float _1474 = _1438;
    float _1476 = _1414;
    if (!_1470)
    {
        _284 = _1442;
    }
    float _1478 = _284;
    float _1480 = _1478;
    if (!_1470)
    {
        _1472 = _1468;
    }
    float _1482 = _1472;
    bool _1484 = !_1470;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1466 + _1490;
        float _1494 = rsqrt(_1462);
        float _1496 = _1492 * _1488;
        float _1498 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = _1504 + (-1.0);
        float _1512 = fma(_1508, _1498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = _1494 * _1512;
        float _1518 = fma(_1468, _1504, _1514);
        float _1520 = fma(_1454, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1522 = fma(_1446, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1486 = _1518;
        _1480 = _1520;
        _1474 = _1522;
    }
    float _1524 = _1486;
    float _1526 = _1480;
    float _1528 = _1474;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1524 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1536 = _1526 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1528 + _1538;
    float _1542 = _1532 * _1532;
    float _1544 = fma(_1536, _1536, _1542);
    float _1546 = fma(_1540, _1540, _1544);
    float _1548 = rsqrt(_1546);
    float _1550 = sqrt(_1546);
    float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1536 * _1552;
    float _1556 = _1540 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1468;
    float _1574 = _1562;
    float _1576 = _1570;
    float _1578 = _1552;
    if (_1566)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1580;
    }
    float _1582 = _1572;
    if (_1566)
    {
        float _1584 = rsqrt(_1562);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1566)
    {
        float _1590 = _1570 * _1582;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1566)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1476 = _1594;
    }
    float _1596 = _1476;
    float _1598 = _1454;
    if (_1566)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1402;
    float _1612 = _1608;
    float _1614 = _1606;
    if (_1566)
    {
        float _1616 = _1596 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        _1610 = _1618;
    }
    float _1620 = _1610;
    float _1622 = -_1552;
    float _1624 = -_1608;
    float _1626 = fma(_1532, _1622, _1624);
    if (_1566)
    {
        float _1628 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1628;
    }
    float _1630 = _1612;
    float _1632 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = _1630;
    float _1636 = _1604;
    if (_1566)
    {
        float _1638 = fma(_1604, _1630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = _1640;
    if (!_1566)
    {
        _1636 = _1554;
    }
    float _1644 = _1636;
    float _1646 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1648 = _1644;
    float _1650 = _1620;
    if (_1566)
    {
        float _1652 = _1620 + (-1.0);
        _1614 = _1652;
    }
    float _1654 = _1614;
    float _1656 = 0.0;
    float _1658 = _1654;
    if (_1566)
    {
        float _1660 = _1586 * _1640;
        _1656 = _1660;
    }
    float _1662 = _1656;
    if (!_1566)
    {
        _1642 = _1626;
    }
    float _1664 = _1642;
    float _1666 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1668 = _1664;
    if (_1566)
    {
        float _1670 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1670;
    }
    float _1672 = _1578;
    if (_1566)
    {
        float _1674 = _1554 * _1662;
        _1648 = _1674;
    }
    float _1676 = _1648;
    if (!_1566)
    {
        _1658 = _1556;
    }
    float _1678 = _1658;
    float _1680 = _1678;
    if (_1566)
    {
        float _1682 = _1556 * _1662;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (!_1566)
    {
        _1588 = _1558;
    }
    float _1686 = _1588;
    float _1688 = _1686;
    if (_1566)
    {
        float _1690 = fma(_1626, _1620, _1672);
        _1668 = _1690;
    }
    float _1692 = _1668;
    if (_1566)
    {
        float _1694 = _1676 * _1676;
        _1688 = _1694;
    }
    float _1696 = _1688;
    if (!_1566)
    {
        _1650 = _1560;
    }
    float _1698 = _1650;
    float _1700 = _1698;
    if (_1566)
    {
        float _1702 = _1684 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    float _1706 = fma(_1692, _1692, _1696);
    float _1708 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = _1706 + _1704;
    float _1712 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1550, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1722 = rsqrt(_1710);
    float _1724 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1712);
    float _1728 = -_1718;
    float _1730 = _1728 + 1.0;
    float _1732 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1736 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1738 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1732);
    float _1740 = abs(_1730);
    float _1742 = log2(_1740);
    float _1744 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1734);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1738);
    float _1750 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1756 = _1722 * _1676;
    float _1758 = _1722 * _1692;
    float _1760 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1762 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1754);
    float _1764 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = _1722 * _1684;
    float _1768 = -_1750;
    float _1770 = fma(_1768, _1720, 1.0);
    float _1772 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1774 = -_1764;
    float _1776 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1774);
    float _1778 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1780 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1772);
    float _1782 = -_1766;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1776);
    float _1786 = exp2(_1778);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1790 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = fma(_1784, 0.5, 0.5);
    float _1796 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1788);
    float _1798 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1790);
    float _1800 = _1758 + 1.0;
    float _1802 = log2(_1770);
    float _1804 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1796);
    float _1806 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1810 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1812 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = fma(_1794, _1808, -0.212114393711090087890625);
    float _1816 = 1.0 / _1780;
    float _1818 = -_1758;
    float _1820 = fma(_1786, _1800, _1818);
    float _1822 = fma(_1794, _1814, 1.570728778839111328125);
    float _1824 = sqrt(_1792);
    float _1826 = _1802 * 0.693147182464599609375;
    float _1828 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1830 = _1810 * _1816;
    float _1832 = _1812 * _1816;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = fma(_1820, 0.5, 0.5);
    float _1840 = _1824 * 0.636619746685028076171875;
    float3 _5430 = float3(_1834, _1836, _1828);
    float _1842 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5430, float3(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5430, float3(0.0), isnan(_5430)), level(0.0)).x;
    float _1844 = -_1822;
    float _1846 = fma(_1840, _1844, 1.0);
    float3 _5446 = float3(_1834, _1836, _1828);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5446, float3(0.0), isnan(_5446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5446, float3(0.0), isnan(_5446)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _5463 = float2(_1846, _1838);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5463, float2(0.0), isnan(_5463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5463, float2(0.0), isnan(_5463)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = in.m_51.w;
    bool _1871 = _718 > 0.5;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1875 = _716 + _1873;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1879 = _1877 != 0;
    float _1881 = in.m_59.x;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1885 = _1883 != 0;
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1889 = in.m_59.y;
    float _1891 = _1244 * (-0.15915493667125701904296875);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1893;
    float _1897 = in.m_61.w;
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1903 = 1.0 / _1895;
    int _1905 = as_type<int>(_1786);
    if (_1879)
    {
        float _1907 = in.m_51.z;
        _1905 = as_type<int>(_1907);
    }
    int _1909 = _1905;
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1919;
    float _1923 = 0.0;
    if (_1885)
    {
        float _1925 = in.m_51.x;
        _1923 = _1925;
    }
    float _1927 = _1923;
    float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1931 = _1929 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1933 = _1869 > 0.5;
    float _1935 = 1.0 / _1901;
    float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1939 = _1937 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1941 = 0;
    float _1943 = _1881;
    if (_1879)
    {
        float _1945 = -_1881;
        float _1947 = _1945 + 1.0;
        _1941 = as_type<int>(_1947);
    }
    int _1949 = _1941;
    float _1951 = 0.0;
    if (!_1879)
    {
        _1951 = _1881;
    }
    float _1953 = _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1957 = _1955 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1959;
    float _1963 = 0.0;
    float _1965 = _1953;
    if (!_1885)
    {
        _1963 = _1881;
    }
    float _1967 = _1963;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1975 = _716 + _1973;
    out.m_63.w = _1897;
    int _1977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1979 = _1977 != 0;
    float _1981 = 1.0 / _1971;
    bool _1983 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1985 = isnan(_716);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    float _1995 = _1975 * _1935;
    int _1997 = _1909;
    float _1999 = _1967;
    if (_1879)
    {
        bool _2001 = as_type<float>(_1909) > 0.5;
        _962 = _2001;
    }
    bool _2003 = _962;
    if (_1885)
    {
        float _2005 = -_1881;
        float _2007 = _2005 + 1.0;
        _1997 = as_type<int>(_2007);
    }
    int _2009 = _1997;
    bool _2011 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2013 = isnan(_716);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2023;
    if (_1885)
    {
        bool _2027 = _1927 > 0.5;
        _1262 = _2027;
    }
    bool _2029 = _1262;
    float _2031 = -_1889;
    float _2033 = _2031 + 1.0;
    if (_1879)
    {
        float _2035 = _2003 ? as_type<float>(_1949) : _1881;
        _1965 = _2035;
    }
    float _2037 = _1965;
    float _2039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1885)
    {
        float _2041 = _2029 ? as_type<float>(_2009) : _1881;
        _1999 = _2041;
    }
    float _2043 = _1999;
    int _2045 = 0;
    if (_1979)
    {
        float _2047 = -_1881;
        float _2049 = _2047 + 1.0;
        _2045 = as_type<int>(_2049);
    }
    int _2051 = _2045;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2055 = _2053 != 0;
    float _2057 = fma(_1931, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _2059 = _1933 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2061 = _1875 * _1981;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2065 = _2063 != 0;
    float _2067 = 1.0 / _1961;
    float _2069 = _2055 ? as_type<float>(_2059) : _1889;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2073 = _716 + _2071;
    int _2075 = _1871 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2077 = fma(_1939, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _2079 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2081 = isnan(_716);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = _2073 * _1903;
    float _2093 = _2065 ? as_type<float>(_2075) : _1889;
    float _2095 = fma(_1957, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2099 = _716 + _2097;
    float _2101 = fma(_1913, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2103 = fma(_1917, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2105 = fma(_1921, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2107;
    bool _2111 = _1296 != 0.0;
    bool _2113 = isnan(_1296);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan(0.0);
    bool _2119 = _2115 || _2117;
    float _2121 = -_2089;
    float _2123 = _2121 + 1.0;
    float _2125 = _2099 * _2067;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2127;
    bool _2131 = _1294 == 0.0;
    bool _2133 = !_2119;
    bool _2135 = _2131 && _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2141 = fma(_2025, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2143 = fma(_2129, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2145 = fma(_2109, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _2147 = _1298 == 0.0;
    bool _2149 = _2147 && _2135;
    float _2151 = in.m_65.x;
    float _2153 = in.m_65.y;
    float _2155 = in.m_65.z;
    float _2157 = 0.0;
    int _2159 = as_type<int>(_2103);
    if (!_1979)
    {
        _2157 = _1881;
    }
    float _2161 = _2157;
    float _2163 = _1993 * _2123;
    float _2165 = _2161;
    if (_1979)
    {
        float _2167 = _1871 ? as_type<float>(_2051) : _1881;
        _2165 = _2167;
    }
    float _2169 = _2165;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2177 = _2175 != 0;
    float _2179 = -_1993;
    float _2181 = _2179 + 1.0;
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2187 = fma(_2139, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2189 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2191 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2193 = isnan(_716);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    float _2203 = fma(_2173, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2205 = -_2021;
    float _2207 = _2205 + 1.0;
    float _2209 = _2021 * _2181;
    float _2211 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2213 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2215 = isnan(_716);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2201 * _2207;
    float _2227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2229 = -_2201;
    float _2231 = _2229 + 1.0;
    float _2233 = fma(_2211, _2093, -0.5);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2237 = _2235 != 0;
    float _2239 = fma(_2185, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2243 = _2241 != 0;
    float _2245 = -_838;
    float _2247 = fma(_1192, _2233, _2245);
    float _2249 = _2151;
    float _2251 = _2155;
    float _2253 = _2153;
    if (!_2149)
    {
        float _2255 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2151);
        _2249 = _2255;
    }
    float _2257 = _2249;
    if (!_2149)
    {
        float _2259 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2155);
        _2251 = _2259;
    }
    float _2261 = _2251;
    float _2263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_2149)
    {
        float _2265 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2153);
        _2253 = _2265;
    }
    float _2267 = _2253;
    bool _2269 = _816 > 0.5;
    float _2271 = _2223 * _2231;
    float _2273 = _2271;
    if (_2177)
    {
        float _2275 = -_1881;
        float _2277 = _2275 + 1.0;
        _1264 = as_type<int>(_2277);
    }
    int _2279 = _1264;
    float _2281 = -_2223;
    float _2283 = _2281 + 1.0;
    int _2285 = _2269 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2287 = _2101 * _2271;
    float _2289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2291 = _2103 * _2271;
    float _2293 = _2105 * _2271;
    if (!_2177)
    {
        _2273 = _1881;
    }
    float _2295 = _2273;
    float _2297 = _2295;
    if (_2237)
    {
        float _2299 = -_1881;
        float _2301 = _2299 + 1.0;
        _2159 = as_type<int>(_2301);
    }
    int _2303 = _2159;
    if (_2177)
    {
        float _2305 = _1871 ? as_type<float>(_2279) : _1881;
        _2297 = _2305;
    }
    float _2307 = _2297;
    float _2309 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2287);
    float _2311 = _2227 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2315 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2317 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2291);
    float _2319 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2293);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2323 = _2321 != 0;
    float _2325 = fma(_2315, _2307, -0.5);
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2329 = _2327 != 0;
    float _2331 = fma(_2057, _2225, _2309);
    float _2333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2335 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2337 = _2243 ? as_type<float>(_2285) : _1889;
    float _2339 = fma(_2077, _2225, _2317);
    if (_2237)
    {
        float _2341 = _1871 ? as_type<float>(_2303) : _1881;
        _1943 = _2341;
    }
    float _2343 = _1943;
    float _2345 = fma(_2095, _2225, _2319);
    float _2347 = fma(_974, _2325, _992);
    float _2349 = _2323 ? as_type<float>(_2285) : _1889;
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2353 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2355 = fma(_2335, _2343, -0.5);
    float _2357 = fma(_2143, _2209, _2331);
    float _2359 = fma(_2141, _2209, _2339);
    float _2361 = fma(_2353, _2337, -0.5);
    float _2363 = fma(_2145, _2209, _2345);
    float _2365 = _2329 ? as_type<float>(_2285) : _1889;
    float _2367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2369 = -_1004;
    float _2371 = fma(_980, _2361, _2369);
    float _2373 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2375 = fma(_2187, _2163, _2357);
    float _2377 = fma(_2203, _2163, _2359);
    float _2379 = fma(_2239, _2163, _2363);
    float _2381 = fma(_2373, _2043, -0.5);
    float _2383 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].x, _2375);
    float _2385 = _1891 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2391 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].y, _2377);
    float _2393 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].z, _2379);
    float _2395 = fma(_2189, _2069, -0.5);
    float _2397 = fma(_1238, _2381, _934);
    float _2399 = _1364 * _2267;
    float _2401 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2405 = _2367 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2407 = fma(_2389, _2365, -0.5);
    float _2409 = _2347 + 0.5;
    float _2411 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2413 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = _2393 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2417 = _1891 * 6.283185482025146484375;
    float _2419 = cos(_2417);
    float _2421 = fma(_1012, _2355, _1234);
    float _2423 = fma(_2405, _2037, -0.5);
    float _2425 = _2387 * _2395;
    float _2427 = -_2267;
    float _2429 = _1362 * _2427;
    float _2431 = fma(_1380, _2257, _2399);
    float _2433 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2437 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2439 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2441 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = exp2(_2401);
    float _2445 = _2403 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2447 = _1372 * _2267;
    float _2449 = fma(_1374, _2257, _2429);
    float _2451 = fma(_1388, _2261, _2431);
    float _2453 = _2419 * _2395;
    float _2455 = -_2425;
    float _2457 = fma(_2419, _2423, _2455);
    float _2459 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2433);
    float _2461 = fma(_2445, _2349, -0.5);
    out.m_67.x = _2437;
    out.m_67.y = _2439;
    out.m_67.z = _2441;
    out.m_67.w = _2435;
    float _2463 = fma(_2387, _2423, _2453);
    float _2465 = fma(_1246, _2457, _1252);
    float _2467 = fma(_1384, _2257, _2447);
    float _2469 = fma(_1376, _2261, _2449);
    float _2471 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2473 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2475 = -_1260;
    float _2477 = fma(_1236, _2461, _2475);
    float _2479 = fma(_1396, _2261, _2467);
    float _2481 = -_2443;
    float _2483 = _2481 + 1.0;
    float _2485 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2473);
    float _2487 = _2477 + 0.5;
    float _2489 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2491 = fma(_2311, _2169, -0.5);
    float _2493 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2495 = -_1254;
    float _2497 = fma(_1248, _2463, _2495);
    float _2499 = _2465 + 0.5;
    float _2501 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2471);
    float _2503 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2493);
    float _2505 = _2247 + 0.5;
    float _2507 = _2397 + 0.5;
    float _2509 = _2497 + 0.5;
    float _2511 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2503);
    float _2513 = _2501 + _1780;
    float _2515 = -_1020;
    float _2517 = fma(_1242, _2407, _2515);
    float _2519 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2489);
    out.m_69.x = _2507;
    out.m_69.y = _2505;
    out.m_69.z = _2499;
    out.m_69.w = _2509;
    float _2521 = _2513 * 0.5;
    float _2523 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2525 = fma(_1240, _2491, _1258);
    float _2527 = _2517 + 0.5;
    float _2529 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2519);
    float _2531 = _2371 + 0.5;
    float _2533 = _2421 + 0.5;
    float _2535 = _2525 + 0.5;
    float _2537 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2485);
    out.m_71.x = _2409;
    out.m_71.y = _2531;
    float _2539 = -_2523;
    float _2541 = _2539 + 1.0;
    float _2543 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2533;
    out.m_73.y = _2527;
    out.m_75.x = _2535;
    out.m_75.y = _2487;
    out.m_77.x = _2511;
    out.m_77.y = _2537;
    out.m_77.z = _2529;
    out.m_79.x = _1536;
    out.m_79.y = _1532;
    out.m_79.z = _1540;
    out.gl_Position.x = _1810;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _2501;
    out.gl_Position.w = _1780;
    out.m_81.z = _2521;
    out.m_81.w = _1780;
    out.m_45.x = _2543;
    float _2545 = _2523 * _1842;
    float _2547 = _1857 * _2545;
    float _2549 = _1867 * _2545;
    float _2551 = fma(_1863, _2547, _1851);
    float _2553 = fma(_1865, _2547, _1853);
    float _2555 = _1857 * _2541;
    float _2557 = fma(_1857, _2549, _1855);
    out.m_83.x = _2551;
    out.m_83.y = _2553;
    out.m_83.z = _2557;
    out.m_83.w = _2555;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _706 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    float _114 = _112;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2616 = as_type<float>(_120);
        out.gl_Position.z = _2616;
    }
    if (!_106)
    {
        return out;
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_102);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2686 = as_type<float>(_158);
        out.gl_Position.z = _2686;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_49.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _284 = _276;
    float _302;
    if (!_282)
    {
        float _286 = in.m_51.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_102);
        float _308 = 1.0 / _306;
        float _310 = _138 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _330 = 1.0 / _316;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _324;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _312 + _348;
    float _352 = 1.0 / _328;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = _350 * _330;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _360 = _312 + _358;
    bool _362 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _364 = isnan(_312);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _312 + _376;
    float _380 = 1.0 / _338;
    bool _382 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _384 = isnan(_312);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = _378 * _340;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _398 = _312 + _396;
    bool _400 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _402 = isnan(_312);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = 1.0 / _320;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _416 = _312 + _414;
    float _418 = _416 * _352;
    float _420 = 1.0 / _334;
    float _422 = _398 * _380;
    bool _424 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _426 = isnan(_312);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = fma(_438, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _444 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _446 = isnan(_312);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _460 = _312 + _458;
    float _462 = _360 * _420;
    float _464 = -_410;
    float _466 = _464 + 1.0;
    out.m_53.x = _346;
    out.m_53.y = _374;
    out.m_53.z = _456;
    float _468 = _460 * _412;
    float _470 = _392 * _466;
    float _472 = -_392;
    float _474 = _472 + 1.0;
    float _476 = _434 * _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _486;
    float _490 = fma(_480, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _492 = fma(_484, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_488, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _496 = -_434;
    float _498 = _496 + 1.0;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -_454;
    float _510 = _508 + 1.0;
    float _512 = _454 * _498;
    bool _514 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _516 = isnan(_312);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = fma(_502, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _528 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _530 = isnan(_312);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _372 * _510;
    float _542 = -_372;
    float _544 = _542 + 1.0;
    float _546 = fma(_506, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = _538 * _544;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = _524 * _550;
    float _564 = -_524;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = fma(_556, _462, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _574 = _440 * _562;
    float _576 = _490 * _562;
    float _578 = _494 * _562;
    float _580 = fma(_560, _462, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _574);
    float _584 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    float _586 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _578);
    float _588 = fma(_526, _552, _582);
    float _590 = fma(_492, _552, _584);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _600 = fma(_570, _462, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _606 = fma(_546, _552, _586);
    float _608 = fma(_572, _540, _588);
    float _610 = fma(_594, _422, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _612 = fma(_598, _422, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _614 = fma(_580, _540, _590);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = fma(_604, _422, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _622;
    float _626 = fma(_600, _540, _606);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _628;
    float _632 = fma(_618, _468, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_610, _512, _608);
    float _636 = fma(_612, _512, _614);
    float _638 = fma(_624, _468, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _640 = fma(_620, _512, _626);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = fma(_630, _468, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_632, _476, _634);
    float _658 = fma(_644, _418, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _660 = fma(_648, _418, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = fma(_638, _476, _636);
    float _664 = fma(_654, _418, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _666 = fma(_650, _476, _640);
    float _668 = fma(_658, _470, _656);
    float _670 = fma(_660, _470, _662);
    float _672 = fma(_664, _470, _666);
    float _674 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].x, _668);
    float _676 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].y, _670);
    float _678 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].z, _672);
    bool _680 = !_344;
    int _682 = as_type<int>(_670);
    int _684 = as_type<int>(_664);
    float _686 = _644;
    float _704;
    if (!_680)
    {
        float _688 = in.m_51.x;
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _696 = _694 * _690;
        float _698 = floor(_696);
        float _700 = -_698;
        float _702 = _696 + _700;
        _704 = _702;
        _706 = true;
    }
    else
    {
        float _708 = float(_102);
        float _710 = 1.0 / _708;
        float _712 = _138 * _710;
        _110 = _708;
        _704 = _712;
    }
    _706 = false;
    float _714 = _110;
    float _716 = _704;
    float _718 = in.m_51.y;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _726 = _648;
    if (_722)
    {
        float _728 = in.m_51.x;
        _726 = _728;
    }
    float _730 = _726;
    if (_722)
    {
        _682 = 0;
    }
    int _732 = _682;
    int _734 = _732;
    if (_722)
    {
        _684 = 0;
    }
    int _736 = _684;
    float _738 = _714;
    int _740 = _736;
    if (_722)
    {
        float _742 = in.m_51.z;
        _738 = _742;
    }
    float _744 = _738;
    float _746 = _718 * 2.0;
    float _748 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _750 = fma(_748, -2.0, _724);
    float _752 = floor(_746);
    float _754 = _748;
    if (_722)
    {
        _754 = _718;
    }
    float _756 = _754;
    float _758 = _756;
    float _760 = _730;
    if (_722)
    {
        _686 = _730;
    }
    float _762 = _686;
    bool _764 = _752 >= 0.0;
    bool _766 = isnan(_752);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    bool _774 = _752 > 0.0;
    int _776 = _772 ? 0 : 1;
    int _778 = as_type<int>(_752);
    float _780 = _744;
    float _782 = _762;
    if (_722)
    {
        _778 = as_type<int>(_744);
    }
    int _784 = _778;
    int _786 = _784;
    if (!_722)
    {
        float _788 = in.m_51.x;
        float _790 = _718 * 3.1415927410125732421875;
        float _792 = in.m_51.z;
        float _794 = _790 * 0.15915493667125701904296875;
        float _796 = _794 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = _788 * 3.1415927410125732421875;
        float _802 = _800 * 0.15915493667125701904296875;
        float _804 = _792 * 3.1415927410125732421875;
        float _806 = _804 * 0.15915493667125701904296875;
        float _808 = _802 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = sin(_812);
        _780 = _792;
        _734 = 1;
        _758 = _798;
        _740 = 2;
        _760 = _788;
        _782 = _810;
        _786 = as_type<int>(_814);
    }
    float _816 = _780;
    int _818 = _734;
    float _820 = _758;
    int _822 = _740;
    float _824 = _760;
    float _826 = _782;
    int _828 = _786;
    float _830 = _816 * 2.0;
    bool _832 = _818 != 1;
    float _834 = _820 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _836 = _822 != 2;
    float _838 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _750);
    float _840 = floor(_830);
    int _842 = ~_776;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    float _862 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _864 = _846;
    if (!_774)
    {
        int _866 = ~_776;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _874 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _876 = -_848;
    float _878 = fma(_862, 2.0, _876);
    float _880 = -_872;
    float _882 = fma(_874, 2.0, _880);
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _886 = _824 + _816;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _892 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _884);
    float _894 = _886 + (-1.0);
    float _896 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[93].w, _888);
    bool _898 = !_832;
    float _900 = _898 ? _820 : _826;
    float _902 = fma(_834, -2.0, _890);
    bool _904 = !_832;
    float _906 = _904 ? as_type<float>(_828) : _820;
    float _908 = _718 + _824;
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _912 = _824 * 2.0;
    bool _914 = _840 > 0.0;
    float _916 = _908 + (-1.0);
    bool _918 = _840 >= 0.0;
    bool _920 = isnan(_840);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = floor(_912);
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _932 = -_138;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _940 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[98].z, _936);
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _944 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[98].w, _938);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _948 = _900 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _950 = _906 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _952 = _900;
    float _954 = _948;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _958 = _906;
    float _960 = as_type<float>(_870);
    bool _962 = _914;
    if (!_832)
    {
        _952 = _824;
    }
    float _964 = _952;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _968 = -_942;
    float _970 = fma(_948, 2.0, _968);
    float _972 = fma(_950, -2.0, _946);
    float _974 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _892);
    float _976 = _964;
    if (!_832)
    {
        _954 = _718;
    }
    float _978 = _954;
    float _980 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _896);
    float _982 = _978;
    if (_832)
    {
        _976 = _816;
    }
    float _984 = _976;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (!_832)
    {
        _956 = _978;
    }
    float _988 = _956;
    float _990 = -_138;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[91].x, _882);
    float _994 = _988;
    if (_832)
    {
        _982 = _824;
    }
    float _996 = _982;
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[84].z, _986);
    bool _1000 = !_860;
    float _1002 = _1000 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1004 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _902);
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[83].z, _966);
    float _1008 = _1002;
    if (!_832)
    {
        _958 = _816;
    }
    float _1010 = _958;
    float _1012 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[97].z, _940);
    int _1014 = abs(as_type<int>(_1002));
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1018 = float(_870);
    float _1020 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[96].y, _972);
    float _1022 = _1010;
    if (!_832)
    {
        _960 = _1010;
    }
    float _1024 = _960;
    int _1026 = _926 ? 0 : 1;
    float _1028 = _1024;
    if (_832)
    {
        _1022 = _718;
    }
    float _1030 = _1022;
    float _1032 = float(_1014);
    int _1034 = ~_1026;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1016);
    int _1042 = _1038;
    if (_832)
    {
        _994 = _824;
    }
    float _1044 = _994;
    float _1046 = _1032 * _1018;
    if (!_914)
    {
        int _1048 = ~_1026;
        int _1050 = _1048 + 1;
        _1042 = _1050;
    }
    int _1052 = _1042;
    float _1054 = in.m_55.x;
    float _1056 = in.m_55.y;
    float _1058 = in.m_55.z;
    bool _1060 = !_852;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1066 = _928 > 0.0;
    float _1068 = _1046 * (-2.0);
    int _1070 = abs(_1062);
    bool _1072 = _928 >= 0.0;
    bool _1074 = isnan(_928);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1084 = log2(_1082);
    float _1086 = fma(_910, _1068, _910);
    int _1088 = _1080 ? 0 : 1;
    float _1090 = _928;
    if (_832)
    {
        _1028 = _718;
    }
    float _1092 = _1028;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_836)
    {
        _1008 = _718;
    }
    float _1096 = _1008;
    float _1098 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1100 = ~_1088;
    int _1102 = _1100 + 1;
    int _1104 = _1102 + 1;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1108 = _1096;
    int _1110 = _1104;
    if (!_836)
    {
        _1108 = _824;
    }
    float _1112 = _1108;
    float _1114 = -_1094;
    float _1116 = fma(_1064, 2.0, _1114);
    float _1118 = fma(_1098, -2.0, _1106);
    if (!_1066)
    {
        int _1120 = ~_1088;
        int _1122 = _1120 + 1;
        _1110 = _1122;
    }
    int _1124 = _1110;
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_836)
    {
        _1090 = _824;
    }
    float _1130 = _1090;
    float _1132 = _1084 * _138;
    float _1134 = _1130;
    if (!_836)
    {
        _1134 = _816;
    }
    float _1136 = _1134;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1140 = float(_1070);
    float _1142 = fma(_1126, -2.0, _1128);
    float _1144 = _816 + (-0.5);
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1148 = fma(_1068, _1058, _1058);
    float _1150 = exp2(_1132);
    float _1152 = float(_1052);
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1158 = _1140 * _1152;
    float _1160 = -_1138;
    float _1162 = fma(_1146, 2.0, _1160);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1166 = 1.0 + _1164;
    float _1168 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1156);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1172 = !_856;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = 1.0 / _1166;
    float _1178 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1170);
    float _1180 = _1158 * (-2.0);
    bool _1182 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1184 = isnan(1.0);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1190 = _1186 || _1188;
    float _1192 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    int _1194 = abs(_1174);
    float _1196 = -_1150;
    float _1198 = _1196 + 1.0;
    bool _1200 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1208 = _1204 || _1206;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = float(_1194);
    float _1216 = fma(_1180, _1054, _1054);
    float _1218 = float(_1124);
    float _1220 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    float _1222 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1210);
    float _1224 = _1208 ? _1198 : 0.0;
    float _1226 = _718 + _816;
    float _1228 = _1214 * _1218;
    float _1230 = _824 + (-0.5);
    float _1232 = -_138;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[96].x, _970);
    float _1236 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1220);
    float _1238 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1168);
    float _1240 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1222);
    float _1242 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[97].w, _944);
    float _1244 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _998);
    float _1246 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1006);
    float _1248 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1040);
    float _1250 = -_138;
    float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1116);
    float _1254 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1118);
    float _1256 = -_138;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1162);
    float _1260 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1142);
    bool _1262 = _1190;
    int _1264 = as_type<int>(_1192);
    if (_1190)
    {
        float _1266 = _1224 * _1176;
        _140 = _1266;
    }
    float _1268 = _140;
    float _1270 = _1226 + (-1.0);
    float _1272 = _1228 * (-2.0);
    float _1274 = fma(_930, _1180, _930);
    float _1276 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1216);
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1280 = in.m_49.x;
    float _1282 = in.m_49.y;
    float _1284 = in.m_49.z;
    float _1286 = fma(_1272, _1056, _1056);
    float _1288 = _718 + (-0.5);
    float _1290 = fma(_1274, _1268, _1276);
    float _1292 = fma(_1278, _1272, _1278);
    float _1294 = in.m_57.x;
    float _1296 = in.m_57.y;
    float _1298 = in.m_57.z;
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1286);
    float _1302 = fma(_1086, _1268, _1154);
    float _1304 = _1290 * 0.15915493667125701904296875;
    float _1306 = fma(_1292, _1268, _1300);
    float _1308 = _1302 * 0.15915493667125701904296875;
    float _1310 = _1304 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1306 * 0.15915493667125701904296875;
    float _1316 = _1314 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _678 * _1284;
    float _1322 = _676 * _1282;
    float _1324 = _674 * _1280;
    float _1326 = _1314 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1296);
    float _1332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1298);
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1294);
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1342 = _1334 * _1330;
    float _1344 = _1308 * 6.283185482025146484375;
    float _1346 = cos(_1344);
    float _1348 = _1336 * _1332;
    float _1350 = _1312 * _1318;
    float _1352 = _1340 * _1338;
    float _1354 = _1304 * 6.283185482025146484375;
    float _1356 = sin(_1354);
    float _1358 = _1312 * _1328;
    float _1360 = _1308 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = _1312 * _1346;
    float _1366 = _1364 * _1342;
    float _1368 = _1356 * _1318;
    float _1370 = _1356 * _1328;
    float _1372 = _1356 * _1346;
    float _1374 = _1328 * _1346;
    float _1376 = _1318 * _1346;
    float _1378 = _1372 * _1342;
    float _1380 = fma(_1362, _1358, _1368);
    float _1382 = -_1350;
    float _1384 = fma(_1362, _1370, _1382);
    float _1386 = -_1370;
    float _1388 = fma(_1362, _1350, _1386);
    float _1390 = -_1342;
    float _1392 = _1362 * _1390;
    float _1394 = fma(_1380, _1352, _1366);
    float _1396 = fma(_1362, _1368, _1358);
    float _1398 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1400 = fma(_1374, _1352, _1392);
    float _1402 = fma(_1388, _1348, _1394);
    float _1404 = fma(_1384, _1352, _1378);
    float _1406 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1408 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1398);
    float _1410 = fma(_1376, _1348, _1400);
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1396, _1348, _1404);
    float _1416 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1406);
    float _1418 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1408);
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1424 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1416);
    float _1426 = _1418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1420);
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1434 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1428);
    float _1438 = _1426 + _1430;
    float _1440 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1434);
    float _1442 = _1432 + _1436;
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1446 = _1438 + _1444;
    float _1448 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1450 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1440);
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1454 = _1442 + _1452;
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1448);
    float _1460 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = fma(_1454, _1454, _1456);
    float _1464 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1458);
    float _1466 = sqrt(_1462);
    float _1468 = _1460 + _1464;
    bool _1470 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1460;
    float _1474 = _1438;
    float _1476 = _1414;
    if (!_1470)
    {
        _284 = _1442;
    }
    float _1478 = _284;
    float _1480 = _1478;
    if (!_1470)
    {
        _1472 = _1468;
    }
    float _1482 = _1472;
    bool _1484 = !_1470;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1466 + _1490;
        float _1494 = rsqrt(_1462);
        float _1496 = _1492 * _1488;
        float _1498 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = _1504 + (-1.0);
        float _1512 = fma(_1508, _1498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = _1494 * _1512;
        float _1518 = fma(_1468, _1504, _1514);
        float _1520 = fma(_1454, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1522 = fma(_1446, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1486 = _1518;
        _1480 = _1520;
        _1474 = _1522;
    }
    float _1524 = _1486;
    float _1526 = _1480;
    float _1528 = _1474;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1524 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1536 = _1526 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1528 + _1538;
    float _1542 = _1532 * _1532;
    float _1544 = fma(_1536, _1536, _1542);
    float _1546 = fma(_1540, _1540, _1544);
    float _1548 = rsqrt(_1546);
    float _1550 = sqrt(_1546);
    float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1536 * _1552;
    float _1556 = _1540 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1468;
    float _1574 = _1562;
    float _1576 = _1570;
    float _1578 = _1552;
    if (_1566)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1580;
    }
    float _1582 = _1572;
    if (_1566)
    {
        float _1584 = rsqrt(_1562);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1566)
    {
        float _1590 = _1570 * _1582;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1566)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1476 = _1594;
    }
    float _1596 = _1476;
    float _1598 = _1454;
    if (_1566)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1402;
    float _1612 = _1608;
    float _1614 = _1606;
    if (_1566)
    {
        float _1616 = _1596 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        _1610 = _1618;
    }
    float _1620 = _1610;
    float _1622 = -_1552;
    float _1624 = -_1608;
    float _1626 = fma(_1532, _1622, _1624);
    if (_1566)
    {
        float _1628 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1628;
    }
    float _1630 = _1612;
    float _1632 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = _1630;
    float _1636 = _1604;
    if (_1566)
    {
        float _1638 = fma(_1604, _1630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = _1640;
    if (!_1566)
    {
        _1636 = _1554;
    }
    float _1644 = _1636;
    float _1646 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1648 = _1644;
    float _1650 = _1620;
    if (_1566)
    {
        float _1652 = _1620 + (-1.0);
        _1614 = _1652;
    }
    float _1654 = _1614;
    float _1656 = 0.0;
    float _1658 = _1654;
    if (_1566)
    {
        float _1660 = _1586 * _1640;
        _1656 = _1660;
    }
    float _1662 = _1656;
    if (!_1566)
    {
        _1642 = _1626;
    }
    float _1664 = _1642;
    float _1666 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1668 = _1664;
    if (_1566)
    {
        float _1670 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1670;
    }
    float _1672 = _1578;
    if (_1566)
    {
        float _1674 = _1554 * _1662;
        _1648 = _1674;
    }
    float _1676 = _1648;
    if (!_1566)
    {
        _1658 = _1556;
    }
    float _1678 = _1658;
    float _1680 = _1678;
    if (_1566)
    {
        float _1682 = _1556 * _1662;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (!_1566)
    {
        _1588 = _1558;
    }
    float _1686 = _1588;
    float _1688 = _1686;
    if (_1566)
    {
        float _1690 = fma(_1626, _1620, _1672);
        _1668 = _1690;
    }
    float _1692 = _1668;
    if (_1566)
    {
        float _1694 = _1676 * _1676;
        _1688 = _1694;
    }
    float _1696 = _1688;
    if (!_1566)
    {
        _1650 = _1560;
    }
    float _1698 = _1650;
    float _1700 = _1698;
    if (_1566)
    {
        float _1702 = _1684 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    float _1706 = fma(_1692, _1692, _1696);
    float _1708 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = _1706 + _1704;
    float _1712 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1550, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1722 = rsqrt(_1710);
    float _1724 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1712);
    float _1728 = -_1718;
    float _1730 = _1728 + 1.0;
    float _1732 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1736 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1738 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1732);
    float _1740 = abs(_1730);
    float _1742 = log2(_1740);
    float _1744 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1734);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1738);
    float _1750 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1756 = _1722 * _1676;
    float _1758 = _1722 * _1692;
    float _1760 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1762 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1754);
    float _1764 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = _1722 * _1684;
    float _1768 = -_1750;
    float _1770 = fma(_1768, _1720, 1.0);
    float _1772 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1774 = -_1764;
    float _1776 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1774);
    float _1778 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1780 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1772);
    float _1782 = -_1766;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1776);
    float _1786 = exp2(_1778);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1790 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = fma(_1784, 0.5, 0.5);
    float _1796 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1788);
    float _1798 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1790);
    float _1800 = _1758 + 1.0;
    float _1802 = log2(_1770);
    float _1804 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1796);
    float _1806 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1810 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1812 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = fma(_1794, _1808, -0.212114393711090087890625);
    float _1816 = 1.0 / _1780;
    float _1818 = -_1758;
    float _1820 = fma(_1786, _1800, _1818);
    float _1822 = fma(_1794, _1814, 1.570728778839111328125);
    float _1824 = sqrt(_1792);
    float _1826 = _1802 * 0.693147182464599609375;
    float _1828 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1830 = _1810 * _1816;
    float _1832 = _1812 * _1816;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = fma(_1820, 0.5, 0.5);
    float _1840 = _1824 * 0.636619746685028076171875;
    float3 _5430 = float3(_1834, _1836, _1828);
    float _1842 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5430, float3(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5430, float3(0.0), isnan(_5430)), level(0.0)).x;
    float _1844 = -_1822;
    float _1846 = fma(_1840, _1844, 1.0);
    float3 _5446 = float3(_1834, _1836, _1828);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5446, float3(0.0), isnan(_5446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5446, float3(0.0), isnan(_5446)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _5463 = float2(_1846, _1838);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5463, float2(0.0), isnan(_5463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5463, float2(0.0), isnan(_5463)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = in.m_51.w;
    bool _1871 = _718 > 0.5;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1875 = _716 + _1873;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1879 = _1877 != 0;
    float _1881 = in.m_59.x;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1885 = _1883 != 0;
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1889 = in.m_59.y;
    float _1891 = _1244 * (-0.15915493667125701904296875);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1893;
    float _1897 = in.m_61.w;
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1903 = 1.0 / _1895;
    int _1905 = as_type<int>(_1786);
    if (_1879)
    {
        float _1907 = in.m_51.z;
        _1905 = as_type<int>(_1907);
    }
    int _1909 = _1905;
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1919;
    float _1923 = 0.0;
    if (_1885)
    {
        float _1925 = in.m_51.x;
        _1923 = _1925;
    }
    float _1927 = _1923;
    float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1931 = _1929 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1933 = _1869 > 0.5;
    float _1935 = 1.0 / _1901;
    float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1939 = _1937 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1941 = 0;
    float _1943 = _1881;
    if (_1879)
    {
        float _1945 = -_1881;
        float _1947 = _1945 + 1.0;
        _1941 = as_type<int>(_1947);
    }
    int _1949 = _1941;
    float _1951 = 0.0;
    if (!_1879)
    {
        _1951 = _1881;
    }
    float _1953 = _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1957 = _1955 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1959;
    float _1963 = 0.0;
    float _1965 = _1953;
    if (!_1885)
    {
        _1963 = _1881;
    }
    float _1967 = _1963;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1975 = _716 + _1973;
    out.m_63.w = _1897;
    int _1977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1979 = _1977 != 0;
    float _1981 = 1.0 / _1971;
    bool _1983 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1985 = isnan(_716);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    float _1995 = _1975 * _1935;
    int _1997 = _1909;
    float _1999 = _1967;
    if (_1879)
    {
        bool _2001 = as_type<float>(_1909) > 0.5;
        _962 = _2001;
    }
    bool _2003 = _962;
    if (_1885)
    {
        float _2005 = -_1881;
        float _2007 = _2005 + 1.0;
        _1997 = as_type<int>(_2007);
    }
    int _2009 = _1997;
    bool _2011 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2013 = isnan(_716);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2023;
    if (_1885)
    {
        bool _2027 = _1927 > 0.5;
        _1262 = _2027;
    }
    bool _2029 = _1262;
    float _2031 = -_1889;
    float _2033 = _2031 + 1.0;
    if (_1879)
    {
        float _2035 = _2003 ? as_type<float>(_1949) : _1881;
        _1965 = _2035;
    }
    float _2037 = _1965;
    float _2039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1885)
    {
        float _2041 = _2029 ? as_type<float>(_2009) : _1881;
        _1999 = _2041;
    }
    float _2043 = _1999;
    int _2045 = 0;
    if (_1979)
    {
        float _2047 = -_1881;
        float _2049 = _2047 + 1.0;
        _2045 = as_type<int>(_2049);
    }
    int _2051 = _2045;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2055 = _2053 != 0;
    float _2057 = fma(_1931, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _2059 = _1933 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2061 = _1875 * _1981;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2065 = _2063 != 0;
    float _2067 = 1.0 / _1961;
    float _2069 = _2055 ? as_type<float>(_2059) : _1889;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2073 = _716 + _2071;
    int _2075 = _1871 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2077 = fma(_1939, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _2079 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2081 = isnan(_716);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = _2073 * _1903;
    float _2093 = _2065 ? as_type<float>(_2075) : _1889;
    float _2095 = fma(_1957, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2099 = _716 + _2097;
    float _2101 = fma(_1913, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2103 = fma(_1917, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2105 = fma(_1921, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2107;
    bool _2111 = _1296 != 0.0;
    bool _2113 = isnan(_1296);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan(0.0);
    bool _2119 = _2115 || _2117;
    float _2121 = -_2089;
    float _2123 = _2121 + 1.0;
    float _2125 = _2099 * _2067;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2127;
    bool _2131 = _1294 == 0.0;
    bool _2133 = !_2119;
    bool _2135 = _2131 && _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2141 = fma(_2025, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2143 = fma(_2129, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2145 = fma(_2109, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _2147 = _1298 == 0.0;
    bool _2149 = _2147 && _2135;
    float _2151 = in.m_65.x;
    float _2153 = in.m_65.y;
    float _2155 = in.m_65.z;
    float _2157 = 0.0;
    int _2159 = as_type<int>(_2103);
    if (!_1979)
    {
        _2157 = _1881;
    }
    float _2161 = _2157;
    float _2163 = _1993 * _2123;
    float _2165 = _2161;
    if (_1979)
    {
        float _2167 = _1871 ? as_type<float>(_2051) : _1881;
        _2165 = _2167;
    }
    float _2169 = _2165;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2177 = _2175 != 0;
    float _2179 = -_1993;
    float _2181 = _2179 + 1.0;
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2187 = fma(_2139, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2189 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2191 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2193 = isnan(_716);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    float _2203 = fma(_2173, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2205 = -_2021;
    float _2207 = _2205 + 1.0;
    float _2209 = _2021 * _2181;
    float _2211 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2213 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2215 = isnan(_716);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2201 * _2207;
    float _2227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2229 = -_2201;
    float _2231 = _2229 + 1.0;
    float _2233 = fma(_2211, _2093, -0.5);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2237 = _2235 != 0;
    float _2239 = fma(_2185, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2243 = _2241 != 0;
    float _2245 = -_838;
    float _2247 = fma(_1192, _2233, _2245);
    float _2249 = _2151;
    float _2251 = _2155;
    float _2253 = _2153;
    if (!_2149)
    {
        float _2255 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2151);
        _2249 = _2255;
    }
    float _2257 = _2249;
    if (!_2149)
    {
        float _2259 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2155);
        _2251 = _2259;
    }
    float _2261 = _2251;
    float _2263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_2149)
    {
        float _2265 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2153);
        _2253 = _2265;
    }
    float _2267 = _2253;
    bool _2269 = _816 > 0.5;
    float _2271 = _2223 * _2231;
    float _2273 = _2271;
    if (_2177)
    {
        float _2275 = -_1881;
        float _2277 = _2275 + 1.0;
        _1264 = as_type<int>(_2277);
    }
    int _2279 = _1264;
    float _2281 = -_2223;
    float _2283 = _2281 + 1.0;
    int _2285 = _2269 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2287 = _2101 * _2271;
    float _2289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2291 = _2103 * _2271;
    float _2293 = _2105 * _2271;
    if (!_2177)
    {
        _2273 = _1881;
    }
    float _2295 = _2273;
    float _2297 = _2295;
    if (_2237)
    {
        float _2299 = -_1881;
        float _2301 = _2299 + 1.0;
        _2159 = as_type<int>(_2301);
    }
    int _2303 = _2159;
    if (_2177)
    {
        float _2305 = _1871 ? as_type<float>(_2279) : _1881;
        _2297 = _2305;
    }
    float _2307 = _2297;
    float _2309 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2287);
    float _2311 = _2227 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2315 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2317 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2291);
    float _2319 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2293);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2323 = _2321 != 0;
    float _2325 = fma(_2315, _2307, -0.5);
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2329 = _2327 != 0;
    float _2331 = fma(_2057, _2225, _2309);
    float _2333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2335 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2337 = _2243 ? as_type<float>(_2285) : _1889;
    float _2339 = fma(_2077, _2225, _2317);
    if (_2237)
    {
        float _2341 = _1871 ? as_type<float>(_2303) : _1881;
        _1943 = _2341;
    }
    float _2343 = _1943;
    float _2345 = fma(_2095, _2225, _2319);
    float _2347 = fma(_974, _2325, _992);
    float _2349 = _2323 ? as_type<float>(_2285) : _1889;
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2353 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2355 = fma(_2335, _2343, -0.5);
    float _2357 = fma(_2143, _2209, _2331);
    float _2359 = fma(_2141, _2209, _2339);
    float _2361 = fma(_2353, _2337, -0.5);
    float _2363 = fma(_2145, _2209, _2345);
    float _2365 = _2329 ? as_type<float>(_2285) : _1889;
    float _2367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2369 = -_1004;
    float _2371 = fma(_980, _2361, _2369);
    float _2373 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2375 = fma(_2187, _2163, _2357);
    float _2377 = fma(_2203, _2163, _2359);
    float _2379 = fma(_2239, _2163, _2363);
    float _2381 = fma(_2373, _2043, -0.5);
    float _2383 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].x, _2375);
    float _2385 = _1891 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2391 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].y, _2377);
    float _2393 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].z, _2379);
    float _2395 = fma(_2189, _2069, -0.5);
    float _2397 = fma(_1238, _2381, _934);
    float _2399 = _1364 * _2267;
    float _2401 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2405 = _2367 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2407 = fma(_2389, _2365, -0.5);
    float _2409 = _2347 + 0.5;
    float _2411 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2413 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = _2393 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2417 = _1891 * 6.283185482025146484375;
    float _2419 = cos(_2417);
    float _2421 = fma(_1012, _2355, _1234);
    float _2423 = fma(_2405, _2037, -0.5);
    float _2425 = _2387 * _2395;
    float _2427 = -_2267;
    float _2429 = _1362 * _2427;
    float _2431 = fma(_1380, _2257, _2399);
    float _2433 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2437 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2439 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2441 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = exp2(_2401);
    float _2445 = _2403 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2447 = _1372 * _2267;
    float _2449 = fma(_1374, _2257, _2429);
    float _2451 = fma(_1388, _2261, _2431);
    float _2453 = _2419 * _2395;
    float _2455 = -_2425;
    float _2457 = fma(_2419, _2423, _2455);
    float _2459 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2433);
    float _2461 = fma(_2445, _2349, -0.5);
    out.m_67.x = _2437;
    out.m_67.y = _2439;
    out.m_67.z = _2441;
    out.m_67.w = _2435;
    float _2463 = fma(_2387, _2423, _2453);
    float _2465 = fma(_1246, _2457, _1252);
    float _2467 = fma(_1384, _2257, _2447);
    float _2469 = fma(_1376, _2261, _2449);
    float _2471 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2473 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2475 = -_1260;
    float _2477 = fma(_1236, _2461, _2475);
    float _2479 = fma(_1396, _2261, _2467);
    float _2481 = -_2443;
    float _2483 = _2481 + 1.0;
    float _2485 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2473);
    float _2487 = _2477 + 0.5;
    float _2489 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2491 = fma(_2311, _2169, -0.5);
    float _2493 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2495 = -_1254;
    float _2497 = fma(_1248, _2463, _2495);
    float _2499 = _2465 + 0.5;
    float _2501 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2471);
    float _2503 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2493);
    float _2505 = _2247 + 0.5;
    float _2507 = _2397 + 0.5;
    float _2509 = _2497 + 0.5;
    float _2511 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2503);
    float _2513 = _2501 + _1780;
    float _2515 = -_1020;
    float _2517 = fma(_1242, _2407, _2515);
    float _2519 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2489);
    out.m_69.x = _2507;
    out.m_69.y = _2505;
    out.m_69.z = _2499;
    out.m_69.w = _2509;
    float _2521 = _2513 * 0.5;
    float _2523 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2525 = fma(_1240, _2491, _1258);
    float _2527 = _2517 + 0.5;
    float _2529 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2519);
    float _2531 = _2371 + 0.5;
    float _2533 = _2421 + 0.5;
    float _2535 = _2525 + 0.5;
    float _2537 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2485);
    out.m_71.x = _2409;
    out.m_71.y = _2531;
    float _2539 = -_2523;
    float _2541 = _2539 + 1.0;
    float _2543 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2533;
    out.m_73.y = _2527;
    out.m_75.x = _2535;
    out.m_75.y = _2487;
    out.m_77.x = _2511;
    out.m_77.y = _2537;
    out.m_77.z = _2529;
    out.m_79.x = _1536;
    out.m_79.y = _1532;
    out.m_79.z = _1540;
    out.gl_Position.x = _1810;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _2501;
    out.gl_Position.w = _1780;
    out.m_81.z = _2521;
    out.m_81.w = _1780;
    out.m_45.x = _2543;
    float _2545 = _2523 * _1842;
    float _2547 = _1857 * _2545;
    float _2549 = _1867 * _2545;
    float _2551 = fma(_1863, _2547, _1851);
    float _2553 = fma(_1865, _2547, _1853);
    float _2555 = _1857 * _2541;
    float _2557 = fma(_1857, _2549, _1855);
    out.m_83.x = _2551;
    out.m_83.y = _2553;
    out.m_83.z = _2557;
    out.m_83.w = _2555;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _706 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    float _114 = _112;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2616 = as_type<float>(_120);
        out.gl_Position.z = _2616;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_102);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2686 = as_type<float>(_158);
        out.gl_Position.z = _2686;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_49.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _284 = _276;
    float _302;
    if (!_282)
    {
        float _286 = in.m_51.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_102);
        float _308 = 1.0 / _306;
        float _310 = _138 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _330 = 1.0 / _316;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _324;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _312 + _348;
    float _352 = 1.0 / _328;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = _350 * _330;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _360 = _312 + _358;
    bool _362 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _364 = isnan(_312);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _312 + _376;
    float _380 = 1.0 / _338;
    bool _382 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _384 = isnan(_312);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = _378 * _340;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _398 = _312 + _396;
    bool _400 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _402 = isnan(_312);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = 1.0 / _320;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _416 = _312 + _414;
    float _418 = _416 * _352;
    float _420 = 1.0 / _334;
    float _422 = _398 * _380;
    bool _424 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _426 = isnan(_312);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = fma(_438, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _444 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _446 = isnan(_312);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _460 = _312 + _458;
    float _462 = _360 * _420;
    float _464 = -_410;
    float _466 = _464 + 1.0;
    out.m_53.x = _346;
    out.m_53.y = _374;
    out.m_53.z = _456;
    float _468 = _460 * _412;
    float _470 = _392 * _466;
    float _472 = -_392;
    float _474 = _472 + 1.0;
    float _476 = _434 * _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _486;
    float _490 = fma(_480, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _492 = fma(_484, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_488, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _496 = -_434;
    float _498 = _496 + 1.0;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = -_454;
    float _510 = _508 + 1.0;
    float _512 = _454 * _498;
    bool _514 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _516 = isnan(_312);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = fma(_502, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _528 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _530 = isnan(_312);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _372 * _510;
    float _542 = -_372;
    float _544 = _542 + 1.0;
    float _546 = fma(_506, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _548 = -_538;
    float _550 = _548 + 1.0;
    float _552 = _538 * _544;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = _524 * _550;
    float _564 = -_524;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = fma(_556, _462, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _574 = _440 * _562;
    float _576 = _490 * _562;
    float _578 = _494 * _562;
    float _580 = fma(_560, _462, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _574);
    float _584 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    float _586 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _578);
    float _588 = fma(_526, _552, _582);
    float _590 = fma(_492, _552, _584);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _600 = fma(_570, _462, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _606 = fma(_546, _552, _586);
    float _608 = fma(_572, _540, _588);
    float _610 = fma(_594, _422, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _612 = fma(_598, _422, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _614 = fma(_580, _540, _590);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = fma(_604, _422, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _622;
    float _626 = fma(_600, _540, _606);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _628;
    float _632 = fma(_618, _468, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_610, _512, _608);
    float _636 = fma(_612, _512, _614);
    float _638 = fma(_624, _468, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _640 = fma(_620, _512, _626);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = fma(_630, _468, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_632, _476, _634);
    float _658 = fma(_644, _418, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _660 = fma(_648, _418, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = fma(_638, _476, _636);
    float _664 = fma(_654, _418, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _666 = fma(_650, _476, _640);
    float _668 = fma(_658, _470, _656);
    float _670 = fma(_660, _470, _662);
    float _672 = fma(_664, _470, _666);
    float _674 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].x, _668);
    float _676 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].y, _670);
    float _678 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[149].z, _672);
    bool _680 = !_344;
    int _682 = as_type<int>(_670);
    int _684 = as_type<int>(_664);
    float _686 = _644;
    float _704;
    if (!_680)
    {
        float _688 = in.m_51.x;
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _696 = _694 * _690;
        float _698 = floor(_696);
        float _700 = -_698;
        float _702 = _696 + _700;
        _704 = _702;
        _706 = true;
    }
    else
    {
        float _708 = float(_102);
        float _710 = 1.0 / _708;
        float _712 = _138 * _710;
        _110 = _708;
        _704 = _712;
    }
    _706 = false;
    float _714 = _110;
    float _716 = _704;
    float _718 = in.m_51.y;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _726 = _648;
    if (_722)
    {
        float _728 = in.m_51.x;
        _726 = _728;
    }
    float _730 = _726;
    if (_722)
    {
        _682 = 0;
    }
    int _732 = _682;
    int _734 = _732;
    if (_722)
    {
        _684 = 0;
    }
    int _736 = _684;
    float _738 = _714;
    int _740 = _736;
    if (_722)
    {
        float _742 = in.m_51.z;
        _738 = _742;
    }
    float _744 = _738;
    float _746 = _718 * 2.0;
    float _748 = _718 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _750 = fma(_748, -2.0, _724);
    float _752 = floor(_746);
    float _754 = _748;
    if (_722)
    {
        _754 = _718;
    }
    float _756 = _754;
    float _758 = _756;
    float _760 = _730;
    if (_722)
    {
        _686 = _730;
    }
    float _762 = _686;
    bool _764 = _752 >= 0.0;
    bool _766 = isnan(_752);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    bool _774 = _752 > 0.0;
    int _776 = _772 ? 0 : 1;
    int _778 = as_type<int>(_752);
    float _780 = _744;
    float _782 = _762;
    if (_722)
    {
        _778 = as_type<int>(_744);
    }
    int _784 = _778;
    int _786 = _784;
    if (!_722)
    {
        float _788 = in.m_51.x;
        float _790 = _718 * 3.1415927410125732421875;
        float _792 = in.m_51.z;
        float _794 = _790 * 0.15915493667125701904296875;
        float _796 = _794 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = _788 * 3.1415927410125732421875;
        float _802 = _800 * 0.15915493667125701904296875;
        float _804 = _792 * 3.1415927410125732421875;
        float _806 = _804 * 0.15915493667125701904296875;
        float _808 = _802 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = sin(_812);
        _780 = _792;
        _734 = 1;
        _758 = _798;
        _740 = 2;
        _760 = _788;
        _782 = _810;
        _786 = as_type<int>(_814);
    }
    float _816 = _780;
    int _818 = _734;
    float _820 = _758;
    int _822 = _740;
    float _824 = _760;
    float _826 = _782;
    int _828 = _786;
    float _830 = _816 * 2.0;
    bool _832 = _818 != 1;
    float _834 = _820 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _836 = _822 != 2;
    float _838 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _750);
    float _840 = floor(_830);
    int _842 = ~_776;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    float _862 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _864 = _846;
    if (!_774)
    {
        int _866 = ~_776;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _874 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _876 = -_848;
    float _878 = fma(_862, 2.0, _876);
    float _880 = -_872;
    float _882 = fma(_874, 2.0, _880);
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _886 = _824 + _816;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _892 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _884);
    float _894 = _886 + (-1.0);
    float _896 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[93].w, _888);
    bool _898 = !_832;
    float _900 = _898 ? _820 : _826;
    float _902 = fma(_834, -2.0, _890);
    bool _904 = !_832;
    float _906 = _904 ? as_type<float>(_828) : _820;
    float _908 = _718 + _824;
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _912 = _824 * 2.0;
    bool _914 = _840 > 0.0;
    float _916 = _908 + (-1.0);
    bool _918 = _840 >= 0.0;
    bool _920 = isnan(_840);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = floor(_912);
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _932 = -_138;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _940 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[98].z, _936);
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _944 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[98].w, _938);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _948 = _900 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _950 = _906 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _952 = _900;
    float _954 = _948;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _958 = _906;
    float _960 = as_type<float>(_870);
    bool _962 = _914;
    if (!_832)
    {
        _952 = _824;
    }
    float _964 = _952;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _968 = -_942;
    float _970 = fma(_948, 2.0, _968);
    float _972 = fma(_950, -2.0, _946);
    float _974 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _892);
    float _976 = _964;
    if (!_832)
    {
        _954 = _718;
    }
    float _978 = _954;
    float _980 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _896);
    float _982 = _978;
    if (_832)
    {
        _976 = _816;
    }
    float _984 = _976;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (!_832)
    {
        _956 = _978;
    }
    float _988 = _956;
    float _990 = -_138;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[91].x, _882);
    float _994 = _988;
    if (_832)
    {
        _982 = _824;
    }
    float _996 = _982;
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[84].z, _986);
    bool _1000 = !_860;
    float _1002 = _1000 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1004 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _902);
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[83].z, _966);
    float _1008 = _1002;
    if (!_832)
    {
        _958 = _816;
    }
    float _1010 = _958;
    float _1012 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[97].z, _940);
    int _1014 = abs(as_type<int>(_1002));
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1018 = float(_870);
    float _1020 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[96].y, _972);
    float _1022 = _1010;
    if (!_832)
    {
        _960 = _1010;
    }
    float _1024 = _960;
    int _1026 = _926 ? 0 : 1;
    float _1028 = _1024;
    if (_832)
    {
        _1022 = _718;
    }
    float _1030 = _1022;
    float _1032 = float(_1014);
    int _1034 = ~_1026;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1016);
    int _1042 = _1038;
    if (_832)
    {
        _994 = _824;
    }
    float _1044 = _994;
    float _1046 = _1032 * _1018;
    if (!_914)
    {
        int _1048 = ~_1026;
        int _1050 = _1048 + 1;
        _1042 = _1050;
    }
    int _1052 = _1042;
    float _1054 = in.m_55.x;
    float _1056 = in.m_55.y;
    float _1058 = in.m_55.z;
    bool _1060 = !_852;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1066 = _928 > 0.0;
    float _1068 = _1046 * (-2.0);
    int _1070 = abs(_1062);
    bool _1072 = _928 >= 0.0;
    bool _1074 = isnan(_928);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1084 = log2(_1082);
    float _1086 = fma(_910, _1068, _910);
    int _1088 = _1080 ? 0 : 1;
    float _1090 = _928;
    if (_832)
    {
        _1028 = _718;
    }
    float _1092 = _1028;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_836)
    {
        _1008 = _718;
    }
    float _1096 = _1008;
    float _1098 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1100 = ~_1088;
    int _1102 = _1100 + 1;
    int _1104 = _1102 + 1;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1108 = _1096;
    int _1110 = _1104;
    if (!_836)
    {
        _1108 = _824;
    }
    float _1112 = _1108;
    float _1114 = -_1094;
    float _1116 = fma(_1064, 2.0, _1114);
    float _1118 = fma(_1098, -2.0, _1106);
    if (!_1066)
    {
        int _1120 = ~_1088;
        int _1122 = _1120 + 1;
        _1110 = _1122;
    }
    int _1124 = _1110;
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_836)
    {
        _1090 = _824;
    }
    float _1130 = _1090;
    float _1132 = _1084 * _138;
    float _1134 = _1130;
    if (!_836)
    {
        _1134 = _816;
    }
    float _1136 = _1134;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1140 = float(_1070);
    float _1142 = fma(_1126, -2.0, _1128);
    float _1144 = _816 + (-0.5);
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1148 = fma(_1068, _1058, _1058);
    float _1150 = exp2(_1132);
    float _1152 = float(_1052);
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1158 = _1140 * _1152;
    float _1160 = -_1138;
    float _1162 = fma(_1146, 2.0, _1160);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1166 = 1.0 + _1164;
    float _1168 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1156);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1172 = !_856;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = 1.0 / _1166;
    float _1178 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1170);
    float _1180 = _1158 * (-2.0);
    bool _1182 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1184 = isnan(1.0);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1190 = _1186 || _1188;
    float _1192 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    int _1194 = abs(_1174);
    float _1196 = -_1150;
    float _1198 = _1196 + 1.0;
    bool _1200 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1208 = _1204 || _1206;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = float(_1194);
    float _1216 = fma(_1180, _1054, _1054);
    float _1218 = float(_1124);
    float _1220 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    float _1222 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1210);
    float _1224 = _1208 ? _1198 : 0.0;
    float _1226 = _718 + _816;
    float _1228 = _1214 * _1218;
    float _1230 = _824 + (-0.5);
    float _1232 = -_138;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[96].x, _970);
    float _1236 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1220);
    float _1238 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1168);
    float _1240 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1222);
    float _1242 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[97].w, _944);
    float _1244 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _998);
    float _1246 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1006);
    float _1248 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1040);
    float _1250 = -_138;
    float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1116);
    float _1254 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1118);
    float _1256 = -_138;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1162);
    float _1260 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1142);
    bool _1262 = _1190;
    int _1264 = as_type<int>(_1192);
    if (_1190)
    {
        float _1266 = _1224 * _1176;
        _140 = _1266;
    }
    float _1268 = _140;
    float _1270 = _1226 + (-1.0);
    float _1272 = _1228 * (-2.0);
    float _1274 = fma(_930, _1180, _930);
    float _1276 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1216);
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1280 = in.m_49.x;
    float _1282 = in.m_49.y;
    float _1284 = in.m_49.z;
    float _1286 = fma(_1272, _1056, _1056);
    float _1288 = _718 + (-0.5);
    float _1290 = fma(_1274, _1268, _1276);
    float _1292 = fma(_1278, _1272, _1278);
    float _1294 = in.m_57.x;
    float _1296 = in.m_57.y;
    float _1298 = in.m_57.z;
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1286);
    float _1302 = fma(_1086, _1268, _1154);
    float _1304 = _1290 * 0.15915493667125701904296875;
    float _1306 = fma(_1292, _1268, _1300);
    float _1308 = _1302 * 0.15915493667125701904296875;
    float _1310 = _1304 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1306 * 0.15915493667125701904296875;
    float _1316 = _1314 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _678 * _1284;
    float _1322 = _676 * _1282;
    float _1324 = _674 * _1280;
    float _1326 = _1314 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1296);
    float _1332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1298);
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1294);
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1342 = _1334 * _1330;
    float _1344 = _1308 * 6.283185482025146484375;
    float _1346 = cos(_1344);
    float _1348 = _1336 * _1332;
    float _1350 = _1312 * _1318;
    float _1352 = _1340 * _1338;
    float _1354 = _1304 * 6.283185482025146484375;
    float _1356 = sin(_1354);
    float _1358 = _1312 * _1328;
    float _1360 = _1308 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = _1312 * _1346;
    float _1366 = _1364 * _1342;
    float _1368 = _1356 * _1318;
    float _1370 = _1356 * _1328;
    float _1372 = _1356 * _1346;
    float _1374 = _1328 * _1346;
    float _1376 = _1318 * _1346;
    float _1378 = _1372 * _1342;
    float _1380 = fma(_1362, _1358, _1368);
    float _1382 = -_1350;
    float _1384 = fma(_1362, _1370, _1382);
    float _1386 = -_1370;
    float _1388 = fma(_1362, _1350, _1386);
    float _1390 = -_1342;
    float _1392 = _1362 * _1390;
    float _1394 = fma(_1380, _1352, _1366);
    float _1396 = fma(_1362, _1368, _1358);
    float _1398 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1400 = fma(_1374, _1352, _1392);
    float _1402 = fma(_1388, _1348, _1394);
    float _1404 = fma(_1384, _1352, _1378);
    float _1406 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1408 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1398);
    float _1410 = fma(_1376, _1348, _1400);
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1396, _1348, _1404);
    float _1416 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1406);
    float _1418 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1408);
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1424 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1416);
    float _1426 = _1418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1420);
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1434 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1428);
    float _1438 = _1426 + _1430;
    float _1440 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1434);
    float _1442 = _1432 + _1436;
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1446 = _1438 + _1444;
    float _1448 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1450 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1440);
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1454 = _1442 + _1452;
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1410, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1448);
    float _1460 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = fma(_1454, _1454, _1456);
    float _1464 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1458);
    float _1466 = sqrt(_1462);
    float _1468 = _1460 + _1464;
    bool _1470 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1460;
    float _1474 = _1438;
    float _1476 = _1414;
    if (!_1470)
    {
        _284 = _1442;
    }
    float _1478 = _284;
    float _1480 = _1478;
    if (!_1470)
    {
        _1472 = _1468;
    }
    float _1482 = _1472;
    bool _1484 = !_1470;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1466 + _1490;
        float _1494 = rsqrt(_1462);
        float _1496 = _1492 * _1488;
        float _1498 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = cos(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = _1504 + (-1.0);
        float _1512 = fma(_1508, _1498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1516 = _1494 * _1512;
        float _1518 = fma(_1468, _1504, _1514);
        float _1520 = fma(_1454, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1522 = fma(_1446, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1486 = _1518;
        _1480 = _1520;
        _1474 = _1522;
    }
    float _1524 = _1486;
    float _1526 = _1480;
    float _1528 = _1474;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1524 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1536 = _1526 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1528 + _1538;
    float _1542 = _1532 * _1532;
    float _1544 = fma(_1536, _1536, _1542);
    float _1546 = fma(_1540, _1540, _1544);
    float _1548 = rsqrt(_1546);
    float _1550 = sqrt(_1546);
    float _1552 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1536 * _1552;
    float _1556 = _1540 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1468;
    float _1574 = _1562;
    float _1576 = _1570;
    float _1578 = _1552;
    if (_1566)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1580;
    }
    float _1582 = _1572;
    if (_1566)
    {
        float _1584 = rsqrt(_1562);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1566)
    {
        float _1590 = _1570 * _1582;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1566)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1476 = _1594;
    }
    float _1596 = _1476;
    float _1598 = _1454;
    if (_1566)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1402;
    float _1612 = _1608;
    float _1614 = _1606;
    if (_1566)
    {
        float _1616 = _1596 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        _1610 = _1618;
    }
    float _1620 = _1610;
    float _1622 = -_1552;
    float _1624 = -_1608;
    float _1626 = fma(_1532, _1622, _1624);
    if (_1566)
    {
        float _1628 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1628;
    }
    float _1630 = _1612;
    float _1632 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = _1630;
    float _1636 = _1604;
    if (_1566)
    {
        float _1638 = fma(_1604, _1630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = _1640;
    if (!_1566)
    {
        _1636 = _1554;
    }
    float _1644 = _1636;
    float _1646 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1648 = _1644;
    float _1650 = _1620;
    if (_1566)
    {
        float _1652 = _1620 + (-1.0);
        _1614 = _1652;
    }
    float _1654 = _1614;
    float _1656 = 0.0;
    float _1658 = _1654;
    if (_1566)
    {
        float _1660 = _1586 * _1640;
        _1656 = _1660;
    }
    float _1662 = _1656;
    if (!_1566)
    {
        _1642 = _1626;
    }
    float _1664 = _1642;
    float _1666 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1668 = _1664;
    if (_1566)
    {
        float _1670 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1670;
    }
    float _1672 = _1578;
    if (_1566)
    {
        float _1674 = _1554 * _1662;
        _1648 = _1674;
    }
    float _1676 = _1648;
    if (!_1566)
    {
        _1658 = _1556;
    }
    float _1678 = _1658;
    float _1680 = _1678;
    if (_1566)
    {
        float _1682 = _1556 * _1662;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (!_1566)
    {
        _1588 = _1558;
    }
    float _1686 = _1588;
    float _1688 = _1686;
    if (_1566)
    {
        float _1690 = fma(_1626, _1620, _1672);
        _1668 = _1690;
    }
    float _1692 = _1668;
    if (_1566)
    {
        float _1694 = _1676 * _1676;
        _1688 = _1694;
    }
    float _1696 = _1688;
    if (!_1566)
    {
        _1650 = _1560;
    }
    float _1698 = _1650;
    float _1700 = _1698;
    if (_1566)
    {
        float _1702 = _1684 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    float _1706 = fma(_1692, _1692, _1696);
    float _1708 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = _1706 + _1704;
    float _1712 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1550, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1722 = rsqrt(_1710);
    float _1724 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1712);
    float _1728 = -_1718;
    float _1730 = _1728 + 1.0;
    float _1732 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1736 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1738 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1732);
    float _1740 = abs(_1730);
    float _1742 = log2(_1740);
    float _1744 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1734);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1738);
    float _1750 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1756 = _1722 * _1676;
    float _1758 = _1722 * _1692;
    float _1760 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1762 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1754);
    float _1764 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = _1722 * _1684;
    float _1768 = -_1750;
    float _1770 = fma(_1768, _1720, 1.0);
    float _1772 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1774 = -_1764;
    float _1776 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1774);
    float _1778 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1780 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1772);
    float _1782 = -_1766;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1776);
    float _1786 = exp2(_1778);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1790 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = fma(_1784, 0.5, 0.5);
    float _1796 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1788);
    float _1798 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1790);
    float _1800 = _1758 + 1.0;
    float _1802 = log2(_1770);
    float _1804 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1796);
    float _1806 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1810 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1812 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = fma(_1794, _1808, -0.212114393711090087890625);
    float _1816 = 1.0 / _1780;
    float _1818 = -_1758;
    float _1820 = fma(_1786, _1800, _1818);
    float _1822 = fma(_1794, _1814, 1.570728778839111328125);
    float _1824 = sqrt(_1792);
    float _1826 = _1802 * 0.693147182464599609375;
    float _1828 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1830 = _1810 * _1816;
    float _1832 = _1812 * _1816;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = fma(_1820, 0.5, 0.5);
    float _1840 = _1824 * 0.636619746685028076171875;
    float3 _5430 = float3(_1834, _1836, _1828);
    float _1842 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5430, float3(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5430, float3(0.0), isnan(_5430)), level(0.0)).x;
    float _1844 = -_1822;
    float _1846 = fma(_1840, _1844, 1.0);
    float3 _5446 = float3(_1834, _1836, _1828);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5446, float3(0.0), isnan(_5446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5446, float3(0.0), isnan(_5446)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _5463 = float2(_1846, _1838);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5463, float2(0.0), isnan(_5463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5463, float2(0.0), isnan(_5463)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = in.m_51.w;
    bool _1871 = _718 > 0.5;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1875 = _716 + _1873;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1879 = _1877 != 0;
    float _1881 = in.m_59.x;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1885 = _1883 != 0;
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1889 = in.m_59.y;
    float _1891 = _1244 * (-0.15915493667125701904296875);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1893;
    float _1897 = in.m_61.w;
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1903 = 1.0 / _1895;
    int _1905 = as_type<int>(_1786);
    if (_1879)
    {
        float _1907 = in.m_51.z;
        _1905 = as_type<int>(_1907);
    }
    int _1909 = _1905;
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1919;
    float _1923 = 0.0;
    if (_1885)
    {
        float _1925 = in.m_51.x;
        _1923 = _1925;
    }
    float _1927 = _1923;
    float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1931 = _1929 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1933 = _1869 > 0.5;
    float _1935 = 1.0 / _1901;
    float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1939 = _1937 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1941 = 0;
    float _1943 = _1881;
    if (_1879)
    {
        float _1945 = -_1881;
        float _1947 = _1945 + 1.0;
        _1941 = as_type<int>(_1947);
    }
    int _1949 = _1941;
    float _1951 = 0.0;
    if (!_1879)
    {
        _1951 = _1881;
    }
    float _1953 = _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1957 = _1955 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1959;
    float _1963 = 0.0;
    float _1965 = _1953;
    if (!_1885)
    {
        _1963 = _1881;
    }
    float _1967 = _1963;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1975 = _716 + _1973;
    out.m_63.w = _1897;
    int _1977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1979 = _1977 != 0;
    float _1981 = 1.0 / _1971;
    bool _1983 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1985 = isnan(_716);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    float _1995 = _1975 * _1935;
    int _1997 = _1909;
    float _1999 = _1967;
    if (_1879)
    {
        bool _2001 = as_type<float>(_1909) > 0.5;
        _962 = _2001;
    }
    bool _2003 = _962;
    if (_1885)
    {
        float _2005 = -_1881;
        float _2007 = _2005 + 1.0;
        _1997 = as_type<int>(_2007);
    }
    int _2009 = _1997;
    bool _2011 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2013 = isnan(_716);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2023;
    if (_1885)
    {
        bool _2027 = _1927 > 0.5;
        _1262 = _2027;
    }
    bool _2029 = _1262;
    float _2031 = -_1889;
    float _2033 = _2031 + 1.0;
    if (_1879)
    {
        float _2035 = _2003 ? as_type<float>(_1949) : _1881;
        _1965 = _2035;
    }
    float _2037 = _1965;
    float _2039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1885)
    {
        float _2041 = _2029 ? as_type<float>(_2009) : _1881;
        _1999 = _2041;
    }
    float _2043 = _1999;
    int _2045 = 0;
    if (_1979)
    {
        float _2047 = -_1881;
        float _2049 = _2047 + 1.0;
        _2045 = as_type<int>(_2049);
    }
    int _2051 = _2045;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2055 = _2053 != 0;
    float _2057 = fma(_1931, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _2059 = _1933 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2061 = _1875 * _1981;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2065 = _2063 != 0;
    float _2067 = 1.0 / _1961;
    float _2069 = _2055 ? as_type<float>(_2059) : _1889;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2073 = _716 + _2071;
    int _2075 = _1871 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2077 = fma(_1939, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _2079 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2081 = isnan(_716);
    bool _2083 = _2079 || _2081;
    bool _2085 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2087 = _2083 || _2085;
    float _2089 = float(_2087);
    float _2091 = _2073 * _1903;
    float _2093 = _2065 ? as_type<float>(_2075) : _1889;
    float _2095 = fma(_1957, _1995, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2099 = _716 + _2097;
    float _2101 = fma(_1913, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2103 = fma(_1917, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2105 = fma(_1921, _2091, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2107;
    bool _2111 = _1296 != 0.0;
    bool _2113 = isnan(_1296);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan(0.0);
    bool _2119 = _2115 || _2117;
    float _2121 = -_2089;
    float _2123 = _2121 + 1.0;
    float _2125 = _2099 * _2067;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2127;
    bool _2131 = _1294 == 0.0;
    bool _2133 = !_2119;
    bool _2135 = _2131 && _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2141 = fma(_2025, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2143 = fma(_2129, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2145 = fma(_2109, _2125, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _2147 = _1298 == 0.0;
    bool _2149 = _2147 && _2135;
    float _2151 = in.m_65.x;
    float _2153 = in.m_65.y;
    float _2155 = in.m_65.z;
    float _2157 = 0.0;
    int _2159 = as_type<int>(_2103);
    if (!_1979)
    {
        _2157 = _1881;
    }
    float _2161 = _2157;
    float _2163 = _1993 * _2123;
    float _2165 = _2161;
    if (_1979)
    {
        float _2167 = _1871 ? as_type<float>(_2051) : _1881;
        _2165 = _2167;
    }
    float _2169 = _2165;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2177 = _2175 != 0;
    float _2179 = -_1993;
    float _2181 = _2179 + 1.0;
    float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2185 = _2183 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2187 = fma(_2139, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2189 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2191 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2193 = isnan(_716);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    float _2203 = fma(_2173, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2205 = -_2021;
    float _2207 = _2205 + 1.0;
    float _2209 = _2021 * _2181;
    float _2211 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2213 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2215 = isnan(_716);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2221 = _2217 || _2219;
    float _2223 = float(_2221);
    float _2225 = _2201 * _2207;
    float _2227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2229 = -_2201;
    float _2231 = _2229 + 1.0;
    float _2233 = fma(_2211, _2093, -0.5);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2237 = _2235 != 0;
    float _2239 = fma(_2185, _2061, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2243 = _2241 != 0;
    float _2245 = -_838;
    float _2247 = fma(_1192, _2233, _2245);
    float _2249 = _2151;
    float _2251 = _2155;
    float _2253 = _2153;
    if (!_2149)
    {
        float _2255 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2151);
        _2249 = _2255;
    }
    float _2257 = _2249;
    if (!_2149)
    {
        float _2259 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2155);
        _2251 = _2259;
    }
    float _2261 = _2251;
    float _2263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_2149)
    {
        float _2265 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2153);
        _2253 = _2265;
    }
    float _2267 = _2253;
    bool _2269 = _816 > 0.5;
    float _2271 = _2223 * _2231;
    float _2273 = _2271;
    if (_2177)
    {
        float _2275 = -_1881;
        float _2277 = _2275 + 1.0;
        _1264 = as_type<int>(_2277);
    }
    int _2279 = _1264;
    float _2281 = -_2223;
    float _2283 = _2281 + 1.0;
    int _2285 = _2269 ? as_type<int>(_2033) : as_type<int>(_1889);
    float _2287 = _2101 * _2271;
    float _2289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2291 = _2103 * _2271;
    float _2293 = _2105 * _2271;
    if (!_2177)
    {
        _2273 = _1881;
    }
    float _2295 = _2273;
    float _2297 = _2295;
    if (_2237)
    {
        float _2299 = -_1881;
        float _2301 = _2299 + 1.0;
        _2159 = as_type<int>(_2301);
    }
    int _2303 = _2159;
    if (_2177)
    {
        float _2305 = _1871 ? as_type<float>(_2279) : _1881;
        _2297 = _2305;
    }
    float _2307 = _2297;
    float _2309 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2287);
    float _2311 = _2227 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2315 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2317 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2291);
    float _2319 = fma(_2283, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2293);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2323 = _2321 != 0;
    float _2325 = fma(_2315, _2307, -0.5);
    int _2327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2329 = _2327 != 0;
    float _2331 = fma(_2057, _2225, _2309);
    float _2333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2335 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2337 = _2243 ? as_type<float>(_2285) : _1889;
    float _2339 = fma(_2077, _2225, _2317);
    if (_2237)
    {
        float _2341 = _1871 ? as_type<float>(_2303) : _1881;
        _1943 = _2341;
    }
    float _2343 = _1943;
    float _2345 = fma(_2095, _2225, _2319);
    float _2347 = fma(_974, _2325, _992);
    float _2349 = _2323 ? as_type<float>(_2285) : _1889;
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2353 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2355 = fma(_2335, _2343, -0.5);
    float _2357 = fma(_2143, _2209, _2331);
    float _2359 = fma(_2141, _2209, _2339);
    float _2361 = fma(_2353, _2337, -0.5);
    float _2363 = fma(_2145, _2209, _2345);
    float _2365 = _2329 ? as_type<float>(_2285) : _1889;
    float _2367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2369 = -_1004;
    float _2371 = fma(_980, _2361, _2369);
    float _2373 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2375 = fma(_2187, _2163, _2357);
    float _2377 = fma(_2203, _2163, _2359);
    float _2379 = fma(_2239, _2163, _2363);
    float _2381 = fma(_2373, _2043, -0.5);
    float _2383 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].x, _2375);
    float _2385 = _1891 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2391 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].y, _2377);
    float _2393 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[127].z, _2379);
    float _2395 = fma(_2189, _2069, -0.5);
    float _2397 = fma(_1238, _2381, _934);
    float _2399 = _1364 * _2267;
    float _2401 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2405 = _2367 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2407 = fma(_2389, _2365, -0.5);
    float _2409 = _2347 + 0.5;
    float _2411 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2413 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = _2393 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2417 = _1891 * 6.283185482025146484375;
    float _2419 = cos(_2417);
    float _2421 = fma(_1012, _2355, _1234);
    float _2423 = fma(_2405, _2037, -0.5);
    float _2425 = _2387 * _2395;
    float _2427 = -_2267;
    float _2429 = _1362 * _2427;
    float _2431 = fma(_1380, _2257, _2399);
    float _2433 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2437 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2439 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2441 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = exp2(_2401);
    float _2445 = _2403 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2447 = _1372 * _2267;
    float _2449 = fma(_1374, _2257, _2429);
    float _2451 = fma(_1388, _2261, _2431);
    float _2453 = _2419 * _2395;
    float _2455 = -_2425;
    float _2457 = fma(_2419, _2423, _2455);
    float _2459 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2433);
    float _2461 = fma(_2445, _2349, -0.5);
    out.m_67.x = _2437;
    out.m_67.y = _2439;
    out.m_67.z = _2441;
    out.m_67.w = _2435;
    float _2463 = fma(_2387, _2423, _2453);
    float _2465 = fma(_1246, _2457, _1252);
    float _2467 = fma(_1384, _2257, _2447);
    float _2469 = fma(_1376, _2261, _2449);
    float _2471 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2473 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2475 = -_1260;
    float _2477 = fma(_1236, _2461, _2475);
    float _2479 = fma(_1396, _2261, _2467);
    float _2481 = -_2443;
    float _2483 = _2481 + 1.0;
    float _2485 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2473);
    float _2487 = _2477 + 0.5;
    float _2489 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2491 = fma(_2311, _2169, -0.5);
    float _2493 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2495 = -_1254;
    float _2497 = fma(_1248, _2463, _2495);
    float _2499 = _2465 + 0.5;
    float _2501 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2471);
    float _2503 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2493);
    float _2505 = _2247 + 0.5;
    float _2507 = _2397 + 0.5;
    float _2509 = _2497 + 0.5;
    float _2511 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2503);
    float _2513 = _2501 + _1780;
    float _2515 = -_1020;
    float _2517 = fma(_1242, _2407, _2515);
    float _2519 = fma(_2469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2489);
    out.m_69.x = _2507;
    out.m_69.y = _2505;
    out.m_69.z = _2499;
    out.m_69.w = _2509;
    float _2521 = _2513 * 0.5;
    float _2523 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2525 = fma(_1240, _2491, _1258);
    float _2527 = _2517 + 0.5;
    float _2529 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2519);
    float _2531 = _2371 + 0.5;
    float _2533 = _2421 + 0.5;
    float _2535 = _2525 + 0.5;
    float _2537 = fma(_2479, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2485);
    out.m_71.x = _2409;
    out.m_71.y = _2531;
    float _2539 = -_2523;
    float _2541 = _2539 + 1.0;
    float _2543 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2533;
    out.m_73.y = _2527;
    out.m_75.x = _2535;
    out.m_75.y = _2487;
    out.m_77.x = _2511;
    out.m_77.y = _2537;
    out.m_77.z = _2529;
    out.m_79.x = _1536;
    out.m_79.y = _1532;
    out.m_79.z = _1540;
    out.gl_Position.x = _1810;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _2501;
    out.gl_Position.w = _1780;
    out.m_81.z = _2521;
    out.m_81.w = _1780;
    out.m_45.x = _2543;
    float _2545 = _2523 * _1842;
    float _2547 = _1857 * _2545;
    float _2549 = _1867 * _2545;
    float _2551 = fma(_1863, _2547, _1851);
    float _2553 = fma(_1865, _2547, _1853);
    float _2555 = _1857 * _2541;
    float _2557 = fma(_1857, _2549, _1855);
    out.m_83.x = _2551;
    out.m_83.y = _2553;
    out.m_83.z = _2557;
    out.m_83.w = _2555;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

