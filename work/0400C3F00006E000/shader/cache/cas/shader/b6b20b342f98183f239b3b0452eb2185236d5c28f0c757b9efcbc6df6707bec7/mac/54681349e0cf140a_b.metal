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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_63 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1706 = false;
    bool _608 = false;
    bool _454 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2328 = as_type<float>(_104);
        out.gl_Position.z = _2328;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2397 = as_type<float>(_140);
        out.gl_Position.z = _2397;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
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
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
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
    float _266 = _262;
    float _284;
    if (!_264)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _298 * _366;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = fma(_362, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = _314 * _352;
    float _392 = _384 * _368;
    float _394 = _386 * _368;
    float _396 = _388 * _368;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _412 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _396);
    float _422 = fma(_412, _354, _410);
    float _424 = fma(_414, _354, _418);
    float _426 = fma(_416, _354, _420);
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _422);
    float _430 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _424);
    float _432 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _426);
    bool _434 = !_364;
    float _452;
    if (!_434)
    {
        float _436 = in.m_53.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_88);
        float _458 = 1.0 / _456;
        float _460 = _122 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _462 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _472 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _488 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _490 = isnan(_462);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    bool _504 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _506 = isnan(_462);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _470;
    float _518 = -_482;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _524 = _498 * _520;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _486;
    float _532 = _502 * _516;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = fma(_532, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _540 = -_514;
    float _542 = _540 + 1.0;
    float _544 = _538 * _524;
    float _546 = _536 * _530;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _550 = _462 + _548;
    float _552 = _482 * _542;
    float _554 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[115].x, _544);
    float _556 = fma(_546, _550, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = fma(_556, _552, _554);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[117].x, _558);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = in.m_51.x;
    float _578 = in.m_51.y;
    float _580 = in.m_51.z;
    out.m_55.x = _568;
    out.m_55.y = _572;
    out.m_55.z = _574;
    out.m_55.w = _570;
    float _582 = _432 * _580;
    float _584 = _430 * _578;
    float _586 = _428 * _576;
    bool _588 = !_522;
    float _606;
    if (!_588)
    {
        float _590 = in.m_53.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_88);
        float _612 = 1.0 / _610;
        float _614 = _122 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = in.m_53.w;
    float _620 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _622 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _624 = in.m_53.x;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _628 = _626 != 0;
    float _630 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _634 = _632 != 0;
    float _636 = in.m_53.y;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _640 = _638 != 0;
    float _642 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _630);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    float _648 = in.m_57.y;
    float _650 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _620);
    float _652 = in.m_57.x;
    float _654 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    float _656 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _658 = 0.0;
    int _660 = as_type<int>(_652);
    bool _662 = _646;
    if (_628)
    {
        float _664 = in.m_53.z;
        _658 = _664;
    }
    float _666 = _658;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _674 = _618 > 0.5;
    float _676 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _678 = false;
    bool _680 = _674;
    if (_634)
    {
        bool _682 = _624 > 0.5;
        _678 = _682;
    }
    bool _684 = _678;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _688 = 1.0 / _670;
    bool _690 = _636 > 0.5;
    float _692 = -_686;
    float _694 = fma(_676, 2.0, _692);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _698 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _700 = -_122;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _704 = fma(_698, -2.0, _696);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _710 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _712 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].w, _706);
    float _714 = -_648;
    float _716 = _714 + 1.0;
    float _718 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].z, _708);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _720;
    float _724 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _654);
    float _726 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _704);
    int _728 = _674 ? as_type<int>(_716) : as_type<int>(_648);
    float _730 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _718);
    float _732 = _704;
    float _734 = _648;
    if (_628)
    {
        bool _736 = _666 > 0.5;
        _680 = _736;
    }
    bool _738 = _680;
    float _740 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _744 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_616);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _722 * _688;
    if (!_634)
    {
        _732 = _652;
    }
    float _758 = _732;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _762 = _616 + _760;
    bool _764 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _766 = isnan(_616);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_754;
    float _778 = _776 + 1.0;
    float _780 = _758;
    int _782 = as_type<int>(_762);
    if (!_634)
    {
        _266 = _758;
    }
    float _784 = _266;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _788 = _784;
    if (_634)
    {
        _780 = _652;
    }
    float _790 = _780;
    float _792 = fma(_756, _762, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _794 = _774 * _778;
    float _796 = _724 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _640 ? as_type<float>(_728) : _648;
    float _800 = _792;
    float _802 = _796;
    if (_634)
    {
        float _804 = -_790;
        float _806 = _804 + 1.0;
        _782 = as_type<int>(_806);
    }
    int _808 = _782;
    if (_628)
    {
        float _810 = -_790;
        float _812 = _810 + 1.0;
        _660 = as_type<int>(_812);
    }
    int _814 = _660;
    float _816 = _792 * _794;
    float _818 = _710 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _822 = _796 + _820;
    if (_646)
    {
        float _824 = _690 ? _716 : _648;
        _734 = _824;
    }
    float _826 = _734;
    float _828 = _742 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_628)
    {
        _800 = _790;
    }
    float _830 = _800;
    float _832 = _822 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _834 = _830;
    if (_634)
    {
        float _836 = _684 ? as_type<float>(_808) : _790;
        _788 = _836;
    }
    float _838 = _788;
    float _840 = fma(_828, _826, -0.5);
    if (_628)
    {
        float _842 = _738 ? as_type<float>(_814) : _790;
        _834 = _842;
    }
    float _844 = _834;
    float _846 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = _818 + _848;
    float _852 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _832);
    float _862 = _844 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _864 = fma(_852, _838, -0.5);
    float _866 = -_774;
    float _868 = _866 + 1.0;
    float _870 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _860);
    float _872 = _862 * _672;
    float _874 = _822 * _822;
    float _876 = fma(_730, _864, _702);
    float _878 = _798 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _880 = _870 >= 0.0;
    float _882 = fma(_850, _850, _874);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[131].x, _816);
    float _886 = -_726;
    float _888 = fma(_740, _840, _886);
    float _890 = fma(_858, _858, _882);
    float _892 = _878 * _854;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[132].x, _884);
    float _898 = rsqrt(_890);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _902 = 0.0;
    if (_880)
    {
        _902 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _904 = _902;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _908 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _888 + 0.5;
    float _914 = _876 + 0.5;
    int _916 = as_type<int>(_904);
    if (_880)
    {
        float _918 = _904 * 5.0;
        _916 = as_type<int>(_918);
    }
    int _920 = _916;
    float _922 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _896 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _926 = _822 * _898;
    float _928 = _850 * _898;
    out.m_61.x = _914;
    out.m_61.y = _912;
    out.m_61.z = _872;
    out.m_61.w = _892;
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_920);
        out.gl_Position.z = _3708;
    }
    if (_880)
    {
        out.m_47.x = 0.0;
    }
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _922;
    out.m_63.w = _924;
    if (_880)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _930 = -_926;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _934 = _858 * _898;
    float _936 = -_928;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _932 + _940;
    float _944 = -_934;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _938 + _948;
    float _952 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _946 + _954;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[28].x, _952);
    float _960 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].z, _958);
    bool _962 = _960 >= 0.0;
    float _964 = _956;
    if (_962)
    {
        _964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _966 = _964;
    int _968 = as_type<int>(_966);
    if (_962)
    {
        out.m_47.x = 0.0;
    }
    if (_962)
    {
        float _970 = _966 * 5.0;
        _968 = as_type<int>(_970);
    }
    int _972 = _968;
    if (_962)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3811 = as_type<float>(_972);
        out.gl_Position.z = _3811;
    }
    if (_962)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _974 = -_796;
    float _976 = _974 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _978 = -_818;
    float _980 = _978 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _984 = _976 * _976;
    float _986 = -_846;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -_926;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _994 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _982);
    float _996 = fma(_980, _980, _984);
    float _998 = -_928;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1002 = _992 * _992;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _994);
    float _1006 = fma(_988, _988, _996);
    float _1008 = -_934;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _1012 = fma(_1000, _1000, _1002);
    float _1014 = rsqrt(_1006);
    float _1016 = fma(_1010, _1010, _1012);
    float _1018 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = rsqrt(_1004);
    float _1022 = _980 * _1014;
    float _1024 = _976 * _1014;
    float _1026 = _988 * _1014;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1034 = -_796;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1038 = _1028 * _1022;
    float _1040 = _1030 * _1026;
    float _1042 = _1032 * _1024;
    float _1044 = -_1038;
    float _1046 = fma(_1030, _1024, _1044);
    float _1048 = -_1040;
    float _1050 = fma(_1032, _1022, _1048);
    float _1052 = -_1042;
    float _1054 = fma(_1028, _1026, _1052);
    float _1056 = _1022 * _1046;
    float _1058 = _1026 * _1050;
    float _1060 = _1024 * _1054;
    float _1062 = -_1056;
    float _1064 = fma(_1026, _1054, _1062);
    float _1066 = -_818;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1070 = -_1058;
    float _1072 = fma(_1024, _1046, _1070);
    float _1074 = _1036 * _1064;
    float _1076 = _1050 * _1036;
    float _1078 = -_1060;
    float _1080 = fma(_1022, _1050, _1078);
    float _1082 = -_846;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1086 = fma(_1068, _1072, _1074);
    float _1088 = fma(_1054, _1068, _1076);
    float _1090 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1092 = fma(_1084, _1080, _1086);
    float _1094 = fma(_1046, _1084, _1088);
    float _1096 = sqrt(_1016);
    float _1098 = _1092 * _1092;
    float _1100 = fma(_1094, _1094, _1098);
    float _1102 = rsqrt(_1100);
    float _1104 = _898 * _1096;
    float _1106 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1108 = _1104 * _1018;
    float _1110 = _1104 * _1090;
    float _1112 = _1104 * _1106;
    float _1114 = _1094 * _1102;
    float _1116 = _1092 * _1102;
    float _1118 = abs(_1114);
    float _1120 = abs(_1116);
    float _1122 = precise::max(_1118, _1120);
    bool _1124 = _1122 >= 16.0;
    float _1126 = in.m_65.x;
    float _1128 = in.m_65.y;
    float _1130 = in.m_65.z;
    float _1132 = _1116;
    float _1134 = _1114;
    int _1136 = as_type<int>(_1112);
    if (_1124)
    {
        float _1138 = _1116 * 0.0625;
        _1132 = _1138;
    }
    float _1140 = _1132;
    if (_1124)
    {
        float _1142 = _1114 * 0.0625;
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = abs(_1140);
    bool _1148 = _1146 != 0.0;
    bool _1150 = isnan(_1146);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = abs(_1144);
    bool _1160 = _1158 == 0.0;
    float _1162 = abs(_1144);
    bool _1164 = _1162 == 0.0;
    bool _1166 = !_1156;
    bool _1168 = _1164 && _1166;
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1126);
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1128);
    float _1174 = _1024 * _1024;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1130);
    float _1178 = _1112 * _1170;
    float _1180 = fma(_1022, _1022, _1174);
    float _1182 = _1130;
    if (_1168)
    {
        bool _1184 = as_type<int>(_1144) >= 0;
        _662 = _1184;
    }
    bool _1186 = _662;
    float _1188 = fma(_1026, _1026, _1180);
    int _1190 = _1186 ? (-1) : 0;
    if (_1168)
    {
        int _1192 = _1186 ? 0 : 1078530011;
        _1136 = _1192;
    }
    int _1194 = _1136;
    int _1196 = _1194;
    if (_1168)
    {
        int _1198 = int(0x80000000) & as_type<int>(_1140);
        int _1200 = _1194 | _1198;
        _1182 = as_type<float>(_1200);
    }
    float _1202 = _1182;
    bool _1204 = !_1156;
    bool _1206 = _1204 && _1160;
    float _1208 = _1202;
    float _1210 = _1202;
    if (!_1206)
    {
        float _1212 = abs(_1140);
        bool _1214 = _1212 != as_type<float>(0x7f800000u /* inf */);
        bool _1216 = isnan(_1212);
        bool _1218 = _1214 || _1216;
        bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1222 = _1218 || _1220;
        float _1224 = abs(_1144);
        bool _1226 = _1224 == as_type<float>(0x7f800000u /* inf */);
        float _1228 = abs(_1144);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        bool _1232 = !_1222;
        bool _1234 = _1230 && _1232;
        if (_1234)
        {
            bool _1236 = as_type<int>(_1144) >= 0;
            _1190 = _1236 ? (-1) : 0;
        }
        int _1238 = _1190;
        if (_1234)
        {
            _1196 = 1075235812;
        }
        int _1240 = _1196;
        int _1242 = _1240;
        if (_1234)
        {
            int _1244 = ~_1238;
            int _1246 = (_1244 != 0) ? _1240 : 1061752795;
            _1242 = _1246;
        }
        int _1248 = _1242;
        if (_1234)
        {
            int _1250 = int(0x80000000) & as_type<int>(_1140);
            int _1252 = _1248 | _1250;
            _1208 = as_type<float>(_1252);
        }
        float _1254 = _1208;
        bool _1256 = !_1222;
        bool _1258 = _1256 && _1226;
        _1210 = _1254;
        if (!_1258)
        {
            float _1260 = abs(_1140);
            float _1262 = abs(_1144);
            float _1264 = precise::max(_1260, _1262);
            float _1266 = abs(_1140);
            float _1268 = abs(_1144);
            float _1270 = precise::min(_1266, _1268);
            float _1272 = 1.0 / _1264;
            float _1274 = abs(_1140);
            float _1276 = abs(_1144);
            bool _1278 = _1274 > _1276;
            bool _1280 = as_type<int>(_1144) >= 0;
            float _1282 = _1270 * _1272;
            float _1284 = abs(_1140);
            float _1286 = abs(_1144);
            float _1288 = _1284 + _1286;
            int _1290 = as_type<int>(_1140) & int(0x80000000);
            float _1292 = _1282 * _1282;
            bool _1294 = _1288 > as_type<float>(0x7f800000u /* inf */);
            bool _1296 = isnan(_1288);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1302 = _1298 || _1300;
            float _1304 = _1292 + 11.33538818359375;
            float _1306 = fma(_1292, _1304, 28.84246826171875);
            float _1308 = fma(_1292, _1306, 19.6966705322265625);
            float _1310 = fma(_1292, -0.82336294651031494140625, -5.674867153167724609375);
            float _1312 = fma(_1292, _1310, -6.565555095672607421875);
            float _1314 = 1.0 / _1308;
            float _1316 = _1292 * _1312;
            float _1318 = _1282 * _1316;
            float _1320 = fma(_1318, _1314, _1282);
            float _1322 = _1320;
            _1210 = _1288;
            if (_1278)
            {
                float _1324 = -_1320;
                float _1326 = _1324 + 1.57079637050628662109375;
                _1322 = _1326;
            }
            float _1328 = _1322;
            int _1330 = as_type<int>(_1328);
            if (!_1280)
            {
                float _1332 = -_1328;
                float _1334 = _1332 + 3.1415927410125732421875;
                _1330 = as_type<int>(_1334);
            }
            int _1336 = _1330;
            if (!_1302)
            {
                int _1338 = _1290 | _1336;
                _1210 = as_type<float>(_1338);
            }
        }
    }
    float _1340 = _1210;
    float _1342 = _1340 + 1.57079637050628662109375;
    float _1344 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1348;
    float _1352 = rsqrt(_1188);
    float _1354 = _1342 * 0.15915493667125701904296875;
    float _1356 = _1346 * _1346;
    float _1358 = _1110 * _1172;
    float _1360 = _1108 * _1176;
    float _1362 = fma(_1350, _1350, _1356);
    float _1364 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1366 = _1354 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1372 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1374 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1374;
    float _1378 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1364);
    float _1380 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1370);
    float _1382 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1372);
    float _1384 = fma(_1376, _1376, _1362);
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1394 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1396 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1380);
    float _1398 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1382);
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1404 = _1392 * _1392;
    float _1406 = _1022 * _1352;
    float _1408 = _1024 * _1352;
    float _1410 = _1026 * _1352;
    float _1412 = sqrt(_1384);
    float _1414 = -_1368;
    float _1416 = _1414 + 1.0;
    float _1418 = fma(_1402, _1402, _1404);
    float _1420 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1422 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1424 = _1406 * _1416;
    float _1426 = _1410 * _1388;
    float _1428 = _1406 * _1388;
    float _1430 = _1408 * _1416;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1436 = -_1426;
    float _1438 = fma(_1408, _1424, _1436);
    float _1440 = _1408 * _1388;
    float _1442 = fma(_1410, _1430, _1428);
    float _1444 = _1410 * _1410;
    float _1446 = fma(_1434, _1434, _1418);
    float _1448 = fma(_1406, _1424, _1368);
    float _1450 = _1420 * _1438;
    float _1452 = -_1440;
    float _1454 = fma(_1410, _1424, _1452);
    float _1456 = _1420 * _1442;
    float _1458 = fma(_1416, _1444, _1368);
    float _1460 = _1412 * 0.066666670143604278564453125;
    float _1462 = fma(_1422, _1448, _1450);
    float _1464 = fma(_1422, _1454, _1456);
    float _1466 = precise::max(_1412, 15.0);
    float _1468 = rsqrt(_1446);
    float _1470 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1472 = fma(_1410, _1424, _1440);
    float _1474 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1476 = _1474 + 1.0;
    float _1478 = precise::max(_1460, 1.0);
    float _1480 = fma(_1470, _1472, _1462);
    float _1482 = precise::min(_1466, 30.0);
    float _1484 = fma(_1470, _1458, _1464);
    float _1486 = precise::min(_1478, 2.0);
    float _1488 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 0.3499999940395355224609375, _1476);
    float _1490 = _818 + _1480;
    float _1492 = fma(_1482, 0.066666670143604278564453125, -1.0);
    float _1494 = _846 + _1484;
    float _1496 = _1486 * _1488;
    float _1498 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1500 = _1490 + _1498;
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1504 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1506 = _1494 + _1504;
    float _1508 = fma(_1408, _1430, _1368);
    float _1510 = fma(_1500, _1496, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1512 = _1468 * _1502;
    float _1514 = fma(_1506, _1496, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1516 = fma(_1408, _1424, _1426);
    float _1518 = _1420 * _1508;
    float _1520 = -_1512;
    float _1522 = fma(_1402, _1520, _1510);
    float _1524 = -_1512;
    float _1526 = fma(_1434, _1524, _1514);
    float _1528 = -_1428;
    float _1530 = fma(_1410, _1430, _1528);
    float _1532 = fma(_1422, _1516, _1518);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1536 = _1522 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1540 = _1526 + _1538;
    float _1542 = fma(_1470, _1530, _1532);
    float _1544 = _1536 * _1536;
    float _1546 = _1540 * _1540;
    float _1548 = _796 + _1542;
    float _1550 = _1544 + _1546;
    float _1552 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1554 = _1548 + _1552;
    float _1556 = sqrt(_1550);
    float _1558 = fma(_1554, _1496, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1560 = -_1512;
    float _1562 = fma(_1392, _1560, _1558);
    bool _1564 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1422;
    float _1568 = _1392;
    float _1570 = _1368;
    float _1572 = _1546;
    if (!_1564)
    {
        _1566 = _1544;
    }
    float _1574 = _1566;
    float _1576 = _1574;
    if (!_1564)
    {
        _1568 = _1522;
    }
    float _1578 = _1568;
    float _1580 = _1578;
    if (!_1564)
    {
        _1570 = _1526;
    }
    float _1582 = _1570;
    float _1584 = _1582;
    if (!_1564)
    {
        _802 = _1562;
    }
    float _1586 = _802;
    bool _1588 = !_1564;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1596 = _1556 + _1594;
        float _1598 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = rsqrt(_1550);
        float _1602 = _1596 * _1592;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1604 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        float _1610 = _1604 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = fma(_1608, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1616 = _1600 * _1614;
        float _1618 = _1612 + (-1.0);
        float _1620 = fma(_1536, _1616, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1622 = fma(_1540, _1616, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1624 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1628 = _1620 + _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1632 = _1622 + _1630;
        float _1634 = fma(_1562, _1612, _1624);
        float _1636 = _1628 * _1628;
        float _1638 = _1632 * _1632;
        _1590 = _1634;
        _1576 = _1636;
        _1572 = _1638;
        _1580 = _1620;
        _1584 = _1622;
    }
    float _1640 = _1590;
    float _1642 = _1576;
    float _1644 = _1572;
    float _1646 = _1580;
    float _1648 = _1584;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1652 = _1640 + _1650;
    out.m_55.x = _568;
    out.m_55.y = _572;
    out.m_55.z = _574;
    out.m_55.w = _570;
    float _1654 = fma(_1652, _1652, _1642);
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _922;
    out.m_63.w = _924;
    float _1656 = _1654 + _1644;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1662 = isnan(_1658);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1668 = _1664 || _1666;
    float _1670 = _1654;
    if (!_1668)
    {
        _1670 = 1.0;
    }
    float _1672 = _1670;
    bool _1674 = !_1668;
    float _1676 = _1672;
    if (!_1674)
    {
        bool _1678 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1680 = isnan(_1658);
        bool _1682 = _1678 || _1680;
        bool _1684 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1686 = _1682 || _1684;
        if (!_1686)
        {
            float _1688 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1690 = _1658 + _1688;
            float _1692 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1694 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1692;
            float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1698 = _1696 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1700 = 1.0 / _1694;
            float _1702 = _1690 * _1700;
            float _1704 = fma(_1702, _1698, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1676 = _1704;
            _1706 = true;
        }
        else
        {
            bool _1708 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1710 = isnan(_1658);
            bool _1712 = _1708 || _1710;
            bool _1714 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1716 = _1712 || _1714;
            if (!_1716)
            {
                float _1718 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1720 = _1658 + _1718;
                float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1724 = _1722 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1728 = _1726 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1730 = 1.0 / _1724;
                float _1732 = _1720 * _1730;
                float _1734 = fma(_1732, _1728, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1676 = _1734;
                _1706 = true;
            }
            else
            {
                _1676 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1706 = false;
    float _1736 = _1676;
    float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1740 = _1640 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1744 = _1646 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1748 = _1648 + _1746;
    float _1750 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1752 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1754 = fma(_1744, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1756 = fma(_1748, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1758 = -_926;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _1762 = -_928;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1754);
    float _1766 = -_934;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1770 = precise::max(0.0, _1750);
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1774 = _1760 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1778 = _1764 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1782 = _1768 + _1780;
    float _1784 = _1774 * _1774;
    float _1786 = fma(_1778, _1778, _1784);
    float _1788 = fma(_1782, _1782, _1786);
    float _1790 = rsqrt(_1788);
    float _1792 = sqrt(_1788);
    float _1794 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1796 = _1778 * _1794;
    float _1798 = _1782 * _1794;
    float _1800 = -_1794;
    float _1802 = -_1770;
    float _1804 = fma(_1774, _1800, _1802);
    float _1806 = _1796 * _1796;
    float _1808 = _1798 * _1798;
    float _1810 = _1806 + _1808;
    float _1812 = sqrt(_1810);
    bool _1814 = _1812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1818 = _1812 + _1816;
    float _1820 = _910;
    float _1822 = _1774;
    float _1824 = _1782;
    float _1826 = _1818;
    float _1828 = _1752;
    float _1830 = _1796;
    if (_1814)
    {
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1832;
    }
    float _1834 = _1820;
    if (_1814)
    {
        float _1836 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1814)
    {
        float _1842 = rsqrt(_1810);
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = _1834;
    float _1848 = _1844;
    if (_1814)
    {
        float _1850 = _1818 * _1834;
        _1826 = _1850;
    }
    float _1852 = _1826;
    if (_1814)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1846 = _1854;
    }
    float _1856 = _1846;
    float _1858 = _1852;
    float _1860 = _1856;
    if (_1814)
    {
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        _1858 = _1864;
    }
    float _1866 = _1858;
    float _1868 = _908;
    if (_1814)
    {
        float _1870 = _1856 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        _1868 = _1872;
    }
    float _1874 = _1868;
    float _1876 = _1866;
    if (_1814)
    {
        float _1878 = fma(_1866, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1878;
    }
    float _1880 = _1840;
    float _1882 = _1880;
    if (_1814)
    {
        float _1884 = _1844 * _1880;
        _1828 = _1884;
    }
    float _1886 = _1828;
    if (!_1814)
    {
        _1882 = _1804;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (!_1814)
    {
        _1848 = _1806;
    }
    float _1892 = _1848;
    float _1894 = _1892;
    float _1896 = _1874;
    if (_1814)
    {
        float _1898 = _1874 + (-1.0);
        _1876 = _1898;
    }
    float _1900 = _1876;
    float _1902 = _1900;
    if (_1814)
    {
        float _1904 = _1796 * _1886;
        _1830 = _1904;
    }
    float _1906 = _1830;
    if (_1814)
    {
        float _1908 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1908;
    }
    float _1910 = _1860;
    if (!_1814)
    {
        _1902 = _1798;
    }
    float _1912 = _1902;
    float _1914 = _1912;
    if (_1814)
    {
        float _1916 = _1798 * _1886;
        _1914 = _1916;
    }
    float _1918 = _1914;
    if (_1814)
    {
        float _1920 = _1906 * _1906;
        _1894 = _1920;
    }
    float _1922 = _1894;
    if (_1814)
    {
        float _1924 = fma(_1804, _1874, _1910);
        _1890 = _1924;
    }
    float _1926 = _1890;
    if (!_1814)
    {
        _1896 = _1808;
    }
    float _1928 = _1896;
    float _1930 = _1928;
    if (_1814)
    {
        float _1932 = _1918 * _1918;
        _1930 = _1932;
    }
    float _1934 = _1930;
    float _1936 = fma(_1926, _1926, _1922);
    float _1938 = _1936 + _1934;
    float _1940 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1944 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1942);
    float _1946 = precise::clamp(_1944, 0.0, 1.0);
    float _1948 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1950 = rsqrt(_1938);
    float _1952 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1940);
    float _1954 = -_1946;
    float _1956 = _1954 + 1.0;
    float _1958 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1948);
    float _1962 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1952);
    float _1964 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1966 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1960);
    float _1970 = _1962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1972 = abs(_1956);
    float _1974 = log2(_1972);
    float _1976 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1978 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1976);
    float _1986 = _1950 * _1906;
    float _1988 = _1950 * _1926;
    float _1990 = -_1980;
    float _1992 = fma(_1990, _1964, 1.0);
    float _1994 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1998 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2000 = _1950 * _1918;
    float _2002 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2004 = -_1996;
    float _2006 = fma(_1988, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2004);
    float _2008 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1998);
    float _2010 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2012 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2014 = -_2000;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2006);
    float _2018 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2020 = log2(_1992);
    float _2022 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2024 = fma(_2016, -0.5, 0.5);
    float _2026 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    float _2028 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = fma(_2016, 0.5, 0.5);
    float _2032 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    float _2034 = _1988 + 1.0;
    float _2036 = exp2(_2010);
    float _2038 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2040 = fma(_2030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2042 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2032);
    float _2044 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2046 = fma(_2030, _2040, -0.212114393711090087890625);
    float _2048 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2042);
    float _2050 = 1.0 / _2026;
    float _2052 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2044);
    float _2054 = _2020 * 0.693147182464599609375;
    float _2056 = fma(_2030, _2046, 1.570728778839111328125);
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2060 = sqrt(_2024);
    float _2062 = -_1988;
    float _2064 = fma(_2036, _2034, _2062);
    float _2066 = fma(_2064, 0.5, 0.5);
    float _2068 = _2048 * _2050;
    float _2070 = _2052 * _2050;
    float _2072 = fma(_2068, 0.5, 0.5);
    float _2074 = fma(_2070, -0.5, 0.5);
    float _2076 = _2060 * 0.636619746685028076171875;
    float _2078 = -_2056;
    float _2080 = fma(_2076, _2078, 1.0);
    float3 _5618 = float3(_2072, _2074, _2058);
    float _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5618, float3(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5618, float3(0.0), isnan(_5618)), level(0.0)).x;
    float3 _5629 = float3(_2072, _2074, _2058);
    float4 _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5629, float3(0.0), isnan(_5629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5629, float3(0.0), isnan(_5629)), level(0.0)).xyzw;
    float _2087 = _2085.x;
    float _2089 = _2085.y;
    float _2091 = _2085.z;
    float _2093 = _2085.w;
    float2 _5646 = float2(_2080, _2066);
    float3 _2097 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5646, float2(0.0), isnan(_5646)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5646, float2(0.0), isnan(_5646)), level(0.0)).xyz;
    float _2099 = _2097.x;
    float _2101 = _2097.y;
    float _2103 = _2097.z;
    float _2105 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2107 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2105);
    float _2109 = _932 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2111 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2107);
    float _2113 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2109);
    bool _2115 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.5);
    bool _2123 = _2119 || _2121;
    float _2125 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2127 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2129 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2113);
    float _2131 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2133 = exp2(_2125);
    float _2135 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2137 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2131);
    float _2139 = _2135 + _2127;
    float _2141 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2137);
    float _2143 = 1.0 / _2127;
    float _2145 = _1974;
    if (_2123)
    {
        _2145 = 1.0;
    }
    float _2147 = _2145;
    float _2149 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2151 = _2139 * _2143;
    float _2153 = _2151 * 0.5;
    float _2155 = _2147;
    if (!_2123)
    {
        float _2157 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2161 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2159);
        float _2163 = _2157 * 0.15915493667125701904296875;
        float _2165 = _2163 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2171 = _2169 * 0.15915493667125701904296875;
        float _2173 = _2163 * 6.283185482025146484375;
        float _2175 = sin(_2173);
        float _2177 = 1.0 / _2167;
        float _2179 = _2171 * 6.283185482025146484375;
        float _2181 = cos(_2179);
        float _2183 = _2175 * _2177;
        float _2185 = 1.0 / _2161;
        float _2187 = _2181 * _2183;
        float _2189 = _2171 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2195 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2193;
        float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2199 = _2185 * _2197;
        float _2201 = 1.0 / _2187;
        float _2203 = 1.0 / _2195;
        float _2205 = _2191 * _2201;
        float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2209 = fma(_2205, _2199, _2207);
        float _2211 = _2209 * _2203;
        float _2213 = precise::clamp(_2211, 0.0, 1.0);
        float _2215 = -_2213;
        float _2217 = _2215 + 1.0;
        _2155 = _2217;
    }
    float _2219 = _2155;
    float _2221 = -_2133;
    float _2223 = _2221 + 1.0;
    float _2225 = _2026 * 0.5;
    float _2227 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2229 = _2219 > 0.0;
    bool _2231 = isnan(_2219);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.0);
    bool _2237 = _2233 || _2235;
    float _2239 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2241 = fma(_2052, -0.5, _2225);
    float _2243 = _2227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = _2149 + _2026;
    float _2247 = _2239 * _2082;
    float _2249 = _2048 + _2026;
    float _2251 = -_2239;
    float _2253 = _2251 + 1.0;
    out.gl_Position.x = _2048;
    out.gl_Position.y = _2052;
    out.gl_Position.z = _2149;
    out.gl_Position.w = _2026;
    float _2255 = _2093 * _2247;
    float _2257 = _2103 * _2247;
    float _2259 = _2245 * 0.5;
    float _2261 = fma(_2099, _2255, _2087);
    float _2263 = fma(_2101, _2255, _2089);
    float _2265 = _2249 * 0.5;
    float _2267 = _2093 * _2253;
    float _2269 = fma(_2093, _2257, _2091);
    out.m_47.x = _2243;
    out.m_67.x = _2265;
    out.m_67.y = _2241;
    out.m_67.z = _2259;
    out.m_67.w = _2026;
    out.m_69.x = _2261;
    out.m_69.y = _2263;
    out.m_69.z = _2269;
    out.m_69.w = _2267;
    if (_2237)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2271 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2271;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1706 = false;
    bool _608 = false;
    bool _454 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2328 = as_type<float>(_104);
        out.gl_Position.z = _2328;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2397 = as_type<float>(_140);
        out.gl_Position.z = _2397;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
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
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
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
    float _266 = _262;
    float _284;
    if (!_264)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _298 * _366;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = fma(_362, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = _314 * _352;
    float _392 = _384 * _368;
    float _394 = _386 * _368;
    float _396 = _388 * _368;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _412 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _396);
    float _422 = fma(_412, _354, _410);
    float _424 = fma(_414, _354, _418);
    float _426 = fma(_416, _354, _420);
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _422);
    float _430 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _424);
    float _432 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _426);
    bool _434 = !_364;
    float _452;
    if (!_434)
    {
        float _436 = in.m_53.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_88);
        float _458 = 1.0 / _456;
        float _460 = _122 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _462 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _472 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _488 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _490 = isnan(_462);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    bool _504 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _506 = isnan(_462);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _470;
    float _518 = -_482;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _524 = _498 * _520;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _486;
    float _532 = _502 * _516;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = fma(_532, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _540 = -_514;
    float _542 = _540 + 1.0;
    float _544 = _538 * _524;
    float _546 = _536 * _530;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _550 = _462 + _548;
    float _552 = _482 * _542;
    float _554 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[115].x, _544);
    float _556 = fma(_546, _550, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = fma(_556, _552, _554);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[117].x, _558);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = in.m_51.x;
    float _578 = in.m_51.y;
    float _580 = in.m_51.z;
    out.m_55.x = _568;
    out.m_55.y = _572;
    out.m_55.z = _574;
    out.m_55.w = _570;
    float _582 = _432 * _580;
    float _584 = _430 * _578;
    float _586 = _428 * _576;
    bool _588 = !_522;
    float _606;
    if (!_588)
    {
        float _590 = in.m_53.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_88);
        float _612 = 1.0 / _610;
        float _614 = _122 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = in.m_53.w;
    float _620 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _622 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _624 = in.m_53.x;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _628 = _626 != 0;
    float _630 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _634 = _632 != 0;
    float _636 = in.m_53.y;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _640 = _638 != 0;
    float _642 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _630);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    float _648 = in.m_57.y;
    float _650 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _620);
    float _652 = in.m_57.x;
    float _654 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    float _656 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _658 = 0.0;
    int _660 = as_type<int>(_652);
    bool _662 = _646;
    if (_628)
    {
        float _664 = in.m_53.z;
        _658 = _664;
    }
    float _666 = _658;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _674 = _618 > 0.5;
    float _676 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _678 = false;
    bool _680 = _674;
    if (_634)
    {
        bool _682 = _624 > 0.5;
        _678 = _682;
    }
    bool _684 = _678;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _688 = 1.0 / _670;
    bool _690 = _636 > 0.5;
    float _692 = -_686;
    float _694 = fma(_676, 2.0, _692);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _698 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _700 = -_122;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _704 = fma(_698, -2.0, _696);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _710 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _712 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].w, _706);
    float _714 = -_648;
    float _716 = _714 + 1.0;
    float _718 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].z, _708);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _720;
    float _724 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _654);
    float _726 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _704);
    int _728 = _674 ? as_type<int>(_716) : as_type<int>(_648);
    float _730 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _718);
    float _732 = _704;
    float _734 = _648;
    if (_628)
    {
        bool _736 = _666 > 0.5;
        _680 = _736;
    }
    bool _738 = _680;
    float _740 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _744 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_616);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _722 * _688;
    if (!_634)
    {
        _732 = _652;
    }
    float _758 = _732;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _762 = _616 + _760;
    bool _764 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _766 = isnan(_616);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_754;
    float _778 = _776 + 1.0;
    float _780 = _758;
    int _782 = as_type<int>(_762);
    if (!_634)
    {
        _266 = _758;
    }
    float _784 = _266;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _788 = _784;
    if (_634)
    {
        _780 = _652;
    }
    float _790 = _780;
    float _792 = fma(_756, _762, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _794 = _774 * _778;
    float _796 = _724 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _640 ? as_type<float>(_728) : _648;
    float _800 = _792;
    float _802 = _796;
    if (_634)
    {
        float _804 = -_790;
        float _806 = _804 + 1.0;
        _782 = as_type<int>(_806);
    }
    int _808 = _782;
    if (_628)
    {
        float _810 = -_790;
        float _812 = _810 + 1.0;
        _660 = as_type<int>(_812);
    }
    int _814 = _660;
    float _816 = _792 * _794;
    float _818 = _710 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _822 = _796 + _820;
    if (_646)
    {
        float _824 = _690 ? _716 : _648;
        _734 = _824;
    }
    float _826 = _734;
    float _828 = _742 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_628)
    {
        _800 = _790;
    }
    float _830 = _800;
    float _832 = _822 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _834 = _830;
    if (_634)
    {
        float _836 = _684 ? as_type<float>(_808) : _790;
        _788 = _836;
    }
    float _838 = _788;
    float _840 = fma(_828, _826, -0.5);
    if (_628)
    {
        float _842 = _738 ? as_type<float>(_814) : _790;
        _834 = _842;
    }
    float _844 = _834;
    float _846 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = _818 + _848;
    float _852 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _832);
    float _862 = _844 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _864 = fma(_852, _838, -0.5);
    float _866 = -_774;
    float _868 = _866 + 1.0;
    float _870 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _860);
    float _872 = _862 * _672;
    float _874 = _822 * _822;
    float _876 = fma(_730, _864, _702);
    float _878 = _798 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _880 = _870 >= 0.0;
    float _882 = fma(_850, _850, _874);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[131].x, _816);
    float _886 = -_726;
    float _888 = fma(_740, _840, _886);
    float _890 = fma(_858, _858, _882);
    float _892 = _878 * _854;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[132].x, _884);
    float _898 = rsqrt(_890);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _902 = 0.0;
    if (_880)
    {
        _902 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _904 = _902;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _908 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _888 + 0.5;
    float _914 = _876 + 0.5;
    int _916 = as_type<int>(_904);
    if (_880)
    {
        float _918 = _904 * 5.0;
        _916 = as_type<int>(_918);
    }
    int _920 = _916;
    float _922 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _896 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _926 = _822 * _898;
    float _928 = _850 * _898;
    out.m_61.x = _914;
    out.m_61.y = _912;
    out.m_61.z = _872;
    out.m_61.w = _892;
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_920);
        out.gl_Position.z = _3708;
    }
    if (_880)
    {
        out.m_47.x = 0.0;
    }
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _922;
    out.m_63.w = _924;
    if (_880)
    {
        return out;
    }
    float _930 = -_926;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _934 = _858 * _898;
    float _936 = -_928;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _932 + _940;
    float _944 = -_934;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _938 + _948;
    float _952 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _946 + _954;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[28].x, _952);
    float _960 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].z, _958);
    bool _962 = _960 >= 0.0;
    float _964 = _956;
    if (_962)
    {
        _964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _966 = _964;
    int _968 = as_type<int>(_966);
    if (_962)
    {
        out.m_47.x = 0.0;
    }
    if (_962)
    {
        float _970 = _966 * 5.0;
        _968 = as_type<int>(_970);
    }
    int _972 = _968;
    if (_962)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3811 = as_type<float>(_972);
        out.gl_Position.z = _3811;
    }
    if (_962)
    {
        return out;
    }
    float _974 = -_796;
    float _976 = _974 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _978 = -_818;
    float _980 = _978 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _984 = _976 * _976;
    float _986 = -_846;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -_926;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _994 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _982);
    float _996 = fma(_980, _980, _984);
    float _998 = -_928;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1002 = _992 * _992;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _994);
    float _1006 = fma(_988, _988, _996);
    float _1008 = -_934;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _1012 = fma(_1000, _1000, _1002);
    float _1014 = rsqrt(_1006);
    float _1016 = fma(_1010, _1010, _1012);
    float _1018 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = rsqrt(_1004);
    float _1022 = _980 * _1014;
    float _1024 = _976 * _1014;
    float _1026 = _988 * _1014;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1034 = -_796;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1038 = _1028 * _1022;
    float _1040 = _1030 * _1026;
    float _1042 = _1032 * _1024;
    float _1044 = -_1038;
    float _1046 = fma(_1030, _1024, _1044);
    float _1048 = -_1040;
    float _1050 = fma(_1032, _1022, _1048);
    float _1052 = -_1042;
    float _1054 = fma(_1028, _1026, _1052);
    float _1056 = _1022 * _1046;
    float _1058 = _1026 * _1050;
    float _1060 = _1024 * _1054;
    float _1062 = -_1056;
    float _1064 = fma(_1026, _1054, _1062);
    float _1066 = -_818;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1070 = -_1058;
    float _1072 = fma(_1024, _1046, _1070);
    float _1074 = _1036 * _1064;
    float _1076 = _1050 * _1036;
    float _1078 = -_1060;
    float _1080 = fma(_1022, _1050, _1078);
    float _1082 = -_846;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1086 = fma(_1068, _1072, _1074);
    float _1088 = fma(_1054, _1068, _1076);
    float _1090 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1092 = fma(_1084, _1080, _1086);
    float _1094 = fma(_1046, _1084, _1088);
    float _1096 = sqrt(_1016);
    float _1098 = _1092 * _1092;
    float _1100 = fma(_1094, _1094, _1098);
    float _1102 = rsqrt(_1100);
    float _1104 = _898 * _1096;
    float _1106 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1108 = _1104 * _1018;
    float _1110 = _1104 * _1090;
    float _1112 = _1104 * _1106;
    float _1114 = _1094 * _1102;
    float _1116 = _1092 * _1102;
    float _1118 = abs(_1114);
    float _1120 = abs(_1116);
    float _1122 = precise::max(_1118, _1120);
    bool _1124 = _1122 >= 16.0;
    float _1126 = in.m_65.x;
    float _1128 = in.m_65.y;
    float _1130 = in.m_65.z;
    float _1132 = _1116;
    float _1134 = _1114;
    int _1136 = as_type<int>(_1112);
    if (_1124)
    {
        float _1138 = _1116 * 0.0625;
        _1132 = _1138;
    }
    float _1140 = _1132;
    if (_1124)
    {
        float _1142 = _1114 * 0.0625;
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = abs(_1140);
    bool _1148 = _1146 != 0.0;
    bool _1150 = isnan(_1146);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = abs(_1144);
    bool _1160 = _1158 == 0.0;
    float _1162 = abs(_1144);
    bool _1164 = _1162 == 0.0;
    bool _1166 = !_1156;
    bool _1168 = _1164 && _1166;
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1126);
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1128);
    float _1174 = _1024 * _1024;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1130);
    float _1178 = _1112 * _1170;
    float _1180 = fma(_1022, _1022, _1174);
    float _1182 = _1130;
    if (_1168)
    {
        bool _1184 = as_type<int>(_1144) >= 0;
        _662 = _1184;
    }
    bool _1186 = _662;
    float _1188 = fma(_1026, _1026, _1180);
    int _1190 = _1186 ? (-1) : 0;
    if (_1168)
    {
        int _1192 = _1186 ? 0 : 1078530011;
        _1136 = _1192;
    }
    int _1194 = _1136;
    int _1196 = _1194;
    if (_1168)
    {
        int _1198 = int(0x80000000) & as_type<int>(_1140);
        int _1200 = _1194 | _1198;
        _1182 = as_type<float>(_1200);
    }
    float _1202 = _1182;
    bool _1204 = !_1156;
    bool _1206 = _1204 && _1160;
    float _1208 = _1202;
    float _1210 = _1202;
    if (!_1206)
    {
        float _1212 = abs(_1140);
        bool _1214 = _1212 != as_type<float>(0x7f800000u /* inf */);
        bool _1216 = isnan(_1212);
        bool _1218 = _1214 || _1216;
        bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1222 = _1218 || _1220;
        float _1224 = abs(_1144);
        bool _1226 = _1224 == as_type<float>(0x7f800000u /* inf */);
        float _1228 = abs(_1144);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        bool _1232 = !_1222;
        bool _1234 = _1230 && _1232;
        if (_1234)
        {
            bool _1236 = as_type<int>(_1144) >= 0;
            _1190 = _1236 ? (-1) : 0;
        }
        int _1238 = _1190;
        if (_1234)
        {
            _1196 = 1075235812;
        }
        int _1240 = _1196;
        int _1242 = _1240;
        if (_1234)
        {
            int _1244 = ~_1238;
            int _1246 = (_1244 != 0) ? _1240 : 1061752795;
            _1242 = _1246;
        }
        int _1248 = _1242;
        if (_1234)
        {
            int _1250 = int(0x80000000) & as_type<int>(_1140);
            int _1252 = _1248 | _1250;
            _1208 = as_type<float>(_1252);
        }
        float _1254 = _1208;
        bool _1256 = !_1222;
        bool _1258 = _1256 && _1226;
        _1210 = _1254;
        if (!_1258)
        {
            float _1260 = abs(_1140);
            float _1262 = abs(_1144);
            float _1264 = precise::max(_1260, _1262);
            float _1266 = abs(_1140);
            float _1268 = abs(_1144);
            float _1270 = precise::min(_1266, _1268);
            float _1272 = 1.0 / _1264;
            float _1274 = abs(_1140);
            float _1276 = abs(_1144);
            bool _1278 = _1274 > _1276;
            bool _1280 = as_type<int>(_1144) >= 0;
            float _1282 = _1270 * _1272;
            float _1284 = abs(_1140);
            float _1286 = abs(_1144);
            float _1288 = _1284 + _1286;
            int _1290 = as_type<int>(_1140) & int(0x80000000);
            float _1292 = _1282 * _1282;
            bool _1294 = _1288 > as_type<float>(0x7f800000u /* inf */);
            bool _1296 = isnan(_1288);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1302 = _1298 || _1300;
            float _1304 = _1292 + 11.33538818359375;
            float _1306 = fma(_1292, _1304, 28.84246826171875);
            float _1308 = fma(_1292, _1306, 19.6966705322265625);
            float _1310 = fma(_1292, -0.82336294651031494140625, -5.674867153167724609375);
            float _1312 = fma(_1292, _1310, -6.565555095672607421875);
            float _1314 = 1.0 / _1308;
            float _1316 = _1292 * _1312;
            float _1318 = _1282 * _1316;
            float _1320 = fma(_1318, _1314, _1282);
            float _1322 = _1320;
            _1210 = _1288;
            if (_1278)
            {
                float _1324 = -_1320;
                float _1326 = _1324 + 1.57079637050628662109375;
                _1322 = _1326;
            }
            float _1328 = _1322;
            int _1330 = as_type<int>(_1328);
            if (!_1280)
            {
                float _1332 = -_1328;
                float _1334 = _1332 + 3.1415927410125732421875;
                _1330 = as_type<int>(_1334);
            }
            int _1336 = _1330;
            if (!_1302)
            {
                int _1338 = _1290 | _1336;
                _1210 = as_type<float>(_1338);
            }
        }
    }
    float _1340 = _1210;
    float _1342 = _1340 + 1.57079637050628662109375;
    float _1344 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1348;
    float _1352 = rsqrt(_1188);
    float _1354 = _1342 * 0.15915493667125701904296875;
    float _1356 = _1346 * _1346;
    float _1358 = _1110 * _1172;
    float _1360 = _1108 * _1176;
    float _1362 = fma(_1350, _1350, _1356);
    float _1364 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1366 = _1354 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1372 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1374 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1374;
    float _1378 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1364);
    float _1380 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1370);
    float _1382 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1372);
    float _1384 = fma(_1376, _1376, _1362);
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1394 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1396 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1380);
    float _1398 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1382);
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1404 = _1392 * _1392;
    float _1406 = _1022 * _1352;
    float _1408 = _1024 * _1352;
    float _1410 = _1026 * _1352;
    float _1412 = sqrt(_1384);
    float _1414 = -_1368;
    float _1416 = _1414 + 1.0;
    float _1418 = fma(_1402, _1402, _1404);
    float _1420 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1422 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1424 = _1406 * _1416;
    float _1426 = _1410 * _1388;
    float _1428 = _1406 * _1388;
    float _1430 = _1408 * _1416;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1436 = -_1426;
    float _1438 = fma(_1408, _1424, _1436);
    float _1440 = _1408 * _1388;
    float _1442 = fma(_1410, _1430, _1428);
    float _1444 = _1410 * _1410;
    float _1446 = fma(_1434, _1434, _1418);
    float _1448 = fma(_1406, _1424, _1368);
    float _1450 = _1420 * _1438;
    float _1452 = -_1440;
    float _1454 = fma(_1410, _1424, _1452);
    float _1456 = _1420 * _1442;
    float _1458 = fma(_1416, _1444, _1368);
    float _1460 = _1412 * 0.066666670143604278564453125;
    float _1462 = fma(_1422, _1448, _1450);
    float _1464 = fma(_1422, _1454, _1456);
    float _1466 = precise::max(_1412, 15.0);
    float _1468 = rsqrt(_1446);
    float _1470 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1472 = fma(_1410, _1424, _1440);
    float _1474 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1476 = _1474 + 1.0;
    float _1478 = precise::max(_1460, 1.0);
    float _1480 = fma(_1470, _1472, _1462);
    float _1482 = precise::min(_1466, 30.0);
    float _1484 = fma(_1470, _1458, _1464);
    float _1486 = precise::min(_1478, 2.0);
    float _1488 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 0.3499999940395355224609375, _1476);
    float _1490 = _818 + _1480;
    float _1492 = fma(_1482, 0.066666670143604278564453125, -1.0);
    float _1494 = _846 + _1484;
    float _1496 = _1486 * _1488;
    float _1498 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1500 = _1490 + _1498;
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1504 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1506 = _1494 + _1504;
    float _1508 = fma(_1408, _1430, _1368);
    float _1510 = fma(_1500, _1496, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1512 = _1468 * _1502;
    float _1514 = fma(_1506, _1496, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1516 = fma(_1408, _1424, _1426);
    float _1518 = _1420 * _1508;
    float _1520 = -_1512;
    float _1522 = fma(_1402, _1520, _1510);
    float _1524 = -_1512;
    float _1526 = fma(_1434, _1524, _1514);
    float _1528 = -_1428;
    float _1530 = fma(_1410, _1430, _1528);
    float _1532 = fma(_1422, _1516, _1518);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1536 = _1522 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1540 = _1526 + _1538;
    float _1542 = fma(_1470, _1530, _1532);
    float _1544 = _1536 * _1536;
    float _1546 = _1540 * _1540;
    float _1548 = _796 + _1542;
    float _1550 = _1544 + _1546;
    float _1552 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1554 = _1548 + _1552;
    float _1556 = sqrt(_1550);
    float _1558 = fma(_1554, _1496, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1560 = -_1512;
    float _1562 = fma(_1392, _1560, _1558);
    bool _1564 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1422;
    float _1568 = _1392;
    float _1570 = _1368;
    float _1572 = _1546;
    if (!_1564)
    {
        _1566 = _1544;
    }
    float _1574 = _1566;
    float _1576 = _1574;
    if (!_1564)
    {
        _1568 = _1522;
    }
    float _1578 = _1568;
    float _1580 = _1578;
    if (!_1564)
    {
        _1570 = _1526;
    }
    float _1582 = _1570;
    float _1584 = _1582;
    if (!_1564)
    {
        _802 = _1562;
    }
    float _1586 = _802;
    bool _1588 = !_1564;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1596 = _1556 + _1594;
        float _1598 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = rsqrt(_1550);
        float _1602 = _1596 * _1592;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1604 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        float _1610 = _1604 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = fma(_1608, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1616 = _1600 * _1614;
        float _1618 = _1612 + (-1.0);
        float _1620 = fma(_1536, _1616, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1622 = fma(_1540, _1616, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1624 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1628 = _1620 + _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1632 = _1622 + _1630;
        float _1634 = fma(_1562, _1612, _1624);
        float _1636 = _1628 * _1628;
        float _1638 = _1632 * _1632;
        _1590 = _1634;
        _1576 = _1636;
        _1572 = _1638;
        _1580 = _1620;
        _1584 = _1622;
    }
    float _1640 = _1590;
    float _1642 = _1576;
    float _1644 = _1572;
    float _1646 = _1580;
    float _1648 = _1584;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1652 = _1640 + _1650;
    out.m_55.x = _568;
    out.m_55.y = _572;
    out.m_55.z = _574;
    out.m_55.w = _570;
    float _1654 = fma(_1652, _1652, _1642);
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _922;
    out.m_63.w = _924;
    float _1656 = _1654 + _1644;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1662 = isnan(_1658);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1668 = _1664 || _1666;
    float _1670 = _1654;
    if (!_1668)
    {
        _1670 = 1.0;
    }
    float _1672 = _1670;
    bool _1674 = !_1668;
    float _1676 = _1672;
    if (!_1674)
    {
        bool _1678 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1680 = isnan(_1658);
        bool _1682 = _1678 || _1680;
        bool _1684 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1686 = _1682 || _1684;
        if (!_1686)
        {
            float _1688 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1690 = _1658 + _1688;
            float _1692 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1694 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1692;
            float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1698 = _1696 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1700 = 1.0 / _1694;
            float _1702 = _1690 * _1700;
            float _1704 = fma(_1702, _1698, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1676 = _1704;
            _1706 = true;
        }
        else
        {
            bool _1708 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1710 = isnan(_1658);
            bool _1712 = _1708 || _1710;
            bool _1714 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1716 = _1712 || _1714;
            if (!_1716)
            {
                float _1718 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1720 = _1658 + _1718;
                float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1724 = _1722 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1728 = _1726 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1730 = 1.0 / _1724;
                float _1732 = _1720 * _1730;
                float _1734 = fma(_1732, _1728, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1676 = _1734;
                _1706 = true;
            }
            else
            {
                _1676 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1706 = false;
    float _1736 = _1676;
    float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1740 = _1640 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1744 = _1646 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1748 = _1648 + _1746;
    float _1750 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1752 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1754 = fma(_1744, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1756 = fma(_1748, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1758 = -_926;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _1762 = -_928;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1754);
    float _1766 = -_934;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1770 = precise::max(0.0, _1750);
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1774 = _1760 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1778 = _1764 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1782 = _1768 + _1780;
    float _1784 = _1774 * _1774;
    float _1786 = fma(_1778, _1778, _1784);
    float _1788 = fma(_1782, _1782, _1786);
    float _1790 = rsqrt(_1788);
    float _1792 = sqrt(_1788);
    float _1794 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1796 = _1778 * _1794;
    float _1798 = _1782 * _1794;
    float _1800 = -_1794;
    float _1802 = -_1770;
    float _1804 = fma(_1774, _1800, _1802);
    float _1806 = _1796 * _1796;
    float _1808 = _1798 * _1798;
    float _1810 = _1806 + _1808;
    float _1812 = sqrt(_1810);
    bool _1814 = _1812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1818 = _1812 + _1816;
    float _1820 = _910;
    float _1822 = _1774;
    float _1824 = _1782;
    float _1826 = _1818;
    float _1828 = _1752;
    float _1830 = _1796;
    if (_1814)
    {
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1832;
    }
    float _1834 = _1820;
    if (_1814)
    {
        float _1836 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1814)
    {
        float _1842 = rsqrt(_1810);
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = _1834;
    float _1848 = _1844;
    if (_1814)
    {
        float _1850 = _1818 * _1834;
        _1826 = _1850;
    }
    float _1852 = _1826;
    if (_1814)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1846 = _1854;
    }
    float _1856 = _1846;
    float _1858 = _1852;
    float _1860 = _1856;
    if (_1814)
    {
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        _1858 = _1864;
    }
    float _1866 = _1858;
    float _1868 = _908;
    if (_1814)
    {
        float _1870 = _1856 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        _1868 = _1872;
    }
    float _1874 = _1868;
    float _1876 = _1866;
    if (_1814)
    {
        float _1878 = fma(_1866, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1878;
    }
    float _1880 = _1840;
    float _1882 = _1880;
    if (_1814)
    {
        float _1884 = _1844 * _1880;
        _1828 = _1884;
    }
    float _1886 = _1828;
    if (!_1814)
    {
        _1882 = _1804;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (!_1814)
    {
        _1848 = _1806;
    }
    float _1892 = _1848;
    float _1894 = _1892;
    float _1896 = _1874;
    if (_1814)
    {
        float _1898 = _1874 + (-1.0);
        _1876 = _1898;
    }
    float _1900 = _1876;
    float _1902 = _1900;
    if (_1814)
    {
        float _1904 = _1796 * _1886;
        _1830 = _1904;
    }
    float _1906 = _1830;
    if (_1814)
    {
        float _1908 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1908;
    }
    float _1910 = _1860;
    if (!_1814)
    {
        _1902 = _1798;
    }
    float _1912 = _1902;
    float _1914 = _1912;
    if (_1814)
    {
        float _1916 = _1798 * _1886;
        _1914 = _1916;
    }
    float _1918 = _1914;
    if (_1814)
    {
        float _1920 = _1906 * _1906;
        _1894 = _1920;
    }
    float _1922 = _1894;
    if (_1814)
    {
        float _1924 = fma(_1804, _1874, _1910);
        _1890 = _1924;
    }
    float _1926 = _1890;
    if (!_1814)
    {
        _1896 = _1808;
    }
    float _1928 = _1896;
    float _1930 = _1928;
    if (_1814)
    {
        float _1932 = _1918 * _1918;
        _1930 = _1932;
    }
    float _1934 = _1930;
    float _1936 = fma(_1926, _1926, _1922);
    float _1938 = _1936 + _1934;
    float _1940 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1944 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1942);
    float _1946 = precise::clamp(_1944, 0.0, 1.0);
    float _1948 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1950 = rsqrt(_1938);
    float _1952 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1940);
    float _1954 = -_1946;
    float _1956 = _1954 + 1.0;
    float _1958 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1948);
    float _1962 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1952);
    float _1964 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1966 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1960);
    float _1970 = _1962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1972 = abs(_1956);
    float _1974 = log2(_1972);
    float _1976 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1978 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1976);
    float _1986 = _1950 * _1906;
    float _1988 = _1950 * _1926;
    float _1990 = -_1980;
    float _1992 = fma(_1990, _1964, 1.0);
    float _1994 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1998 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2000 = _1950 * _1918;
    float _2002 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2004 = -_1996;
    float _2006 = fma(_1988, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2004);
    float _2008 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1998);
    float _2010 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2012 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2014 = -_2000;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2006);
    float _2018 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2020 = log2(_1992);
    float _2022 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2024 = fma(_2016, -0.5, 0.5);
    float _2026 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    float _2028 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = fma(_2016, 0.5, 0.5);
    float _2032 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    float _2034 = _1988 + 1.0;
    float _2036 = exp2(_2010);
    float _2038 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2040 = fma(_2030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2042 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2032);
    float _2044 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2046 = fma(_2030, _2040, -0.212114393711090087890625);
    float _2048 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2042);
    float _2050 = 1.0 / _2026;
    float _2052 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2044);
    float _2054 = _2020 * 0.693147182464599609375;
    float _2056 = fma(_2030, _2046, 1.570728778839111328125);
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2060 = sqrt(_2024);
    float _2062 = -_1988;
    float _2064 = fma(_2036, _2034, _2062);
    float _2066 = fma(_2064, 0.5, 0.5);
    float _2068 = _2048 * _2050;
    float _2070 = _2052 * _2050;
    float _2072 = fma(_2068, 0.5, 0.5);
    float _2074 = fma(_2070, -0.5, 0.5);
    float _2076 = _2060 * 0.636619746685028076171875;
    float _2078 = -_2056;
    float _2080 = fma(_2076, _2078, 1.0);
    float3 _5618 = float3(_2072, _2074, _2058);
    float _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5618, float3(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5618, float3(0.0), isnan(_5618)), level(0.0)).x;
    float3 _5629 = float3(_2072, _2074, _2058);
    float4 _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5629, float3(0.0), isnan(_5629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5629, float3(0.0), isnan(_5629)), level(0.0)).xyzw;
    float _2087 = _2085.x;
    float _2089 = _2085.y;
    float _2091 = _2085.z;
    float _2093 = _2085.w;
    float2 _5646 = float2(_2080, _2066);
    float3 _2097 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5646, float2(0.0), isnan(_5646)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5646, float2(0.0), isnan(_5646)), level(0.0)).xyz;
    float _2099 = _2097.x;
    float _2101 = _2097.y;
    float _2103 = _2097.z;
    float _2105 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2107 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2105);
    float _2109 = _932 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2111 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2107);
    float _2113 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2109);
    bool _2115 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.5);
    bool _2123 = _2119 || _2121;
    float _2125 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2127 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2129 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2113);
    float _2131 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2133 = exp2(_2125);
    float _2135 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2137 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2131);
    float _2139 = _2135 + _2127;
    float _2141 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2137);
    float _2143 = 1.0 / _2127;
    float _2145 = _1974;
    if (_2123)
    {
        _2145 = 1.0;
    }
    float _2147 = _2145;
    float _2149 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2151 = _2139 * _2143;
    float _2153 = _2151 * 0.5;
    float _2155 = _2147;
    if (!_2123)
    {
        float _2157 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2161 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2159);
        float _2163 = _2157 * 0.15915493667125701904296875;
        float _2165 = _2163 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2171 = _2169 * 0.15915493667125701904296875;
        float _2173 = _2163 * 6.283185482025146484375;
        float _2175 = sin(_2173);
        float _2177 = 1.0 / _2167;
        float _2179 = _2171 * 6.283185482025146484375;
        float _2181 = cos(_2179);
        float _2183 = _2175 * _2177;
        float _2185 = 1.0 / _2161;
        float _2187 = _2181 * _2183;
        float _2189 = _2171 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2195 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2193;
        float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2199 = _2185 * _2197;
        float _2201 = 1.0 / _2187;
        float _2203 = 1.0 / _2195;
        float _2205 = _2191 * _2201;
        float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2209 = fma(_2205, _2199, _2207);
        float _2211 = _2209 * _2203;
        float _2213 = precise::clamp(_2211, 0.0, 1.0);
        float _2215 = -_2213;
        float _2217 = _2215 + 1.0;
        _2155 = _2217;
    }
    float _2219 = _2155;
    float _2221 = -_2133;
    float _2223 = _2221 + 1.0;
    float _2225 = _2026 * 0.5;
    float _2227 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2229 = _2219 > 0.0;
    bool _2231 = isnan(_2219);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.0);
    bool _2237 = _2233 || _2235;
    float _2239 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2241 = fma(_2052, -0.5, _2225);
    float _2243 = _2227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = _2149 + _2026;
    float _2247 = _2239 * _2082;
    float _2249 = _2048 + _2026;
    float _2251 = -_2239;
    float _2253 = _2251 + 1.0;
    out.gl_Position.x = _2048;
    out.gl_Position.y = _2052;
    out.gl_Position.z = _2149;
    out.gl_Position.w = _2026;
    float _2255 = _2093 * _2247;
    float _2257 = _2103 * _2247;
    float _2259 = _2245 * 0.5;
    float _2261 = fma(_2099, _2255, _2087);
    float _2263 = fma(_2101, _2255, _2089);
    float _2265 = _2249 * 0.5;
    float _2267 = _2093 * _2253;
    float _2269 = fma(_2093, _2257, _2091);
    out.m_47.x = _2243;
    out.m_67.x = _2265;
    out.m_67.y = _2241;
    out.m_67.z = _2259;
    out.m_67.w = _2026;
    out.m_69.x = _2261;
    out.m_69.y = _2263;
    out.m_69.z = _2269;
    out.m_69.w = _2267;
    if (_2237)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2271 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2271;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1706 = false;
    bool _608 = false;
    bool _454 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2328 = as_type<float>(_104);
        out.gl_Position.z = _2328;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2397 = as_type<float>(_140);
        out.gl_Position.z = _2397;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
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
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
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
    float _266 = _262;
    float _284;
    if (!_264)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _298 * _366;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = fma(_362, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = _314 * _352;
    float _392 = _384 * _368;
    float _394 = _386 * _368;
    float _396 = _388 * _368;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _412 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_404, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _396);
    float _422 = fma(_412, _354, _410);
    float _424 = fma(_414, _354, _418);
    float _426 = fma(_416, _354, _420);
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _422);
    float _430 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _424);
    float _432 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _426);
    bool _434 = !_364;
    float _452;
    if (!_434)
    {
        float _436 = in.m_53.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_88);
        float _458 = 1.0 / _456;
        float _460 = _122 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _462 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _472 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _488 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _490 = isnan(_462);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    bool _504 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _506 = isnan(_462);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _470;
    float _518 = -_482;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _524 = _498 * _520;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _486;
    float _532 = _502 * _516;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = fma(_532, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _540 = -_514;
    float _542 = _540 + 1.0;
    float _544 = _538 * _524;
    float _546 = _536 * _530;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _550 = _462 + _548;
    float _552 = _482 * _542;
    float _554 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[115].x, _544);
    float _556 = fma(_546, _550, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = fma(_556, _552, _554);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[117].x, _558);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = in.m_51.x;
    float _578 = in.m_51.y;
    float _580 = in.m_51.z;
    out.m_55.x = _568;
    out.m_55.y = _572;
    out.m_55.z = _574;
    out.m_55.w = _570;
    float _582 = _432 * _580;
    float _584 = _430 * _578;
    float _586 = _428 * _576;
    bool _588 = !_522;
    float _606;
    if (!_588)
    {
        float _590 = in.m_53.x;
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _594 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_88);
        float _612 = 1.0 / _610;
        float _614 = _122 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = in.m_53.w;
    float _620 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _622 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _624 = in.m_53.x;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _628 = _626 != 0;
    float _630 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _634 = _632 != 0;
    float _636 = in.m_53.y;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _640 = _638 != 0;
    float _642 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _630);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    float _648 = in.m_57.y;
    float _650 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _620);
    float _652 = in.m_57.x;
    float _654 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    float _656 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _658 = 0.0;
    int _660 = as_type<int>(_652);
    bool _662 = _646;
    if (_628)
    {
        float _664 = in.m_53.z;
        _658 = _664;
    }
    float _666 = _658;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _674 = _618 > 0.5;
    float _676 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _678 = false;
    bool _680 = _674;
    if (_634)
    {
        bool _682 = _624 > 0.5;
        _678 = _682;
    }
    bool _684 = _678;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _688 = 1.0 / _670;
    bool _690 = _636 > 0.5;
    float _692 = -_686;
    float _694 = fma(_676, 2.0, _692);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _698 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _700 = -_122;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _704 = fma(_698, -2.0, _696);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _710 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _712 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].w, _706);
    float _714 = -_648;
    float _716 = _714 + 1.0;
    float _718 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].z, _708);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _720;
    float _724 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _654);
    float _726 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _704);
    int _728 = _674 ? as_type<int>(_716) : as_type<int>(_648);
    float _730 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _718);
    float _732 = _704;
    float _734 = _648;
    if (_628)
    {
        bool _736 = _666 > 0.5;
        _680 = _736;
    }
    bool _738 = _680;
    float _740 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _744 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_616);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _722 * _688;
    if (!_634)
    {
        _732 = _652;
    }
    float _758 = _732;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _762 = _616 + _760;
    bool _764 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _766 = isnan(_616);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_754;
    float _778 = _776 + 1.0;
    float _780 = _758;
    int _782 = as_type<int>(_762);
    if (!_634)
    {
        _266 = _758;
    }
    float _784 = _266;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _788 = _784;
    if (_634)
    {
        _780 = _652;
    }
    float _790 = _780;
    float _792 = fma(_756, _762, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _794 = _774 * _778;
    float _796 = _724 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _640 ? as_type<float>(_728) : _648;
    float _800 = _792;
    float _802 = _796;
    if (_634)
    {
        float _804 = -_790;
        float _806 = _804 + 1.0;
        _782 = as_type<int>(_806);
    }
    int _808 = _782;
    if (_628)
    {
        float _810 = -_790;
        float _812 = _810 + 1.0;
        _660 = as_type<int>(_812);
    }
    int _814 = _660;
    float _816 = _792 * _794;
    float _818 = _710 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _822 = _796 + _820;
    if (_646)
    {
        float _824 = _690 ? _716 : _648;
        _734 = _824;
    }
    float _826 = _734;
    float _828 = _742 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_628)
    {
        _800 = _790;
    }
    float _830 = _800;
    float _832 = _822 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _834 = _830;
    if (_634)
    {
        float _836 = _684 ? as_type<float>(_808) : _790;
        _788 = _836;
    }
    float _838 = _788;
    float _840 = fma(_828, _826, -0.5);
    if (_628)
    {
        float _842 = _738 ? as_type<float>(_814) : _790;
        _834 = _842;
    }
    float _844 = _834;
    float _846 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = _818 + _848;
    float _852 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _832);
    float _862 = _844 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _864 = fma(_852, _838, -0.5);
    float _866 = -_774;
    float _868 = _866 + 1.0;
    float _870 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _860);
    float _872 = _862 * _672;
    float _874 = _822 * _822;
    float _876 = fma(_730, _864, _702);
    float _878 = _798 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _880 = _870 >= 0.0;
    float _882 = fma(_850, _850, _874);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[131].x, _816);
    float _886 = -_726;
    float _888 = fma(_740, _840, _886);
    float _890 = fma(_858, _858, _882);
    float _892 = _878 * _854;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _896 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[132].x, _884);
    float _898 = rsqrt(_890);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _902 = 0.0;
    if (_880)
    {
        _902 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _904 = _902;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _908 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _910 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _888 + 0.5;
    float _914 = _876 + 0.5;
    int _916 = as_type<int>(_904);
    if (_880)
    {
        float _918 = _904 * 5.0;
        _916 = as_type<int>(_918);
    }
    int _920 = _916;
    float _922 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _896 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _926 = _822 * _898;
    float _928 = _850 * _898;
    out.m_61.x = _914;
    out.m_61.y = _912;
    out.m_61.z = _872;
    out.m_61.w = _892;
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_920);
        out.gl_Position.z = _3708;
    }
    if (_880)
    {
        out.m_47.x = 0.0;
    }
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _922;
    out.m_63.w = _924;
    if (_880)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _930 = -_926;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _934 = _858 * _898;
    float _936 = -_928;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _932 + _940;
    float _944 = -_934;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _938 + _948;
    float _952 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _946 + _954;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[28].x, _952);
    float _960 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].z, _958);
    bool _962 = _960 >= 0.0;
    float _964 = _956;
    if (_962)
    {
        _964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _966 = _964;
    int _968 = as_type<int>(_966);
    if (_962)
    {
        out.m_47.x = 0.0;
    }
    if (_962)
    {
        float _970 = _966 * 5.0;
        _968 = as_type<int>(_970);
    }
    int _972 = _968;
    if (_962)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3811 = as_type<float>(_972);
        out.gl_Position.z = _3811;
    }
    if (_962)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _974 = -_796;
    float _976 = _974 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _978 = -_818;
    float _980 = _978 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _984 = _976 * _976;
    float _986 = -_846;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -_926;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _994 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _982);
    float _996 = fma(_980, _980, _984);
    float _998 = -_928;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1002 = _992 * _992;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _994);
    float _1006 = fma(_988, _988, _996);
    float _1008 = -_934;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _1012 = fma(_1000, _1000, _1002);
    float _1014 = rsqrt(_1006);
    float _1016 = fma(_1010, _1010, _1012);
    float _1018 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = rsqrt(_1004);
    float _1022 = _980 * _1014;
    float _1024 = _976 * _1014;
    float _1026 = _988 * _1014;
    float _1028 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1034 = -_796;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1038 = _1028 * _1022;
    float _1040 = _1030 * _1026;
    float _1042 = _1032 * _1024;
    float _1044 = -_1038;
    float _1046 = fma(_1030, _1024, _1044);
    float _1048 = -_1040;
    float _1050 = fma(_1032, _1022, _1048);
    float _1052 = -_1042;
    float _1054 = fma(_1028, _1026, _1052);
    float _1056 = _1022 * _1046;
    float _1058 = _1026 * _1050;
    float _1060 = _1024 * _1054;
    float _1062 = -_1056;
    float _1064 = fma(_1026, _1054, _1062);
    float _1066 = -_818;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1070 = -_1058;
    float _1072 = fma(_1024, _1046, _1070);
    float _1074 = _1036 * _1064;
    float _1076 = _1050 * _1036;
    float _1078 = -_1060;
    float _1080 = fma(_1022, _1050, _1078);
    float _1082 = -_846;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1086 = fma(_1068, _1072, _1074);
    float _1088 = fma(_1054, _1068, _1076);
    float _1090 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1092 = fma(_1084, _1080, _1086);
    float _1094 = fma(_1046, _1084, _1088);
    float _1096 = sqrt(_1016);
    float _1098 = _1092 * _1092;
    float _1100 = fma(_1094, _1094, _1098);
    float _1102 = rsqrt(_1100);
    float _1104 = _898 * _1096;
    float _1106 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1108 = _1104 * _1018;
    float _1110 = _1104 * _1090;
    float _1112 = _1104 * _1106;
    float _1114 = _1094 * _1102;
    float _1116 = _1092 * _1102;
    float _1118 = abs(_1114);
    float _1120 = abs(_1116);
    float _1122 = precise::max(_1118, _1120);
    bool _1124 = _1122 >= 16.0;
    float _1126 = in.m_65.x;
    float _1128 = in.m_65.y;
    float _1130 = in.m_65.z;
    float _1132 = _1116;
    float _1134 = _1114;
    int _1136 = as_type<int>(_1112);
    if (_1124)
    {
        float _1138 = _1116 * 0.0625;
        _1132 = _1138;
    }
    float _1140 = _1132;
    if (_1124)
    {
        float _1142 = _1114 * 0.0625;
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = abs(_1140);
    bool _1148 = _1146 != 0.0;
    bool _1150 = isnan(_1146);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = abs(_1144);
    bool _1160 = _1158 == 0.0;
    float _1162 = abs(_1144);
    bool _1164 = _1162 == 0.0;
    bool _1166 = !_1156;
    bool _1168 = _1164 && _1166;
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1126);
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1128);
    float _1174 = _1024 * _1024;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1130);
    float _1178 = _1112 * _1170;
    float _1180 = fma(_1022, _1022, _1174);
    float _1182 = _1130;
    if (_1168)
    {
        bool _1184 = as_type<int>(_1144) >= 0;
        _662 = _1184;
    }
    bool _1186 = _662;
    float _1188 = fma(_1026, _1026, _1180);
    int _1190 = _1186 ? (-1) : 0;
    if (_1168)
    {
        int _1192 = _1186 ? 0 : 1078530011;
        _1136 = _1192;
    }
    int _1194 = _1136;
    int _1196 = _1194;
    if (_1168)
    {
        int _1198 = int(0x80000000) & as_type<int>(_1140);
        int _1200 = _1194 | _1198;
        _1182 = as_type<float>(_1200);
    }
    float _1202 = _1182;
    bool _1204 = !_1156;
    bool _1206 = _1204 && _1160;
    float _1208 = _1202;
    float _1210 = _1202;
    if (!_1206)
    {
        float _1212 = abs(_1140);
        bool _1214 = _1212 != as_type<float>(0x7f800000u /* inf */);
        bool _1216 = isnan(_1212);
        bool _1218 = _1214 || _1216;
        bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1222 = _1218 || _1220;
        float _1224 = abs(_1144);
        bool _1226 = _1224 == as_type<float>(0x7f800000u /* inf */);
        float _1228 = abs(_1144);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        bool _1232 = !_1222;
        bool _1234 = _1230 && _1232;
        if (_1234)
        {
            bool _1236 = as_type<int>(_1144) >= 0;
            _1190 = _1236 ? (-1) : 0;
        }
        int _1238 = _1190;
        if (_1234)
        {
            _1196 = 1075235812;
        }
        int _1240 = _1196;
        int _1242 = _1240;
        if (_1234)
        {
            int _1244 = ~_1238;
            int _1246 = (_1244 != 0) ? _1240 : 1061752795;
            _1242 = _1246;
        }
        int _1248 = _1242;
        if (_1234)
        {
            int _1250 = int(0x80000000) & as_type<int>(_1140);
            int _1252 = _1248 | _1250;
            _1208 = as_type<float>(_1252);
        }
        float _1254 = _1208;
        bool _1256 = !_1222;
        bool _1258 = _1256 && _1226;
        _1210 = _1254;
        if (!_1258)
        {
            float _1260 = abs(_1140);
            float _1262 = abs(_1144);
            float _1264 = precise::max(_1260, _1262);
            float _1266 = abs(_1140);
            float _1268 = abs(_1144);
            float _1270 = precise::min(_1266, _1268);
            float _1272 = 1.0 / _1264;
            float _1274 = abs(_1140);
            float _1276 = abs(_1144);
            bool _1278 = _1274 > _1276;
            bool _1280 = as_type<int>(_1144) >= 0;
            float _1282 = _1270 * _1272;
            float _1284 = abs(_1140);
            float _1286 = abs(_1144);
            float _1288 = _1284 + _1286;
            int _1290 = as_type<int>(_1140) & int(0x80000000);
            float _1292 = _1282 * _1282;
            bool _1294 = _1288 > as_type<float>(0x7f800000u /* inf */);
            bool _1296 = isnan(_1288);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1302 = _1298 || _1300;
            float _1304 = _1292 + 11.33538818359375;
            float _1306 = fma(_1292, _1304, 28.84246826171875);
            float _1308 = fma(_1292, _1306, 19.6966705322265625);
            float _1310 = fma(_1292, -0.82336294651031494140625, -5.674867153167724609375);
            float _1312 = fma(_1292, _1310, -6.565555095672607421875);
            float _1314 = 1.0 / _1308;
            float _1316 = _1292 * _1312;
            float _1318 = _1282 * _1316;
            float _1320 = fma(_1318, _1314, _1282);
            float _1322 = _1320;
            _1210 = _1288;
            if (_1278)
            {
                float _1324 = -_1320;
                float _1326 = _1324 + 1.57079637050628662109375;
                _1322 = _1326;
            }
            float _1328 = _1322;
            int _1330 = as_type<int>(_1328);
            if (!_1280)
            {
                float _1332 = -_1328;
                float _1334 = _1332 + 3.1415927410125732421875;
                _1330 = as_type<int>(_1334);
            }
            int _1336 = _1330;
            if (!_1302)
            {
                int _1338 = _1290 | _1336;
                _1210 = as_type<float>(_1338);
            }
        }
    }
    float _1340 = _1210;
    float _1342 = _1340 + 1.57079637050628662109375;
    float _1344 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1348;
    float _1352 = rsqrt(_1188);
    float _1354 = _1342 * 0.15915493667125701904296875;
    float _1356 = _1346 * _1346;
    float _1358 = _1110 * _1172;
    float _1360 = _1108 * _1176;
    float _1362 = fma(_1350, _1350, _1356);
    float _1364 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1366 = _1354 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1372 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1374 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1376 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1374;
    float _1378 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1364);
    float _1380 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1370);
    float _1382 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1372);
    float _1384 = fma(_1376, _1376, _1362);
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1394 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1396 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1380);
    float _1398 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1382);
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1402 = _1400 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1404 = _1392 * _1392;
    float _1406 = _1022 * _1352;
    float _1408 = _1024 * _1352;
    float _1410 = _1026 * _1352;
    float _1412 = sqrt(_1384);
    float _1414 = -_1368;
    float _1416 = _1414 + 1.0;
    float _1418 = fma(_1402, _1402, _1404);
    float _1420 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1422 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1424 = _1406 * _1416;
    float _1426 = _1410 * _1388;
    float _1428 = _1406 * _1388;
    float _1430 = _1408 * _1416;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1436 = -_1426;
    float _1438 = fma(_1408, _1424, _1436);
    float _1440 = _1408 * _1388;
    float _1442 = fma(_1410, _1430, _1428);
    float _1444 = _1410 * _1410;
    float _1446 = fma(_1434, _1434, _1418);
    float _1448 = fma(_1406, _1424, _1368);
    float _1450 = _1420 * _1438;
    float _1452 = -_1440;
    float _1454 = fma(_1410, _1424, _1452);
    float _1456 = _1420 * _1442;
    float _1458 = fma(_1416, _1444, _1368);
    float _1460 = _1412 * 0.066666670143604278564453125;
    float _1462 = fma(_1422, _1448, _1450);
    float _1464 = fma(_1422, _1454, _1456);
    float _1466 = precise::max(_1412, 15.0);
    float _1468 = rsqrt(_1446);
    float _1470 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1472 = fma(_1410, _1424, _1440);
    float _1474 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1476 = _1474 + 1.0;
    float _1478 = precise::max(_1460, 1.0);
    float _1480 = fma(_1470, _1472, _1462);
    float _1482 = precise::min(_1466, 30.0);
    float _1484 = fma(_1470, _1458, _1464);
    float _1486 = precise::min(_1478, 2.0);
    float _1488 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, 0.3499999940395355224609375, _1476);
    float _1490 = _818 + _1480;
    float _1492 = fma(_1482, 0.066666670143604278564453125, -1.0);
    float _1494 = _846 + _1484;
    float _1496 = _1486 * _1488;
    float _1498 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1500 = _1490 + _1498;
    float _1502 = _1492 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1504 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1506 = _1494 + _1504;
    float _1508 = fma(_1408, _1430, _1368);
    float _1510 = fma(_1500, _1496, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1512 = _1468 * _1502;
    float _1514 = fma(_1506, _1496, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1516 = fma(_1408, _1424, _1426);
    float _1518 = _1420 * _1508;
    float _1520 = -_1512;
    float _1522 = fma(_1402, _1520, _1510);
    float _1524 = -_1512;
    float _1526 = fma(_1434, _1524, _1514);
    float _1528 = -_1428;
    float _1530 = fma(_1410, _1430, _1528);
    float _1532 = fma(_1422, _1516, _1518);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1536 = _1522 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1540 = _1526 + _1538;
    float _1542 = fma(_1470, _1530, _1532);
    float _1544 = _1536 * _1536;
    float _1546 = _1540 * _1540;
    float _1548 = _796 + _1542;
    float _1550 = _1544 + _1546;
    float _1552 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1554 = _1548 + _1552;
    float _1556 = sqrt(_1550);
    float _1558 = fma(_1554, _1496, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1560 = -_1512;
    float _1562 = fma(_1392, _1560, _1558);
    bool _1564 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1422;
    float _1568 = _1392;
    float _1570 = _1368;
    float _1572 = _1546;
    if (!_1564)
    {
        _1566 = _1544;
    }
    float _1574 = _1566;
    float _1576 = _1574;
    if (!_1564)
    {
        _1568 = _1522;
    }
    float _1578 = _1568;
    float _1580 = _1578;
    if (!_1564)
    {
        _1570 = _1526;
    }
    float _1582 = _1570;
    float _1584 = _1582;
    if (!_1564)
    {
        _802 = _1562;
    }
    float _1586 = _802;
    bool _1588 = !_1564;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1596 = _1556 + _1594;
        float _1598 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = rsqrt(_1550);
        float _1602 = _1596 * _1592;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1604 * 6.283185482025146484375;
        float _1608 = sin(_1606);
        float _1610 = _1604 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = fma(_1608, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1616 = _1600 * _1614;
        float _1618 = _1612 + (-1.0);
        float _1620 = fma(_1536, _1616, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1622 = fma(_1540, _1616, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1624 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1628 = _1620 + _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1632 = _1622 + _1630;
        float _1634 = fma(_1562, _1612, _1624);
        float _1636 = _1628 * _1628;
        float _1638 = _1632 * _1632;
        _1590 = _1634;
        _1576 = _1636;
        _1572 = _1638;
        _1580 = _1620;
        _1584 = _1622;
    }
    float _1640 = _1590;
    float _1642 = _1576;
    float _1644 = _1572;
    float _1646 = _1580;
    float _1648 = _1584;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1652 = _1640 + _1650;
    out.m_55.x = _568;
    out.m_55.y = _572;
    out.m_55.z = _574;
    out.m_55.w = _570;
    float _1654 = fma(_1652, _1652, _1642);
    out.m_63.x = _908;
    out.m_63.y = _910;
    out.m_63.z = _922;
    out.m_63.w = _924;
    float _1656 = _1654 + _1644;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1662 = isnan(_1658);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1668 = _1664 || _1666;
    float _1670 = _1654;
    if (!_1668)
    {
        _1670 = 1.0;
    }
    float _1672 = _1670;
    bool _1674 = !_1668;
    float _1676 = _1672;
    if (!_1674)
    {
        bool _1678 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1680 = isnan(_1658);
        bool _1682 = _1678 || _1680;
        bool _1684 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1686 = _1682 || _1684;
        if (!_1686)
        {
            float _1688 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1690 = _1658 + _1688;
            float _1692 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1694 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1692;
            float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1698 = _1696 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1700 = 1.0 / _1694;
            float _1702 = _1690 * _1700;
            float _1704 = fma(_1702, _1698, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1676 = _1704;
            _1706 = true;
        }
        else
        {
            bool _1708 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1710 = isnan(_1658);
            bool _1712 = _1708 || _1710;
            bool _1714 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1716 = _1712 || _1714;
            if (!_1716)
            {
                float _1718 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1720 = _1658 + _1718;
                float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1724 = _1722 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1728 = _1726 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1730 = 1.0 / _1724;
                float _1732 = _1720 * _1730;
                float _1734 = fma(_1732, _1728, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1676 = _1734;
                _1706 = true;
            }
            else
            {
                _1676 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1706 = false;
    float _1736 = _1676;
    float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1740 = _1640 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1744 = _1646 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1748 = _1648 + _1746;
    float _1750 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1752 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1754 = fma(_1744, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1756 = fma(_1748, _1736, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1758 = -_926;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _1762 = -_928;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1754);
    float _1766 = -_934;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1770 = precise::max(0.0, _1750);
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1774 = _1760 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1778 = _1764 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1782 = _1768 + _1780;
    float _1784 = _1774 * _1774;
    float _1786 = fma(_1778, _1778, _1784);
    float _1788 = fma(_1782, _1782, _1786);
    float _1790 = rsqrt(_1788);
    float _1792 = sqrt(_1788);
    float _1794 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1796 = _1778 * _1794;
    float _1798 = _1782 * _1794;
    float _1800 = -_1794;
    float _1802 = -_1770;
    float _1804 = fma(_1774, _1800, _1802);
    float _1806 = _1796 * _1796;
    float _1808 = _1798 * _1798;
    float _1810 = _1806 + _1808;
    float _1812 = sqrt(_1810);
    bool _1814 = _1812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1818 = _1812 + _1816;
    float _1820 = _910;
    float _1822 = _1774;
    float _1824 = _1782;
    float _1826 = _1818;
    float _1828 = _1752;
    float _1830 = _1796;
    if (_1814)
    {
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1832;
    }
    float _1834 = _1820;
    if (_1814)
    {
        float _1836 = _1804 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1814)
    {
        float _1842 = rsqrt(_1810);
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = _1834;
    float _1848 = _1844;
    if (_1814)
    {
        float _1850 = _1818 * _1834;
        _1826 = _1850;
    }
    float _1852 = _1826;
    if (_1814)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1846 = _1854;
    }
    float _1856 = _1846;
    float _1858 = _1852;
    float _1860 = _1856;
    if (_1814)
    {
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        _1858 = _1864;
    }
    float _1866 = _1858;
    float _1868 = _908;
    if (_1814)
    {
        float _1870 = _1856 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        _1868 = _1872;
    }
    float _1874 = _1868;
    float _1876 = _1866;
    if (_1814)
    {
        float _1878 = fma(_1866, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1878;
    }
    float _1880 = _1840;
    float _1882 = _1880;
    if (_1814)
    {
        float _1884 = _1844 * _1880;
        _1828 = _1884;
    }
    float _1886 = _1828;
    if (!_1814)
    {
        _1882 = _1804;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (!_1814)
    {
        _1848 = _1806;
    }
    float _1892 = _1848;
    float _1894 = _1892;
    float _1896 = _1874;
    if (_1814)
    {
        float _1898 = _1874 + (-1.0);
        _1876 = _1898;
    }
    float _1900 = _1876;
    float _1902 = _1900;
    if (_1814)
    {
        float _1904 = _1796 * _1886;
        _1830 = _1904;
    }
    float _1906 = _1830;
    if (_1814)
    {
        float _1908 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1860 = _1908;
    }
    float _1910 = _1860;
    if (!_1814)
    {
        _1902 = _1798;
    }
    float _1912 = _1902;
    float _1914 = _1912;
    if (_1814)
    {
        float _1916 = _1798 * _1886;
        _1914 = _1916;
    }
    float _1918 = _1914;
    if (_1814)
    {
        float _1920 = _1906 * _1906;
        _1894 = _1920;
    }
    float _1922 = _1894;
    if (_1814)
    {
        float _1924 = fma(_1804, _1874, _1910);
        _1890 = _1924;
    }
    float _1926 = _1890;
    if (!_1814)
    {
        _1896 = _1808;
    }
    float _1928 = _1896;
    float _1930 = _1928;
    if (_1814)
    {
        float _1932 = _1918 * _1918;
        _1930 = _1932;
    }
    float _1934 = _1930;
    float _1936 = fma(_1926, _1926, _1922);
    float _1938 = _1936 + _1934;
    float _1940 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1944 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1942);
    float _1946 = precise::clamp(_1944, 0.0, 1.0);
    float _1948 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1950 = rsqrt(_1938);
    float _1952 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1940);
    float _1954 = -_1946;
    float _1956 = _1954 + 1.0;
    float _1958 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1948);
    float _1962 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1952);
    float _1964 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1966 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1960);
    float _1970 = _1962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1972 = abs(_1956);
    float _1974 = log2(_1972);
    float _1976 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1978 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1976);
    float _1986 = _1950 * _1906;
    float _1988 = _1950 * _1926;
    float _1990 = -_1980;
    float _1992 = fma(_1990, _1964, 1.0);
    float _1994 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1998 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2000 = _1950 * _1918;
    float _2002 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2004 = -_1996;
    float _2006 = fma(_1988, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2004);
    float _2008 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1998);
    float _2010 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2012 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2014 = -_2000;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2006);
    float _2018 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2020 = log2(_1992);
    float _2022 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2024 = fma(_2016, -0.5, 0.5);
    float _2026 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2018);
    float _2028 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = fma(_2016, 0.5, 0.5);
    float _2032 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    float _2034 = _1988 + 1.0;
    float _2036 = exp2(_2010);
    float _2038 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2040 = fma(_2030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2042 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2032);
    float _2044 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2046 = fma(_2030, _2040, -0.212114393711090087890625);
    float _2048 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2042);
    float _2050 = 1.0 / _2026;
    float _2052 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2044);
    float _2054 = _2020 * 0.693147182464599609375;
    float _2056 = fma(_2030, _2046, 1.570728778839111328125);
    float _2058 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2060 = sqrt(_2024);
    float _2062 = -_1988;
    float _2064 = fma(_2036, _2034, _2062);
    float _2066 = fma(_2064, 0.5, 0.5);
    float _2068 = _2048 * _2050;
    float _2070 = _2052 * _2050;
    float _2072 = fma(_2068, 0.5, 0.5);
    float _2074 = fma(_2070, -0.5, 0.5);
    float _2076 = _2060 * 0.636619746685028076171875;
    float _2078 = -_2056;
    float _2080 = fma(_2076, _2078, 1.0);
    float3 _5618 = float3(_2072, _2074, _2058);
    float _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5618, float3(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5618, float3(0.0), isnan(_5618)), level(0.0)).x;
    float3 _5629 = float3(_2072, _2074, _2058);
    float4 _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5629, float3(0.0), isnan(_5629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5629, float3(0.0), isnan(_5629)), level(0.0)).xyzw;
    float _2087 = _2085.x;
    float _2089 = _2085.y;
    float _2091 = _2085.z;
    float _2093 = _2085.w;
    float2 _5646 = float2(_2080, _2066);
    float3 _2097 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5646, float2(0.0), isnan(_5646)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5646, float2(0.0), isnan(_5646)), level(0.0)).xyz;
    float _2099 = _2097.x;
    float _2101 = _2097.y;
    float _2103 = _2097.z;
    float _2105 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2107 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2105);
    float _2109 = _932 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2111 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2107);
    float _2113 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2109);
    bool _2115 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.5);
    bool _2123 = _2119 || _2121;
    float _2125 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2127 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2129 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2113);
    float _2131 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2133 = exp2(_2125);
    float _2135 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2137 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2131);
    float _2139 = _2135 + _2127;
    float _2141 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2137);
    float _2143 = 1.0 / _2127;
    float _2145 = _1974;
    if (_2123)
    {
        _2145 = 1.0;
    }
    float _2147 = _2145;
    float _2149 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2151 = _2139 * _2143;
    float _2153 = _2151 * 0.5;
    float _2155 = _2147;
    if (!_2123)
    {
        float _2157 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2161 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2159);
        float _2163 = _2157 * 0.15915493667125701904296875;
        float _2165 = _2163 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2171 = _2169 * 0.15915493667125701904296875;
        float _2173 = _2163 * 6.283185482025146484375;
        float _2175 = sin(_2173);
        float _2177 = 1.0 / _2167;
        float _2179 = _2171 * 6.283185482025146484375;
        float _2181 = cos(_2179);
        float _2183 = _2175 * _2177;
        float _2185 = 1.0 / _2161;
        float _2187 = _2181 * _2183;
        float _2189 = _2171 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2195 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2193;
        float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2199 = _2185 * _2197;
        float _2201 = 1.0 / _2187;
        float _2203 = 1.0 / _2195;
        float _2205 = _2191 * _2201;
        float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2209 = fma(_2205, _2199, _2207);
        float _2211 = _2209 * _2203;
        float _2213 = precise::clamp(_2211, 0.0, 1.0);
        float _2215 = -_2213;
        float _2217 = _2215 + 1.0;
        _2155 = _2217;
    }
    float _2219 = _2155;
    float _2221 = -_2133;
    float _2223 = _2221 + 1.0;
    float _2225 = _2026 * 0.5;
    float _2227 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2229 = _2219 > 0.0;
    bool _2231 = isnan(_2219);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.0);
    bool _2237 = _2233 || _2235;
    float _2239 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2241 = fma(_2052, -0.5, _2225);
    float _2243 = _2227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = _2149 + _2026;
    float _2247 = _2239 * _2082;
    float _2249 = _2048 + _2026;
    float _2251 = -_2239;
    float _2253 = _2251 + 1.0;
    out.gl_Position.x = _2048;
    out.gl_Position.y = _2052;
    out.gl_Position.z = _2149;
    out.gl_Position.w = _2026;
    float _2255 = _2093 * _2247;
    float _2257 = _2103 * _2247;
    float _2259 = _2245 * 0.5;
    float _2261 = fma(_2099, _2255, _2087);
    float _2263 = fma(_2101, _2255, _2089);
    float _2265 = _2249 * 0.5;
    float _2267 = _2093 * _2253;
    float _2269 = fma(_2093, _2257, _2091);
    out.m_47.x = _2243;
    out.m_67.x = _2265;
    out.m_67.y = _2241;
    out.m_67.z = _2259;
    out.m_67.w = _2026;
    out.m_69.x = _2261;
    out.m_69.y = _2263;
    out.m_69.z = _2269;
    out.m_69.w = _2267;
    if (_2237)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2271 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2271;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

