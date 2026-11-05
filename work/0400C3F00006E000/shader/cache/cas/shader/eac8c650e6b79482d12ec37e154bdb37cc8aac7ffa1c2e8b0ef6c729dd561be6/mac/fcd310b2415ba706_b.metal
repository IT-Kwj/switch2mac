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
    float4 m_55 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _988 = false;
    bool _808 = false;
    bool _616 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    float _98 = _96;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_90)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2383 = as_type<float>(_104);
        out.gl_Position.z = _2383;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    float _124 = _120;
    if (_116)
    {
        float _126 = float(_86);
        _122 = _126;
    }
    float _128 = _122;
    bool _130 = _120 >= _128;
    bool _132 = !_116;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    int _138 = 0;
    if (_134)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2452 = as_type<float>(_142);
        out.gl_Position.z = _2452;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = _146;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _94 = _174;
    }
    float _176 = _94;
    float _178 = _176;
    if (!_156)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_156;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _146 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _146);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_156;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _146 * _224;
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
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_242, _162, _250);
    float _258 = fma(_252, _144, _164);
    float _260 = fma(_254, _144, _166);
    float _262 = fma(_256, _144, _168);
    bool _264 = !_244;
    float _266 = _262;
    float _284;
    if (!_264)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_86);
        float _290 = 1.0 / _288;
        float _292 = _120 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = 1.0 / _302;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _318;
    float _322 = 1.0 / _310;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = _294 + _324;
    bool _328 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_294);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_338;
    float _342 = _340 + 1.0;
    float _344 = 1.0 / _306;
    float _346 = _326 * _316;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = _294 + _348;
    bool _352 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _354 = isnan(_294);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _370 = 1.0 / _314;
    float _372 = _350 * _322;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _376 = _294 + _374;
    bool _378 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _380 = isnan(_294);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_366, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _392 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_294);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = 1.0 / _320;
    float _406 = _298 * _344;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _294 + _408;
    bool _412 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _414 = isnan(_294);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _402 * _342;
    float _426 = -_402;
    float _428 = _426 + 1.0;
    float _430 = _376 * _370;
    float _432 = -_388;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _436;
    float _440 = _362 * _434;
    float _442 = -_362;
    float _444 = _442 + 1.0;
    float _446 = fma(_438, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _410 * _404;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = _422 * _444;
    float _456 = -_422;
    float _458 = _456 + 1.0;
    float _460 = fma(_452, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _462 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_294);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = _338 * _458;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = _472 * _428;
    float _486 = -_472;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = fma(_482, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _496 = _460 * _484;
    float _498 = _446 * _484;
    float _500 = _390 * _484;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _510;
    float _514 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].x, _496);
    float _516 = fma(_478, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_492, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = fma(_504, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_508, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = fma(_512, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _528 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _530 = fma(_494, _424, _514);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _540 = fma(_518, _424, _528);
    float _542 = fma(_520, _474, _530);
    float _544 = fma(_534, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _550 = fma(_516, _424, _526);
    float _552 = fma(_524, _474, _540);
    float _554 = fma(_538, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _560;
    float _564 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _566 = fma(_522, _474, _550);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _568;
    float _572 = fma(_544, _454, _542);
    float _574 = fma(_558, _448, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _576 = fma(_562, _448, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _578 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _580 = fma(_554, _454, _566);
    float _582 = fma(_564, _454, _552);
    float _584 = fma(_574, _440, _572);
    float _586 = fma(_576, _440, _580);
    float _588 = fma(_578, _440, _582);
    float _590 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].x, _584);
    float _592 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].y, _586);
    float _594 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].z, _588);
    bool _596 = !_368;
    float _614;
    if (!_596)
    {
        float _598 = in.m_51.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_86);
        float _620 = 1.0 / _618;
        float _622 = _120 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _628 = _624 + _626;
    bool _630 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _624 + _642;
    bool _646 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _648 = isnan(_624);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _664;
    float _684 = _676 * _680;
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _690;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _696 = 1.0 / _660;
    float _698 = _656 * _688;
    float _700 = -_656;
    float _702 = _700 + 1.0;
    float _704 = _644 * _682;
    float _706 = _628 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _712;
    float _716 = fma(_692, _706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _720 = fma(_714, _706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _722 = _716 * _698;
    float _724 = _718 * _698;
    float _726 = _720 * _698;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].x, _722);
    float _742 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].y, _724);
    float _744 = fma(_730, _704, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _746 = fma(_734, _704, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _748 = fma(_738, _704, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].z, _726);
    float _752 = fma(_744, _684, _740);
    float _754 = fma(_746, _684, _742);
    float _756 = fma(_748, _684, _750);
    float _758 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].x, _752);
    float _760 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].y, _754);
    float _762 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].z, _756);
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _766 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _768 = in.m_49.x;
    float _770 = in.m_49.y;
    float _772 = in.m_49.z;
    float _774 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _776 = _764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _780 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _776;
    out.m_53.y = _778;
    out.m_53.z = _780;
    float _782 = _594 * _772;
    float _784 = _592 * _770;
    float _786 = _590 * _768;
    bool _788 = !_694;
    float _806;
    if (!_788)
    {
        float _790 = in.m_51.x;
        float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _794 = _790 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _798 = _796 * _792;
        float _800 = floor(_798);
        float _802 = -_800;
        float _804 = _798 + _802;
        _806 = _804;
        _808 = true;
    }
    else
    {
        float _810 = float(_86);
        float _812 = 1.0 / _810;
        float _814 = _120 * _812;
        _806 = _814;
    }
    _808 = false;
    float _816 = _806;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _820 = _816 + _818;
    bool _822 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _824 = isnan(_816);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _836 = _816 + _834;
    bool _838 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _840 = isnan(_816);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _858 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _860 = isnan(_816);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = 1.0 / _856;
    float _876 = _868 * _872;
    float _878 = -_868;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _882;
    bool _886 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _888 = 1.0 / _852;
    float _890 = _848 * _880;
    float _892 = -_848;
    float _894 = _892 + 1.0;
    float _896 = _836 * _874;
    float _898 = _820 * _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _904;
    float _908 = fma(_884, _898, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _910 = fma(_902, _898, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _912 = fma(_906, _898, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _914 = _908 * _890;
    float _916 = _910 * _890;
    float _918 = _912 * _890;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _932 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].x, _914);
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].y, _916);
    float _936 = fma(_922, _896, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _938 = fma(_926, _896, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _940 = fma(_930, _896, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _942 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].z, _918);
    float _944 = fma(_936, _876, _932);
    float _946 = fma(_938, _876, _934);
    float _948 = fma(_940, _876, _942);
    float _950 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].x, _944);
    float _952 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].y, _946);
    float _954 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].z, _948);
    float _956 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _960 = _954 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _962;
    out.m_55.y = _964;
    out.m_55.z = _966;
    bool _968 = !_886;
    float _986;
    if (!_968)
    {
        float _970 = in.m_51.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[14].x, _120);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_86);
        float _992 = 1.0 / _990;
        float _994 = _120 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = in.m_51.x;
    float _1000 = in.m_51.y;
    float _1002 = in.m_51.z;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1012 = 1.0 / _1006;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1022 = 1.0 / _1010;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1028 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1030 = isnan(_996);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _1000 + _998;
    float _1042 = _998 * 2.0;
    float _1044 = 1.0 / _1016;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = _1000 * 2.0;
    float _1052 = _1002 + (-0.5);
    float _1054 = _1040 + (-1.0);
    float _1056 = -_1038;
    float _1058 = _1056 + 1.0;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1064 = 1.0 / _1020;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1076 = _1074 != 0;
    float _1078 = _1000 + _1002;
    float _1080 = 1.0 / _1026;
    float _1082 = _998 + (-0.5);
    float _1084 = _1078 + (-1.0);
    float _1086 = 1.0 / _1048;
    float _1088 = _1002 + _998;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1090;
    float _1094 = _1088 + (-1.0);
    float _1096 = _1092 * _1012;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1102 = 1.0 / _1062;
    float _1104 = _1000 + (-0.5);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1110 = _1108 * _1022;
    float _1112 = floor(_1042);
    float _1114 = _1002 * 2.0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1124;
    float _1128 = _1100 * _1086;
    float _1130 = _1118 * _1044;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1132;
    float _1136 = floor(_1114);
    float _1138 = _1126 * _1102;
    float _1140 = _1122 * _1064;
    bool _1142 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1144 = isnan(_996);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = _1134 * _1080;
    float _1156 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1158 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1160 = isnan(_996);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = floor(_1050);
    bool _1172 = _1112 > 0.0;
    float _1174 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1176 = _1112 >= 0.0;
    bool _1178 = isnan(_1112);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(0.0);
    bool _1184 = _1180 || _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1188 = _996 + _1186;
    bool _1190 = !_1068;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = -_1168;
    float _1196 = _1194 + 1.0;
    float _1198 = -_1152;
    float _1200 = _1198 + 1.0;
    bool _1202 = _1136 >= 0.0;
    bool _1204 = isnan(_1136);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(0.0);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1096, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1216 = log2(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1220 = _996 + _1218;
    int _1222 = _1210 ? 0 : 1;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1226 = _996 + _1224;
    bool _1228 = _1136 > 0.0;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1232 = _996 + _1230;
    bool _1234 = _1170 > 0.0;
    float _1236 = fma(_1130, _1220, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1238 = _1170 >= 0.0;
    bool _1240 = isnan(_1170);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.0);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_1110, _1232, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1250 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1252 = isnan(_996);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = fma(_1140, _1226, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1264 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1266 = isnan(_996);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1278 = _996 + _1276;
    int _1280 = abs(_1192);
    float _1282 = _1260 * _1196;
    float _1284 = -_1260;
    float _1286 = _1284 + 1.0;
    float _1288 = _1216 * _120;
    int _1290 = ~_1222;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    float _1296 = _1274 * _1286;
    float _1298 = -_1274;
    float _1300 = _1298 + 1.0;
    bool _1302 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1304 = isnan(_996);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = exp2(_1288);
    int _1316 = _1294;
    if (!_1228)
    {
        int _1318 = ~_1222;
        int _1320 = _1318 + 1;
        _1316 = _1320;
    }
    int _1322 = _1316;
    float _1324 = _1152 * _1300;
    bool _1326 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1328 = isnan(_996);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -_1312;
    float _1340 = _1338 + 1.0;
    float _1342 = _1312 * _1200;
    bool _1344 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1346 = isnan(_996);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1038 * _1340;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1360 = _996 + _1358;
    float _1362 = _1354 * _1058;
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1370 = 1.0 + _1368;
    float _1372 = fma(_1154, _1360, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1376 = _996 + _1374;
    float _1378 = _1336 * _1366;
    float _1380 = fma(_1128, _1278, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1382 = -_1336;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1138, _1376, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1388 = _1212 * _1378;
    float _1390 = in.m_57.x;
    float _1392 = in.m_57.y;
    float _1394 = in.m_57.z;
    float _1396 = -_1314;
    float _1398 = _1396 + 1.0;
    bool _1400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1408 = _1404 || _1406;
    float _1410 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1388);
    float _1412 = float(_1280);
    float _1414 = 1.0 / _1370;
    float _1416 = _1408 ? _1398 : 0.0;
    float _1418 = fma(_1248, _1362, _1410);
    float _1420 = float(_1322);
    bool _1422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1424 = isnan(1.0);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1430 = _1426 || _1428;
    float _1432 = fma(_1236, _1356, _1418);
    bool _1434 = !_1076;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = _1412 * _1420;
    int _1440 = _1246 ? 0 : 1;
    float _1442 = fma(_1262, _1342, _1432);
    int _1444 = abs(_1436);
    float _1446 = _1438 * (-2.0);
    int _1448 = _1184 ? 0 : 1;
    float _1450 = fma(_1372, _1324, _1442);
    float _1452 = float(_1444);
    int _1454 = ~_1440;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    float _1460 = fma(_1380, _1296, _1450);
    float _1462 = fma(_1446, _1390, _1390);
    bool _1464 = !_1072;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1458;
    if (_1430)
    {
        float _1470 = _1416 * _1414;
        _124 = _1470;
    }
    float _1472 = _124;
    if (!_1234)
    {
        int _1474 = ~_1440;
        int _1476 = _1474 + 1;
        _1468 = _1476;
    }
    int _1478 = _1468;
    float _1480 = fma(_1156, _1446, _1156);
    int _1482 = ~_1448;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    float _1488 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1462);
    float _1490 = fma(_1386, _1282, _1460);
    int _1492 = _1486;
    if (!_1172)
    {
        int _1494 = ~_1448;
        int _1496 = _1494 + 1;
        _1492 = _1496;
    }
    int _1498 = _1492;
    int _1500 = abs(_1466);
    float _1502 = fma(_1480, _1472, _1488);
    float _1504 = float(_1478);
    float _1506 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1490);
    float _1508 = float(_1500);
    float _1510 = _1452 * _1504;
    float _1512 = float(_1498);
    float _1514 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[191].y, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1516 = _1510 * (-2.0);
    float _1518 = _1508 * _1512;
    float _1520 = fma(_1514, 6.283185482025146484375, _1392);
    float _1522 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1524 = _1502 * 0.15915493667125701904296875;
    float _1526 = _1518 * (-2.0);
    float _1528 = fma(_1516, _1394, _1394);
    float _1530 = fma(_1174, _1516, _1174);
    float _1532 = _1524 * 6.283185482025146484375;
    float _1534 = sin(_1532);
    float _1536 = fma(_1520, _1526, _1520);
    float _1538 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1528);
    float _1540 = fma(_1522, _1526, _1522);
    float _1542 = in.m_59.x;
    float _1544 = in.m_59.y;
    float _1546 = in.m_59.z;
    float _1548 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1536);
    float _1550 = fma(_1530, _1472, _1538);
    float _1552 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1554 = _1524 * 6.283185482025146484375;
    float _1556 = cos(_1554);
    float _1558 = fma(_1540, _1472, _1548);
    float _1560 = _1550 * 0.15915493667125701904296875;
    float _1562 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1564 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1566 = isnan(0.5);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1572 = _1568 || _1570;
    float _1574 = _1558 * 0.15915493667125701904296875;
    float _1576 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1578 = _1560 * 6.283185482025146484375;
    float _1580 = cos(_1578);
    float _1582 = _1574 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1544);
    float _1588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1546);
    float _1590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1542);
    float _1592 = _1574 * 6.283185482025146484375;
    float _1594 = cos(_1592);
    float _1596 = _1586 * _1552;
    float _1598 = _1588 * _1576;
    float _1600 = _1556 * _1580;
    float _1602 = _1590 * _1562;
    float _1604 = _1600 * _1598;
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1534 * _1584;
    float _1612 = _1534 * _1580;
    float _1614 = _1556 * _1584;
    float _1616 = _1584 * _1580;
    float _1618 = _1612 * _1598;
    float _1620 = _1556 * _1594;
    float _1622 = _1534 * _1594;
    float _1624 = _1594 * _1580;
    float _1626 = fma(_1608, _1620, _1610);
    float _1628 = -_1614;
    float _1630 = fma(_1608, _1622, _1628);
    float _1632 = -_1622;
    float _1634 = fma(_1608, _1614, _1632);
    float _1636 = -_1598;
    float _1638 = _1608 * _1636;
    float _1640 = fma(_1626, _1602, _1604);
    float _1642 = fma(_1608, _1610, _1620);
    float _1644 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1646 = fma(_1624, _1602, _1638);
    float _1648 = -_1596;
    float _1650 = fma(_1634, _1648, _1640);
    float _1652 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1654 = fma(_1630, _1602, _1618);
    float _1656 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1644);
    float _1658 = -_1596;
    float _1660 = fma(_1616, _1658, _1646);
    float _1662 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1664 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1652);
    float _1666 = -_1596;
    float _1668 = fma(_1642, _1666, _1654);
    float _1670 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1656);
    float _1672 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1674 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1662);
    float _1676 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1664);
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1680 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1672);
    float _1682 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1674);
    float _1684 = _1676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1686 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1688 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1680);
    float _1690 = _1678 + _1682;
    float _1692 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1694 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1686);
    float _1696 = _1684 + _1688;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1700 = _1690 + _1698;
    float _1702 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1692);
    float _1704 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1694);
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1702);
    float _1714 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1716 = fma(_1708, _1708, _1710);
    float _1718 = _1714 + _1712;
    float _1720 = sqrt(_1716);
    bool _1722 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1704;
    float _1726 = _1710;
    float _1728 = _1720;
    float _1730 = _1718;
    float _1732 = _1668;
    if (!_1722)
    {
        _266 = _1696;
    }
    float _1734 = _266;
    float _1736 = _1734;
    if (!_1722)
    {
        _1724 = _1690;
    }
    float _1738 = _1724;
    float _1740 = _1738;
    if (!_1722)
    {
        _1726 = _1718;
    }
    float _1742 = _1726;
    bool _1744 = !_1722;
    float _1746 = _1742;
    if (!_1744)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1752 = _1720 + _1750;
        float _1754 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1756 = rsqrt(_1716);
        float _1758 = _1752 * _1748;
        float _1760 = _1758 * 0.15915493667125701904296875;
        float _1762 = _1760 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1760 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764 + (-1.0);
        float _1772 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1774 = fma(_1768, _1754, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1776 = fma(_1718, _1764, _1772);
        float _1778 = _1756 * _1774;
        float _1780 = fma(_1708, _1778, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1782 = fma(_1700, _1778, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1746 = _1776;
        _1736 = _1780;
        _1740 = _1782;
        _1728 = _1760;
    }
    float _1784 = _1746;
    float _1786 = _1736;
    float _1788 = _1740;
    float _1790 = _1728;
    float _1792 = _1784;
    float _1794 = _1786;
    float _1796 = _1788;
    float _1798 = _1790;
    if (!_1572)
    {
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1802 = _1714 + _1800;
        float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1806 = _1684 + _1804;
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1810 = -_1714;
        float _1812 = _1810 + _1784;
        float _1814 = _1802 * _1802;
        float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1818 = _1678 + _1816;
        float _1820 = fma(_1806, _1806, _1814);
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1824 = fma(_1818, _1818, _1820);
        float _1826 = sqrt(_1824);
        float _1828 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1830 = precise::min(_1826, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1832 = _1830 * _1822;
        float _1834 = -_1684;
        float _1836 = _1834 + _1786;
        float _1838 = _1828 * _1832;
        float _1840 = -_1678;
        float _1842 = _1840 + _1788;
        float _1844 = fma(_1836, _1838, _1684);
        float _1846 = fma(_1812, _1838, _1714);
        float _1848 = fma(_1842, _1838, _1678);
        _1792 = _1846;
        _1794 = _1844;
        _1796 = _1848;
        _1798 = _1838;
    }
    float _1850 = _1792;
    float _1852 = _1794;
    float _1854 = _1796;
    float _1856 = _1798;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1860 = _1850 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1852 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1854 + _1866;
    float _1870 = _1860 * _1860;
    float _1872 = fma(_1864, _1864, _1870);
    float _1874 = fma(_1868, _1868, _1872);
    float _1876 = rsqrt(_1874);
    float _1878 = sqrt(_1874);
    float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1864 * _1880;
    float _1884 = _1868 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1856;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1860;
    float _1908 = _1882;
    if (_1894)
    {
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1910;
    }
    float _1912 = _1900;
    if (_1894)
    {
        float _1914 = rsqrt(_1890);
        _1902 = _1914;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1894)
    {
        float _1920 = _1898 * _1912;
        _1904 = _1920;
    }
    float _1922 = _1904;
    if (_1894)
    {
        float _1924 = _1922 * 0.15915493667125701904296875;
        _1730 = _1924;
    }
    float _1926 = _1730;
    float _1928 = _1868;
    if (_1894)
    {
        float _1930 = _1926 * 6.283185482025146484375;
        float _1932 = sin(_1930);
        _1928 = _1932;
    }
    float _1934 = _1928;
    float _1936 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1938 = precise::max(0.0, _1936);
    float _1940 = _1912;
    float _1942 = _1938;
    if (_1894)
    {
        float _1944 = _1926 * 6.283185482025146484375;
        float _1946 = cos(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = -_1880;
    float _1952 = -_1938;
    float _1954 = fma(_1860, _1950, _1952);
    if (_1894)
    {
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1906 = _1956;
    }
    float _1958 = _1906;
    float _1960 = _1934;
    float _1962 = _1958;
    if (_1894)
    {
        float _1964 = fma(_1934, _1958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1960 = _1964;
    }
    float _1966 = _1960;
    float _1968 = _1966;
    if (!_1894)
    {
        _1962 = _1884;
    }
    float _1970 = _1962;
    float _1972 = _1970;
    if (_1894)
    {
        float _1974 = _1948 + (-1.0);
        _1942 = _1974;
    }
    float _1976 = _1942;
    float _1978 = _1976;
    if (_1894)
    {
        float _1980 = _1916 * _1966;
        _1732 = _1980;
    }
    float _1982 = _1732;
    if (!_1894)
    {
        _1968 = _1954;
    }
    float _1984 = _1968;
    float _1986 = _1984;
    if (_1894)
    {
        float _1988 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _1988;
    }
    float _1990 = _1978;
    float _1992 = _1990;
    if (_1894)
    {
        float _1994 = _1882 * _1982;
        _1908 = _1994;
    }
    float _1996 = _1908;
    if (!_1894)
    {
        _1918 = _1886;
    }
    float _1998 = _1918;
    float _2000 = _1998;
    if (_1894)
    {
        float _2002 = _1884 * _1982;
        _1972 = _2002;
    }
    float _2004 = _1972;
    if (_1894)
    {
        float _2006 = fma(_1954, _1948, _1990);
        _1986 = _2006;
    }
    float _2008 = _1986;
    if (_1894)
    {
        float _2010 = _1996 * _1996;
        _2000 = _2010;
    }
    float _2012 = _2000;
    if (!_1894)
    {
        _1992 = _1888;
    }
    float _2014 = _1992;
    float _2016 = _2014;
    if (_1894)
    {
        float _2018 = _2004 * _2004;
        _2016 = _2018;
    }
    float _2020 = _2016;
    float _2022 = fma(_2008, _2008, _2012);
    float _2024 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2026 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2028 = _2022 + _2020;
    float _2030 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2024);
    float _2032 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2028);
    float _2042 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2044 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2046 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2030);
    float _2048 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2050 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2042);
    float _2052 = -_2038;
    float _2054 = _2052 + 1.0;
    float _2056 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2058 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2048);
    float _2060 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2044);
    float _2062 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2050);
    float _2064 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2066 = abs(_2054);
    float _2068 = log2(_2066);
    float _2070 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2072 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2058);
    float _2074 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2040 * _1996;
    float _2078 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, _2026, 1.0);
    float _2084 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = _2040 * _2008;
    float _2088 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2078);
    float _2092 = _2040 * _2004;
    float _2094 = log2(_2082);
    float _2096 = -_2088;
    float _2098 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2096);
    float _2100 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2090);
    float _2102 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2106 = -_2092;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2098);
    float _2110 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2100);
    float _2112 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2114 = exp2(_2104);
    float _2116 = fma(_2108, -0.5, 0.5);
    float _2118 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2112);
    float _2120 = _2086 + 1.0;
    float _2122 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2118);
    float _2124 = 1.0 / _2110;
    float _2126 = fma(_2108, 0.5, 0.5);
    float _2128 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2122);
    float _2132 = _2094 * 0.693147182464599609375;
    float _2134 = fma(_2126, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2136 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2128);
    float _2138 = sqrt(_2116);
    float _2140 = fma(_2126, _2134, -0.212114393711090087890625);
    float _2142 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2136);
    float _2144 = -_2086;
    float _2146 = fma(_2114, _2120, _2144);
    float _2148 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = fma(_2126, _2140, 1.570728778839111328125);
    float _2152 = _2130 * _2124;
    float _2154 = _2142 * _2124;
    float _2156 = fma(_2152, 0.5, 0.5);
    float _2158 = fma(_2154, -0.5, 0.5);
    float _2160 = _2138 * 0.636619746685028076171875;
    float _2162 = fma(_2146, 0.5, 0.5);
    float _2164 = -_2150;
    float _2166 = fma(_2160, _2164, 1.0);
    float3 _5670 = float3(_2156, _2158, _2148);
    float _2168 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5670, float3(0.0), isnan(_5670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5670, float3(0.0), isnan(_5670)), level(0.0)).x;
    float3 _5681 = float3(_2156, _2158, _2148);
    float4 _2171 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5681, float3(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5681, float3(0.0), isnan(_5681)), level(0.0)).xyzw;
    float _2173 = _2171.x;
    float _2175 = _2171.y;
    float _2177 = _2171.z;
    float _2179 = _2171.w;
    float2 _5698 = float2(_2166, _2162);
    float3 _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5698, float2(0.0), isnan(_5698)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5698, float2(0.0), isnan(_5698)), level(0.0)).xyz;
    float _2185 = _2183.x;
    float _2187 = _2183.y;
    float _2189 = _2183.z;
    float _2191 = in.m_61.x;
    float _2193 = in.m_61.y;
    float _2195 = in.m_61.z;
    bool _2197 = _1544 != 0.0;
    bool _2199 = isnan(_1544);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan(0.0);
    bool _2205 = _2201 || _2203;
    float _2207 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2209 = _1542 == 0.0;
    bool _2211 = !_2205;
    bool _2213 = _2209 && _2211;
    float _2215 = exp2(_2207);
    bool _2217 = _1546 == 0.0;
    bool _2219 = _2217 && _2213;
    float _2221 = _2195;
    float _2223 = _2191;
    float _2225 = _2193;
    if (!_2219)
    {
        float _2227 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2195);
        _2221 = _2227;
    }
    float _2229 = _2221;
    if (!_2219)
    {
        float _2231 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2223 = _2231;
    }
    float _2233 = _2223;
    if (!_2219)
    {
        float _2235 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2193);
        _2225 = _2235;
    }
    float _2237 = _2225;
    float _2239 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = _1600 * _2229;
    float _2243 = -_2229;
    float _2245 = _1608 * _2243;
    float _2247 = _1612 * _2229;
    float _2249 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2251 = fma(_1626, _2233, _2241);
    float _2253 = fma(_1624, _2233, _2245);
    float _2255 = fma(_1630, _2233, _2247);
    float _2257 = -_2215;
    float _2259 = _2257 + 1.0;
    float _2261 = -_2237;
    float _2263 = fma(_1634, _2261, _2251);
    float _2265 = -_2237;
    float _2267 = fma(_1616, _2265, _2253);
    float _2269 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2249);
    float _2271 = -_2237;
    float _2273 = fma(_1642, _2271, _2255);
    float _2275 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2277 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2281 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2283 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2275);
    float _2285 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2277);
    float _2287 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2269);
    float _2289 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2279);
    float _2291 = _2130 + _2110;
    float _2293 = _2110 * 0.5;
    float _2295 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2283);
    float _2297 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2285);
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2289);
    float _2301 = _2291 * 0.5;
    float _2303 = fma(_2142, -0.5, _2293);
    float _2305 = _2287 + _2110;
    out.m_63.x = _2299;
    out.m_63.y = _2295;
    out.m_63.z = _2297;
    float _2307 = _2305 * 0.5;
    float _2309 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2130;
    out.gl_Position.y = _2142;
    out.gl_Position.z = _2287;
    out.gl_Position.w = _2110;
    out.m_65.x = _2301;
    out.m_65.y = _2303;
    out.m_65.z = _2307;
    out.m_65.w = _2110;
    out.m_45.x = _2309;
    float _2311 = _2281 * _2168;
    float _2313 = -_2281;
    float _2315 = _2313 + 1.0;
    float _2317 = _2179 * _2311;
    float _2319 = _2189 * _2311;
    float _2321 = _2179 * _2315;
    float _2323 = fma(_2185, _2317, _2173);
    float _2325 = fma(_2187, _2317, _2175);
    float _2327 = fma(_2179, _2319, _2177);
    out.m_67.x = _2323;
    out.m_67.y = _2325;
    out.m_67.z = _2327;
    out.m_67.w = _2321;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _988 = false;
    bool _808 = false;
    bool _616 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    float _98 = _96;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_90)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2383 = as_type<float>(_104);
        out.gl_Position.z = _2383;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    float _124 = _120;
    if (_116)
    {
        float _126 = float(_86);
        _122 = _126;
    }
    float _128 = _122;
    bool _130 = _120 >= _128;
    bool _132 = !_116;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    int _138 = 0;
    if (_134)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2452 = as_type<float>(_142);
        out.gl_Position.z = _2452;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = _146;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _94 = _174;
    }
    float _176 = _94;
    float _178 = _176;
    if (!_156)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_156;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _146 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _146);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_156;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _146 * _224;
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
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_242, _162, _250);
    float _258 = fma(_252, _144, _164);
    float _260 = fma(_254, _144, _166);
    float _262 = fma(_256, _144, _168);
    bool _264 = !_244;
    float _266 = _262;
    float _284;
    if (!_264)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_86);
        float _290 = 1.0 / _288;
        float _292 = _120 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = 1.0 / _302;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _318;
    float _322 = 1.0 / _310;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = _294 + _324;
    bool _328 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_294);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_338;
    float _342 = _340 + 1.0;
    float _344 = 1.0 / _306;
    float _346 = _326 * _316;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = _294 + _348;
    bool _352 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _354 = isnan(_294);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _370 = 1.0 / _314;
    float _372 = _350 * _322;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _376 = _294 + _374;
    bool _378 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _380 = isnan(_294);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_366, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _392 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_294);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = 1.0 / _320;
    float _406 = _298 * _344;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _294 + _408;
    bool _412 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _414 = isnan(_294);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _402 * _342;
    float _426 = -_402;
    float _428 = _426 + 1.0;
    float _430 = _376 * _370;
    float _432 = -_388;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _436;
    float _440 = _362 * _434;
    float _442 = -_362;
    float _444 = _442 + 1.0;
    float _446 = fma(_438, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _410 * _404;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = _422 * _444;
    float _456 = -_422;
    float _458 = _456 + 1.0;
    float _460 = fma(_452, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _462 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_294);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = _338 * _458;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = _472 * _428;
    float _486 = -_472;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = fma(_482, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _496 = _460 * _484;
    float _498 = _446 * _484;
    float _500 = _390 * _484;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _510;
    float _514 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].x, _496);
    float _516 = fma(_478, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_492, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = fma(_504, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_508, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = fma(_512, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _528 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _530 = fma(_494, _424, _514);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _540 = fma(_518, _424, _528);
    float _542 = fma(_520, _474, _530);
    float _544 = fma(_534, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _550 = fma(_516, _424, _526);
    float _552 = fma(_524, _474, _540);
    float _554 = fma(_538, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _560;
    float _564 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _566 = fma(_522, _474, _550);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _568;
    float _572 = fma(_544, _454, _542);
    float _574 = fma(_558, _448, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _576 = fma(_562, _448, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _578 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _580 = fma(_554, _454, _566);
    float _582 = fma(_564, _454, _552);
    float _584 = fma(_574, _440, _572);
    float _586 = fma(_576, _440, _580);
    float _588 = fma(_578, _440, _582);
    float _590 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].x, _584);
    float _592 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].y, _586);
    float _594 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].z, _588);
    bool _596 = !_368;
    float _614;
    if (!_596)
    {
        float _598 = in.m_51.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_86);
        float _620 = 1.0 / _618;
        float _622 = _120 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _628 = _624 + _626;
    bool _630 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _624 + _642;
    bool _646 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _648 = isnan(_624);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _664;
    float _684 = _676 * _680;
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _690;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _696 = 1.0 / _660;
    float _698 = _656 * _688;
    float _700 = -_656;
    float _702 = _700 + 1.0;
    float _704 = _644 * _682;
    float _706 = _628 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _712;
    float _716 = fma(_692, _706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _720 = fma(_714, _706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _722 = _716 * _698;
    float _724 = _718 * _698;
    float _726 = _720 * _698;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].x, _722);
    float _742 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].y, _724);
    float _744 = fma(_730, _704, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _746 = fma(_734, _704, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _748 = fma(_738, _704, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].z, _726);
    float _752 = fma(_744, _684, _740);
    float _754 = fma(_746, _684, _742);
    float _756 = fma(_748, _684, _750);
    float _758 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].x, _752);
    float _760 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].y, _754);
    float _762 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].z, _756);
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _766 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _768 = in.m_49.x;
    float _770 = in.m_49.y;
    float _772 = in.m_49.z;
    float _774 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _776 = _764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _780 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _776;
    out.m_53.y = _778;
    out.m_53.z = _780;
    float _782 = _594 * _772;
    float _784 = _592 * _770;
    float _786 = _590 * _768;
    bool _788 = !_694;
    float _806;
    if (!_788)
    {
        float _790 = in.m_51.x;
        float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _794 = _790 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _798 = _796 * _792;
        float _800 = floor(_798);
        float _802 = -_800;
        float _804 = _798 + _802;
        _806 = _804;
        _808 = true;
    }
    else
    {
        float _810 = float(_86);
        float _812 = 1.0 / _810;
        float _814 = _120 * _812;
        _806 = _814;
    }
    _808 = false;
    float _816 = _806;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _820 = _816 + _818;
    bool _822 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _824 = isnan(_816);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _836 = _816 + _834;
    bool _838 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _840 = isnan(_816);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _858 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _860 = isnan(_816);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = 1.0 / _856;
    float _876 = _868 * _872;
    float _878 = -_868;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _882;
    bool _886 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _888 = 1.0 / _852;
    float _890 = _848 * _880;
    float _892 = -_848;
    float _894 = _892 + 1.0;
    float _896 = _836 * _874;
    float _898 = _820 * _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _904;
    float _908 = fma(_884, _898, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _910 = fma(_902, _898, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _912 = fma(_906, _898, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _914 = _908 * _890;
    float _916 = _910 * _890;
    float _918 = _912 * _890;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _932 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].x, _914);
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].y, _916);
    float _936 = fma(_922, _896, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _938 = fma(_926, _896, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _940 = fma(_930, _896, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _942 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].z, _918);
    float _944 = fma(_936, _876, _932);
    float _946 = fma(_938, _876, _934);
    float _948 = fma(_940, _876, _942);
    float _950 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].x, _944);
    float _952 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].y, _946);
    float _954 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].z, _948);
    float _956 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _960 = _954 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _962;
    out.m_55.y = _964;
    out.m_55.z = _966;
    bool _968 = !_886;
    float _986;
    if (!_968)
    {
        float _970 = in.m_51.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[14].x, _120);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_86);
        float _992 = 1.0 / _990;
        float _994 = _120 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = in.m_51.x;
    float _1000 = in.m_51.y;
    float _1002 = in.m_51.z;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1012 = 1.0 / _1006;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1022 = 1.0 / _1010;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1028 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1030 = isnan(_996);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _1000 + _998;
    float _1042 = _998 * 2.0;
    float _1044 = 1.0 / _1016;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = _1000 * 2.0;
    float _1052 = _1002 + (-0.5);
    float _1054 = _1040 + (-1.0);
    float _1056 = -_1038;
    float _1058 = _1056 + 1.0;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1064 = 1.0 / _1020;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1076 = _1074 != 0;
    float _1078 = _1000 + _1002;
    float _1080 = 1.0 / _1026;
    float _1082 = _998 + (-0.5);
    float _1084 = _1078 + (-1.0);
    float _1086 = 1.0 / _1048;
    float _1088 = _1002 + _998;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1090;
    float _1094 = _1088 + (-1.0);
    float _1096 = _1092 * _1012;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1102 = 1.0 / _1062;
    float _1104 = _1000 + (-0.5);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1110 = _1108 * _1022;
    float _1112 = floor(_1042);
    float _1114 = _1002 * 2.0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1124;
    float _1128 = _1100 * _1086;
    float _1130 = _1118 * _1044;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1132;
    float _1136 = floor(_1114);
    float _1138 = _1126 * _1102;
    float _1140 = _1122 * _1064;
    bool _1142 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1144 = isnan(_996);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = _1134 * _1080;
    float _1156 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1158 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1160 = isnan(_996);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = floor(_1050);
    bool _1172 = _1112 > 0.0;
    float _1174 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1176 = _1112 >= 0.0;
    bool _1178 = isnan(_1112);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(0.0);
    bool _1184 = _1180 || _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1188 = _996 + _1186;
    bool _1190 = !_1068;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = -_1168;
    float _1196 = _1194 + 1.0;
    float _1198 = -_1152;
    float _1200 = _1198 + 1.0;
    bool _1202 = _1136 >= 0.0;
    bool _1204 = isnan(_1136);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(0.0);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1096, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1216 = log2(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1220 = _996 + _1218;
    int _1222 = _1210 ? 0 : 1;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1226 = _996 + _1224;
    bool _1228 = _1136 > 0.0;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1232 = _996 + _1230;
    bool _1234 = _1170 > 0.0;
    float _1236 = fma(_1130, _1220, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1238 = _1170 >= 0.0;
    bool _1240 = isnan(_1170);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.0);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_1110, _1232, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1250 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1252 = isnan(_996);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = fma(_1140, _1226, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1264 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1266 = isnan(_996);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1278 = _996 + _1276;
    int _1280 = abs(_1192);
    float _1282 = _1260 * _1196;
    float _1284 = -_1260;
    float _1286 = _1284 + 1.0;
    float _1288 = _1216 * _120;
    int _1290 = ~_1222;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    float _1296 = _1274 * _1286;
    float _1298 = -_1274;
    float _1300 = _1298 + 1.0;
    bool _1302 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1304 = isnan(_996);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = exp2(_1288);
    int _1316 = _1294;
    if (!_1228)
    {
        int _1318 = ~_1222;
        int _1320 = _1318 + 1;
        _1316 = _1320;
    }
    int _1322 = _1316;
    float _1324 = _1152 * _1300;
    bool _1326 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1328 = isnan(_996);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -_1312;
    float _1340 = _1338 + 1.0;
    float _1342 = _1312 * _1200;
    bool _1344 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1346 = isnan(_996);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1038 * _1340;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1360 = _996 + _1358;
    float _1362 = _1354 * _1058;
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1370 = 1.0 + _1368;
    float _1372 = fma(_1154, _1360, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1376 = _996 + _1374;
    float _1378 = _1336 * _1366;
    float _1380 = fma(_1128, _1278, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1382 = -_1336;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1138, _1376, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1388 = _1212 * _1378;
    float _1390 = in.m_57.x;
    float _1392 = in.m_57.y;
    float _1394 = in.m_57.z;
    float _1396 = -_1314;
    float _1398 = _1396 + 1.0;
    bool _1400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1408 = _1404 || _1406;
    float _1410 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1388);
    float _1412 = float(_1280);
    float _1414 = 1.0 / _1370;
    float _1416 = _1408 ? _1398 : 0.0;
    float _1418 = fma(_1248, _1362, _1410);
    float _1420 = float(_1322);
    bool _1422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1424 = isnan(1.0);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1430 = _1426 || _1428;
    float _1432 = fma(_1236, _1356, _1418);
    bool _1434 = !_1076;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = _1412 * _1420;
    int _1440 = _1246 ? 0 : 1;
    float _1442 = fma(_1262, _1342, _1432);
    int _1444 = abs(_1436);
    float _1446 = _1438 * (-2.0);
    int _1448 = _1184 ? 0 : 1;
    float _1450 = fma(_1372, _1324, _1442);
    float _1452 = float(_1444);
    int _1454 = ~_1440;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    float _1460 = fma(_1380, _1296, _1450);
    float _1462 = fma(_1446, _1390, _1390);
    bool _1464 = !_1072;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1458;
    if (_1430)
    {
        float _1470 = _1416 * _1414;
        _124 = _1470;
    }
    float _1472 = _124;
    if (!_1234)
    {
        int _1474 = ~_1440;
        int _1476 = _1474 + 1;
        _1468 = _1476;
    }
    int _1478 = _1468;
    float _1480 = fma(_1156, _1446, _1156);
    int _1482 = ~_1448;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    float _1488 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1462);
    float _1490 = fma(_1386, _1282, _1460);
    int _1492 = _1486;
    if (!_1172)
    {
        int _1494 = ~_1448;
        int _1496 = _1494 + 1;
        _1492 = _1496;
    }
    int _1498 = _1492;
    int _1500 = abs(_1466);
    float _1502 = fma(_1480, _1472, _1488);
    float _1504 = float(_1478);
    float _1506 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1490);
    float _1508 = float(_1500);
    float _1510 = _1452 * _1504;
    float _1512 = float(_1498);
    float _1514 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[191].y, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1516 = _1510 * (-2.0);
    float _1518 = _1508 * _1512;
    float _1520 = fma(_1514, 6.283185482025146484375, _1392);
    float _1522 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1524 = _1502 * 0.15915493667125701904296875;
    float _1526 = _1518 * (-2.0);
    float _1528 = fma(_1516, _1394, _1394);
    float _1530 = fma(_1174, _1516, _1174);
    float _1532 = _1524 * 6.283185482025146484375;
    float _1534 = sin(_1532);
    float _1536 = fma(_1520, _1526, _1520);
    float _1538 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1528);
    float _1540 = fma(_1522, _1526, _1522);
    float _1542 = in.m_59.x;
    float _1544 = in.m_59.y;
    float _1546 = in.m_59.z;
    float _1548 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1536);
    float _1550 = fma(_1530, _1472, _1538);
    float _1552 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1554 = _1524 * 6.283185482025146484375;
    float _1556 = cos(_1554);
    float _1558 = fma(_1540, _1472, _1548);
    float _1560 = _1550 * 0.15915493667125701904296875;
    float _1562 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1564 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1566 = isnan(0.5);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1572 = _1568 || _1570;
    float _1574 = _1558 * 0.15915493667125701904296875;
    float _1576 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1578 = _1560 * 6.283185482025146484375;
    float _1580 = cos(_1578);
    float _1582 = _1574 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1544);
    float _1588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1546);
    float _1590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1542);
    float _1592 = _1574 * 6.283185482025146484375;
    float _1594 = cos(_1592);
    float _1596 = _1586 * _1552;
    float _1598 = _1588 * _1576;
    float _1600 = _1556 * _1580;
    float _1602 = _1590 * _1562;
    float _1604 = _1600 * _1598;
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1534 * _1584;
    float _1612 = _1534 * _1580;
    float _1614 = _1556 * _1584;
    float _1616 = _1584 * _1580;
    float _1618 = _1612 * _1598;
    float _1620 = _1556 * _1594;
    float _1622 = _1534 * _1594;
    float _1624 = _1594 * _1580;
    float _1626 = fma(_1608, _1620, _1610);
    float _1628 = -_1614;
    float _1630 = fma(_1608, _1622, _1628);
    float _1632 = -_1622;
    float _1634 = fma(_1608, _1614, _1632);
    float _1636 = -_1598;
    float _1638 = _1608 * _1636;
    float _1640 = fma(_1626, _1602, _1604);
    float _1642 = fma(_1608, _1610, _1620);
    float _1644 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1646 = fma(_1624, _1602, _1638);
    float _1648 = -_1596;
    float _1650 = fma(_1634, _1648, _1640);
    float _1652 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1654 = fma(_1630, _1602, _1618);
    float _1656 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1644);
    float _1658 = -_1596;
    float _1660 = fma(_1616, _1658, _1646);
    float _1662 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1664 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1652);
    float _1666 = -_1596;
    float _1668 = fma(_1642, _1666, _1654);
    float _1670 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1656);
    float _1672 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1674 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1662);
    float _1676 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1664);
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1680 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1672);
    float _1682 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1674);
    float _1684 = _1676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1686 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1688 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1680);
    float _1690 = _1678 + _1682;
    float _1692 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1694 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1686);
    float _1696 = _1684 + _1688;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1700 = _1690 + _1698;
    float _1702 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1692);
    float _1704 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1694);
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1702);
    float _1714 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1716 = fma(_1708, _1708, _1710);
    float _1718 = _1714 + _1712;
    float _1720 = sqrt(_1716);
    bool _1722 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1704;
    float _1726 = _1710;
    float _1728 = _1720;
    float _1730 = _1718;
    float _1732 = _1668;
    if (!_1722)
    {
        _266 = _1696;
    }
    float _1734 = _266;
    float _1736 = _1734;
    if (!_1722)
    {
        _1724 = _1690;
    }
    float _1738 = _1724;
    float _1740 = _1738;
    if (!_1722)
    {
        _1726 = _1718;
    }
    float _1742 = _1726;
    bool _1744 = !_1722;
    float _1746 = _1742;
    if (!_1744)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1752 = _1720 + _1750;
        float _1754 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1756 = rsqrt(_1716);
        float _1758 = _1752 * _1748;
        float _1760 = _1758 * 0.15915493667125701904296875;
        float _1762 = _1760 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1760 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764 + (-1.0);
        float _1772 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1774 = fma(_1768, _1754, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1776 = fma(_1718, _1764, _1772);
        float _1778 = _1756 * _1774;
        float _1780 = fma(_1708, _1778, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1782 = fma(_1700, _1778, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1746 = _1776;
        _1736 = _1780;
        _1740 = _1782;
        _1728 = _1760;
    }
    float _1784 = _1746;
    float _1786 = _1736;
    float _1788 = _1740;
    float _1790 = _1728;
    float _1792 = _1784;
    float _1794 = _1786;
    float _1796 = _1788;
    float _1798 = _1790;
    if (!_1572)
    {
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1802 = _1714 + _1800;
        float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1806 = _1684 + _1804;
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1810 = -_1714;
        float _1812 = _1810 + _1784;
        float _1814 = _1802 * _1802;
        float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1818 = _1678 + _1816;
        float _1820 = fma(_1806, _1806, _1814);
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1824 = fma(_1818, _1818, _1820);
        float _1826 = sqrt(_1824);
        float _1828 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1830 = precise::min(_1826, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1832 = _1830 * _1822;
        float _1834 = -_1684;
        float _1836 = _1834 + _1786;
        float _1838 = _1828 * _1832;
        float _1840 = -_1678;
        float _1842 = _1840 + _1788;
        float _1844 = fma(_1836, _1838, _1684);
        float _1846 = fma(_1812, _1838, _1714);
        float _1848 = fma(_1842, _1838, _1678);
        _1792 = _1846;
        _1794 = _1844;
        _1796 = _1848;
        _1798 = _1838;
    }
    float _1850 = _1792;
    float _1852 = _1794;
    float _1854 = _1796;
    float _1856 = _1798;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1860 = _1850 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1852 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1854 + _1866;
    float _1870 = _1860 * _1860;
    float _1872 = fma(_1864, _1864, _1870);
    float _1874 = fma(_1868, _1868, _1872);
    float _1876 = rsqrt(_1874);
    float _1878 = sqrt(_1874);
    float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1864 * _1880;
    float _1884 = _1868 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1856;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1860;
    float _1908 = _1882;
    if (_1894)
    {
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1910;
    }
    float _1912 = _1900;
    if (_1894)
    {
        float _1914 = rsqrt(_1890);
        _1902 = _1914;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1894)
    {
        float _1920 = _1898 * _1912;
        _1904 = _1920;
    }
    float _1922 = _1904;
    if (_1894)
    {
        float _1924 = _1922 * 0.15915493667125701904296875;
        _1730 = _1924;
    }
    float _1926 = _1730;
    float _1928 = _1868;
    if (_1894)
    {
        float _1930 = _1926 * 6.283185482025146484375;
        float _1932 = sin(_1930);
        _1928 = _1932;
    }
    float _1934 = _1928;
    float _1936 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1938 = precise::max(0.0, _1936);
    float _1940 = _1912;
    float _1942 = _1938;
    if (_1894)
    {
        float _1944 = _1926 * 6.283185482025146484375;
        float _1946 = cos(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = -_1880;
    float _1952 = -_1938;
    float _1954 = fma(_1860, _1950, _1952);
    if (_1894)
    {
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1906 = _1956;
    }
    float _1958 = _1906;
    float _1960 = _1934;
    float _1962 = _1958;
    if (_1894)
    {
        float _1964 = fma(_1934, _1958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1960 = _1964;
    }
    float _1966 = _1960;
    float _1968 = _1966;
    if (!_1894)
    {
        _1962 = _1884;
    }
    float _1970 = _1962;
    float _1972 = _1970;
    if (_1894)
    {
        float _1974 = _1948 + (-1.0);
        _1942 = _1974;
    }
    float _1976 = _1942;
    float _1978 = _1976;
    if (_1894)
    {
        float _1980 = _1916 * _1966;
        _1732 = _1980;
    }
    float _1982 = _1732;
    if (!_1894)
    {
        _1968 = _1954;
    }
    float _1984 = _1968;
    float _1986 = _1984;
    if (_1894)
    {
        float _1988 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _1988;
    }
    float _1990 = _1978;
    float _1992 = _1990;
    if (_1894)
    {
        float _1994 = _1882 * _1982;
        _1908 = _1994;
    }
    float _1996 = _1908;
    if (!_1894)
    {
        _1918 = _1886;
    }
    float _1998 = _1918;
    float _2000 = _1998;
    if (_1894)
    {
        float _2002 = _1884 * _1982;
        _1972 = _2002;
    }
    float _2004 = _1972;
    if (_1894)
    {
        float _2006 = fma(_1954, _1948, _1990);
        _1986 = _2006;
    }
    float _2008 = _1986;
    if (_1894)
    {
        float _2010 = _1996 * _1996;
        _2000 = _2010;
    }
    float _2012 = _2000;
    if (!_1894)
    {
        _1992 = _1888;
    }
    float _2014 = _1992;
    float _2016 = _2014;
    if (_1894)
    {
        float _2018 = _2004 * _2004;
        _2016 = _2018;
    }
    float _2020 = _2016;
    float _2022 = fma(_2008, _2008, _2012);
    float _2024 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2026 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2028 = _2022 + _2020;
    float _2030 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2024);
    float _2032 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2028);
    float _2042 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2044 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2046 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2030);
    float _2048 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2050 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2042);
    float _2052 = -_2038;
    float _2054 = _2052 + 1.0;
    float _2056 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2058 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2048);
    float _2060 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2044);
    float _2062 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2050);
    float _2064 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2066 = abs(_2054);
    float _2068 = log2(_2066);
    float _2070 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2072 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2058);
    float _2074 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2040 * _1996;
    float _2078 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, _2026, 1.0);
    float _2084 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = _2040 * _2008;
    float _2088 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2078);
    float _2092 = _2040 * _2004;
    float _2094 = log2(_2082);
    float _2096 = -_2088;
    float _2098 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2096);
    float _2100 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2090);
    float _2102 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2106 = -_2092;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2098);
    float _2110 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2100);
    float _2112 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2114 = exp2(_2104);
    float _2116 = fma(_2108, -0.5, 0.5);
    float _2118 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2112);
    float _2120 = _2086 + 1.0;
    float _2122 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2118);
    float _2124 = 1.0 / _2110;
    float _2126 = fma(_2108, 0.5, 0.5);
    float _2128 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2122);
    float _2132 = _2094 * 0.693147182464599609375;
    float _2134 = fma(_2126, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2136 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2128);
    float _2138 = sqrt(_2116);
    float _2140 = fma(_2126, _2134, -0.212114393711090087890625);
    float _2142 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2136);
    float _2144 = -_2086;
    float _2146 = fma(_2114, _2120, _2144);
    float _2148 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = fma(_2126, _2140, 1.570728778839111328125);
    float _2152 = _2130 * _2124;
    float _2154 = _2142 * _2124;
    float _2156 = fma(_2152, 0.5, 0.5);
    float _2158 = fma(_2154, -0.5, 0.5);
    float _2160 = _2138 * 0.636619746685028076171875;
    float _2162 = fma(_2146, 0.5, 0.5);
    float _2164 = -_2150;
    float _2166 = fma(_2160, _2164, 1.0);
    float3 _5670 = float3(_2156, _2158, _2148);
    float _2168 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5670, float3(0.0), isnan(_5670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5670, float3(0.0), isnan(_5670)), level(0.0)).x;
    float3 _5681 = float3(_2156, _2158, _2148);
    float4 _2171 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5681, float3(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5681, float3(0.0), isnan(_5681)), level(0.0)).xyzw;
    float _2173 = _2171.x;
    float _2175 = _2171.y;
    float _2177 = _2171.z;
    float _2179 = _2171.w;
    float2 _5698 = float2(_2166, _2162);
    float3 _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5698, float2(0.0), isnan(_5698)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5698, float2(0.0), isnan(_5698)), level(0.0)).xyz;
    float _2185 = _2183.x;
    float _2187 = _2183.y;
    float _2189 = _2183.z;
    float _2191 = in.m_61.x;
    float _2193 = in.m_61.y;
    float _2195 = in.m_61.z;
    bool _2197 = _1544 != 0.0;
    bool _2199 = isnan(_1544);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan(0.0);
    bool _2205 = _2201 || _2203;
    float _2207 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2209 = _1542 == 0.0;
    bool _2211 = !_2205;
    bool _2213 = _2209 && _2211;
    float _2215 = exp2(_2207);
    bool _2217 = _1546 == 0.0;
    bool _2219 = _2217 && _2213;
    float _2221 = _2195;
    float _2223 = _2191;
    float _2225 = _2193;
    if (!_2219)
    {
        float _2227 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2195);
        _2221 = _2227;
    }
    float _2229 = _2221;
    if (!_2219)
    {
        float _2231 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2223 = _2231;
    }
    float _2233 = _2223;
    if (!_2219)
    {
        float _2235 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2193);
        _2225 = _2235;
    }
    float _2237 = _2225;
    float _2239 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = _1600 * _2229;
    float _2243 = -_2229;
    float _2245 = _1608 * _2243;
    float _2247 = _1612 * _2229;
    float _2249 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2251 = fma(_1626, _2233, _2241);
    float _2253 = fma(_1624, _2233, _2245);
    float _2255 = fma(_1630, _2233, _2247);
    float _2257 = -_2215;
    float _2259 = _2257 + 1.0;
    float _2261 = -_2237;
    float _2263 = fma(_1634, _2261, _2251);
    float _2265 = -_2237;
    float _2267 = fma(_1616, _2265, _2253);
    float _2269 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2249);
    float _2271 = -_2237;
    float _2273 = fma(_1642, _2271, _2255);
    float _2275 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2277 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2281 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2283 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2275);
    float _2285 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2277);
    float _2287 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2269);
    float _2289 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2279);
    float _2291 = _2130 + _2110;
    float _2293 = _2110 * 0.5;
    float _2295 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2283);
    float _2297 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2285);
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2289);
    float _2301 = _2291 * 0.5;
    float _2303 = fma(_2142, -0.5, _2293);
    float _2305 = _2287 + _2110;
    out.m_63.x = _2299;
    out.m_63.y = _2295;
    out.m_63.z = _2297;
    float _2307 = _2305 * 0.5;
    float _2309 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2130;
    out.gl_Position.y = _2142;
    out.gl_Position.z = _2287;
    out.gl_Position.w = _2110;
    out.m_65.x = _2301;
    out.m_65.y = _2303;
    out.m_65.z = _2307;
    out.m_65.w = _2110;
    out.m_45.x = _2309;
    float _2311 = _2281 * _2168;
    float _2313 = -_2281;
    float _2315 = _2313 + 1.0;
    float _2317 = _2179 * _2311;
    float _2319 = _2189 * _2311;
    float _2321 = _2179 * _2315;
    float _2323 = fma(_2185, _2317, _2173);
    float _2325 = fma(_2187, _2317, _2175);
    float _2327 = fma(_2179, _2319, _2177);
    out.m_67.x = _2323;
    out.m_67.y = _2325;
    out.m_67.z = _2327;
    out.m_67.w = _2321;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _988 = false;
    bool _808 = false;
    bool _616 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    float _98 = _96;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_90)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2383 = as_type<float>(_104);
        out.gl_Position.z = _2383;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    float _124 = _120;
    if (_116)
    {
        float _126 = float(_86);
        _122 = _126;
    }
    float _128 = _122;
    bool _130 = _120 >= _128;
    bool _132 = !_116;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    int _138 = 0;
    if (_134)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2452 = as_type<float>(_142);
        out.gl_Position.z = _2452;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = _146;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _94 = _174;
    }
    float _176 = _94;
    float _178 = _176;
    if (!_156)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_156;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _146 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _146);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_156;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _146 * _224;
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
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_242, _162, _250);
    float _258 = fma(_252, _144, _164);
    float _260 = fma(_254, _144, _166);
    float _262 = fma(_256, _144, _168);
    bool _264 = !_244;
    float _266 = _262;
    float _284;
    if (!_264)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_86);
        float _290 = 1.0 / _288;
        float _292 = _120 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = 1.0 / _302;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _318;
    float _322 = 1.0 / _310;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = _294 + _324;
    bool _328 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_294);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_338;
    float _342 = _340 + 1.0;
    float _344 = 1.0 / _306;
    float _346 = _326 * _316;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = _294 + _348;
    bool _352 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _354 = isnan(_294);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _370 = 1.0 / _314;
    float _372 = _350 * _322;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _376 = _294 + _374;
    bool _378 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _380 = isnan(_294);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_366, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _392 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_294);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = 1.0 / _320;
    float _406 = _298 * _344;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _294 + _408;
    bool _412 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _414 = isnan(_294);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _402 * _342;
    float _426 = -_402;
    float _428 = _426 + 1.0;
    float _430 = _376 * _370;
    float _432 = -_388;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _436;
    float _440 = _362 * _434;
    float _442 = -_362;
    float _444 = _442 + 1.0;
    float _446 = fma(_438, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _410 * _404;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = _422 * _444;
    float _456 = -_422;
    float _458 = _456 + 1.0;
    float _460 = fma(_452, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _462 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_294);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = _338 * _458;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = _472 * _428;
    float _486 = -_472;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = fma(_482, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _496 = _460 * _484;
    float _498 = _446 * _484;
    float _500 = _390 * _484;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _510;
    float _514 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].x, _496);
    float _516 = fma(_478, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_492, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = fma(_504, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_508, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = fma(_512, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].y, _498);
    float _528 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _530 = fma(_494, _424, _514);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _540 = fma(_518, _424, _528);
    float _542 = fma(_520, _474, _530);
    float _544 = fma(_534, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _550 = fma(_516, _424, _526);
    float _552 = fma(_524, _474, _540);
    float _554 = fma(_538, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _560;
    float _564 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _566 = fma(_522, _474, _550);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _568;
    float _572 = fma(_544, _454, _542);
    float _574 = fma(_558, _448, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _576 = fma(_562, _448, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _578 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _580 = fma(_554, _454, _566);
    float _582 = fma(_564, _454, _552);
    float _584 = fma(_574, _440, _572);
    float _586 = fma(_576, _440, _580);
    float _588 = fma(_578, _440, _582);
    float _590 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].x, _584);
    float _592 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].y, _586);
    float _594 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[148].z, _588);
    bool _596 = !_368;
    float _614;
    if (!_596)
    {
        float _598 = in.m_51.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_86);
        float _620 = 1.0 / _618;
        float _622 = _120 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _628 = _624 + _626;
    bool _630 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _644 = _624 + _642;
    bool _646 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _648 = isnan(_624);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_640;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _664;
    float _684 = _676 * _680;
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _690;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _696 = 1.0 / _660;
    float _698 = _656 * _688;
    float _700 = -_656;
    float _702 = _700 + 1.0;
    float _704 = _644 * _682;
    float _706 = _628 * _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _712;
    float _716 = fma(_692, _706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _718 = fma(_710, _706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _720 = fma(_714, _706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _722 = _716 * _698;
    float _724 = _718 * _698;
    float _726 = _720 * _698;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].x, _722);
    float _742 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].y, _724);
    float _744 = fma(_730, _704, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _746 = fma(_734, _704, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _748 = fma(_738, _704, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[107].z, _726);
    float _752 = fma(_744, _684, _740);
    float _754 = fma(_746, _684, _742);
    float _756 = fma(_748, _684, _750);
    float _758 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].x, _752);
    float _760 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].y, _754);
    float _762 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[109].z, _756);
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _766 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _768 = in.m_49.x;
    float _770 = in.m_49.y;
    float _772 = in.m_49.z;
    float _774 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _776 = _764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _780 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _776;
    out.m_53.y = _778;
    out.m_53.z = _780;
    float _782 = _594 * _772;
    float _784 = _592 * _770;
    float _786 = _590 * _768;
    bool _788 = !_694;
    float _806;
    if (!_788)
    {
        float _790 = in.m_51.x;
        float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _794 = _790 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _798 = _796 * _792;
        float _800 = floor(_798);
        float _802 = -_800;
        float _804 = _798 + _802;
        _806 = _804;
        _808 = true;
    }
    else
    {
        float _810 = float(_86);
        float _812 = 1.0 / _810;
        float _814 = _120 * _812;
        _806 = _814;
    }
    _808 = false;
    float _816 = _806;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _820 = _816 + _818;
    bool _822 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _824 = isnan(_816);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _836 = _816 + _834;
    bool _838 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _840 = isnan(_816);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _858 = _816 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _860 = isnan(_816);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -_832;
    float _872 = _870 + 1.0;
    float _874 = 1.0 / _856;
    float _876 = _868 * _872;
    float _878 = -_868;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _882;
    bool _886 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _888 = 1.0 / _852;
    float _890 = _848 * _880;
    float _892 = -_848;
    float _894 = _892 + 1.0;
    float _896 = _836 * _874;
    float _898 = _820 * _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _904;
    float _908 = fma(_884, _898, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _910 = fma(_902, _898, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _912 = fma(_906, _898, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _914 = _908 * _890;
    float _916 = _910 * _890;
    float _918 = _912 * _890;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _932 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].x, _914);
    float _934 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].y, _916);
    float _936 = fma(_922, _896, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _938 = fma(_926, _896, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _940 = fma(_930, _896, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _942 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].z, _918);
    float _944 = fma(_936, _876, _932);
    float _946 = fma(_938, _876, _934);
    float _948 = fma(_940, _876, _942);
    float _950 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].x, _944);
    float _952 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].y, _946);
    float _954 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[125].z, _948);
    float _956 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _960 = _954 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _962;
    out.m_55.y = _964;
    out.m_55.z = _966;
    bool _968 = !_886;
    float _986;
    if (!_968)
    {
        float _970 = in.m_51.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[14].x, _120);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_86);
        float _992 = 1.0 / _990;
        float _994 = _120 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = in.m_51.x;
    float _1000 = in.m_51.y;
    float _1002 = in.m_51.z;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1012 = 1.0 / _1006;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1022 = 1.0 / _1010;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1028 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1030 = isnan(_996);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _1000 + _998;
    float _1042 = _998 * 2.0;
    float _1044 = 1.0 / _1016;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = _1000 * 2.0;
    float _1052 = _1002 + (-0.5);
    float _1054 = _1040 + (-1.0);
    float _1056 = -_1038;
    float _1058 = _1056 + 1.0;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1064 = 1.0 / _1020;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1076 = _1074 != 0;
    float _1078 = _1000 + _1002;
    float _1080 = 1.0 / _1026;
    float _1082 = _998 + (-0.5);
    float _1084 = _1078 + (-1.0);
    float _1086 = 1.0 / _1048;
    float _1088 = _1002 + _998;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1090;
    float _1094 = _1088 + (-1.0);
    float _1096 = _1092 * _1012;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1102 = 1.0 / _1062;
    float _1104 = _1000 + (-0.5);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1110 = _1108 * _1022;
    float _1112 = floor(_1042);
    float _1114 = _1002 * 2.0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1124;
    float _1128 = _1100 * _1086;
    float _1130 = _1118 * _1044;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1132;
    float _1136 = floor(_1114);
    float _1138 = _1126 * _1102;
    float _1140 = _1122 * _1064;
    bool _1142 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1144 = isnan(_996);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = _1134 * _1080;
    float _1156 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1158 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1160 = isnan(_996);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = floor(_1050);
    bool _1172 = _1112 > 0.0;
    float _1174 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1176 = _1112 >= 0.0;
    bool _1178 = isnan(_1112);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(0.0);
    bool _1184 = _1180 || _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1188 = _996 + _1186;
    bool _1190 = !_1068;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = -_1168;
    float _1196 = _1194 + 1.0;
    float _1198 = -_1152;
    float _1200 = _1198 + 1.0;
    bool _1202 = _1136 >= 0.0;
    bool _1204 = isnan(_1136);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(0.0);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1096, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1216 = log2(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1220 = _996 + _1218;
    int _1222 = _1210 ? 0 : 1;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1226 = _996 + _1224;
    bool _1228 = _1136 > 0.0;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1232 = _996 + _1230;
    bool _1234 = _1170 > 0.0;
    float _1236 = fma(_1130, _1220, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1238 = _1170 >= 0.0;
    bool _1240 = isnan(_1170);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.0);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_1110, _1232, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1250 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1252 = isnan(_996);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1258 = _1254 || _1256;
    float _1260 = float(_1258);
    float _1262 = fma(_1140, _1226, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1264 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1266 = isnan(_996);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1278 = _996 + _1276;
    int _1280 = abs(_1192);
    float _1282 = _1260 * _1196;
    float _1284 = -_1260;
    float _1286 = _1284 + 1.0;
    float _1288 = _1216 * _120;
    int _1290 = ~_1222;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    float _1296 = _1274 * _1286;
    float _1298 = -_1274;
    float _1300 = _1298 + 1.0;
    bool _1302 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1304 = isnan(_996);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = exp2(_1288);
    int _1316 = _1294;
    if (!_1228)
    {
        int _1318 = ~_1222;
        int _1320 = _1318 + 1;
        _1316 = _1320;
    }
    int _1322 = _1316;
    float _1324 = _1152 * _1300;
    bool _1326 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1328 = isnan(_996);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = -_1312;
    float _1340 = _1338 + 1.0;
    float _1342 = _1312 * _1200;
    bool _1344 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1346 = isnan(_996);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1038 * _1340;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1360 = _996 + _1358;
    float _1362 = _1354 * _1058;
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1370 = 1.0 + _1368;
    float _1372 = fma(_1154, _1360, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1376 = _996 + _1374;
    float _1378 = _1336 * _1366;
    float _1380 = fma(_1128, _1278, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1382 = -_1336;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1138, _1376, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1388 = _1212 * _1378;
    float _1390 = in.m_57.x;
    float _1392 = in.m_57.y;
    float _1394 = in.m_57.z;
    float _1396 = -_1314;
    float _1398 = _1396 + 1.0;
    bool _1400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1408 = _1404 || _1406;
    float _1410 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1388);
    float _1412 = float(_1280);
    float _1414 = 1.0 / _1370;
    float _1416 = _1408 ? _1398 : 0.0;
    float _1418 = fma(_1248, _1362, _1410);
    float _1420 = float(_1322);
    bool _1422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1424 = isnan(1.0);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1430 = _1426 || _1428;
    float _1432 = fma(_1236, _1356, _1418);
    bool _1434 = !_1076;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = _1412 * _1420;
    int _1440 = _1246 ? 0 : 1;
    float _1442 = fma(_1262, _1342, _1432);
    int _1444 = abs(_1436);
    float _1446 = _1438 * (-2.0);
    int _1448 = _1184 ? 0 : 1;
    float _1450 = fma(_1372, _1324, _1442);
    float _1452 = float(_1444);
    int _1454 = ~_1440;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    float _1460 = fma(_1380, _1296, _1450);
    float _1462 = fma(_1446, _1390, _1390);
    bool _1464 = !_1072;
    int _1466 = _1464 ? 0 : 1;
    int _1468 = _1458;
    if (_1430)
    {
        float _1470 = _1416 * _1414;
        _124 = _1470;
    }
    float _1472 = _124;
    if (!_1234)
    {
        int _1474 = ~_1440;
        int _1476 = _1474 + 1;
        _1468 = _1476;
    }
    int _1478 = _1468;
    float _1480 = fma(_1156, _1446, _1156);
    int _1482 = ~_1448;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    float _1488 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1462);
    float _1490 = fma(_1386, _1282, _1460);
    int _1492 = _1486;
    if (!_1172)
    {
        int _1494 = ~_1448;
        int _1496 = _1494 + 1;
        _1492 = _1496;
    }
    int _1498 = _1492;
    int _1500 = abs(_1466);
    float _1502 = fma(_1480, _1472, _1488);
    float _1504 = float(_1478);
    float _1506 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1490);
    float _1508 = float(_1500);
    float _1510 = _1452 * _1504;
    float _1512 = float(_1498);
    float _1514 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[191].y, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1516 = _1510 * (-2.0);
    float _1518 = _1508 * _1512;
    float _1520 = fma(_1514, 6.283185482025146484375, _1392);
    float _1522 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1524 = _1502 * 0.15915493667125701904296875;
    float _1526 = _1518 * (-2.0);
    float _1528 = fma(_1516, _1394, _1394);
    float _1530 = fma(_1174, _1516, _1174);
    float _1532 = _1524 * 6.283185482025146484375;
    float _1534 = sin(_1532);
    float _1536 = fma(_1520, _1526, _1520);
    float _1538 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1528);
    float _1540 = fma(_1522, _1526, _1522);
    float _1542 = in.m_59.x;
    float _1544 = in.m_59.y;
    float _1546 = in.m_59.z;
    float _1548 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1536);
    float _1550 = fma(_1530, _1472, _1538);
    float _1552 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1554 = _1524 * 6.283185482025146484375;
    float _1556 = cos(_1554);
    float _1558 = fma(_1540, _1472, _1548);
    float _1560 = _1550 * 0.15915493667125701904296875;
    float _1562 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1564 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1566 = isnan(0.5);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1572 = _1568 || _1570;
    float _1574 = _1558 * 0.15915493667125701904296875;
    float _1576 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1578 = _1560 * 6.283185482025146484375;
    float _1580 = cos(_1578);
    float _1582 = _1574 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1544);
    float _1588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1546);
    float _1590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1542);
    float _1592 = _1574 * 6.283185482025146484375;
    float _1594 = cos(_1592);
    float _1596 = _1586 * _1552;
    float _1598 = _1588 * _1576;
    float _1600 = _1556 * _1580;
    float _1602 = _1590 * _1562;
    float _1604 = _1600 * _1598;
    float _1606 = _1560 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1534 * _1584;
    float _1612 = _1534 * _1580;
    float _1614 = _1556 * _1584;
    float _1616 = _1584 * _1580;
    float _1618 = _1612 * _1598;
    float _1620 = _1556 * _1594;
    float _1622 = _1534 * _1594;
    float _1624 = _1594 * _1580;
    float _1626 = fma(_1608, _1620, _1610);
    float _1628 = -_1614;
    float _1630 = fma(_1608, _1622, _1628);
    float _1632 = -_1622;
    float _1634 = fma(_1608, _1614, _1632);
    float _1636 = -_1598;
    float _1638 = _1608 * _1636;
    float _1640 = fma(_1626, _1602, _1604);
    float _1642 = fma(_1608, _1610, _1620);
    float _1644 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1646 = fma(_1624, _1602, _1638);
    float _1648 = -_1596;
    float _1650 = fma(_1634, _1648, _1640);
    float _1652 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1654 = fma(_1630, _1602, _1618);
    float _1656 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1644);
    float _1658 = -_1596;
    float _1660 = fma(_1616, _1658, _1646);
    float _1662 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1664 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1652);
    float _1666 = -_1596;
    float _1668 = fma(_1642, _1666, _1654);
    float _1670 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1656);
    float _1672 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1674 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1662);
    float _1676 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1664);
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1680 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1672);
    float _1682 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1674);
    float _1684 = _1676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1686 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1688 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1680);
    float _1690 = _1678 + _1682;
    float _1692 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1694 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1686);
    float _1696 = _1684 + _1688;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1700 = _1690 + _1698;
    float _1702 = fma(_1660, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1692);
    float _1704 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1694);
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1702);
    float _1714 = _1704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1716 = fma(_1708, _1708, _1710);
    float _1718 = _1714 + _1712;
    float _1720 = sqrt(_1716);
    bool _1722 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1704;
    float _1726 = _1710;
    float _1728 = _1720;
    float _1730 = _1718;
    float _1732 = _1668;
    if (!_1722)
    {
        _266 = _1696;
    }
    float _1734 = _266;
    float _1736 = _1734;
    if (!_1722)
    {
        _1724 = _1690;
    }
    float _1738 = _1724;
    float _1740 = _1738;
    if (!_1722)
    {
        _1726 = _1718;
    }
    float _1742 = _1726;
    bool _1744 = !_1722;
    float _1746 = _1742;
    if (!_1744)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1752 = _1720 + _1750;
        float _1754 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1756 = rsqrt(_1716);
        float _1758 = _1752 * _1748;
        float _1760 = _1758 * 0.15915493667125701904296875;
        float _1762 = _1760 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1760 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764 + (-1.0);
        float _1772 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1774 = fma(_1768, _1754, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1776 = fma(_1718, _1764, _1772);
        float _1778 = _1756 * _1774;
        float _1780 = fma(_1708, _1778, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1782 = fma(_1700, _1778, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1746 = _1776;
        _1736 = _1780;
        _1740 = _1782;
        _1728 = _1760;
    }
    float _1784 = _1746;
    float _1786 = _1736;
    float _1788 = _1740;
    float _1790 = _1728;
    float _1792 = _1784;
    float _1794 = _1786;
    float _1796 = _1788;
    float _1798 = _1790;
    if (!_1572)
    {
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1802 = _1714 + _1800;
        float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1806 = _1684 + _1804;
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1810 = -_1714;
        float _1812 = _1810 + _1784;
        float _1814 = _1802 * _1802;
        float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1818 = _1678 + _1816;
        float _1820 = fma(_1806, _1806, _1814);
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1824 = fma(_1818, _1818, _1820);
        float _1826 = sqrt(_1824);
        float _1828 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1830 = precise::min(_1826, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1832 = _1830 * _1822;
        float _1834 = -_1684;
        float _1836 = _1834 + _1786;
        float _1838 = _1828 * _1832;
        float _1840 = -_1678;
        float _1842 = _1840 + _1788;
        float _1844 = fma(_1836, _1838, _1684);
        float _1846 = fma(_1812, _1838, _1714);
        float _1848 = fma(_1842, _1838, _1678);
        _1792 = _1846;
        _1794 = _1844;
        _1796 = _1848;
        _1798 = _1838;
    }
    float _1850 = _1792;
    float _1852 = _1794;
    float _1854 = _1796;
    float _1856 = _1798;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1860 = _1850 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1852 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1854 + _1866;
    float _1870 = _1860 * _1860;
    float _1872 = fma(_1864, _1864, _1870);
    float _1874 = fma(_1868, _1868, _1872);
    float _1876 = rsqrt(_1874);
    float _1878 = sqrt(_1874);
    float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1864 * _1880;
    float _1884 = _1868 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1856;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1860;
    float _1908 = _1882;
    if (_1894)
    {
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1910;
    }
    float _1912 = _1900;
    if (_1894)
    {
        float _1914 = rsqrt(_1890);
        _1902 = _1914;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1894)
    {
        float _1920 = _1898 * _1912;
        _1904 = _1920;
    }
    float _1922 = _1904;
    if (_1894)
    {
        float _1924 = _1922 * 0.15915493667125701904296875;
        _1730 = _1924;
    }
    float _1926 = _1730;
    float _1928 = _1868;
    if (_1894)
    {
        float _1930 = _1926 * 6.283185482025146484375;
        float _1932 = sin(_1930);
        _1928 = _1932;
    }
    float _1934 = _1928;
    float _1936 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1938 = precise::max(0.0, _1936);
    float _1940 = _1912;
    float _1942 = _1938;
    if (_1894)
    {
        float _1944 = _1926 * 6.283185482025146484375;
        float _1946 = cos(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = -_1880;
    float _1952 = -_1938;
    float _1954 = fma(_1860, _1950, _1952);
    if (_1894)
    {
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1906 = _1956;
    }
    float _1958 = _1906;
    float _1960 = _1934;
    float _1962 = _1958;
    if (_1894)
    {
        float _1964 = fma(_1934, _1958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1960 = _1964;
    }
    float _1966 = _1960;
    float _1968 = _1966;
    if (!_1894)
    {
        _1962 = _1884;
    }
    float _1970 = _1962;
    float _1972 = _1970;
    if (_1894)
    {
        float _1974 = _1948 + (-1.0);
        _1942 = _1974;
    }
    float _1976 = _1942;
    float _1978 = _1976;
    if (_1894)
    {
        float _1980 = _1916 * _1966;
        _1732 = _1980;
    }
    float _1982 = _1732;
    if (!_1894)
    {
        _1968 = _1954;
    }
    float _1984 = _1968;
    float _1986 = _1984;
    if (_1894)
    {
        float _1988 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _1988;
    }
    float _1990 = _1978;
    float _1992 = _1990;
    if (_1894)
    {
        float _1994 = _1882 * _1982;
        _1908 = _1994;
    }
    float _1996 = _1908;
    if (!_1894)
    {
        _1918 = _1886;
    }
    float _1998 = _1918;
    float _2000 = _1998;
    if (_1894)
    {
        float _2002 = _1884 * _1982;
        _1972 = _2002;
    }
    float _2004 = _1972;
    if (_1894)
    {
        float _2006 = fma(_1954, _1948, _1990);
        _1986 = _2006;
    }
    float _2008 = _1986;
    if (_1894)
    {
        float _2010 = _1996 * _1996;
        _2000 = _2010;
    }
    float _2012 = _2000;
    if (!_1894)
    {
        _1992 = _1888;
    }
    float _2014 = _1992;
    float _2016 = _2014;
    if (_1894)
    {
        float _2018 = _2004 * _2004;
        _2016 = _2018;
    }
    float _2020 = _2016;
    float _2022 = fma(_2008, _2008, _2012);
    float _2024 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2026 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2028 = _2022 + _2020;
    float _2030 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2024);
    float _2032 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2028);
    float _2042 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2044 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2046 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2030);
    float _2048 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2050 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2042);
    float _2052 = -_2038;
    float _2054 = _2052 + 1.0;
    float _2056 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2058 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2048);
    float _2060 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2044);
    float _2062 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2050);
    float _2064 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2066 = abs(_2054);
    float _2068 = log2(_2066);
    float _2070 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2072 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2058);
    float _2074 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2040 * _1996;
    float _2078 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, _2026, 1.0);
    float _2084 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = _2040 * _2008;
    float _2088 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2078);
    float _2092 = _2040 * _2004;
    float _2094 = log2(_2082);
    float _2096 = -_2088;
    float _2098 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2096);
    float _2100 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2090);
    float _2102 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2104 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2106 = -_2092;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2098);
    float _2110 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2100);
    float _2112 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2114 = exp2(_2104);
    float _2116 = fma(_2108, -0.5, 0.5);
    float _2118 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2112);
    float _2120 = _2086 + 1.0;
    float _2122 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2118);
    float _2124 = 1.0 / _2110;
    float _2126 = fma(_2108, 0.5, 0.5);
    float _2128 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2102);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2122);
    float _2132 = _2094 * 0.693147182464599609375;
    float _2134 = fma(_2126, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2136 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2128);
    float _2138 = sqrt(_2116);
    float _2140 = fma(_2126, _2134, -0.212114393711090087890625);
    float _2142 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2136);
    float _2144 = -_2086;
    float _2146 = fma(_2114, _2120, _2144);
    float _2148 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = fma(_2126, _2140, 1.570728778839111328125);
    float _2152 = _2130 * _2124;
    float _2154 = _2142 * _2124;
    float _2156 = fma(_2152, 0.5, 0.5);
    float _2158 = fma(_2154, -0.5, 0.5);
    float _2160 = _2138 * 0.636619746685028076171875;
    float _2162 = fma(_2146, 0.5, 0.5);
    float _2164 = -_2150;
    float _2166 = fma(_2160, _2164, 1.0);
    float3 _5670 = float3(_2156, _2158, _2148);
    float _2168 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5670, float3(0.0), isnan(_5670)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5670, float3(0.0), isnan(_5670)), level(0.0)).x;
    float3 _5681 = float3(_2156, _2158, _2148);
    float4 _2171 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5681, float3(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5681, float3(0.0), isnan(_5681)), level(0.0)).xyzw;
    float _2173 = _2171.x;
    float _2175 = _2171.y;
    float _2177 = _2171.z;
    float _2179 = _2171.w;
    float2 _5698 = float2(_2166, _2162);
    float3 _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5698, float2(0.0), isnan(_5698)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5698, float2(0.0), isnan(_5698)), level(0.0)).xyz;
    float _2185 = _2183.x;
    float _2187 = _2183.y;
    float _2189 = _2183.z;
    float _2191 = in.m_61.x;
    float _2193 = in.m_61.y;
    float _2195 = in.m_61.z;
    bool _2197 = _1544 != 0.0;
    bool _2199 = isnan(_1544);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan(0.0);
    bool _2205 = _2201 || _2203;
    float _2207 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2209 = _1542 == 0.0;
    bool _2211 = !_2205;
    bool _2213 = _2209 && _2211;
    float _2215 = exp2(_2207);
    bool _2217 = _1546 == 0.0;
    bool _2219 = _2217 && _2213;
    float _2221 = _2195;
    float _2223 = _2191;
    float _2225 = _2193;
    if (!_2219)
    {
        float _2227 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2195);
        _2221 = _2227;
    }
    float _2229 = _2221;
    if (!_2219)
    {
        float _2231 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2223 = _2231;
    }
    float _2233 = _2223;
    if (!_2219)
    {
        float _2235 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2193);
        _2225 = _2235;
    }
    float _2237 = _2225;
    float _2239 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = _1600 * _2229;
    float _2243 = -_2229;
    float _2245 = _1608 * _2243;
    float _2247 = _1612 * _2229;
    float _2249 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2251 = fma(_1626, _2233, _2241);
    float _2253 = fma(_1624, _2233, _2245);
    float _2255 = fma(_1630, _2233, _2247);
    float _2257 = -_2215;
    float _2259 = _2257 + 1.0;
    float _2261 = -_2237;
    float _2263 = fma(_1634, _2261, _2251);
    float _2265 = -_2237;
    float _2267 = fma(_1616, _2265, _2253);
    float _2269 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2249);
    float _2271 = -_2237;
    float _2273 = fma(_1642, _2271, _2255);
    float _2275 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2277 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2281 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2283 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2275);
    float _2285 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2277);
    float _2287 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2269);
    float _2289 = fma(_2267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2279);
    float _2291 = _2130 + _2110;
    float _2293 = _2110 * 0.5;
    float _2295 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2283);
    float _2297 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2285);
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2289);
    float _2301 = _2291 * 0.5;
    float _2303 = fma(_2142, -0.5, _2293);
    float _2305 = _2287 + _2110;
    out.m_63.x = _2299;
    out.m_63.y = _2295;
    out.m_63.z = _2297;
    float _2307 = _2305 * 0.5;
    float _2309 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2130;
    out.gl_Position.y = _2142;
    out.gl_Position.z = _2287;
    out.gl_Position.w = _2110;
    out.m_65.x = _2301;
    out.m_65.y = _2303;
    out.m_65.z = _2307;
    out.m_65.w = _2110;
    out.m_45.x = _2309;
    float _2311 = _2281 * _2168;
    float _2313 = -_2281;
    float _2315 = _2313 + 1.0;
    float _2317 = _2179 * _2311;
    float _2319 = _2189 * _2311;
    float _2321 = _2179 * _2315;
    float _2323 = fma(_2185, _2317, _2173);
    float _2325 = fma(_2187, _2317, _2175);
    float _2327 = fma(_2179, _2319, _2177);
    out.m_67.x = _2323;
    out.m_67.y = _2325;
    out.m_67.z = _2327;
    out.m_67.w = _2321;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

