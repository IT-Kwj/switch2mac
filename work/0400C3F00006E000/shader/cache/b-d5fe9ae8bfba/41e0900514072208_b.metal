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
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _528 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3208 = as_type<float>(_106);
        out.gl_Position.z = _3208;
    }
    if (!_94)
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _100;
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
        float _3276 = as_type<float>(_142);
        out.gl_Position.z = _3276;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _170 = 0.0;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _170 = _174;
    }
    float _176 = _170;
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
    float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _226 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _228 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _230 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _232 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].x, _226);
    float _234 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].y, _228);
    float _236 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].z, _230);
    float _238 = _228;
    if (!_156)
    {
        _238 = _146;
    }
    float _240 = _238;
    float _242 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _232);
    bool _244 = !_156;
    float _246 = _240;
    if (!_244)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _146 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _246 = _266;
    }
    float _268 = _246;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].y, _234);
    float _274 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].z, _236);
    float _276 = fma(_268, _158, _242);
    float _278 = fma(_268, _160, _272);
    float _280 = fma(_268, _162, _274);
    float _282 = fma(_276, _144, _164);
    float _284 = fma(_278, _144, _166);
    float _286 = fma(_280, _144, _168);
    bool _288 = !_270;
    float _290 = _282;
    float _308;
    if (!_288)
    {
        float _292 = in.m_51.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_90);
        float _314 = 1.0 / _312;
        float _316 = _122 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _332;
    bool _336 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _338 = isnan(_318);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _326;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _354 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _356 = isnan(_318);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _368 = 1.0 / _330;
    float _370 = _334 * _348;
    bool _372 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _374 = isnan(_318);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = 1.0 / _352;
    float _386 = -_346;
    float _388 = _386 + 1.0;
    float _390 = fma(_370, _322, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _396 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _398 = isnan(_318);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -_382;
    float _410 = _408 + 1.0;
    float _412 = _382 * _388;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _418 = 1.0 / _394;
    float _420 = -_406;
    float _422 = _420 + 1.0;
    float _424 = _364 * _410;
    float _426 = _416 * _368;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _428;
    float _432 = _346 * _422;
    float _434 = _390 * _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = _318 + _436;
    float _440 = -_364;
    float _442 = _440 + 1.0;
    bool _444 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _446 = isnan(_318);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _430 * _384;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _318 + _462;
    float _466 = fma(_426, _438, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _468 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _434);
    float _470 = -_454;
    float _472 = _470 + 1.0;
    float _474 = _460 * _418;
    float _476 = fma(_456, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _480 = _318 + _478;
    float _482 = fma(_466, _412, _468);
    float _484 = _406 * _472;
    float _486 = in.m_49.x;
    float _488 = in.m_49.y;
    float _490 = in.m_49.z;
    float _492 = fma(_474, _480, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _494 = fma(_476, _432, _482);
    float _496 = fma(_492, _484, _494);
    float _498 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[119].x, _496);
    float _500 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _500;
    float _502 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = _490 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _508 = !_366;
    float _526;
    if (!_508)
    {
        float _510 = in.m_51.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_90);
        float _532 = 1.0 / _530;
        float _534 = _122 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.y;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _546 = _544 != 0;
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _550 = int(_548);
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _558 = _556 != 0;
    float _560 = float(_90);
    float _562 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _564 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _566 = int(_564);
    float _568 = float(_540);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _574 = 1.0 / _568;
    float _576 = float(_550);
    float _578 = -_542;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _594 = float(uint(_566));
    float _596 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _598 = int(_596);
    int _600 = ~_566;
    int _602 = _600 + 1;
    float _604 = float(_566);
    float _606 = _122 * _574;
    float _608 = 1.0 / _576;
    float _610 = 1.0 / _594;
    float _612 = float(uint(_598));
    int _614 = ~_598;
    int _616 = _614 + 1;
    float _618 = trunc(_606);
    int _620 = int(_618);
    float _622 = _122 * _608;
    int _624 = as_type<int>(_610) + (-2);
    float _626 = 1.0 / _612;
    float _628 = float(uint(_620));
    float _630 = trunc(_622);
    int _632 = int(_630);
    float _634 = as_type<float>(_624) * _628;
    float _636 = trunc(_634);
    float _638 = precise::max(_636, 0.0);
    uint _641 = uint(_638);
    int _643 = as_type<int>(_626) + (-2);
    float _645 = in.m_55.x;
    float _647 = float(uint(_632));
    float _649 = 1.0 / _572;
    float _651 = float(_632);
    float _653 = as_type<float>(_643) * _647;
    int _655 = _602 * int(_641);
    int _657 = _655 + _620;
    float _659 = trunc(_653);
    float _661 = precise::max(_659, 0.0);
    uint _663 = uint(_661);
    float _665 = in.m_51.z;
    float _667 = float(uint(_657));
    float _669 = in.m_51.y;
    float _671 = 1.0 / _584;
    float _673 = as_type<float>(_624) * _667;
    float _675 = _588 * _649;
    float _677 = in.m_51.x;
    int _679 = _616 * int(_663);
    int _681 = _679 + _632;
    float _683 = trunc(_673);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    float _689 = float(uint(_681));
    float _691 = _592 * _671;
    bool _693 = _665 > 0.5;
    float _695 = as_type<float>(_643) * _689;
    float _697 = _689;
    float _699 = _542;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _703 = _645;
    if (!_546)
    {
        _697 = _645;
    }
    float _705 = _697;
    float _707 = 1.0 / _560;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _711 = _536 + _709;
    bool _713 = _669 > 0.5;
    int _715 = int(_641) + int(_687);
    int _717 = int(_687);
    bool _719 = _713;
    float _721 = _705;
    if (_546)
    {
        float _723 = -_645;
        float _725 = _723 + 1.0;
        _717 = as_type<int>(_725);
    }
    int _727 = _717;
    int _729 = _713 ? as_type<int>(_580) : as_type<int>(_542);
    float _731 = trunc(_695);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    if (_546)
    {
        bool _737 = _677 > 0.5;
        _719 = _737;
    }
    bool _739 = _719;
    float _741 = _677 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _743 = ~_566;
    int _745 = _743 + 1;
    float _747 = _558 ? as_type<float>(_729) : _542;
    if (_554)
    {
        float _749 = _693 ? _580 : _542;
        _699 = _749;
    }
    float _751 = _699;
    int _753 = _745 * _715;
    int _755 = _753 + _620;
    if (_546)
    {
        float _757 = _739 ? as_type<float>(_727) : _645;
        _721 = _757;
    }
    float _759 = _721;
    float _761 = _122 * _707;
    int _763 = ~_598;
    int _765 = _763 + 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _777 = _775 != 0;
    int _779 = int(_663) + int(_735);
    bool _781 = uint(_755) >= uint(_566);
    bool _783 = !_769;
    int _785 = _783 ? 0 : 1;
    int _787 = _765 * _779;
    int _789 = _787 + _632;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _793 = _791 != 0;
    bool _795 = !_781;
    int _797 = _795 ? 0 : (-1);
    bool _799 = !_773;
    int _801 = _799 ? 0 : 1;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _821 = _819 != 0;
    bool _823 = !_793;
    int _825 = _823 ? 0 : 1;
    bool _827 = uint(_789) >= uint(_598);
    bool _829 = !_821;
    int _831 = _829 ? 0 : 1;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _835 = _833 != 0;
    float _837 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _841 = !_827;
    int _843 = _841 ? 0 : (-1);
    bool _845 = !_809;
    int _847 = _845 ? 0 : 1;
    float _849 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    bool _851 = !_805;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    bool _857 = !_813;
    int _859 = _857 ? 0 : 1;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _869 = _867 != 0;
    float _871 = -_861;
    float _873 = fma(_741, 2.0, _871);
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _877 = _875 != 0;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _881 = _879 != 0;
    float _883 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _562);
    if (_835)
    {
        _290 = 1.0;
    }
    float _885 = _290;
    float _887 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _849);
    float _889 = _885;
    if (!_835)
    {
        _889 = 7.345489978790283203125;
    }
    float _891 = _889;
    float _893 = _887 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _895 = _893;
    if (_835)
    {
        _701 = _677;
    }
    float _897 = _701;
    float _899 = _891 * _677;
    float _901 = 0.0;
    float _903 = _897;
    if (_835)
    {
        _901 = 1.0;
    }
    float _905 = _901;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _909 = _905;
    if (!_835)
    {
        _903 = _669;
    }
    float _911 = _903;
    float _913 = _669 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_835)
    {
        _909 = 1.2345600128173828125;
    }
    float _915 = _909;
    float _917 = floor(_899);
    int _919 = ~_715;
    int _921 = _919 + _797;
    int _923 = _921 + 1;
    float _925 = fma(_913, -2.0, _907);
    float _927 = float(_620);
    float _929 = _911 * _915;
    float _931 = float(_598);
    float _933 = fma(_675, _711, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _935 = _927 >= _604;
    bool _937 = isnan(_927);
    bool _939 = _935 || _937;
    bool _941 = isnan(_604);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = floor(_929);
    float _949 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _883);
    bool _951 = _651 >= _931;
    bool _953 = isnan(_651);
    bool _955 = _951 || _953;
    bool _957 = isnan(_931);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _855);
    int _965 = abs(_801);
    bool _967 = !_777;
    int _969 = _967 ? 0 : 1;
    float _971 = trunc(_945);
    int _973 = int(_971);
    float _975 = -_917;
    float _977 = _899 + _975;
    bool _979 = !_817;
    int _981 = _979 ? 0 : 1;
    bool _983 = _566 == 0;
    float _985 = _977 * _604;
    bool _987 = _669 > 0.5;
    float _989 = trunc(_961);
    int _991 = int(_989);
    float _993 = -_947;
    float _995 = _929 + _993;
    int _997 = _566 * _923;
    int _999 = _997 + _620;
    int _1001 = ~_779;
    int _1003 = _1001 + _843;
    int _1005 = _1003 + 1;
    float _1007 = _761 * _604;
    float _1009 = _761 * _931;
    float _1011 = _995 * _931;
    bool _1013 = !_983;
    int _1015 = _1013 ? _999 : (-1);
    int _1017 = _598 * _1005;
    int _1019 = _1017 + _632;
    int _1021 = ~_973;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = trunc(_1007);
    int _1029 = int(_1027);
    bool _1031 = !_869;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = _598 == 0;
    int _1037 = _1015 * _1025;
    int _1039 = _566 + (-1);
    int _1041 = ~_991;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    float _1047 = trunc(_985);
    int _1049 = int(_1047);
    bool _1051 = !_1035;
    int _1053 = _1051 ? _1019 : (-1);
    int _1055 = _973 * _1039;
    int _1057 = _1055 + _1037;
    int _1059 = _598 + (-1);
    int _1061 = abs(_785);
    int _1063 = _1053 * _1045;
    float _1065 = trunc(_1011);
    int _1067 = int(_1065);
    int _1069 = _991 * _1059;
    int _1071 = _1069 + _1063;
    int _1073 = abs(_847);
    int _1075 = _1057 * _965;
    int _1077 = abs(_1033);
    int _1079 = abs(_853);
    float _1081 = trunc(_1009);
    int _1083 = int(_1081);
    int _1085 = abs(_825);
    int _1087 = _1029 * _1061;
    int _1089 = _1087 + _1075;
    int _1091 = _1071 * _1073;
    int _1093 = _1049 * _1085;
    int _1095 = _1093 + _620;
    int _1097 = abs(_969);
    int _1099 = _1067 * _1077;
    int _1101 = _1099 + _632;
    int _1103 = abs(_831);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1107 = _536 + _1105;
    int _1109 = abs(_859);
    int _1111 = _1095 * _1097;
    int _1113 = _1111 + _1089;
    float _1115 = fma(_691, _1107, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1117 = abs(_981);
    int _1119 = _1083 * _1079;
    int _1121 = _1119 + _1091;
    float _1123 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1125 = _1049 * _1103;
    int _1127 = _1125 + _1113;
    bool _1129 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1131 = isnan(_536);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    int _1141 = _1101 * _1109;
    int _1143 = _1141 + _1121;
    bool _1145 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1147 = isnan(_536);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1159 = float(uint(_1127));
    int _1161 = _1067 * _1117;
    int _1163 = _1161 + _1143;
    float _1165 = -_1139;
    float _1167 = _1165 + 1.0;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1171 = _1075;
    if (_835)
    {
        _1171 = 0;
    }
    int _1173 = _1171;
    float _1175 = as_type<float>(_624) * _1159;
    float _1177 = float(uint(_1163));
    float _1179 = _1155 * _1167;
    float _1181 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1169);
    int _1183 = _1173;
    if (!_835)
    {
        _1183 = 2;
    }
    int _1185 = _1183;
    float _1187 = as_type<float>(_643) * _1177;
    float _1189 = trunc(_1175);
    float _1191 = precise::max(_1189, 0.0);
    uint _1193 = uint(_1191);
    bool _1195 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1197 = isnan(_536);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1181);
    float _1209 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _925);
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1213 = _1185 != 2;
    float _1215 = -_1155;
    float _1217 = _1215 + 1.0;
    float _1219 = -_1209;
    float _1221 = fma(_1207, _1123, _1219);
    float _1223 = trunc(_1187);
    float _1225 = precise::max(_1223, 0.0);
    uint _1227 = uint(_1225);
    int _1229 = ~_566;
    int _1231 = _1229 + 1;
    float _1233 = fma(_1211, _751, -0.5);
    int _1235 = as_type<int>(_1211);
    float _1237 = as_type<float>(_1231);
    if (_877)
    {
        float _1239 = -_645;
        float _1241 = _1239 + 1.0;
        _1235 = as_type<int>(_1241);
    }
    int _1243 = _1235;
    int _1245 = ~_598;
    int _1247 = _1245 + 1;
    float _1249 = _1205 * _1217;
    float _1251 = -_1205;
    float _1253 = _1251 + 1.0;
    if (!_877)
    {
        _1237 = _645;
    }
    float _1255 = _1237;
    float _1257 = _933 * _1249;
    float _1259 = _1255;
    if (_877)
    {
        float _1261 = _987 ? as_type<float>(_1243) : _645;
        _1259 = _1261;
    }
    float _1263 = _1259;
    int _1265 = _1231 * int(_1193);
    int _1267 = _1265 + _1127;
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1257);
    if (_1213)
    {
        _703 = _677;
    }
    float _1271 = _703;
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1275 = _1271;
    if (!_1213)
    {
        _1275 = _665;
    }
    float _1277 = _1275;
    int _1279 = _1247 * int(_1227);
    int _1281 = _1279 + _1163;
    float _1283 = float(uint(_1267));
    float _1285 = fma(_1115, _1179, _1269);
    float _1287 = float(uint(_1095));
    float _1289 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1291 = float(uint(_1281));
    float _1293 = as_type<float>(_624) * _1283;
    float _1295 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1285);
    float _1297 = as_type<float>(_643) * _1291;
    float _1299 = trunc(_1293);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1309 = -_122;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _873);
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1315 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1307);
    float _1317 = trunc(_1297);
    float _1319 = precise::max(_1317, 0.0);
    uint _1321 = uint(_1319);
    float _1323 = as_type<float>(_624) * _1287;
    float _1325 = float(uint(_1101));
    float _1327 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1315);
    float _1329 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1331 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1313);
    float _1333 = _1287;
    if (_1213)
    {
        _1333 = _669;
    }
    float _1335 = _1333;
    float _1337 = as_type<float>(_643) * _1325;
    float _1339 = trunc(_1323);
    float _1341 = precise::max(_1339, 0.0);
    uint _1343 = uint(_1341);
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1347 = fma(_1327, _1305, _1311);
    float _1349 = fma(_1329, _1263, -0.5);
    int _1351 = ~_566;
    int _1353 = _1351 + 1;
    float _1355 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1345);
    float _1357 = _1335;
    if (!_1213)
    {
        _1357 = _677;
    }
    float _1359 = _1357;
    float _1361 = trunc(_1337);
    float _1363 = precise::max(_1361, 0.0);
    uint _1365 = uint(_1363);
    int _1367 = int(_1227) + int(_1321);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1371 = int(_1193) + int(_1303);
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1375 = ~_566;
    int _1377 = _1375 + 1;
    float _1379 = -_1369;
    float _1381 = fma(_1289, 2.0, _1379);
    int _1383 = ~_598;
    int _1385 = _1383 + 1;
    int _1387 = _1353 * int(_1343);
    int _1389 = _1387 + _1095;
    int _1391 = ~_598;
    int _1393 = _1391 + 1;
    int _1395 = _1377 * _1371;
    int _1397 = _1395 + _1127;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _893 + _1399;
    float _1403 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1331);
    float _1405 = float(uint(_1389));
    int _1407 = _1385 * _1367;
    int _1409 = _1407 + _1163;
    bool _1411 = uint(_1397) >= uint(_566);
    float _1413 = _963 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1415 = -_122;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1381);
    float _1419 = as_type<float>(_624) * _1405;
    bool _1421 = uint(_1409) >= uint(_598);
    float _1423 = _949 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1425 = _1393 * int(_1365);
    int _1427 = _1425 + _1101;
    bool _1429 = !_1411;
    int _1431 = _1429 ? 0 : (-1);
    float _1433 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1437 = _1423 + _1435;
    float _1439 = trunc(_1419);
    float _1441 = precise::max(_1439, 0.0);
    uint _1443 = uint(_1441);
    int _1445 = ~_1371;
    int _1447 = _1445 + _1431;
    int _1449 = _1447 + 1;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1453 = _1413 + _1451;
    float _1455 = float(uint(_1427));
    float _1457 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1461 = _566 * _1449;
    int _1463 = _1461 + _1127;
    float _1465 = _1347 + 0.5;
    float _1467 = as_type<float>(_643) * _1455;
    bool _1469 = !_1421;
    int _1471 = _1469 ? 0 : (-1);
    float _1473 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1457);
    float _1475 = fma(_1373, -2.0, _1459);
    bool _1477 = !_983;
    int _1479 = _1477 ? _1463 : (-1);
    int _1481 = ~_1367;
    int _1483 = _1481 + _1471;
    int _1485 = _1483 + 1;
    float _1487 = trunc(_1467);
    float _1489 = precise::max(_1487, 0.0);
    uint _1491 = uint(_1489);
    bool _1493 = _1473 >= 0.0;
    int _1495 = _1479 >> 31;
    int _1497 = _598 * _1485;
    int _1499 = _1497 + _1163;
    int _1501 = _1479 & 3;
    bool _1503 = _1501 != 0;
    int _1505 = int(_1343) + int(_1443);
    float _1507 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1475);
    int _1509 = _1495 & 3;
    int _1511 = ~_566;
    int _1513 = _1511 + 1;
    float _1515 = -_1507;
    float _1517 = fma(_1403, _1233, _1515);
    bool _1519 = !_1503;
    int _1521 = _1519 ? 0 : 1;
    if (_1493)
    {
        out.m_45.x = 0.0;
    }
    int _1523 = _1479 & 3;
    bool _1525 = _1523 != 0;
    bool _1527 = !_1035;
    int _1529 = _1527 ? _1499 : (-1);
    int _1531 = _1479 + _1509;
    int _1533 = _1513 * _1505;
    int _1535 = _1533 + _1095;
    int _1537 = _1529 >> 31;
    bool _1539 = uint(_1501) > 1u;
    int _1541 = _1531 >> 2;
    int _1543 = int(_1365) + int(_1491);
    int _1545 = _1537 & 3;
    int _1547 = _1541 << 4;
    int _1549 = _1547 + 368;
    int _1551 = _1525 ? 0 : 1;
    bool _1553 = uint(_1535) >= uint(_566);
    int _1555 = _1529 + _1545;
    uint _1557 = uint(int(uint(_1549) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[int(_1567)][_1569];
    int _1573 = ~_1551;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1555 >> 2;
    int _1581 = _1577;
    if (!_1539)
    {
        int _1583 = ~_1551;
        int _1585 = _1583 + 1;
        _1581 = _1585;
    }
    int _1587 = _1581;
    float _1589 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1355);
    bool _1591 = uint(_1501) >= 2u;
    int _1593 = _1579 << 4;
    int _1595 = _1593 + 512;
    float _1597 = fma(_1589, _1349, _1417);
    int _1599 = ~_598;
    int _1601 = _1599 + 1;
    int _1603 = _1549 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    int _1621 = _1591 ? 0 : 1;
    float _1623 = _1221 + 0.5;
    bool _1625 = _1501 != 3;
    int _1627 = _1601 * _1543;
    int _1629 = _1627 + _1101;
    bool _1631 = !_1553;
    int _1633 = _1631 ? 0 : (-1);
    int _1635 = abs(_1587);
    uint _1637 = uint(int(uint(_1595) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[int(_1647)][_1649];
    int _1653 = ~_1505;
    int _1655 = _1653 + _1633;
    int _1657 = _1655 + 1;
    out.m_57.x = _1465;
    out.m_57.y = _1623;
    bool _1659 = uint(_1629) >= uint(_598);
    int _1661 = ~_1621;
    int _1663 = _1661 + 1;
    int _1665 = _1663 + 1;
    int _1667 = _566 * _1657;
    int _1669 = _1667 + _1095;
    bool _1671 = !_1659;
    int _1673 = _1671 ? 0 : (-1);
    int _1675 = _1595 + 8;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    uint _1679 = uint(int(uint(int(_1677)) >> uint(2)));
    int _1681 = int(_1677) & 3;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[int(_1679)][_1681];
    int _1685 = int(_1677) + 1;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    int _1689 = _1685 & 3;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[int(_1687)][_1689];
    int _1693 = _1665;
    if (_1625)
    {
        int _1695 = ~_1621;
        int _1697 = _1695 + 1;
        _1693 = _1697;
    }
    int _1699 = _1693;
    int _1701 = _1529 & 3;
    bool _1703 = _1701 != 0;
    int _1705 = _1529 & 3;
    bool _1707 = _1705 != 0;
    int _1709 = _1703 ? 0 : 1;
    bool _1711 = uint(_1705) > 1u;
    int _1713 = ~_1543;
    int _1715 = _1713 + _1673;
    int _1717 = _1715 + 1;
    bool _1719 = !_1707;
    int _1721 = _1719 ? 0 : 1;
    bool _1723 = uint(_1705) >= 2u;
    int _1725 = _598 * _1717;
    int _1727 = _1725 + _1101;
    int _1729 = _1723 ? 0 : 1;
    bool _1731 = _1705 != 3;
    int _1733 = ~_1709;
    int _1735 = _1733 + 1;
    int _1737 = _1735 + 1;
    int _1739 = _1737;
    if (!_1711)
    {
        int _1741 = ~_1709;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = ~_1635;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = abs(_1521);
    int _1755 = abs(_1745);
    int _1757 = _1751 * as_type<int>(_1571);
    int _1759 = ~_1729;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (_1731)
    {
        int _1767 = ~_1729;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = abs(_1721);
    int _1775 = ~_1755;
    int _1777 = _1775 + 1;
    int _1779 = _1777 + 1;
    int _1781 = abs(_1771);
    int _1783 = ~_1773;
    int _1785 = _1783 + 1;
    int _1787 = _1785 + 1;
    int _1789 = _1779 * as_type<int>(_1651);
    int _1791 = ~_1753;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = abs(_1699);
    int _1799 = _1787 * as_type<int>(_1643);
    int _1801 = _1799 + _1789;
    int _1803 = ~_1781;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    int _1809 = _1795 * as_type<int>(_1563);
    int _1811 = _1809 + _1757;
    bool _1813 = _1705 != 3;
    int _1815 = ~_1797;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1807 * as_type<int>(_1683);
    int _1823 = _1821 + _1801;
    bool _1825 = _1501 != 3;
    bool _1827 = !_1813;
    int _1829 = _1827 ? 0 : (-1);
    int _1831 = _1819 * as_type<int>(_1611);
    int _1833 = _1831 + _1811;
    bool _1835 = !_881;
    int _1837 = _1835 ? 0 : 1;
    bool _1839 = !_1825;
    int _1841 = _1839 ? 0 : (-1);
    int _1843 = abs(_1829);
    int _1845 = abs(_1837);
    int _1847 = abs(_1841);
    float _1849 = _1401 * _1401;
    bool _1851 = !_865;
    int _1853 = _1851 ? 0 : 1;
    float _1855 = fma(_1437, _1437, _1849);
    int _1857 = abs(_1853);
    int _1859 = ~_1847;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    float _1865 = fma(_1453, _1453, _1855);
    int _1867 = ~_1843;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    int _1873 = ~_1857;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1863 * as_type<int>(_1619);
    int _1881 = _1879 + _1833;
    int _1883 = ~_1845;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    int _1889 = _1871 * as_type<int>(_1691);
    int _1891 = _1889 + _1823;
    float _1893 = rsqrt(_1865);
    bool _1895 = !_983;
    float _1897 = _1895 ? as_type<float>(_1669) : as_type<float>(0xffffffffu /* nan */);
    int _1899 = _1881 * _1877;
    bool _1901 = !_1035;
    int _1903 = _1901 ? _1727 : (-1);
    int _1905 = _1891 * _1887;
    float _1907 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1909 = as_type<int>(_1897) * _1857;
    int _1911 = _1909 + _1899;
    float _1913 = _1897;
    if (_1493)
    {
        _1913 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1915 = _1913;
    int _1917 = _1903 * _1845;
    int _1919 = _1917 + _1905;
    float _1921 = _1597 + 0.5;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1925 = as_type<int>(_1915);
    float _1927 = _1923;
    if (_1493)
    {
        float _1929 = _1915 * 5.0;
        _1925 = as_type<int>(_1929);
    }
    int _1931 = _1925;
    float _1933 = _1517 + 0.5;
    float _1935 = float(_1911);
    float _1937 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1939 = float(_1919);
    float _1941 = _1923 * _1893;
    if (_1493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5922 = as_type<float>(_1931);
        out.gl_Position.z = _5922;
    }
    float _1943 = _1437 * _1941;
    out.m_59.x = _1921;
    out.m_59.y = _1933;
    float _1945 = _1401 * _1941;
    out.m_61.x = _1935;
    out.m_61.y = _1939;
    out.m_63.w = _1937;
    if (_1493)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1947 = -_1945;
    float _1949 = _893 + _1947;
    float _1951 = _1453 * _1941;
    float _1953 = -_1943;
    float _1955 = _1423 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1959 = _1949 + _1957;
    float _1961 = -_1951;
    float _1963 = _1413 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1967 = _1955 + _1965;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1973 = _1963 + _1971;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1969);
    float _1977 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1975);
    bool _1979 = _1977 >= 0.0;
    float _1981 = _1973;
    float _1983 = _1951;
    if (_1979)
    {
        _1927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1985 = _1927;
    int _1987 = as_type<int>(_1985);
    if (_1979)
    {
        out.m_45.x = 0.0;
    }
    if (_1979)
    {
        float _1989 = _1985 * 5.0;
        _1987 = as_type<int>(_1989);
    }
    int _1991 = _1987;
    if (_1979)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6023 = as_type<float>(_1991);
        out.gl_Position.z = _6023;
    }
    if (_1979)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1993 = -_893;
    float _1995 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1997 = -_1423;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2001 = -_1413;
    float _2003 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2005 = _1995 * _1995;
    float _2007 = -_1945;
    float _2009 = _1401 + _2007;
    float _2011 = fma(_1999, _1999, _2005);
    float _2013 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2015 = fma(_2003, _2003, _2011);
    float _2017 = -_1943;
    float _2019 = _1437 + _2017;
    float _2021 = -_2013;
    float _2023 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2021);
    float _2025 = _2009 * _2009;
    float _2027 = rsqrt(_2015);
    float _2029 = -_1951;
    float _2031 = _1453 + _2029;
    float _2033 = fma(_2019, _2019, _2025);
    float _2035 = fma(_2031, _2031, _2033);
    float _2037 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2039 = sqrt(_2035);
    float _2041 = -_2037;
    float _2043 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2041);
    float _2045 = _1999 * _2027;
    float _2047 = _2003 * _2027;
    float _2049 = _1995 * _2027;
    float _2051 = _2045 * _2045;
    float _2053 = fma(_2047, _2047, _2051);
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2057 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2061 = rsqrt(_2053);
    float _2063 = -_2055;
    float _2065 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2069 = -_2059;
    float _2071 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2069);
    float _2073 = -_2057;
    float _2075 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2073);
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2079 = _1893 * _2039;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2083 = -_2067;
    float _2085 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2083);
    float _2087 = _1907 * _2079;
    float _2089 = -_2081;
    float _2091 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2089);
    float _2093 = -_2077;
    float _2095 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2093);
    float _2097 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2085);
    float _2099 = _2047 * _2061;
    float _2101 = _2045 * _2061;
    float _2103 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2095);
    float _2105 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2107 = -_2099;
    float _2109 = _2047 * _2107;
    float _2111 = -_2099;
    float _2113 = _2049 * _2111;
    float _2115 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2117 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2119 = -_2109;
    float _2121 = fma(_2045, _2101, _2119);
    float _2123 = _2049 * _2101;
    float _2125 = -_2115;
    float _2127 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    float _2129 = -_2117;
    float _2131 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2133 = _2121 * _2121;
    float _2135 = -_2105;
    float _2137 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2135);
    float _2139 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2131);
    float _2141 = fma(_2123, _2123, _2133);
    float _2143 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2127);
    float _2145 = fma(_2113, _2113, _2141);
    float _2147 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2137);
    float _2149 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2151 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2153 = 1.0 / _502;
    float _2155 = -_2147;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2143);
    float _2159 = -_2149;
    float _2161 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2163 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2165 = -_2151;
    float _2167 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2165);
    float _2169 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2161);
    float _2171 = -_2163;
    float _2173 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2171);
    float _2175 = rsqrt(_2145);
    float _2177 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2167);
    float _2179 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2173);
    float _2181 = 1.0 / _2157;
    float _2183 = _2121 * _2175;
    float _2185 = precise::clamp(_2183, 0.0, 1.0);
    float _2187 = 1.0 / _506;
    float _2189 = -_2185;
    float _2191 = _2189 + 1.0;
    float _2193 = fma(_2169, _2181, -1.0);
    float _2195 = _2191 * _2181;
    float _2197 = fma(_2191, _2193, 1.0);
    float _2199 = _2179 * _2195;
    float _2201 = _2177 * _2195;
    float _2203 = 1.0 / _504;
    float _2205 = _2197 * _2197;
    float _2207 = fma(_2199, _2199, _2205);
    float _2209 = fma(_2201, _2201, _2207);
    float _2211 = rsqrt(_2209);
    float _2213 = _2201 * _2211;
    float _2215 = _2199 * _2211;
    float _2217 = _2197 * _2211;
    float _2219 = -_2213;
    float _2221 = _2045 * _2219;
    float _2223 = -_2215;
    float _2225 = _2049 * _2223;
    float _2227 = _2047 * _2217;
    float _2229 = -_2215;
    float _2231 = -_2221;
    float _2233 = fma(_2047, _2229, _2231);
    float _2235 = -_2225;
    float _2237 = fma(_2045, _2217, _2235);
    float _2239 = -_2213;
    float _2241 = -_2227;
    float _2243 = fma(_2049, _2239, _2241);
    float _2245 = _2233 * _2233;
    float _2247 = fma(_2243, _2243, _2245);
    float _2249 = fma(_2237, _2237, _2247);
    float _2251 = rsqrt(_2249);
    float _2253 = _2243 * _2251;
    float _2255 = _2237 * _2251;
    float _2257 = _2233 * _2251;
    float _2259 = _2047 * _2253;
    float _2261 = _2049 * _2255;
    float _2263 = -_2259;
    float _2265 = fma(_2045, _2255, _2263);
    float _2267 = _2045 * _2257;
    float _2269 = -_2261;
    float _2271 = fma(_2047, _2257, _2269);
    float _2273 = _2265 * _2265;
    float _2275 = -_2267;
    float _2277 = fma(_2049, _2253, _2275);
    float _2279 = fma(_2271, _2271, _2273);
    float _2281 = fma(_2277, _2277, _2279);
    float _2283 = rsqrt(_2281);
    float _2285 = _2277 * _2283;
    float _2287 = _2265 * _2283;
    float _2289 = _2271 * _2283;
    float _2291 = _2045 * _2285;
    float _2293 = in.m_65.x;
    float _2295 = in.m_65.y;
    float _2297 = in.m_65.z;
    float _2299 = _2047 * _2287;
    float _2301 = _2049 * _2289;
    float _2303 = -_2291;
    float _2305 = fma(_2047, _2289, _2303);
    float _2307 = -_2299;
    float _2309 = fma(_2049, _2285, _2307);
    float _2311 = -_2301;
    float _2313 = fma(_2045, _2287, _2311);
    float _2315 = _2305 * _2305;
    float _2317 = fma(_2309, _2309, _2315);
    float _2319 = fma(_2313, _2313, _2317);
    float _2321 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2323 = rsqrt(_2319);
    float _2325 = _2153 * _2293;
    float _2327 = _2203 * _2295;
    float _2329 = _2321 * _2079;
    float _2331 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2325);
    float _2335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2327);
    float _2337 = _2187 * _2297;
    float _2339 = _2331 * _2079;
    float _2341 = _2087 * _2333;
    float _2343 = _2329 * _2335;
    float _2345 = _2337 * _2339;
    float _2347 = _2341 * _2323;
    float _2349 = _2343 * _2287;
    float _2351 = _2343 * _2289;
    float _2353 = _2343 * _2285;
    float _2355 = _2339 + (-1.0);
    float _2357 = fma(_2305, _2347, _2349);
    float _2359 = fma(_2309, _2347, _2351);
    float _2361 = fma(_2313, _2347, _2353);
    float _2363 = fma(_2049, _2345, _2357);
    float _2365 = fma(_2045, _2345, _2359);
    float _2367 = fma(_2047, _2345, _2361);
    float _2369 = _2329 + (-1.0);
    float _2371 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2373 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2375 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2371);
    float _2377 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2379 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2373);
    float _2381 = _893 + _2363;
    float _2383 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2375);
    float _2385 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2377);
    float _2387 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2379);
    float _2389 = _2087 + (-1.0);
    float _2391 = _2355 * _2383;
    float _2393 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2385);
    float _2395 = _2369 * _2387;
    float _2397 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2401 = _2393 * _2389;
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2405 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2397);
    float _2407 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2399);
    float _2409 = _1413 + _2367;
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2403);
    float _2413 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2405);
    float _2415 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2407);
    float _2417 = _1423 + _2365;
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2411);
    float _2421 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2423 = _2409 + _2415;
    float _2425 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2427 = _2417 + _2419;
    float _2429 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2433 = _2423 + _2431;
    float _2435 = 1.0 / _2425;
    float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2439 = _2427 + _2437;
    float _2441 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2429);
    float _2443 = _2433 * _2433;
    float _2445 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2421);
    float _2447 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2441);
    float _2449 = fma(_2439, _2439, _2443);
    float _2451 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2445);
    bool _2453 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan(0.5);
    bool _2461 = _2457 || _2459;
    float _2463 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2465 = sqrt(_2449);
    float _2467 = _2463 + _2425;
    float _2469 = _2467 * _2435;
    float _2471 = _2469 * 0.5;
    float _2473 = _2381 + _2451;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2475);
    bool _2479 = _2465 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2481 = 1.0 / _2477;
    bool _2483 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2485 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(0.5);
    bool _2491 = _2487 || _2489;
    float _2493 = _2451;
    float _2495 = _2445;
    float _2497 = _2427;
    float _2499 = _2381;
    if (!_2479)
    {
        _2493 = _2423;
    }
    float _2501 = _2493;
    float _2503 = _2501;
    if (!_2479)
    {
        _2495 = _2473;
    }
    float _2505 = _2495;
    bool _2507 = !_2479;
    float _2509 = _2505;
    if (!_2507)
    {
        float _2511 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2515 = _2465 + _2513;
        float _2517 = rsqrt(_2449);
        float _2519 = _2515 * _2511;
        float _2521 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2519 * 0.15915493667125701904296875;
        float _2525 = _2523 * 6.283185482025146484375;
        float _2527 = cos(_2525);
        float _2529 = _2523 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = _2527 + (-1.0);
        float _2535 = fma(_2531, _2521, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2537 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2539 = _2517 * _2535;
        float _2541 = fma(_2473, _2527, _2537);
        float _2543 = fma(_2439, _2539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2545 = fma(_2433, _2539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2497 = _2543;
        _2509 = _2541;
        _2503 = _2545;
        _2499 = _2539;
    }
    float _2547 = _2497;
    float _2549 = _2509;
    float _2551 = _2503;
    float _2553 = _2499;
    float _2555 = -_1943;
    float _2557 = _2555 + _2547;
    float _2559 = -_1945;
    float _2561 = _2559 + _2549;
    float _2563 = -_1951;
    float _2565 = _2563 + _2551;
    float _2567 = _2553;
    float _2569 = _2561;
    float _2571 = _2557;
    float _2573 = _2565;
    float _2575 = _2551;
    if (_2491)
    {
        _2567 = 1.0;
    }
    float _2577 = _2567;
    float _2579 = _2577;
    if (!_2461)
    {
        float _2581 = _1959 * _1959;
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2585 = -_1413;
        float _2587 = _2585 + _2551;
        float _2589 = -_893;
        float _2591 = _2589 + _2549;
        float _2593 = fma(_1967, _1967, _2581);
        float _2595 = fma(_1973, _1973, _2593);
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2599 = sqrt(_2595);
        float _2601 = 1.0 / _2079;
        float _2603 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2605 = precise::min(_2599, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2607 = _2605 * _2583;
        float _2609 = _2607 * _2601;
        float _2611 = -_1423;
        float _2613 = _2611 + _2547;
        float _2615 = _2603 * _2609;
        float _2617 = _2587 * _2609;
        float _2619 = fma(_2613, _2615, _1955);
        float _2621 = fma(_2591, _2615, _1949);
        float _2623 = fma(_2603, _2617, _1963);
        _2569 = _2621;
        _2571 = _2619;
        _2573 = _2623;
        _2575 = _2617;
    }
    float _2625 = _2569;
    float _2627 = _2571;
    float _2629 = _2573;
    float _2631 = _2575;
    float _2633 = _2631;
    if (_2491)
    {
        _2633 = 1.0;
    }
    float _2635 = _2633;
    float _2637 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2639 = _2481 * _2637;
    float _2641 = _2635;
    if (!_2491)
    {
        float _2643 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2645 = _2643 * 0.15915493667125701904296875;
        float _2647 = _2645 * 6.283185482025146484375;
        float _2649 = cos(_2647);
        float _2651 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2653 = _2651 * 0.15915493667125701904296875;
        float _2655 = _2645 * 6.283185482025146484375;
        float _2657 = sin(_2655);
        float _2659 = 1.0 / _2649;
        float _2661 = _2653 * 6.283185482025146484375;
        float _2663 = cos(_2661);
        float _2665 = _2657 * _2659;
        float _2667 = _2653 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        float _2671 = _2663 * _2665;
        float _2673 = 1.0 / _2671;
        float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2677 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2675;
        float _2679 = 1.0 / _2677;
        float _2681 = _2669 * _2673;
        float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2685 = fma(_2639, _2681, _2683);
        float _2687 = _2685 * _2679;
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        _895 = _2679;
        _2579 = _2689;
    }
    float _2691 = _895;
    float _2693 = _2579;
    float _2695 = _2691;
    if (!_2491)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2639, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2695 = _2713;
        _2641 = _2747;
    }
    float _2749 = _2695;
    float _2751 = _2641;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2755 = _2625 + _2753;
    float _2757 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2759 = _2627 + _2757;
    float _2761 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2763 = _2629 + _2761;
    float _2765 = _2755 * _2755;
    float _2767 = fma(_2759, _2759, _2765);
    float _2769 = fma(_2763, _2763, _2767);
    float _2771 = rsqrt(_2769);
    float _2773 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2775 = _2759 * _2773;
    float _2777 = _2763 * _2773;
    float _2779 = _2775 * _2775;
    float _2781 = _2777 * _2777;
    float _2783 = _2779 + _2781;
    float _2785 = sqrt(_2783);
    bool _2787 = _2785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2791 = _2785 + _2789;
    float _2793 = _2771;
    float _2795 = _2749;
    float _2797 = _2791;
    float _2799 = _2755;
    float _2801 = _2775;
    if (_2787)
    {
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2793 = _2803;
    }
    float _2805 = _2793;
    if (_2787)
    {
        float _2807 = rsqrt(_2783);
        _2795 = _2807;
    }
    float _2809 = _2795;
    float _2811 = _2809;
    if (_2787)
    {
        float _2813 = _2791 * _2805;
        _2797 = _2813;
    }
    float _2815 = _2797;
    if (_2787)
    {
        float _2817 = _2815 * 0.15915493667125701904296875;
        _1981 = _2817;
    }
    float _2819 = _1981;
    float _2821 = _2763;
    if (_2787)
    {
        float _2823 = _2819 * 6.283185482025146484375;
        float _2825 = sin(_2823);
        _2821 = _2825;
    }
    float _2827 = _2821;
    float _2829 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2831 = precise::max(0.0, _2829);
    float _2833 = _2805;
    float _2835 = _2831;
    if (_2787)
    {
        float _2837 = _2819 * 6.283185482025146484375;
        float _2839 = cos(_2837);
        _2833 = _2839;
    }
    float _2841 = _2833;
    float _2843 = -_2773;
    float _2845 = -_2831;
    float _2847 = fma(_2755, _2843, _2845);
    float _2849 = _2847;
    if (_2787)
    {
        float _2851 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2799 = _2851;
    }
    float _2853 = _2799;
    float _2855 = sqrt(_2769);
    float _2857 = _2853;
    float _2859 = _2827;
    if (_2787)
    {
        float _2861 = fma(_2827, _2853, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = _2863;
    if (!_2787)
    {
        _2859 = _2779;
    }
    float _2867 = _2859;
    float _2869 = _2867;
    if (_2787)
    {
        float _2871 = _2841 + (-1.0);
        _2835 = _2871;
    }
    float _2873 = _2835;
    float _2875 = _2873;
    if (_2787)
    {
        float _2877 = _2809 * _2863;
        _1983 = _2877;
    }
    float _2879 = _1983;
    if (!_2787)
    {
        _2865 = _2781;
    }
    float _2881 = _2865;
    float _2883 = _2881;
    if (_2787)
    {
        float _2885 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2811 = _2885;
    }
    float _2887 = _2811;
    if (_2787)
    {
        float _2889 = _2775 * _2879;
        _2801 = _2889;
    }
    float _2891 = _2801;
    if (!_2787)
    {
        _2875 = _2777;
    }
    float _2893 = _2875;
    float _2895 = _2893;
    if (_2787)
    {
        float _2897 = _2777 * _2879;
        _2895 = _2897;
    }
    float _2899 = _2895;
    if (_2787)
    {
        float _2901 = fma(_2847, _2841, _2887);
        _2849 = _2901;
    }
    float _2903 = _2849;
    if (_2787)
    {
        float _2905 = _2891 * _2891;
        _2869 = _2905;
    }
    float _2907 = _2869;
    if (_2787)
    {
        float _2909 = _2899 * _2899;
        _2883 = _2909;
    }
    float _2911 = _2883;
    float _2913 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2915 = fma(_2903, _2903, _2907);
    float _2917 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2921 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2919);
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2913);
    float _2927 = _2915 + _2911;
    float _2929 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2931 = -_2923;
    float _2933 = _2931 + 1.0;
    float _2935 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2937 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2925);
    float _2939 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2929);
    float _2941 = rsqrt(_2927);
    float _2943 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2945 = _2937 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2947 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2939);
    float _2949 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2943);
    float _2951 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2935);
    float _2953 = _2947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2955 = abs(_2933);
    float _2957 = log2(_2955);
    float _2959 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2949);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2963 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2951);
    float _2965 = _2959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2967 = -_2961;
    float _2969 = fma(_2967, _2917, 1.0);
    float _2971 = _2941 * _2891;
    float _2973 = _2941 * _2903;
    float _2975 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2977 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2979 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2981 = _2941 * _2899;
    float _2983 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2975);
    float _2985 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2987 = -_2979;
    float _2989 = fma(_2973, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2987);
    float _2991 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2993 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2983);
    float _2995 = log2(_2969);
    float _2997 = -_2981;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2989);
    float _3001 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3003 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2993);
    float _3005 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2985);
    float _3007 = fma(_2999, -0.5, 0.5);
    float _3009 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3001);
    float _3011 = fma(_2999, 0.5, 0.5);
    float _3013 = exp2(_2991);
    float _3015 = _2973 + 1.0;
    float _3017 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3005);
    float _3019 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3009);
    float _3021 = fma(_3011, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3023 = 1.0 / _3003;
    float _3025 = fma(_3011, _3021, -0.212114393711090087890625);
    float _3027 = _2995 * 0.693147182464599609375;
    float _3029 = fma(_3011, _3025, 1.570728778839111328125);
    float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3033 = sqrt(_3007);
    float _3035 = -_2973;
    float _3037 = fma(_3013, _3015, _3035);
    float _3039 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3017);
    float _3041 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3019);
    float _3043 = fma(_3037, 0.5, 0.5);
    float _3045 = _3039 * _3023;
    float _3047 = _3041 * _3023;
    float _3049 = fma(_3045, 0.5, 0.5);
    float _3051 = fma(_3047, -0.5, 0.5);
    float _3053 = _3033 * 0.636619746685028076171875;
    float3 _7726 = float3(_3049, _3051, _3031);
    float _3055 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7726, float3(0.0), isnan(_7726)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7726, float3(0.0), isnan(_7726)), level(0.0)).x;
    float3 _7737 = float3(_3049, _3051, _3031);
    float4 _3058 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7737, float3(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7737, float3(0.0), isnan(_7737)), level(0.0)).xyzw;
    float _3060 = _3058.x;
    float _3062 = _3058.y;
    float _3064 = _3058.z;
    float _3066 = _3058.w;
    float _3068 = -_3029;
    float _3070 = fma(_3053, _3068, 1.0);
    float2 _7759 = float2(_3070, _3043);
    float3 _3074 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7759, float2(0.0), isnan(_7759)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7759, float2(0.0), isnan(_7759)), level(0.0)).xyz;
    float _3076 = _3074.x;
    float _3078 = _3074.y;
    float _3080 = _3074.z;
    float _3082 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3084 = _2693 * _2751;
    float _3086 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3088 = _2693 > 0.0;
    bool _3090 = isnan(_2693);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan(0.0);
    bool _3096 = _3092 || _3094;
    out.m_53.w = _500;
    float _3098 = _3084 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3100 = exp2(_3082);
    float _3102 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3086);
    bool _3104 = _2751 <= 0.0;
    bool _3106 = !_3096;
    bool _3108 = _3104 || _3106;
    float _3110 = _3098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3112 = _3003 * 0.5;
    float _3114 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3102);
    float _3116 = _3039 + _3003;
    out.m_63.w = _1937;
    float _3118 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3114);
    out.m_67.x = _1955;
    out.m_67.y = _1949;
    out.m_67.z = _1963;
    float _3120 = _3116 * 0.5;
    float _3122 = _3118 + _3003;
    out.m_45.x = _3110;
    float _3124 = -_3100;
    float _3126 = _3124 + 1.0;
    float _3128 = _3122 * 0.5;
    float _3130 = fma(_3041, -0.5, _3112);
    out.gl_Position.x = _3039;
    out.gl_Position.y = _3041;
    out.gl_Position.z = _3118;
    out.gl_Position.w = _3003;
    float _3132 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3120;
    out.m_69.y = _3130;
    out.m_69.z = _3128;
    out.m_69.w = _3003;
    float _3134 = -_3132;
    float _3136 = _3134 + 1.0;
    float _3138 = _3132 * _3055;
    float _3140 = _3066 * _3136;
    float _3142 = _3066 * _3138;
    float _3144 = _3080 * _3138;
    float _3146 = fma(_3076, _3142, _3060);
    float _3148 = fma(_3078, _3142, _3062);
    float _3150 = fma(_3066, _3144, _3064);
    out.m_71.x = _3146;
    out.m_71.y = _3148;
    out.m_71.z = _3150;
    out.m_71.w = _3140;
    if (!_3108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3152 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3152;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _528 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3208 = as_type<float>(_106);
        out.gl_Position.z = _3208;
    }
    if (!_94)
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _100;
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
        float _3276 = as_type<float>(_142);
        out.gl_Position.z = _3276;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _170 = 0.0;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _170 = _174;
    }
    float _176 = _170;
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
    float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _226 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _228 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _230 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _232 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].x, _226);
    float _234 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].y, _228);
    float _236 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].z, _230);
    float _238 = _228;
    if (!_156)
    {
        _238 = _146;
    }
    float _240 = _238;
    float _242 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _232);
    bool _244 = !_156;
    float _246 = _240;
    if (!_244)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _146 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _246 = _266;
    }
    float _268 = _246;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].y, _234);
    float _274 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].z, _236);
    float _276 = fma(_268, _158, _242);
    float _278 = fma(_268, _160, _272);
    float _280 = fma(_268, _162, _274);
    float _282 = fma(_276, _144, _164);
    float _284 = fma(_278, _144, _166);
    float _286 = fma(_280, _144, _168);
    bool _288 = !_270;
    float _290 = _282;
    float _308;
    if (!_288)
    {
        float _292 = in.m_51.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_90);
        float _314 = 1.0 / _312;
        float _316 = _122 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _332;
    bool _336 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _338 = isnan(_318);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _326;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _354 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _356 = isnan(_318);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _368 = 1.0 / _330;
    float _370 = _334 * _348;
    bool _372 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _374 = isnan(_318);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = 1.0 / _352;
    float _386 = -_346;
    float _388 = _386 + 1.0;
    float _390 = fma(_370, _322, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _396 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _398 = isnan(_318);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -_382;
    float _410 = _408 + 1.0;
    float _412 = _382 * _388;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _418 = 1.0 / _394;
    float _420 = -_406;
    float _422 = _420 + 1.0;
    float _424 = _364 * _410;
    float _426 = _416 * _368;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _428;
    float _432 = _346 * _422;
    float _434 = _390 * _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = _318 + _436;
    float _440 = -_364;
    float _442 = _440 + 1.0;
    bool _444 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _446 = isnan(_318);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _430 * _384;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _318 + _462;
    float _466 = fma(_426, _438, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _468 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _434);
    float _470 = -_454;
    float _472 = _470 + 1.0;
    float _474 = _460 * _418;
    float _476 = fma(_456, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _480 = _318 + _478;
    float _482 = fma(_466, _412, _468);
    float _484 = _406 * _472;
    float _486 = in.m_49.x;
    float _488 = in.m_49.y;
    float _490 = in.m_49.z;
    float _492 = fma(_474, _480, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _494 = fma(_476, _432, _482);
    float _496 = fma(_492, _484, _494);
    float _498 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[119].x, _496);
    float _500 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _500;
    float _502 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = _490 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _508 = !_366;
    float _526;
    if (!_508)
    {
        float _510 = in.m_51.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_90);
        float _532 = 1.0 / _530;
        float _534 = _122 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.y;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _546 = _544 != 0;
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _550 = int(_548);
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _558 = _556 != 0;
    float _560 = float(_90);
    float _562 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _564 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _566 = int(_564);
    float _568 = float(_540);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _574 = 1.0 / _568;
    float _576 = float(_550);
    float _578 = -_542;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _594 = float(uint(_566));
    float _596 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _598 = int(_596);
    int _600 = ~_566;
    int _602 = _600 + 1;
    float _604 = float(_566);
    float _606 = _122 * _574;
    float _608 = 1.0 / _576;
    float _610 = 1.0 / _594;
    float _612 = float(uint(_598));
    int _614 = ~_598;
    int _616 = _614 + 1;
    float _618 = trunc(_606);
    int _620 = int(_618);
    float _622 = _122 * _608;
    int _624 = as_type<int>(_610) + (-2);
    float _626 = 1.0 / _612;
    float _628 = float(uint(_620));
    float _630 = trunc(_622);
    int _632 = int(_630);
    float _634 = as_type<float>(_624) * _628;
    float _636 = trunc(_634);
    float _638 = precise::max(_636, 0.0);
    uint _641 = uint(_638);
    int _643 = as_type<int>(_626) + (-2);
    float _645 = in.m_55.x;
    float _647 = float(uint(_632));
    float _649 = 1.0 / _572;
    float _651 = float(_632);
    float _653 = as_type<float>(_643) * _647;
    int _655 = _602 * int(_641);
    int _657 = _655 + _620;
    float _659 = trunc(_653);
    float _661 = precise::max(_659, 0.0);
    uint _663 = uint(_661);
    float _665 = in.m_51.z;
    float _667 = float(uint(_657));
    float _669 = in.m_51.y;
    float _671 = 1.0 / _584;
    float _673 = as_type<float>(_624) * _667;
    float _675 = _588 * _649;
    float _677 = in.m_51.x;
    int _679 = _616 * int(_663);
    int _681 = _679 + _632;
    float _683 = trunc(_673);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    float _689 = float(uint(_681));
    float _691 = _592 * _671;
    bool _693 = _665 > 0.5;
    float _695 = as_type<float>(_643) * _689;
    float _697 = _689;
    float _699 = _542;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _703 = _645;
    if (!_546)
    {
        _697 = _645;
    }
    float _705 = _697;
    float _707 = 1.0 / _560;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _711 = _536 + _709;
    bool _713 = _669 > 0.5;
    int _715 = int(_641) + int(_687);
    int _717 = int(_687);
    bool _719 = _713;
    float _721 = _705;
    if (_546)
    {
        float _723 = -_645;
        float _725 = _723 + 1.0;
        _717 = as_type<int>(_725);
    }
    int _727 = _717;
    int _729 = _713 ? as_type<int>(_580) : as_type<int>(_542);
    float _731 = trunc(_695);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    if (_546)
    {
        bool _737 = _677 > 0.5;
        _719 = _737;
    }
    bool _739 = _719;
    float _741 = _677 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _743 = ~_566;
    int _745 = _743 + 1;
    float _747 = _558 ? as_type<float>(_729) : _542;
    if (_554)
    {
        float _749 = _693 ? _580 : _542;
        _699 = _749;
    }
    float _751 = _699;
    int _753 = _745 * _715;
    int _755 = _753 + _620;
    if (_546)
    {
        float _757 = _739 ? as_type<float>(_727) : _645;
        _721 = _757;
    }
    float _759 = _721;
    float _761 = _122 * _707;
    int _763 = ~_598;
    int _765 = _763 + 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _777 = _775 != 0;
    int _779 = int(_663) + int(_735);
    bool _781 = uint(_755) >= uint(_566);
    bool _783 = !_769;
    int _785 = _783 ? 0 : 1;
    int _787 = _765 * _779;
    int _789 = _787 + _632;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _793 = _791 != 0;
    bool _795 = !_781;
    int _797 = _795 ? 0 : (-1);
    bool _799 = !_773;
    int _801 = _799 ? 0 : 1;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _821 = _819 != 0;
    bool _823 = !_793;
    int _825 = _823 ? 0 : 1;
    bool _827 = uint(_789) >= uint(_598);
    bool _829 = !_821;
    int _831 = _829 ? 0 : 1;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _835 = _833 != 0;
    float _837 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _841 = !_827;
    int _843 = _841 ? 0 : (-1);
    bool _845 = !_809;
    int _847 = _845 ? 0 : 1;
    float _849 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    bool _851 = !_805;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    bool _857 = !_813;
    int _859 = _857 ? 0 : 1;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _869 = _867 != 0;
    float _871 = -_861;
    float _873 = fma(_741, 2.0, _871);
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _877 = _875 != 0;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _881 = _879 != 0;
    float _883 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _562);
    if (_835)
    {
        _290 = 1.0;
    }
    float _885 = _290;
    float _887 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _849);
    float _889 = _885;
    if (!_835)
    {
        _889 = 7.345489978790283203125;
    }
    float _891 = _889;
    float _893 = _887 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _895 = _893;
    if (_835)
    {
        _701 = _677;
    }
    float _897 = _701;
    float _899 = _891 * _677;
    float _901 = 0.0;
    float _903 = _897;
    if (_835)
    {
        _901 = 1.0;
    }
    float _905 = _901;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _909 = _905;
    if (!_835)
    {
        _903 = _669;
    }
    float _911 = _903;
    float _913 = _669 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_835)
    {
        _909 = 1.2345600128173828125;
    }
    float _915 = _909;
    float _917 = floor(_899);
    int _919 = ~_715;
    int _921 = _919 + _797;
    int _923 = _921 + 1;
    float _925 = fma(_913, -2.0, _907);
    float _927 = float(_620);
    float _929 = _911 * _915;
    float _931 = float(_598);
    float _933 = fma(_675, _711, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _935 = _927 >= _604;
    bool _937 = isnan(_927);
    bool _939 = _935 || _937;
    bool _941 = isnan(_604);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = floor(_929);
    float _949 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _883);
    bool _951 = _651 >= _931;
    bool _953 = isnan(_651);
    bool _955 = _951 || _953;
    bool _957 = isnan(_931);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _855);
    int _965 = abs(_801);
    bool _967 = !_777;
    int _969 = _967 ? 0 : 1;
    float _971 = trunc(_945);
    int _973 = int(_971);
    float _975 = -_917;
    float _977 = _899 + _975;
    bool _979 = !_817;
    int _981 = _979 ? 0 : 1;
    bool _983 = _566 == 0;
    float _985 = _977 * _604;
    bool _987 = _669 > 0.5;
    float _989 = trunc(_961);
    int _991 = int(_989);
    float _993 = -_947;
    float _995 = _929 + _993;
    int _997 = _566 * _923;
    int _999 = _997 + _620;
    int _1001 = ~_779;
    int _1003 = _1001 + _843;
    int _1005 = _1003 + 1;
    float _1007 = _761 * _604;
    float _1009 = _761 * _931;
    float _1011 = _995 * _931;
    bool _1013 = !_983;
    int _1015 = _1013 ? _999 : (-1);
    int _1017 = _598 * _1005;
    int _1019 = _1017 + _632;
    int _1021 = ~_973;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = trunc(_1007);
    int _1029 = int(_1027);
    bool _1031 = !_869;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = _598 == 0;
    int _1037 = _1015 * _1025;
    int _1039 = _566 + (-1);
    int _1041 = ~_991;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    float _1047 = trunc(_985);
    int _1049 = int(_1047);
    bool _1051 = !_1035;
    int _1053 = _1051 ? _1019 : (-1);
    int _1055 = _973 * _1039;
    int _1057 = _1055 + _1037;
    int _1059 = _598 + (-1);
    int _1061 = abs(_785);
    int _1063 = _1053 * _1045;
    float _1065 = trunc(_1011);
    int _1067 = int(_1065);
    int _1069 = _991 * _1059;
    int _1071 = _1069 + _1063;
    int _1073 = abs(_847);
    int _1075 = _1057 * _965;
    int _1077 = abs(_1033);
    int _1079 = abs(_853);
    float _1081 = trunc(_1009);
    int _1083 = int(_1081);
    int _1085 = abs(_825);
    int _1087 = _1029 * _1061;
    int _1089 = _1087 + _1075;
    int _1091 = _1071 * _1073;
    int _1093 = _1049 * _1085;
    int _1095 = _1093 + _620;
    int _1097 = abs(_969);
    int _1099 = _1067 * _1077;
    int _1101 = _1099 + _632;
    int _1103 = abs(_831);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1107 = _536 + _1105;
    int _1109 = abs(_859);
    int _1111 = _1095 * _1097;
    int _1113 = _1111 + _1089;
    float _1115 = fma(_691, _1107, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1117 = abs(_981);
    int _1119 = _1083 * _1079;
    int _1121 = _1119 + _1091;
    float _1123 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1125 = _1049 * _1103;
    int _1127 = _1125 + _1113;
    bool _1129 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1131 = isnan(_536);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    int _1141 = _1101 * _1109;
    int _1143 = _1141 + _1121;
    bool _1145 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1147 = isnan(_536);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1159 = float(uint(_1127));
    int _1161 = _1067 * _1117;
    int _1163 = _1161 + _1143;
    float _1165 = -_1139;
    float _1167 = _1165 + 1.0;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1171 = _1075;
    if (_835)
    {
        _1171 = 0;
    }
    int _1173 = _1171;
    float _1175 = as_type<float>(_624) * _1159;
    float _1177 = float(uint(_1163));
    float _1179 = _1155 * _1167;
    float _1181 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1169);
    int _1183 = _1173;
    if (!_835)
    {
        _1183 = 2;
    }
    int _1185 = _1183;
    float _1187 = as_type<float>(_643) * _1177;
    float _1189 = trunc(_1175);
    float _1191 = precise::max(_1189, 0.0);
    uint _1193 = uint(_1191);
    bool _1195 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1197 = isnan(_536);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1181);
    float _1209 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _925);
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1213 = _1185 != 2;
    float _1215 = -_1155;
    float _1217 = _1215 + 1.0;
    float _1219 = -_1209;
    float _1221 = fma(_1207, _1123, _1219);
    float _1223 = trunc(_1187);
    float _1225 = precise::max(_1223, 0.0);
    uint _1227 = uint(_1225);
    int _1229 = ~_566;
    int _1231 = _1229 + 1;
    float _1233 = fma(_1211, _751, -0.5);
    int _1235 = as_type<int>(_1211);
    float _1237 = as_type<float>(_1231);
    if (_877)
    {
        float _1239 = -_645;
        float _1241 = _1239 + 1.0;
        _1235 = as_type<int>(_1241);
    }
    int _1243 = _1235;
    int _1245 = ~_598;
    int _1247 = _1245 + 1;
    float _1249 = _1205 * _1217;
    float _1251 = -_1205;
    float _1253 = _1251 + 1.0;
    if (!_877)
    {
        _1237 = _645;
    }
    float _1255 = _1237;
    float _1257 = _933 * _1249;
    float _1259 = _1255;
    if (_877)
    {
        float _1261 = _987 ? as_type<float>(_1243) : _645;
        _1259 = _1261;
    }
    float _1263 = _1259;
    int _1265 = _1231 * int(_1193);
    int _1267 = _1265 + _1127;
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1257);
    if (_1213)
    {
        _703 = _677;
    }
    float _1271 = _703;
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1275 = _1271;
    if (!_1213)
    {
        _1275 = _665;
    }
    float _1277 = _1275;
    int _1279 = _1247 * int(_1227);
    int _1281 = _1279 + _1163;
    float _1283 = float(uint(_1267));
    float _1285 = fma(_1115, _1179, _1269);
    float _1287 = float(uint(_1095));
    float _1289 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1291 = float(uint(_1281));
    float _1293 = as_type<float>(_624) * _1283;
    float _1295 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1285);
    float _1297 = as_type<float>(_643) * _1291;
    float _1299 = trunc(_1293);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1309 = -_122;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _873);
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1315 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1307);
    float _1317 = trunc(_1297);
    float _1319 = precise::max(_1317, 0.0);
    uint _1321 = uint(_1319);
    float _1323 = as_type<float>(_624) * _1287;
    float _1325 = float(uint(_1101));
    float _1327 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1315);
    float _1329 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1331 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1313);
    float _1333 = _1287;
    if (_1213)
    {
        _1333 = _669;
    }
    float _1335 = _1333;
    float _1337 = as_type<float>(_643) * _1325;
    float _1339 = trunc(_1323);
    float _1341 = precise::max(_1339, 0.0);
    uint _1343 = uint(_1341);
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1347 = fma(_1327, _1305, _1311);
    float _1349 = fma(_1329, _1263, -0.5);
    int _1351 = ~_566;
    int _1353 = _1351 + 1;
    float _1355 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1345);
    float _1357 = _1335;
    if (!_1213)
    {
        _1357 = _677;
    }
    float _1359 = _1357;
    float _1361 = trunc(_1337);
    float _1363 = precise::max(_1361, 0.0);
    uint _1365 = uint(_1363);
    int _1367 = int(_1227) + int(_1321);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1371 = int(_1193) + int(_1303);
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1375 = ~_566;
    int _1377 = _1375 + 1;
    float _1379 = -_1369;
    float _1381 = fma(_1289, 2.0, _1379);
    int _1383 = ~_598;
    int _1385 = _1383 + 1;
    int _1387 = _1353 * int(_1343);
    int _1389 = _1387 + _1095;
    int _1391 = ~_598;
    int _1393 = _1391 + 1;
    int _1395 = _1377 * _1371;
    int _1397 = _1395 + _1127;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _893 + _1399;
    float _1403 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1331);
    float _1405 = float(uint(_1389));
    int _1407 = _1385 * _1367;
    int _1409 = _1407 + _1163;
    bool _1411 = uint(_1397) >= uint(_566);
    float _1413 = _963 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1415 = -_122;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1381);
    float _1419 = as_type<float>(_624) * _1405;
    bool _1421 = uint(_1409) >= uint(_598);
    float _1423 = _949 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1425 = _1393 * int(_1365);
    int _1427 = _1425 + _1101;
    bool _1429 = !_1411;
    int _1431 = _1429 ? 0 : (-1);
    float _1433 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1437 = _1423 + _1435;
    float _1439 = trunc(_1419);
    float _1441 = precise::max(_1439, 0.0);
    uint _1443 = uint(_1441);
    int _1445 = ~_1371;
    int _1447 = _1445 + _1431;
    int _1449 = _1447 + 1;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1453 = _1413 + _1451;
    float _1455 = float(uint(_1427));
    float _1457 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1461 = _566 * _1449;
    int _1463 = _1461 + _1127;
    float _1465 = _1347 + 0.5;
    float _1467 = as_type<float>(_643) * _1455;
    bool _1469 = !_1421;
    int _1471 = _1469 ? 0 : (-1);
    float _1473 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1457);
    float _1475 = fma(_1373, -2.0, _1459);
    bool _1477 = !_983;
    int _1479 = _1477 ? _1463 : (-1);
    int _1481 = ~_1367;
    int _1483 = _1481 + _1471;
    int _1485 = _1483 + 1;
    float _1487 = trunc(_1467);
    float _1489 = precise::max(_1487, 0.0);
    uint _1491 = uint(_1489);
    bool _1493 = _1473 >= 0.0;
    int _1495 = _1479 >> 31;
    int _1497 = _598 * _1485;
    int _1499 = _1497 + _1163;
    int _1501 = _1479 & 3;
    bool _1503 = _1501 != 0;
    int _1505 = int(_1343) + int(_1443);
    float _1507 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1475);
    int _1509 = _1495 & 3;
    int _1511 = ~_566;
    int _1513 = _1511 + 1;
    float _1515 = -_1507;
    float _1517 = fma(_1403, _1233, _1515);
    bool _1519 = !_1503;
    int _1521 = _1519 ? 0 : 1;
    if (_1493)
    {
        out.m_45.x = 0.0;
    }
    int _1523 = _1479 & 3;
    bool _1525 = _1523 != 0;
    bool _1527 = !_1035;
    int _1529 = _1527 ? _1499 : (-1);
    int _1531 = _1479 + _1509;
    int _1533 = _1513 * _1505;
    int _1535 = _1533 + _1095;
    int _1537 = _1529 >> 31;
    bool _1539 = uint(_1501) > 1u;
    int _1541 = _1531 >> 2;
    int _1543 = int(_1365) + int(_1491);
    int _1545 = _1537 & 3;
    int _1547 = _1541 << 4;
    int _1549 = _1547 + 368;
    int _1551 = _1525 ? 0 : 1;
    bool _1553 = uint(_1535) >= uint(_566);
    int _1555 = _1529 + _1545;
    uint _1557 = uint(int(uint(_1549) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[int(_1567)][_1569];
    int _1573 = ~_1551;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1555 >> 2;
    int _1581 = _1577;
    if (!_1539)
    {
        int _1583 = ~_1551;
        int _1585 = _1583 + 1;
        _1581 = _1585;
    }
    int _1587 = _1581;
    float _1589 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1355);
    bool _1591 = uint(_1501) >= 2u;
    int _1593 = _1579 << 4;
    int _1595 = _1593 + 512;
    float _1597 = fma(_1589, _1349, _1417);
    int _1599 = ~_598;
    int _1601 = _1599 + 1;
    int _1603 = _1549 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    int _1621 = _1591 ? 0 : 1;
    float _1623 = _1221 + 0.5;
    bool _1625 = _1501 != 3;
    int _1627 = _1601 * _1543;
    int _1629 = _1627 + _1101;
    bool _1631 = !_1553;
    int _1633 = _1631 ? 0 : (-1);
    int _1635 = abs(_1587);
    uint _1637 = uint(int(uint(_1595) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[int(_1647)][_1649];
    int _1653 = ~_1505;
    int _1655 = _1653 + _1633;
    int _1657 = _1655 + 1;
    out.m_57.x = _1465;
    out.m_57.y = _1623;
    bool _1659 = uint(_1629) >= uint(_598);
    int _1661 = ~_1621;
    int _1663 = _1661 + 1;
    int _1665 = _1663 + 1;
    int _1667 = _566 * _1657;
    int _1669 = _1667 + _1095;
    bool _1671 = !_1659;
    int _1673 = _1671 ? 0 : (-1);
    int _1675 = _1595 + 8;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    uint _1679 = uint(int(uint(int(_1677)) >> uint(2)));
    int _1681 = int(_1677) & 3;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[int(_1679)][_1681];
    int _1685 = int(_1677) + 1;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    int _1689 = _1685 & 3;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[int(_1687)][_1689];
    int _1693 = _1665;
    if (_1625)
    {
        int _1695 = ~_1621;
        int _1697 = _1695 + 1;
        _1693 = _1697;
    }
    int _1699 = _1693;
    int _1701 = _1529 & 3;
    bool _1703 = _1701 != 0;
    int _1705 = _1529 & 3;
    bool _1707 = _1705 != 0;
    int _1709 = _1703 ? 0 : 1;
    bool _1711 = uint(_1705) > 1u;
    int _1713 = ~_1543;
    int _1715 = _1713 + _1673;
    int _1717 = _1715 + 1;
    bool _1719 = !_1707;
    int _1721 = _1719 ? 0 : 1;
    bool _1723 = uint(_1705) >= 2u;
    int _1725 = _598 * _1717;
    int _1727 = _1725 + _1101;
    int _1729 = _1723 ? 0 : 1;
    bool _1731 = _1705 != 3;
    int _1733 = ~_1709;
    int _1735 = _1733 + 1;
    int _1737 = _1735 + 1;
    int _1739 = _1737;
    if (!_1711)
    {
        int _1741 = ~_1709;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = ~_1635;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = abs(_1521);
    int _1755 = abs(_1745);
    int _1757 = _1751 * as_type<int>(_1571);
    int _1759 = ~_1729;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (_1731)
    {
        int _1767 = ~_1729;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = abs(_1721);
    int _1775 = ~_1755;
    int _1777 = _1775 + 1;
    int _1779 = _1777 + 1;
    int _1781 = abs(_1771);
    int _1783 = ~_1773;
    int _1785 = _1783 + 1;
    int _1787 = _1785 + 1;
    int _1789 = _1779 * as_type<int>(_1651);
    int _1791 = ~_1753;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = abs(_1699);
    int _1799 = _1787 * as_type<int>(_1643);
    int _1801 = _1799 + _1789;
    int _1803 = ~_1781;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    int _1809 = _1795 * as_type<int>(_1563);
    int _1811 = _1809 + _1757;
    bool _1813 = _1705 != 3;
    int _1815 = ~_1797;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1807 * as_type<int>(_1683);
    int _1823 = _1821 + _1801;
    bool _1825 = _1501 != 3;
    bool _1827 = !_1813;
    int _1829 = _1827 ? 0 : (-1);
    int _1831 = _1819 * as_type<int>(_1611);
    int _1833 = _1831 + _1811;
    bool _1835 = !_881;
    int _1837 = _1835 ? 0 : 1;
    bool _1839 = !_1825;
    int _1841 = _1839 ? 0 : (-1);
    int _1843 = abs(_1829);
    int _1845 = abs(_1837);
    int _1847 = abs(_1841);
    float _1849 = _1401 * _1401;
    bool _1851 = !_865;
    int _1853 = _1851 ? 0 : 1;
    float _1855 = fma(_1437, _1437, _1849);
    int _1857 = abs(_1853);
    int _1859 = ~_1847;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    float _1865 = fma(_1453, _1453, _1855);
    int _1867 = ~_1843;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    int _1873 = ~_1857;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1863 * as_type<int>(_1619);
    int _1881 = _1879 + _1833;
    int _1883 = ~_1845;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    int _1889 = _1871 * as_type<int>(_1691);
    int _1891 = _1889 + _1823;
    float _1893 = rsqrt(_1865);
    bool _1895 = !_983;
    float _1897 = _1895 ? as_type<float>(_1669) : as_type<float>(0xffffffffu /* nan */);
    int _1899 = _1881 * _1877;
    bool _1901 = !_1035;
    int _1903 = _1901 ? _1727 : (-1);
    int _1905 = _1891 * _1887;
    float _1907 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1909 = as_type<int>(_1897) * _1857;
    int _1911 = _1909 + _1899;
    float _1913 = _1897;
    if (_1493)
    {
        _1913 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1915 = _1913;
    int _1917 = _1903 * _1845;
    int _1919 = _1917 + _1905;
    float _1921 = _1597 + 0.5;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1925 = as_type<int>(_1915);
    float _1927 = _1923;
    if (_1493)
    {
        float _1929 = _1915 * 5.0;
        _1925 = as_type<int>(_1929);
    }
    int _1931 = _1925;
    float _1933 = _1517 + 0.5;
    float _1935 = float(_1911);
    float _1937 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1939 = float(_1919);
    float _1941 = _1923 * _1893;
    if (_1493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5922 = as_type<float>(_1931);
        out.gl_Position.z = _5922;
    }
    float _1943 = _1437 * _1941;
    out.m_59.x = _1921;
    out.m_59.y = _1933;
    float _1945 = _1401 * _1941;
    out.m_61.x = _1935;
    out.m_61.y = _1939;
    out.m_63.w = _1937;
    if (_1493)
    {
        return out;
    }
    float _1947 = -_1945;
    float _1949 = _893 + _1947;
    float _1951 = _1453 * _1941;
    float _1953 = -_1943;
    float _1955 = _1423 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1959 = _1949 + _1957;
    float _1961 = -_1951;
    float _1963 = _1413 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1967 = _1955 + _1965;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1973 = _1963 + _1971;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1969);
    float _1977 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1975);
    bool _1979 = _1977 >= 0.0;
    float _1981 = _1973;
    float _1983 = _1951;
    if (_1979)
    {
        _1927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1985 = _1927;
    int _1987 = as_type<int>(_1985);
    if (_1979)
    {
        out.m_45.x = 0.0;
    }
    if (_1979)
    {
        float _1989 = _1985 * 5.0;
        _1987 = as_type<int>(_1989);
    }
    int _1991 = _1987;
    if (_1979)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6023 = as_type<float>(_1991);
        out.gl_Position.z = _6023;
    }
    if (_1979)
    {
        return out;
    }
    float _1993 = -_893;
    float _1995 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1997 = -_1423;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2001 = -_1413;
    float _2003 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2005 = _1995 * _1995;
    float _2007 = -_1945;
    float _2009 = _1401 + _2007;
    float _2011 = fma(_1999, _1999, _2005);
    float _2013 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2015 = fma(_2003, _2003, _2011);
    float _2017 = -_1943;
    float _2019 = _1437 + _2017;
    float _2021 = -_2013;
    float _2023 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2021);
    float _2025 = _2009 * _2009;
    float _2027 = rsqrt(_2015);
    float _2029 = -_1951;
    float _2031 = _1453 + _2029;
    float _2033 = fma(_2019, _2019, _2025);
    float _2035 = fma(_2031, _2031, _2033);
    float _2037 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2039 = sqrt(_2035);
    float _2041 = -_2037;
    float _2043 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2041);
    float _2045 = _1999 * _2027;
    float _2047 = _2003 * _2027;
    float _2049 = _1995 * _2027;
    float _2051 = _2045 * _2045;
    float _2053 = fma(_2047, _2047, _2051);
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2057 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2061 = rsqrt(_2053);
    float _2063 = -_2055;
    float _2065 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2069 = -_2059;
    float _2071 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2069);
    float _2073 = -_2057;
    float _2075 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2073);
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2079 = _1893 * _2039;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2083 = -_2067;
    float _2085 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2083);
    float _2087 = _1907 * _2079;
    float _2089 = -_2081;
    float _2091 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2089);
    float _2093 = -_2077;
    float _2095 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2093);
    float _2097 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2085);
    float _2099 = _2047 * _2061;
    float _2101 = _2045 * _2061;
    float _2103 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2095);
    float _2105 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2107 = -_2099;
    float _2109 = _2047 * _2107;
    float _2111 = -_2099;
    float _2113 = _2049 * _2111;
    float _2115 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2117 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2119 = -_2109;
    float _2121 = fma(_2045, _2101, _2119);
    float _2123 = _2049 * _2101;
    float _2125 = -_2115;
    float _2127 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    float _2129 = -_2117;
    float _2131 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2133 = _2121 * _2121;
    float _2135 = -_2105;
    float _2137 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2135);
    float _2139 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2131);
    float _2141 = fma(_2123, _2123, _2133);
    float _2143 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2127);
    float _2145 = fma(_2113, _2113, _2141);
    float _2147 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2137);
    float _2149 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2151 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2153 = 1.0 / _502;
    float _2155 = -_2147;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2143);
    float _2159 = -_2149;
    float _2161 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2163 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2165 = -_2151;
    float _2167 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2165);
    float _2169 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2161);
    float _2171 = -_2163;
    float _2173 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2171);
    float _2175 = rsqrt(_2145);
    float _2177 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2167);
    float _2179 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2173);
    float _2181 = 1.0 / _2157;
    float _2183 = _2121 * _2175;
    float _2185 = precise::clamp(_2183, 0.0, 1.0);
    float _2187 = 1.0 / _506;
    float _2189 = -_2185;
    float _2191 = _2189 + 1.0;
    float _2193 = fma(_2169, _2181, -1.0);
    float _2195 = _2191 * _2181;
    float _2197 = fma(_2191, _2193, 1.0);
    float _2199 = _2179 * _2195;
    float _2201 = _2177 * _2195;
    float _2203 = 1.0 / _504;
    float _2205 = _2197 * _2197;
    float _2207 = fma(_2199, _2199, _2205);
    float _2209 = fma(_2201, _2201, _2207);
    float _2211 = rsqrt(_2209);
    float _2213 = _2201 * _2211;
    float _2215 = _2199 * _2211;
    float _2217 = _2197 * _2211;
    float _2219 = -_2213;
    float _2221 = _2045 * _2219;
    float _2223 = -_2215;
    float _2225 = _2049 * _2223;
    float _2227 = _2047 * _2217;
    float _2229 = -_2215;
    float _2231 = -_2221;
    float _2233 = fma(_2047, _2229, _2231);
    float _2235 = -_2225;
    float _2237 = fma(_2045, _2217, _2235);
    float _2239 = -_2213;
    float _2241 = -_2227;
    float _2243 = fma(_2049, _2239, _2241);
    float _2245 = _2233 * _2233;
    float _2247 = fma(_2243, _2243, _2245);
    float _2249 = fma(_2237, _2237, _2247);
    float _2251 = rsqrt(_2249);
    float _2253 = _2243 * _2251;
    float _2255 = _2237 * _2251;
    float _2257 = _2233 * _2251;
    float _2259 = _2047 * _2253;
    float _2261 = _2049 * _2255;
    float _2263 = -_2259;
    float _2265 = fma(_2045, _2255, _2263);
    float _2267 = _2045 * _2257;
    float _2269 = -_2261;
    float _2271 = fma(_2047, _2257, _2269);
    float _2273 = _2265 * _2265;
    float _2275 = -_2267;
    float _2277 = fma(_2049, _2253, _2275);
    float _2279 = fma(_2271, _2271, _2273);
    float _2281 = fma(_2277, _2277, _2279);
    float _2283 = rsqrt(_2281);
    float _2285 = _2277 * _2283;
    float _2287 = _2265 * _2283;
    float _2289 = _2271 * _2283;
    float _2291 = _2045 * _2285;
    float _2293 = in.m_65.x;
    float _2295 = in.m_65.y;
    float _2297 = in.m_65.z;
    float _2299 = _2047 * _2287;
    float _2301 = _2049 * _2289;
    float _2303 = -_2291;
    float _2305 = fma(_2047, _2289, _2303);
    float _2307 = -_2299;
    float _2309 = fma(_2049, _2285, _2307);
    float _2311 = -_2301;
    float _2313 = fma(_2045, _2287, _2311);
    float _2315 = _2305 * _2305;
    float _2317 = fma(_2309, _2309, _2315);
    float _2319 = fma(_2313, _2313, _2317);
    float _2321 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2323 = rsqrt(_2319);
    float _2325 = _2153 * _2293;
    float _2327 = _2203 * _2295;
    float _2329 = _2321 * _2079;
    float _2331 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2325);
    float _2335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2327);
    float _2337 = _2187 * _2297;
    float _2339 = _2331 * _2079;
    float _2341 = _2087 * _2333;
    float _2343 = _2329 * _2335;
    float _2345 = _2337 * _2339;
    float _2347 = _2341 * _2323;
    float _2349 = _2343 * _2287;
    float _2351 = _2343 * _2289;
    float _2353 = _2343 * _2285;
    float _2355 = _2339 + (-1.0);
    float _2357 = fma(_2305, _2347, _2349);
    float _2359 = fma(_2309, _2347, _2351);
    float _2361 = fma(_2313, _2347, _2353);
    float _2363 = fma(_2049, _2345, _2357);
    float _2365 = fma(_2045, _2345, _2359);
    float _2367 = fma(_2047, _2345, _2361);
    float _2369 = _2329 + (-1.0);
    float _2371 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2373 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2375 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2371);
    float _2377 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2379 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2373);
    float _2381 = _893 + _2363;
    float _2383 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2375);
    float _2385 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2377);
    float _2387 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2379);
    float _2389 = _2087 + (-1.0);
    float _2391 = _2355 * _2383;
    float _2393 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2385);
    float _2395 = _2369 * _2387;
    float _2397 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2401 = _2393 * _2389;
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2405 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2397);
    float _2407 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2399);
    float _2409 = _1413 + _2367;
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2403);
    float _2413 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2405);
    float _2415 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2407);
    float _2417 = _1423 + _2365;
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2411);
    float _2421 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2423 = _2409 + _2415;
    float _2425 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2427 = _2417 + _2419;
    float _2429 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2433 = _2423 + _2431;
    float _2435 = 1.0 / _2425;
    float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2439 = _2427 + _2437;
    float _2441 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2429);
    float _2443 = _2433 * _2433;
    float _2445 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2421);
    float _2447 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2441);
    float _2449 = fma(_2439, _2439, _2443);
    float _2451 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2445);
    bool _2453 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan(0.5);
    bool _2461 = _2457 || _2459;
    float _2463 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2465 = sqrt(_2449);
    float _2467 = _2463 + _2425;
    float _2469 = _2467 * _2435;
    float _2471 = _2469 * 0.5;
    float _2473 = _2381 + _2451;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2475);
    bool _2479 = _2465 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2481 = 1.0 / _2477;
    bool _2483 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2485 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(0.5);
    bool _2491 = _2487 || _2489;
    float _2493 = _2451;
    float _2495 = _2445;
    float _2497 = _2427;
    float _2499 = _2381;
    if (!_2479)
    {
        _2493 = _2423;
    }
    float _2501 = _2493;
    float _2503 = _2501;
    if (!_2479)
    {
        _2495 = _2473;
    }
    float _2505 = _2495;
    bool _2507 = !_2479;
    float _2509 = _2505;
    if (!_2507)
    {
        float _2511 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2515 = _2465 + _2513;
        float _2517 = rsqrt(_2449);
        float _2519 = _2515 * _2511;
        float _2521 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2519 * 0.15915493667125701904296875;
        float _2525 = _2523 * 6.283185482025146484375;
        float _2527 = cos(_2525);
        float _2529 = _2523 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = _2527 + (-1.0);
        float _2535 = fma(_2531, _2521, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2537 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2539 = _2517 * _2535;
        float _2541 = fma(_2473, _2527, _2537);
        float _2543 = fma(_2439, _2539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2545 = fma(_2433, _2539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2497 = _2543;
        _2509 = _2541;
        _2503 = _2545;
        _2499 = _2539;
    }
    float _2547 = _2497;
    float _2549 = _2509;
    float _2551 = _2503;
    float _2553 = _2499;
    float _2555 = -_1943;
    float _2557 = _2555 + _2547;
    float _2559 = -_1945;
    float _2561 = _2559 + _2549;
    float _2563 = -_1951;
    float _2565 = _2563 + _2551;
    float _2567 = _2553;
    float _2569 = _2561;
    float _2571 = _2557;
    float _2573 = _2565;
    float _2575 = _2551;
    if (_2491)
    {
        _2567 = 1.0;
    }
    float _2577 = _2567;
    float _2579 = _2577;
    if (!_2461)
    {
        float _2581 = _1959 * _1959;
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2585 = -_1413;
        float _2587 = _2585 + _2551;
        float _2589 = -_893;
        float _2591 = _2589 + _2549;
        float _2593 = fma(_1967, _1967, _2581);
        float _2595 = fma(_1973, _1973, _2593);
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2599 = sqrt(_2595);
        float _2601 = 1.0 / _2079;
        float _2603 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2605 = precise::min(_2599, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2607 = _2605 * _2583;
        float _2609 = _2607 * _2601;
        float _2611 = -_1423;
        float _2613 = _2611 + _2547;
        float _2615 = _2603 * _2609;
        float _2617 = _2587 * _2609;
        float _2619 = fma(_2613, _2615, _1955);
        float _2621 = fma(_2591, _2615, _1949);
        float _2623 = fma(_2603, _2617, _1963);
        _2569 = _2621;
        _2571 = _2619;
        _2573 = _2623;
        _2575 = _2617;
    }
    float _2625 = _2569;
    float _2627 = _2571;
    float _2629 = _2573;
    float _2631 = _2575;
    float _2633 = _2631;
    if (_2491)
    {
        _2633 = 1.0;
    }
    float _2635 = _2633;
    float _2637 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2639 = _2481 * _2637;
    float _2641 = _2635;
    if (!_2491)
    {
        float _2643 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2645 = _2643 * 0.15915493667125701904296875;
        float _2647 = _2645 * 6.283185482025146484375;
        float _2649 = cos(_2647);
        float _2651 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2653 = _2651 * 0.15915493667125701904296875;
        float _2655 = _2645 * 6.283185482025146484375;
        float _2657 = sin(_2655);
        float _2659 = 1.0 / _2649;
        float _2661 = _2653 * 6.283185482025146484375;
        float _2663 = cos(_2661);
        float _2665 = _2657 * _2659;
        float _2667 = _2653 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        float _2671 = _2663 * _2665;
        float _2673 = 1.0 / _2671;
        float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2677 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2675;
        float _2679 = 1.0 / _2677;
        float _2681 = _2669 * _2673;
        float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2685 = fma(_2639, _2681, _2683);
        float _2687 = _2685 * _2679;
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        _895 = _2679;
        _2579 = _2689;
    }
    float _2691 = _895;
    float _2693 = _2579;
    float _2695 = _2691;
    if (!_2491)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2639, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2695 = _2713;
        _2641 = _2747;
    }
    float _2749 = _2695;
    float _2751 = _2641;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2755 = _2625 + _2753;
    float _2757 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2759 = _2627 + _2757;
    float _2761 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2763 = _2629 + _2761;
    float _2765 = _2755 * _2755;
    float _2767 = fma(_2759, _2759, _2765);
    float _2769 = fma(_2763, _2763, _2767);
    float _2771 = rsqrt(_2769);
    float _2773 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2775 = _2759 * _2773;
    float _2777 = _2763 * _2773;
    float _2779 = _2775 * _2775;
    float _2781 = _2777 * _2777;
    float _2783 = _2779 + _2781;
    float _2785 = sqrt(_2783);
    bool _2787 = _2785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2791 = _2785 + _2789;
    float _2793 = _2771;
    float _2795 = _2749;
    float _2797 = _2791;
    float _2799 = _2755;
    float _2801 = _2775;
    if (_2787)
    {
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2793 = _2803;
    }
    float _2805 = _2793;
    if (_2787)
    {
        float _2807 = rsqrt(_2783);
        _2795 = _2807;
    }
    float _2809 = _2795;
    float _2811 = _2809;
    if (_2787)
    {
        float _2813 = _2791 * _2805;
        _2797 = _2813;
    }
    float _2815 = _2797;
    if (_2787)
    {
        float _2817 = _2815 * 0.15915493667125701904296875;
        _1981 = _2817;
    }
    float _2819 = _1981;
    float _2821 = _2763;
    if (_2787)
    {
        float _2823 = _2819 * 6.283185482025146484375;
        float _2825 = sin(_2823);
        _2821 = _2825;
    }
    float _2827 = _2821;
    float _2829 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2831 = precise::max(0.0, _2829);
    float _2833 = _2805;
    float _2835 = _2831;
    if (_2787)
    {
        float _2837 = _2819 * 6.283185482025146484375;
        float _2839 = cos(_2837);
        _2833 = _2839;
    }
    float _2841 = _2833;
    float _2843 = -_2773;
    float _2845 = -_2831;
    float _2847 = fma(_2755, _2843, _2845);
    float _2849 = _2847;
    if (_2787)
    {
        float _2851 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2799 = _2851;
    }
    float _2853 = _2799;
    float _2855 = sqrt(_2769);
    float _2857 = _2853;
    float _2859 = _2827;
    if (_2787)
    {
        float _2861 = fma(_2827, _2853, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = _2863;
    if (!_2787)
    {
        _2859 = _2779;
    }
    float _2867 = _2859;
    float _2869 = _2867;
    if (_2787)
    {
        float _2871 = _2841 + (-1.0);
        _2835 = _2871;
    }
    float _2873 = _2835;
    float _2875 = _2873;
    if (_2787)
    {
        float _2877 = _2809 * _2863;
        _1983 = _2877;
    }
    float _2879 = _1983;
    if (!_2787)
    {
        _2865 = _2781;
    }
    float _2881 = _2865;
    float _2883 = _2881;
    if (_2787)
    {
        float _2885 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2811 = _2885;
    }
    float _2887 = _2811;
    if (_2787)
    {
        float _2889 = _2775 * _2879;
        _2801 = _2889;
    }
    float _2891 = _2801;
    if (!_2787)
    {
        _2875 = _2777;
    }
    float _2893 = _2875;
    float _2895 = _2893;
    if (_2787)
    {
        float _2897 = _2777 * _2879;
        _2895 = _2897;
    }
    float _2899 = _2895;
    if (_2787)
    {
        float _2901 = fma(_2847, _2841, _2887);
        _2849 = _2901;
    }
    float _2903 = _2849;
    if (_2787)
    {
        float _2905 = _2891 * _2891;
        _2869 = _2905;
    }
    float _2907 = _2869;
    if (_2787)
    {
        float _2909 = _2899 * _2899;
        _2883 = _2909;
    }
    float _2911 = _2883;
    float _2913 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2915 = fma(_2903, _2903, _2907);
    float _2917 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2921 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2919);
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2913);
    float _2927 = _2915 + _2911;
    float _2929 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2931 = -_2923;
    float _2933 = _2931 + 1.0;
    float _2935 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2937 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2925);
    float _2939 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2929);
    float _2941 = rsqrt(_2927);
    float _2943 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2945 = _2937 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2947 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2939);
    float _2949 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2943);
    float _2951 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2935);
    float _2953 = _2947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2955 = abs(_2933);
    float _2957 = log2(_2955);
    float _2959 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2949);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2963 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2951);
    float _2965 = _2959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2967 = -_2961;
    float _2969 = fma(_2967, _2917, 1.0);
    float _2971 = _2941 * _2891;
    float _2973 = _2941 * _2903;
    float _2975 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2977 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2979 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2981 = _2941 * _2899;
    float _2983 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2975);
    float _2985 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2987 = -_2979;
    float _2989 = fma(_2973, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2987);
    float _2991 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2993 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2983);
    float _2995 = log2(_2969);
    float _2997 = -_2981;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2989);
    float _3001 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3003 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2993);
    float _3005 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2985);
    float _3007 = fma(_2999, -0.5, 0.5);
    float _3009 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3001);
    float _3011 = fma(_2999, 0.5, 0.5);
    float _3013 = exp2(_2991);
    float _3015 = _2973 + 1.0;
    float _3017 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3005);
    float _3019 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3009);
    float _3021 = fma(_3011, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3023 = 1.0 / _3003;
    float _3025 = fma(_3011, _3021, -0.212114393711090087890625);
    float _3027 = _2995 * 0.693147182464599609375;
    float _3029 = fma(_3011, _3025, 1.570728778839111328125);
    float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3033 = sqrt(_3007);
    float _3035 = -_2973;
    float _3037 = fma(_3013, _3015, _3035);
    float _3039 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3017);
    float _3041 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3019);
    float _3043 = fma(_3037, 0.5, 0.5);
    float _3045 = _3039 * _3023;
    float _3047 = _3041 * _3023;
    float _3049 = fma(_3045, 0.5, 0.5);
    float _3051 = fma(_3047, -0.5, 0.5);
    float _3053 = _3033 * 0.636619746685028076171875;
    float3 _7726 = float3(_3049, _3051, _3031);
    float _3055 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7726, float3(0.0), isnan(_7726)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7726, float3(0.0), isnan(_7726)), level(0.0)).x;
    float3 _7737 = float3(_3049, _3051, _3031);
    float4 _3058 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7737, float3(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7737, float3(0.0), isnan(_7737)), level(0.0)).xyzw;
    float _3060 = _3058.x;
    float _3062 = _3058.y;
    float _3064 = _3058.z;
    float _3066 = _3058.w;
    float _3068 = -_3029;
    float _3070 = fma(_3053, _3068, 1.0);
    float2 _7759 = float2(_3070, _3043);
    float3 _3074 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7759, float2(0.0), isnan(_7759)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7759, float2(0.0), isnan(_7759)), level(0.0)).xyz;
    float _3076 = _3074.x;
    float _3078 = _3074.y;
    float _3080 = _3074.z;
    float _3082 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3084 = _2693 * _2751;
    float _3086 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3088 = _2693 > 0.0;
    bool _3090 = isnan(_2693);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan(0.0);
    bool _3096 = _3092 || _3094;
    out.m_53.w = _500;
    float _3098 = _3084 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3100 = exp2(_3082);
    float _3102 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3086);
    bool _3104 = _2751 <= 0.0;
    bool _3106 = !_3096;
    bool _3108 = _3104 || _3106;
    float _3110 = _3098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3112 = _3003 * 0.5;
    float _3114 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3102);
    float _3116 = _3039 + _3003;
    out.m_63.w = _1937;
    float _3118 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3114);
    out.m_67.x = _1955;
    out.m_67.y = _1949;
    out.m_67.z = _1963;
    float _3120 = _3116 * 0.5;
    float _3122 = _3118 + _3003;
    out.m_45.x = _3110;
    float _3124 = -_3100;
    float _3126 = _3124 + 1.0;
    float _3128 = _3122 * 0.5;
    float _3130 = fma(_3041, -0.5, _3112);
    out.gl_Position.x = _3039;
    out.gl_Position.y = _3041;
    out.gl_Position.z = _3118;
    out.gl_Position.w = _3003;
    float _3132 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3120;
    out.m_69.y = _3130;
    out.m_69.z = _3128;
    out.m_69.w = _3003;
    float _3134 = -_3132;
    float _3136 = _3134 + 1.0;
    float _3138 = _3132 * _3055;
    float _3140 = _3066 * _3136;
    float _3142 = _3066 * _3138;
    float _3144 = _3080 * _3138;
    float _3146 = fma(_3076, _3142, _3060);
    float _3148 = fma(_3078, _3142, _3062);
    float _3150 = fma(_3066, _3144, _3064);
    out.m_71.x = _3146;
    out.m_71.y = _3148;
    out.m_71.z = _3150;
    out.m_71.w = _3140;
    if (!_3108)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3152 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3152;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _528 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3208 = as_type<float>(_106);
        out.gl_Position.z = _3208;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _100;
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
        float _3276 = as_type<float>(_142);
        out.gl_Position.z = _3276;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _170 = 0.0;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _170 = _174;
    }
    float _176 = _170;
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
    float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _226 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _228 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _230 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _232 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].x, _226);
    float _234 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].y, _228);
    float _236 = fma(_222, (*spvDescriptorSet0.vp_c10)._m0[8].z, _230);
    float _238 = _228;
    if (!_156)
    {
        _238 = _146;
    }
    float _240 = _238;
    float _242 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _232);
    bool _244 = !_156;
    float _246 = _240;
    if (!_244)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _146 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _246 = _266;
    }
    float _268 = _246;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].y, _234);
    float _274 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].z, _236);
    float _276 = fma(_268, _158, _242);
    float _278 = fma(_268, _160, _272);
    float _280 = fma(_268, _162, _274);
    float _282 = fma(_276, _144, _164);
    float _284 = fma(_278, _144, _166);
    float _286 = fma(_280, _144, _168);
    bool _288 = !_270;
    float _290 = _282;
    float _308;
    if (!_288)
    {
        float _292 = in.m_51.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_90);
        float _314 = 1.0 / _312;
        float _316 = _122 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _332;
    bool _336 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _338 = isnan(_318);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _326;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _354 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _356 = isnan(_318);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _368 = 1.0 / _330;
    float _370 = _334 * _348;
    bool _372 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _374 = isnan(_318);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = 1.0 / _352;
    float _386 = -_346;
    float _388 = _386 + 1.0;
    float _390 = fma(_370, _322, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _396 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _398 = isnan(_318);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -_382;
    float _410 = _408 + 1.0;
    float _412 = _382 * _388;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _418 = 1.0 / _394;
    float _420 = -_406;
    float _422 = _420 + 1.0;
    float _424 = _364 * _410;
    float _426 = _416 * _368;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _428;
    float _432 = _346 * _422;
    float _434 = _390 * _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = _318 + _436;
    float _440 = -_364;
    float _442 = _440 + 1.0;
    bool _444 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _446 = isnan(_318);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _430 * _384;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _464 = _318 + _462;
    float _466 = fma(_426, _438, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _468 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _434);
    float _470 = -_454;
    float _472 = _470 + 1.0;
    float _474 = _460 * _418;
    float _476 = fma(_456, _464, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _480 = _318 + _478;
    float _482 = fma(_466, _412, _468);
    float _484 = _406 * _472;
    float _486 = in.m_49.x;
    float _488 = in.m_49.y;
    float _490 = in.m_49.z;
    float _492 = fma(_474, _480, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _494 = fma(_476, _432, _482);
    float _496 = fma(_492, _484, _494);
    float _498 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[119].x, _496);
    float _500 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _500;
    float _502 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = _490 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _508 = !_366;
    float _526;
    if (!_508)
    {
        float _510 = in.m_51.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_90);
        float _532 = 1.0 / _530;
        float _534 = _122 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.y;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _546 = _544 != 0;
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _550 = int(_548);
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _558 = _556 != 0;
    float _560 = float(_90);
    float _562 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _564 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _566 = int(_564);
    float _568 = float(_540);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _574 = 1.0 / _568;
    float _576 = float(_550);
    float _578 = -_542;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _594 = float(uint(_566));
    float _596 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _598 = int(_596);
    int _600 = ~_566;
    int _602 = _600 + 1;
    float _604 = float(_566);
    float _606 = _122 * _574;
    float _608 = 1.0 / _576;
    float _610 = 1.0 / _594;
    float _612 = float(uint(_598));
    int _614 = ~_598;
    int _616 = _614 + 1;
    float _618 = trunc(_606);
    int _620 = int(_618);
    float _622 = _122 * _608;
    int _624 = as_type<int>(_610) + (-2);
    float _626 = 1.0 / _612;
    float _628 = float(uint(_620));
    float _630 = trunc(_622);
    int _632 = int(_630);
    float _634 = as_type<float>(_624) * _628;
    float _636 = trunc(_634);
    float _638 = precise::max(_636, 0.0);
    uint _641 = uint(_638);
    int _643 = as_type<int>(_626) + (-2);
    float _645 = in.m_55.x;
    float _647 = float(uint(_632));
    float _649 = 1.0 / _572;
    float _651 = float(_632);
    float _653 = as_type<float>(_643) * _647;
    int _655 = _602 * int(_641);
    int _657 = _655 + _620;
    float _659 = trunc(_653);
    float _661 = precise::max(_659, 0.0);
    uint _663 = uint(_661);
    float _665 = in.m_51.z;
    float _667 = float(uint(_657));
    float _669 = in.m_51.y;
    float _671 = 1.0 / _584;
    float _673 = as_type<float>(_624) * _667;
    float _675 = _588 * _649;
    float _677 = in.m_51.x;
    int _679 = _616 * int(_663);
    int _681 = _679 + _632;
    float _683 = trunc(_673);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    float _689 = float(uint(_681));
    float _691 = _592 * _671;
    bool _693 = _665 > 0.5;
    float _695 = as_type<float>(_643) * _689;
    float _697 = _689;
    float _699 = _542;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _703 = _645;
    if (!_546)
    {
        _697 = _645;
    }
    float _705 = _697;
    float _707 = 1.0 / _560;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _711 = _536 + _709;
    bool _713 = _669 > 0.5;
    int _715 = int(_641) + int(_687);
    int _717 = int(_687);
    bool _719 = _713;
    float _721 = _705;
    if (_546)
    {
        float _723 = -_645;
        float _725 = _723 + 1.0;
        _717 = as_type<int>(_725);
    }
    int _727 = _717;
    int _729 = _713 ? as_type<int>(_580) : as_type<int>(_542);
    float _731 = trunc(_695);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    if (_546)
    {
        bool _737 = _677 > 0.5;
        _719 = _737;
    }
    bool _739 = _719;
    float _741 = _677 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _743 = ~_566;
    int _745 = _743 + 1;
    float _747 = _558 ? as_type<float>(_729) : _542;
    if (_554)
    {
        float _749 = _693 ? _580 : _542;
        _699 = _749;
    }
    float _751 = _699;
    int _753 = _745 * _715;
    int _755 = _753 + _620;
    if (_546)
    {
        float _757 = _739 ? as_type<float>(_727) : _645;
        _721 = _757;
    }
    float _759 = _721;
    float _761 = _122 * _707;
    int _763 = ~_598;
    int _765 = _763 + 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _777 = _775 != 0;
    int _779 = int(_663) + int(_735);
    bool _781 = uint(_755) >= uint(_566);
    bool _783 = !_769;
    int _785 = _783 ? 0 : 1;
    int _787 = _765 * _779;
    int _789 = _787 + _632;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _793 = _791 != 0;
    bool _795 = !_781;
    int _797 = _795 ? 0 : (-1);
    bool _799 = !_773;
    int _801 = _799 ? 0 : 1;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _821 = _819 != 0;
    bool _823 = !_793;
    int _825 = _823 ? 0 : 1;
    bool _827 = uint(_789) >= uint(_598);
    bool _829 = !_821;
    int _831 = _829 ? 0 : 1;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _835 = _833 != 0;
    float _837 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _841 = !_827;
    int _843 = _841 ? 0 : (-1);
    bool _845 = !_809;
    int _847 = _845 ? 0 : 1;
    float _849 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    bool _851 = !_805;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    bool _857 = !_813;
    int _859 = _857 ? 0 : 1;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _869 = _867 != 0;
    float _871 = -_861;
    float _873 = fma(_741, 2.0, _871);
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _877 = _875 != 0;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _881 = _879 != 0;
    float _883 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _562);
    if (_835)
    {
        _290 = 1.0;
    }
    float _885 = _290;
    float _887 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _849);
    float _889 = _885;
    if (!_835)
    {
        _889 = 7.345489978790283203125;
    }
    float _891 = _889;
    float _893 = _887 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _895 = _893;
    if (_835)
    {
        _701 = _677;
    }
    float _897 = _701;
    float _899 = _891 * _677;
    float _901 = 0.0;
    float _903 = _897;
    if (_835)
    {
        _901 = 1.0;
    }
    float _905 = _901;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _909 = _905;
    if (!_835)
    {
        _903 = _669;
    }
    float _911 = _903;
    float _913 = _669 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_835)
    {
        _909 = 1.2345600128173828125;
    }
    float _915 = _909;
    float _917 = floor(_899);
    int _919 = ~_715;
    int _921 = _919 + _797;
    int _923 = _921 + 1;
    float _925 = fma(_913, -2.0, _907);
    float _927 = float(_620);
    float _929 = _911 * _915;
    float _931 = float(_598);
    float _933 = fma(_675, _711, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _935 = _927 >= _604;
    bool _937 = isnan(_927);
    bool _939 = _935 || _937;
    bool _941 = isnan(_604);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = floor(_929);
    float _949 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _883);
    bool _951 = _651 >= _931;
    bool _953 = isnan(_651);
    bool _955 = _951 || _953;
    bool _957 = isnan(_931);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _855);
    int _965 = abs(_801);
    bool _967 = !_777;
    int _969 = _967 ? 0 : 1;
    float _971 = trunc(_945);
    int _973 = int(_971);
    float _975 = -_917;
    float _977 = _899 + _975;
    bool _979 = !_817;
    int _981 = _979 ? 0 : 1;
    bool _983 = _566 == 0;
    float _985 = _977 * _604;
    bool _987 = _669 > 0.5;
    float _989 = trunc(_961);
    int _991 = int(_989);
    float _993 = -_947;
    float _995 = _929 + _993;
    int _997 = _566 * _923;
    int _999 = _997 + _620;
    int _1001 = ~_779;
    int _1003 = _1001 + _843;
    int _1005 = _1003 + 1;
    float _1007 = _761 * _604;
    float _1009 = _761 * _931;
    float _1011 = _995 * _931;
    bool _1013 = !_983;
    int _1015 = _1013 ? _999 : (-1);
    int _1017 = _598 * _1005;
    int _1019 = _1017 + _632;
    int _1021 = ~_973;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = trunc(_1007);
    int _1029 = int(_1027);
    bool _1031 = !_869;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = _598 == 0;
    int _1037 = _1015 * _1025;
    int _1039 = _566 + (-1);
    int _1041 = ~_991;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    float _1047 = trunc(_985);
    int _1049 = int(_1047);
    bool _1051 = !_1035;
    int _1053 = _1051 ? _1019 : (-1);
    int _1055 = _973 * _1039;
    int _1057 = _1055 + _1037;
    int _1059 = _598 + (-1);
    int _1061 = abs(_785);
    int _1063 = _1053 * _1045;
    float _1065 = trunc(_1011);
    int _1067 = int(_1065);
    int _1069 = _991 * _1059;
    int _1071 = _1069 + _1063;
    int _1073 = abs(_847);
    int _1075 = _1057 * _965;
    int _1077 = abs(_1033);
    int _1079 = abs(_853);
    float _1081 = trunc(_1009);
    int _1083 = int(_1081);
    int _1085 = abs(_825);
    int _1087 = _1029 * _1061;
    int _1089 = _1087 + _1075;
    int _1091 = _1071 * _1073;
    int _1093 = _1049 * _1085;
    int _1095 = _1093 + _620;
    int _1097 = abs(_969);
    int _1099 = _1067 * _1077;
    int _1101 = _1099 + _632;
    int _1103 = abs(_831);
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1107 = _536 + _1105;
    int _1109 = abs(_859);
    int _1111 = _1095 * _1097;
    int _1113 = _1111 + _1089;
    float _1115 = fma(_691, _1107, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1117 = abs(_981);
    int _1119 = _1083 * _1079;
    int _1121 = _1119 + _1091;
    float _1123 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1125 = _1049 * _1103;
    int _1127 = _1125 + _1113;
    bool _1129 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1131 = isnan(_536);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    int _1141 = _1101 * _1109;
    int _1143 = _1141 + _1121;
    bool _1145 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1147 = isnan(_536);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1159 = float(uint(_1127));
    int _1161 = _1067 * _1117;
    int _1163 = _1161 + _1143;
    float _1165 = -_1139;
    float _1167 = _1165 + 1.0;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1171 = _1075;
    if (_835)
    {
        _1171 = 0;
    }
    int _1173 = _1171;
    float _1175 = as_type<float>(_624) * _1159;
    float _1177 = float(uint(_1163));
    float _1179 = _1155 * _1167;
    float _1181 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1169);
    int _1183 = _1173;
    if (!_835)
    {
        _1183 = 2;
    }
    int _1185 = _1183;
    float _1187 = as_type<float>(_643) * _1177;
    float _1189 = trunc(_1175);
    float _1191 = precise::max(_1189, 0.0);
    uint _1193 = uint(_1191);
    bool _1195 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1197 = isnan(_536);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1181);
    float _1209 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _925);
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1213 = _1185 != 2;
    float _1215 = -_1155;
    float _1217 = _1215 + 1.0;
    float _1219 = -_1209;
    float _1221 = fma(_1207, _1123, _1219);
    float _1223 = trunc(_1187);
    float _1225 = precise::max(_1223, 0.0);
    uint _1227 = uint(_1225);
    int _1229 = ~_566;
    int _1231 = _1229 + 1;
    float _1233 = fma(_1211, _751, -0.5);
    int _1235 = as_type<int>(_1211);
    float _1237 = as_type<float>(_1231);
    if (_877)
    {
        float _1239 = -_645;
        float _1241 = _1239 + 1.0;
        _1235 = as_type<int>(_1241);
    }
    int _1243 = _1235;
    int _1245 = ~_598;
    int _1247 = _1245 + 1;
    float _1249 = _1205 * _1217;
    float _1251 = -_1205;
    float _1253 = _1251 + 1.0;
    if (!_877)
    {
        _1237 = _645;
    }
    float _1255 = _1237;
    float _1257 = _933 * _1249;
    float _1259 = _1255;
    if (_877)
    {
        float _1261 = _987 ? as_type<float>(_1243) : _645;
        _1259 = _1261;
    }
    float _1263 = _1259;
    int _1265 = _1231 * int(_1193);
    int _1267 = _1265 + _1127;
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1257);
    if (_1213)
    {
        _703 = _677;
    }
    float _1271 = _703;
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1275 = _1271;
    if (!_1213)
    {
        _1275 = _665;
    }
    float _1277 = _1275;
    int _1279 = _1247 * int(_1227);
    int _1281 = _1279 + _1163;
    float _1283 = float(uint(_1267));
    float _1285 = fma(_1115, _1179, _1269);
    float _1287 = float(uint(_1095));
    float _1289 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1291 = float(uint(_1281));
    float _1293 = as_type<float>(_624) * _1283;
    float _1295 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1285);
    float _1297 = as_type<float>(_643) * _1291;
    float _1299 = trunc(_1293);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1309 = -_122;
    float _1311 = fma(_1309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _873);
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1315 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1307);
    float _1317 = trunc(_1297);
    float _1319 = precise::max(_1317, 0.0);
    uint _1321 = uint(_1319);
    float _1323 = as_type<float>(_624) * _1287;
    float _1325 = float(uint(_1101));
    float _1327 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1315);
    float _1329 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1331 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1313);
    float _1333 = _1287;
    if (_1213)
    {
        _1333 = _669;
    }
    float _1335 = _1333;
    float _1337 = as_type<float>(_643) * _1325;
    float _1339 = trunc(_1323);
    float _1341 = precise::max(_1339, 0.0);
    uint _1343 = uint(_1341);
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1347 = fma(_1327, _1305, _1311);
    float _1349 = fma(_1329, _1263, -0.5);
    int _1351 = ~_566;
    int _1353 = _1351 + 1;
    float _1355 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1345);
    float _1357 = _1335;
    if (!_1213)
    {
        _1357 = _677;
    }
    float _1359 = _1357;
    float _1361 = trunc(_1337);
    float _1363 = precise::max(_1361, 0.0);
    uint _1365 = uint(_1363);
    int _1367 = int(_1227) + int(_1321);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1371 = int(_1193) + int(_1303);
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1375 = ~_566;
    int _1377 = _1375 + 1;
    float _1379 = -_1369;
    float _1381 = fma(_1289, 2.0, _1379);
    int _1383 = ~_598;
    int _1385 = _1383 + 1;
    int _1387 = _1353 * int(_1343);
    int _1389 = _1387 + _1095;
    int _1391 = ~_598;
    int _1393 = _1391 + 1;
    int _1395 = _1377 * _1371;
    int _1397 = _1395 + _1127;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _893 + _1399;
    float _1403 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1331);
    float _1405 = float(uint(_1389));
    int _1407 = _1385 * _1367;
    int _1409 = _1407 + _1163;
    bool _1411 = uint(_1397) >= uint(_566);
    float _1413 = _963 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1415 = -_122;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1381);
    float _1419 = as_type<float>(_624) * _1405;
    bool _1421 = uint(_1409) >= uint(_598);
    float _1423 = _949 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1425 = _1393 * int(_1365);
    int _1427 = _1425 + _1101;
    bool _1429 = !_1411;
    int _1431 = _1429 ? 0 : (-1);
    float _1433 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1437 = _1423 + _1435;
    float _1439 = trunc(_1419);
    float _1441 = precise::max(_1439, 0.0);
    uint _1443 = uint(_1441);
    int _1445 = ~_1371;
    int _1447 = _1445 + _1431;
    int _1449 = _1447 + 1;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1453 = _1413 + _1451;
    float _1455 = float(uint(_1427));
    float _1457 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1461 = _566 * _1449;
    int _1463 = _1461 + _1127;
    float _1465 = _1347 + 0.5;
    float _1467 = as_type<float>(_643) * _1455;
    bool _1469 = !_1421;
    int _1471 = _1469 ? 0 : (-1);
    float _1473 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1457);
    float _1475 = fma(_1373, -2.0, _1459);
    bool _1477 = !_983;
    int _1479 = _1477 ? _1463 : (-1);
    int _1481 = ~_1367;
    int _1483 = _1481 + _1471;
    int _1485 = _1483 + 1;
    float _1487 = trunc(_1467);
    float _1489 = precise::max(_1487, 0.0);
    uint _1491 = uint(_1489);
    bool _1493 = _1473 >= 0.0;
    int _1495 = _1479 >> 31;
    int _1497 = _598 * _1485;
    int _1499 = _1497 + _1163;
    int _1501 = _1479 & 3;
    bool _1503 = _1501 != 0;
    int _1505 = int(_1343) + int(_1443);
    float _1507 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1475);
    int _1509 = _1495 & 3;
    int _1511 = ~_566;
    int _1513 = _1511 + 1;
    float _1515 = -_1507;
    float _1517 = fma(_1403, _1233, _1515);
    bool _1519 = !_1503;
    int _1521 = _1519 ? 0 : 1;
    if (_1493)
    {
        out.m_45.x = 0.0;
    }
    int _1523 = _1479 & 3;
    bool _1525 = _1523 != 0;
    bool _1527 = !_1035;
    int _1529 = _1527 ? _1499 : (-1);
    int _1531 = _1479 + _1509;
    int _1533 = _1513 * _1505;
    int _1535 = _1533 + _1095;
    int _1537 = _1529 >> 31;
    bool _1539 = uint(_1501) > 1u;
    int _1541 = _1531 >> 2;
    int _1543 = int(_1365) + int(_1491);
    int _1545 = _1537 & 3;
    int _1547 = _1541 << 4;
    int _1549 = _1547 + 368;
    int _1551 = _1525 ? 0 : 1;
    bool _1553 = uint(_1535) >= uint(_566);
    int _1555 = _1529 + _1545;
    uint _1557 = uint(int(uint(_1549) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[int(_1567)][_1569];
    int _1573 = ~_1551;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1555 >> 2;
    int _1581 = _1577;
    if (!_1539)
    {
        int _1583 = ~_1551;
        int _1585 = _1583 + 1;
        _1581 = _1585;
    }
    int _1587 = _1581;
    float _1589 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1355);
    bool _1591 = uint(_1501) >= 2u;
    int _1593 = _1579 << 4;
    int _1595 = _1593 + 512;
    float _1597 = fma(_1589, _1349, _1417);
    int _1599 = ~_598;
    int _1601 = _1599 + 1;
    int _1603 = _1549 + 8;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c9)._m0[int(_1615)][_1617];
    int _1621 = _1591 ? 0 : 1;
    float _1623 = _1221 + 0.5;
    bool _1625 = _1501 != 3;
    int _1627 = _1601 * _1543;
    int _1629 = _1627 + _1101;
    bool _1631 = !_1553;
    int _1633 = _1631 ? 0 : (-1);
    int _1635 = abs(_1587);
    uint _1637 = uint(int(uint(_1595) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[int(_1647)][_1649];
    int _1653 = ~_1505;
    int _1655 = _1653 + _1633;
    int _1657 = _1655 + 1;
    out.m_57.x = _1465;
    out.m_57.y = _1623;
    bool _1659 = uint(_1629) >= uint(_598);
    int _1661 = ~_1621;
    int _1663 = _1661 + 1;
    int _1665 = _1663 + 1;
    int _1667 = _566 * _1657;
    int _1669 = _1667 + _1095;
    bool _1671 = !_1659;
    int _1673 = _1671 ? 0 : (-1);
    int _1675 = _1595 + 8;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    uint _1679 = uint(int(uint(int(_1677)) >> uint(2)));
    int _1681 = int(_1677) & 3;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[int(_1679)][_1681];
    int _1685 = int(_1677) + 1;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    int _1689 = _1685 & 3;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[int(_1687)][_1689];
    int _1693 = _1665;
    if (_1625)
    {
        int _1695 = ~_1621;
        int _1697 = _1695 + 1;
        _1693 = _1697;
    }
    int _1699 = _1693;
    int _1701 = _1529 & 3;
    bool _1703 = _1701 != 0;
    int _1705 = _1529 & 3;
    bool _1707 = _1705 != 0;
    int _1709 = _1703 ? 0 : 1;
    bool _1711 = uint(_1705) > 1u;
    int _1713 = ~_1543;
    int _1715 = _1713 + _1673;
    int _1717 = _1715 + 1;
    bool _1719 = !_1707;
    int _1721 = _1719 ? 0 : 1;
    bool _1723 = uint(_1705) >= 2u;
    int _1725 = _598 * _1717;
    int _1727 = _1725 + _1101;
    int _1729 = _1723 ? 0 : 1;
    bool _1731 = _1705 != 3;
    int _1733 = ~_1709;
    int _1735 = _1733 + 1;
    int _1737 = _1735 + 1;
    int _1739 = _1737;
    if (!_1711)
    {
        int _1741 = ~_1709;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = ~_1635;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = abs(_1521);
    int _1755 = abs(_1745);
    int _1757 = _1751 * as_type<int>(_1571);
    int _1759 = ~_1729;
    int _1761 = _1759 + 1;
    int _1763 = _1761 + 1;
    int _1765 = _1763;
    if (_1731)
    {
        int _1767 = ~_1729;
        int _1769 = _1767 + 1;
        _1765 = _1769;
    }
    int _1771 = _1765;
    int _1773 = abs(_1721);
    int _1775 = ~_1755;
    int _1777 = _1775 + 1;
    int _1779 = _1777 + 1;
    int _1781 = abs(_1771);
    int _1783 = ~_1773;
    int _1785 = _1783 + 1;
    int _1787 = _1785 + 1;
    int _1789 = _1779 * as_type<int>(_1651);
    int _1791 = ~_1753;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = abs(_1699);
    int _1799 = _1787 * as_type<int>(_1643);
    int _1801 = _1799 + _1789;
    int _1803 = ~_1781;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    int _1809 = _1795 * as_type<int>(_1563);
    int _1811 = _1809 + _1757;
    bool _1813 = _1705 != 3;
    int _1815 = ~_1797;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1807 * as_type<int>(_1683);
    int _1823 = _1821 + _1801;
    bool _1825 = _1501 != 3;
    bool _1827 = !_1813;
    int _1829 = _1827 ? 0 : (-1);
    int _1831 = _1819 * as_type<int>(_1611);
    int _1833 = _1831 + _1811;
    bool _1835 = !_881;
    int _1837 = _1835 ? 0 : 1;
    bool _1839 = !_1825;
    int _1841 = _1839 ? 0 : (-1);
    int _1843 = abs(_1829);
    int _1845 = abs(_1837);
    int _1847 = abs(_1841);
    float _1849 = _1401 * _1401;
    bool _1851 = !_865;
    int _1853 = _1851 ? 0 : 1;
    float _1855 = fma(_1437, _1437, _1849);
    int _1857 = abs(_1853);
    int _1859 = ~_1847;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    float _1865 = fma(_1453, _1453, _1855);
    int _1867 = ~_1843;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    int _1873 = ~_1857;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1863 * as_type<int>(_1619);
    int _1881 = _1879 + _1833;
    int _1883 = ~_1845;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    int _1889 = _1871 * as_type<int>(_1691);
    int _1891 = _1889 + _1823;
    float _1893 = rsqrt(_1865);
    bool _1895 = !_983;
    float _1897 = _1895 ? as_type<float>(_1669) : as_type<float>(0xffffffffu /* nan */);
    int _1899 = _1881 * _1877;
    bool _1901 = !_1035;
    int _1903 = _1901 ? _1727 : (-1);
    int _1905 = _1891 * _1887;
    float _1907 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1909 = as_type<int>(_1897) * _1857;
    int _1911 = _1909 + _1899;
    float _1913 = _1897;
    if (_1493)
    {
        _1913 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1915 = _1913;
    int _1917 = _1903 * _1845;
    int _1919 = _1917 + _1905;
    float _1921 = _1597 + 0.5;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1925 = as_type<int>(_1915);
    float _1927 = _1923;
    if (_1493)
    {
        float _1929 = _1915 * 5.0;
        _1925 = as_type<int>(_1929);
    }
    int _1931 = _1925;
    float _1933 = _1517 + 0.5;
    float _1935 = float(_1911);
    float _1937 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1939 = float(_1919);
    float _1941 = _1923 * _1893;
    if (_1493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5922 = as_type<float>(_1931);
        out.gl_Position.z = _5922;
    }
    float _1943 = _1437 * _1941;
    out.m_59.x = _1921;
    out.m_59.y = _1933;
    float _1945 = _1401 * _1941;
    out.m_61.x = _1935;
    out.m_61.y = _1939;
    out.m_63.w = _1937;
    if (_1493)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1947 = -_1945;
    float _1949 = _893 + _1947;
    float _1951 = _1453 * _1941;
    float _1953 = -_1943;
    float _1955 = _1423 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1959 = _1949 + _1957;
    float _1961 = -_1951;
    float _1963 = _1413 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1967 = _1955 + _1965;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1973 = _1963 + _1971;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1969);
    float _1977 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1975);
    bool _1979 = _1977 >= 0.0;
    float _1981 = _1973;
    float _1983 = _1951;
    if (_1979)
    {
        _1927 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1985 = _1927;
    int _1987 = as_type<int>(_1985);
    if (_1979)
    {
        out.m_45.x = 0.0;
    }
    if (_1979)
    {
        float _1989 = _1985 * 5.0;
        _1987 = as_type<int>(_1989);
    }
    int _1991 = _1987;
    if (_1979)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6023 = as_type<float>(_1991);
        out.gl_Position.z = _6023;
    }
    if (_1979)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1993 = -_893;
    float _1995 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1997 = -_1423;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2001 = -_1413;
    float _2003 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2005 = _1995 * _1995;
    float _2007 = -_1945;
    float _2009 = _1401 + _2007;
    float _2011 = fma(_1999, _1999, _2005);
    float _2013 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2015 = fma(_2003, _2003, _2011);
    float _2017 = -_1943;
    float _2019 = _1437 + _2017;
    float _2021 = -_2013;
    float _2023 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2021);
    float _2025 = _2009 * _2009;
    float _2027 = rsqrt(_2015);
    float _2029 = -_1951;
    float _2031 = _1453 + _2029;
    float _2033 = fma(_2019, _2019, _2025);
    float _2035 = fma(_2031, _2031, _2033);
    float _2037 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2039 = sqrt(_2035);
    float _2041 = -_2037;
    float _2043 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2041);
    float _2045 = _1999 * _2027;
    float _2047 = _2003 * _2027;
    float _2049 = _1995 * _2027;
    float _2051 = _2045 * _2045;
    float _2053 = fma(_2047, _2047, _2051);
    float _2055 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2057 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2061 = rsqrt(_2053);
    float _2063 = -_2055;
    float _2065 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2069 = -_2059;
    float _2071 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2069);
    float _2073 = -_2057;
    float _2075 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2073);
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2079 = _1893 * _2039;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2083 = -_2067;
    float _2085 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2083);
    float _2087 = _1907 * _2079;
    float _2089 = -_2081;
    float _2091 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2089);
    float _2093 = -_2077;
    float _2095 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2093);
    float _2097 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2085);
    float _2099 = _2047 * _2061;
    float _2101 = _2045 * _2061;
    float _2103 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2095);
    float _2105 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2107 = -_2099;
    float _2109 = _2047 * _2107;
    float _2111 = -_2099;
    float _2113 = _2049 * _2111;
    float _2115 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2117 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2119 = -_2109;
    float _2121 = fma(_2045, _2101, _2119);
    float _2123 = _2049 * _2101;
    float _2125 = -_2115;
    float _2127 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    float _2129 = -_2117;
    float _2131 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2133 = _2121 * _2121;
    float _2135 = -_2105;
    float _2137 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2135);
    float _2139 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2131);
    float _2141 = fma(_2123, _2123, _2133);
    float _2143 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2127);
    float _2145 = fma(_2113, _2113, _2141);
    float _2147 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2137);
    float _2149 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2151 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2153 = 1.0 / _502;
    float _2155 = -_2147;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2143);
    float _2159 = -_2149;
    float _2161 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2163 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2165 = -_2151;
    float _2167 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2165);
    float _2169 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2161);
    float _2171 = -_2163;
    float _2173 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2171);
    float _2175 = rsqrt(_2145);
    float _2177 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2167);
    float _2179 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2173);
    float _2181 = 1.0 / _2157;
    float _2183 = _2121 * _2175;
    float _2185 = precise::clamp(_2183, 0.0, 1.0);
    float _2187 = 1.0 / _506;
    float _2189 = -_2185;
    float _2191 = _2189 + 1.0;
    float _2193 = fma(_2169, _2181, -1.0);
    float _2195 = _2191 * _2181;
    float _2197 = fma(_2191, _2193, 1.0);
    float _2199 = _2179 * _2195;
    float _2201 = _2177 * _2195;
    float _2203 = 1.0 / _504;
    float _2205 = _2197 * _2197;
    float _2207 = fma(_2199, _2199, _2205);
    float _2209 = fma(_2201, _2201, _2207);
    float _2211 = rsqrt(_2209);
    float _2213 = _2201 * _2211;
    float _2215 = _2199 * _2211;
    float _2217 = _2197 * _2211;
    float _2219 = -_2213;
    float _2221 = _2045 * _2219;
    float _2223 = -_2215;
    float _2225 = _2049 * _2223;
    float _2227 = _2047 * _2217;
    float _2229 = -_2215;
    float _2231 = -_2221;
    float _2233 = fma(_2047, _2229, _2231);
    float _2235 = -_2225;
    float _2237 = fma(_2045, _2217, _2235);
    float _2239 = -_2213;
    float _2241 = -_2227;
    float _2243 = fma(_2049, _2239, _2241);
    float _2245 = _2233 * _2233;
    float _2247 = fma(_2243, _2243, _2245);
    float _2249 = fma(_2237, _2237, _2247);
    float _2251 = rsqrt(_2249);
    float _2253 = _2243 * _2251;
    float _2255 = _2237 * _2251;
    float _2257 = _2233 * _2251;
    float _2259 = _2047 * _2253;
    float _2261 = _2049 * _2255;
    float _2263 = -_2259;
    float _2265 = fma(_2045, _2255, _2263);
    float _2267 = _2045 * _2257;
    float _2269 = -_2261;
    float _2271 = fma(_2047, _2257, _2269);
    float _2273 = _2265 * _2265;
    float _2275 = -_2267;
    float _2277 = fma(_2049, _2253, _2275);
    float _2279 = fma(_2271, _2271, _2273);
    float _2281 = fma(_2277, _2277, _2279);
    float _2283 = rsqrt(_2281);
    float _2285 = _2277 * _2283;
    float _2287 = _2265 * _2283;
    float _2289 = _2271 * _2283;
    float _2291 = _2045 * _2285;
    float _2293 = in.m_65.x;
    float _2295 = in.m_65.y;
    float _2297 = in.m_65.z;
    float _2299 = _2047 * _2287;
    float _2301 = _2049 * _2289;
    float _2303 = -_2291;
    float _2305 = fma(_2047, _2289, _2303);
    float _2307 = -_2299;
    float _2309 = fma(_2049, _2285, _2307);
    float _2311 = -_2301;
    float _2313 = fma(_2045, _2287, _2311);
    float _2315 = _2305 * _2305;
    float _2317 = fma(_2309, _2309, _2315);
    float _2319 = fma(_2313, _2313, _2317);
    float _2321 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2323 = rsqrt(_2319);
    float _2325 = _2153 * _2293;
    float _2327 = _2203 * _2295;
    float _2329 = _2321 * _2079;
    float _2331 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2325);
    float _2335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2327);
    float _2337 = _2187 * _2297;
    float _2339 = _2331 * _2079;
    float _2341 = _2087 * _2333;
    float _2343 = _2329 * _2335;
    float _2345 = _2337 * _2339;
    float _2347 = _2341 * _2323;
    float _2349 = _2343 * _2287;
    float _2351 = _2343 * _2289;
    float _2353 = _2343 * _2285;
    float _2355 = _2339 + (-1.0);
    float _2357 = fma(_2305, _2347, _2349);
    float _2359 = fma(_2309, _2347, _2351);
    float _2361 = fma(_2313, _2347, _2353);
    float _2363 = fma(_2049, _2345, _2357);
    float _2365 = fma(_2045, _2345, _2359);
    float _2367 = fma(_2047, _2345, _2361);
    float _2369 = _2329 + (-1.0);
    float _2371 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2373 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2375 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2371);
    float _2377 = _2363 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2379 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2373);
    float _2381 = _893 + _2363;
    float _2383 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2375);
    float _2385 = fma(_2365, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2377);
    float _2387 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2379);
    float _2389 = _2087 + (-1.0);
    float _2391 = _2355 * _2383;
    float _2393 = fma(_2367, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2385);
    float _2395 = _2369 * _2387;
    float _2397 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2401 = _2393 * _2389;
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2405 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2397);
    float _2407 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2399);
    float _2409 = _1413 + _2367;
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2403);
    float _2413 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2405);
    float _2415 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2407);
    float _2417 = _1423 + _2365;
    float _2419 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2411);
    float _2421 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2423 = _2409 + _2415;
    float _2425 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2427 = _2417 + _2419;
    float _2429 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2433 = _2423 + _2431;
    float _2435 = 1.0 / _2425;
    float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2439 = _2427 + _2437;
    float _2441 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2429);
    float _2443 = _2433 * _2433;
    float _2445 = fma(_2395, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2421);
    float _2447 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2441);
    float _2449 = fma(_2439, _2439, _2443);
    float _2451 = fma(_2401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2445);
    bool _2453 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan(0.5);
    bool _2461 = _2457 || _2459;
    float _2463 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2465 = sqrt(_2449);
    float _2467 = _2463 + _2425;
    float _2469 = _2467 * _2435;
    float _2471 = _2469 * 0.5;
    float _2473 = _2381 + _2451;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2475);
    bool _2479 = _2465 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2481 = 1.0 / _2477;
    bool _2483 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2485 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2487 = _2483 || _2485;
    bool _2489 = isnan(0.5);
    bool _2491 = _2487 || _2489;
    float _2493 = _2451;
    float _2495 = _2445;
    float _2497 = _2427;
    float _2499 = _2381;
    if (!_2479)
    {
        _2493 = _2423;
    }
    float _2501 = _2493;
    float _2503 = _2501;
    if (!_2479)
    {
        _2495 = _2473;
    }
    float _2505 = _2495;
    bool _2507 = !_2479;
    float _2509 = _2505;
    if (!_2507)
    {
        float _2511 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2515 = _2465 + _2513;
        float _2517 = rsqrt(_2449);
        float _2519 = _2515 * _2511;
        float _2521 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2519 * 0.15915493667125701904296875;
        float _2525 = _2523 * 6.283185482025146484375;
        float _2527 = cos(_2525);
        float _2529 = _2523 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = _2527 + (-1.0);
        float _2535 = fma(_2531, _2521, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2537 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2539 = _2517 * _2535;
        float _2541 = fma(_2473, _2527, _2537);
        float _2543 = fma(_2439, _2539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2545 = fma(_2433, _2539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2497 = _2543;
        _2509 = _2541;
        _2503 = _2545;
        _2499 = _2539;
    }
    float _2547 = _2497;
    float _2549 = _2509;
    float _2551 = _2503;
    float _2553 = _2499;
    float _2555 = -_1943;
    float _2557 = _2555 + _2547;
    float _2559 = -_1945;
    float _2561 = _2559 + _2549;
    float _2563 = -_1951;
    float _2565 = _2563 + _2551;
    float _2567 = _2553;
    float _2569 = _2561;
    float _2571 = _2557;
    float _2573 = _2565;
    float _2575 = _2551;
    if (_2491)
    {
        _2567 = 1.0;
    }
    float _2577 = _2567;
    float _2579 = _2577;
    if (!_2461)
    {
        float _2581 = _1959 * _1959;
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2585 = -_1413;
        float _2587 = _2585 + _2551;
        float _2589 = -_893;
        float _2591 = _2589 + _2549;
        float _2593 = fma(_1967, _1967, _2581);
        float _2595 = fma(_1973, _1973, _2593);
        float _2597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2599 = sqrt(_2595);
        float _2601 = 1.0 / _2079;
        float _2603 = _2597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2605 = precise::min(_2599, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2607 = _2605 * _2583;
        float _2609 = _2607 * _2601;
        float _2611 = -_1423;
        float _2613 = _2611 + _2547;
        float _2615 = _2603 * _2609;
        float _2617 = _2587 * _2609;
        float _2619 = fma(_2613, _2615, _1955);
        float _2621 = fma(_2591, _2615, _1949);
        float _2623 = fma(_2603, _2617, _1963);
        _2569 = _2621;
        _2571 = _2619;
        _2573 = _2623;
        _2575 = _2617;
    }
    float _2625 = _2569;
    float _2627 = _2571;
    float _2629 = _2573;
    float _2631 = _2575;
    float _2633 = _2631;
    if (_2491)
    {
        _2633 = 1.0;
    }
    float _2635 = _2633;
    float _2637 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2639 = _2481 * _2637;
    float _2641 = _2635;
    if (!_2491)
    {
        float _2643 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2645 = _2643 * 0.15915493667125701904296875;
        float _2647 = _2645 * 6.283185482025146484375;
        float _2649 = cos(_2647);
        float _2651 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2653 = _2651 * 0.15915493667125701904296875;
        float _2655 = _2645 * 6.283185482025146484375;
        float _2657 = sin(_2655);
        float _2659 = 1.0 / _2649;
        float _2661 = _2653 * 6.283185482025146484375;
        float _2663 = cos(_2661);
        float _2665 = _2657 * _2659;
        float _2667 = _2653 * 6.283185482025146484375;
        float _2669 = sin(_2667);
        float _2671 = _2663 * _2665;
        float _2673 = 1.0 / _2671;
        float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2677 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2675;
        float _2679 = 1.0 / _2677;
        float _2681 = _2669 * _2673;
        float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2685 = fma(_2639, _2681, _2683);
        float _2687 = _2685 * _2679;
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        _895 = _2679;
        _2579 = _2689;
    }
    float _2691 = _895;
    float _2693 = _2579;
    float _2695 = _2691;
    if (!_2491)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2639, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2695 = _2713;
        _2641 = _2747;
    }
    float _2749 = _2695;
    float _2751 = _2641;
    float _2753 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2755 = _2625 + _2753;
    float _2757 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2759 = _2627 + _2757;
    float _2761 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2763 = _2629 + _2761;
    float _2765 = _2755 * _2755;
    float _2767 = fma(_2759, _2759, _2765);
    float _2769 = fma(_2763, _2763, _2767);
    float _2771 = rsqrt(_2769);
    float _2773 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2775 = _2759 * _2773;
    float _2777 = _2763 * _2773;
    float _2779 = _2775 * _2775;
    float _2781 = _2777 * _2777;
    float _2783 = _2779 + _2781;
    float _2785 = sqrt(_2783);
    bool _2787 = _2785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2791 = _2785 + _2789;
    float _2793 = _2771;
    float _2795 = _2749;
    float _2797 = _2791;
    float _2799 = _2755;
    float _2801 = _2775;
    if (_2787)
    {
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2793 = _2803;
    }
    float _2805 = _2793;
    if (_2787)
    {
        float _2807 = rsqrt(_2783);
        _2795 = _2807;
    }
    float _2809 = _2795;
    float _2811 = _2809;
    if (_2787)
    {
        float _2813 = _2791 * _2805;
        _2797 = _2813;
    }
    float _2815 = _2797;
    if (_2787)
    {
        float _2817 = _2815 * 0.15915493667125701904296875;
        _1981 = _2817;
    }
    float _2819 = _1981;
    float _2821 = _2763;
    if (_2787)
    {
        float _2823 = _2819 * 6.283185482025146484375;
        float _2825 = sin(_2823);
        _2821 = _2825;
    }
    float _2827 = _2821;
    float _2829 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2831 = precise::max(0.0, _2829);
    float _2833 = _2805;
    float _2835 = _2831;
    if (_2787)
    {
        float _2837 = _2819 * 6.283185482025146484375;
        float _2839 = cos(_2837);
        _2833 = _2839;
    }
    float _2841 = _2833;
    float _2843 = -_2773;
    float _2845 = -_2831;
    float _2847 = fma(_2755, _2843, _2845);
    float _2849 = _2847;
    if (_2787)
    {
        float _2851 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2799 = _2851;
    }
    float _2853 = _2799;
    float _2855 = sqrt(_2769);
    float _2857 = _2853;
    float _2859 = _2827;
    if (_2787)
    {
        float _2861 = fma(_2827, _2853, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = _2863;
    if (!_2787)
    {
        _2859 = _2779;
    }
    float _2867 = _2859;
    float _2869 = _2867;
    if (_2787)
    {
        float _2871 = _2841 + (-1.0);
        _2835 = _2871;
    }
    float _2873 = _2835;
    float _2875 = _2873;
    if (_2787)
    {
        float _2877 = _2809 * _2863;
        _1983 = _2877;
    }
    float _2879 = _1983;
    if (!_2787)
    {
        _2865 = _2781;
    }
    float _2881 = _2865;
    float _2883 = _2881;
    if (_2787)
    {
        float _2885 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2811 = _2885;
    }
    float _2887 = _2811;
    if (_2787)
    {
        float _2889 = _2775 * _2879;
        _2801 = _2889;
    }
    float _2891 = _2801;
    if (!_2787)
    {
        _2875 = _2777;
    }
    float _2893 = _2875;
    float _2895 = _2893;
    if (_2787)
    {
        float _2897 = _2777 * _2879;
        _2895 = _2897;
    }
    float _2899 = _2895;
    if (_2787)
    {
        float _2901 = fma(_2847, _2841, _2887);
        _2849 = _2901;
    }
    float _2903 = _2849;
    if (_2787)
    {
        float _2905 = _2891 * _2891;
        _2869 = _2905;
    }
    float _2907 = _2869;
    if (_2787)
    {
        float _2909 = _2899 * _2899;
        _2883 = _2909;
    }
    float _2911 = _2883;
    float _2913 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2915 = fma(_2903, _2903, _2907);
    float _2917 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2921 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2919);
    float _2923 = precise::clamp(_2921, 0.0, 1.0);
    float _2925 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2913);
    float _2927 = _2915 + _2911;
    float _2929 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2931 = -_2923;
    float _2933 = _2931 + 1.0;
    float _2935 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2937 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2925);
    float _2939 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2929);
    float _2941 = rsqrt(_2927);
    float _2943 = _2625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2945 = _2937 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2947 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2939);
    float _2949 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2943);
    float _2951 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2935);
    float _2953 = _2947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2955 = abs(_2933);
    float _2957 = log2(_2955);
    float _2959 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2949);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2963 = fma(_2629, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2951);
    float _2965 = _2959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2967 = -_2961;
    float _2969 = fma(_2967, _2917, 1.0);
    float _2971 = _2941 * _2891;
    float _2973 = _2941 * _2903;
    float _2975 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2977 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2979 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2981 = _2941 * _2899;
    float _2983 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2975);
    float _2985 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2987 = -_2979;
    float _2989 = fma(_2973, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2987);
    float _2991 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2993 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2983);
    float _2995 = log2(_2969);
    float _2997 = -_2981;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2989);
    float _3001 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3003 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2993);
    float _3005 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2985);
    float _3007 = fma(_2999, -0.5, 0.5);
    float _3009 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3001);
    float _3011 = fma(_2999, 0.5, 0.5);
    float _3013 = exp2(_2991);
    float _3015 = _2973 + 1.0;
    float _3017 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3005);
    float _3019 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3009);
    float _3021 = fma(_3011, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3023 = 1.0 / _3003;
    float _3025 = fma(_3011, _3021, -0.212114393711090087890625);
    float _3027 = _2995 * 0.693147182464599609375;
    float _3029 = fma(_3011, _3025, 1.570728778839111328125);
    float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3033 = sqrt(_3007);
    float _3035 = -_2973;
    float _3037 = fma(_3013, _3015, _3035);
    float _3039 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3017);
    float _3041 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3019);
    float _3043 = fma(_3037, 0.5, 0.5);
    float _3045 = _3039 * _3023;
    float _3047 = _3041 * _3023;
    float _3049 = fma(_3045, 0.5, 0.5);
    float _3051 = fma(_3047, -0.5, 0.5);
    float _3053 = _3033 * 0.636619746685028076171875;
    float3 _7726 = float3(_3049, _3051, _3031);
    float _3055 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7726, float3(0.0), isnan(_7726)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7726, float3(0.0), isnan(_7726)), level(0.0)).x;
    float3 _7737 = float3(_3049, _3051, _3031);
    float4 _3058 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7737, float3(0.0), isnan(_7737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7737, float3(0.0), isnan(_7737)), level(0.0)).xyzw;
    float _3060 = _3058.x;
    float _3062 = _3058.y;
    float _3064 = _3058.z;
    float _3066 = _3058.w;
    float _3068 = -_3029;
    float _3070 = fma(_3053, _3068, 1.0);
    float2 _7759 = float2(_3070, _3043);
    float3 _3074 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7759, float2(0.0), isnan(_7759)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7759, float2(0.0), isnan(_7759)), level(0.0)).xyz;
    float _3076 = _3074.x;
    float _3078 = _3074.y;
    float _3080 = _3074.z;
    float _3082 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3084 = _2693 * _2751;
    float _3086 = _2965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3088 = _2693 > 0.0;
    bool _3090 = isnan(_2693);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan(0.0);
    bool _3096 = _3092 || _3094;
    out.m_53.w = _500;
    float _3098 = _3084 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3100 = exp2(_3082);
    float _3102 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3086);
    bool _3104 = _2751 <= 0.0;
    bool _3106 = !_3096;
    bool _3108 = _3104 || _3106;
    float _3110 = _3098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3112 = _3003 * 0.5;
    float _3114 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3102);
    float _3116 = _3039 + _3003;
    out.m_63.w = _1937;
    float _3118 = fma(_2977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3114);
    out.m_67.x = _1955;
    out.m_67.y = _1949;
    out.m_67.z = _1963;
    float _3120 = _3116 * 0.5;
    float _3122 = _3118 + _3003;
    out.m_45.x = _3110;
    float _3124 = -_3100;
    float _3126 = _3124 + 1.0;
    float _3128 = _3122 * 0.5;
    float _3130 = fma(_3041, -0.5, _3112);
    out.gl_Position.x = _3039;
    out.gl_Position.y = _3041;
    out.gl_Position.z = _3118;
    out.gl_Position.w = _3003;
    float _3132 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3120;
    out.m_69.y = _3130;
    out.m_69.z = _3128;
    out.m_69.w = _3003;
    float _3134 = -_3132;
    float _3136 = _3134 + 1.0;
    float _3138 = _3132 * _3055;
    float _3140 = _3066 * _3136;
    float _3142 = _3066 * _3138;
    float _3144 = _3080 * _3138;
    float _3146 = fma(_3076, _3142, _3060);
    float _3148 = fma(_3078, _3142, _3062);
    float _3150 = fma(_3066, _3144, _3064);
    out.m_71.x = _3146;
    out.m_71.y = _3148;
    out.m_71.z = _3150;
    out.m_71.w = _3140;
    if (!_3108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3152 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3152;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

