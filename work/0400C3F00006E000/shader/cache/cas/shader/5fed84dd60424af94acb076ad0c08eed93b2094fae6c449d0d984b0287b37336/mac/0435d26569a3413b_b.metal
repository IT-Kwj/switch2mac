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
    bool _490 = false;
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
        float _3170 = as_type<float>(_106);
        out.gl_Position.z = _3170;
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
        float _3238 = as_type<float>(_142);
        out.gl_Position.z = _3238;
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
    bool _328 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _330 = isnan(_318);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _348 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _350 = isnan(_318);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _326;
    float _362 = -_338;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _366;
    bool _370 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _372 = isnan(_318);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _358 * _364;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _390 = 1.0 / _342;
    float _392 = _380 * _386;
    float _394 = -_380;
    float _396 = _394 + 1.0;
    float _398 = 1.0 / _346;
    float _400 = _368 * _360;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _406 = fma(_400, _322, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _408 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _410 = isnan(_318);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _404 * _390;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _428 = _318 + _426;
    float _430 = _406 * _392;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _434 = _318 + _432;
    float _436 = fma(_420, _428, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _438 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _430);
    float _440 = _424 * _398;
    float _442 = -_418;
    float _444 = _442 + 1.0;
    float _446 = fma(_436, _382, _438);
    float _448 = fma(_440, _434, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _450 = _338 * _444;
    float _452 = fma(_448, _450, _446);
    float _454 = in.m_49.x;
    float _456 = in.m_49.y;
    float _458 = in.m_49.z;
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[118].x, _452);
    float _462 = _460 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _462;
    float _464 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _466 = _456 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _470 = !_388;
    float _488;
    if (!_470)
    {
        float _472 = in.m_51.x;
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_90);
        float _494 = 1.0 / _492;
        float _496 = _122 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _502 = int(_500);
    float _504 = in.m_55.y;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _508 = _506 != 0;
    float _510 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _512 = int(_510);
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _520 = _518 != 0;
    float _522 = float(_90);
    float _524 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _526 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _528 = int(_526);
    float _530 = float(_502);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _536 = 1.0 / _530;
    float _538 = float(_512);
    float _540 = -_504;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _556 = float(uint(_528));
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _560 = int(_558);
    int _562 = ~_528;
    int _564 = _562 + 1;
    float _566 = float(_528);
    float _568 = _122 * _536;
    float _570 = 1.0 / _538;
    float _572 = 1.0 / _556;
    float _574 = float(uint(_560));
    int _576 = ~_560;
    int _578 = _576 + 1;
    float _580 = trunc(_568);
    int _582 = int(_580);
    float _584 = _122 * _570;
    int _586 = as_type<int>(_572) + (-2);
    float _588 = 1.0 / _574;
    float _590 = float(uint(_582));
    float _592 = trunc(_584);
    int _594 = int(_592);
    float _596 = as_type<float>(_586) * _590;
    float _598 = trunc(_596);
    float _600 = precise::max(_598, 0.0);
    uint _603 = uint(_600);
    int _605 = as_type<int>(_588) + (-2);
    float _607 = in.m_55.x;
    float _609 = float(uint(_594));
    float _611 = 1.0 / _534;
    float _613 = float(_594);
    float _615 = as_type<float>(_605) * _609;
    int _617 = _564 * int(_603);
    int _619 = _617 + _582;
    float _621 = trunc(_615);
    float _623 = precise::max(_621, 0.0);
    uint _625 = uint(_623);
    float _627 = in.m_51.z;
    float _629 = float(uint(_619));
    float _631 = in.m_51.y;
    float _633 = 1.0 / _546;
    float _635 = as_type<float>(_586) * _629;
    float _637 = _550 * _611;
    float _639 = in.m_51.x;
    int _641 = _578 * int(_625);
    int _643 = _641 + _594;
    float _645 = trunc(_635);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    float _651 = float(uint(_643));
    float _653 = _554 * _633;
    bool _655 = _627 > 0.5;
    float _657 = as_type<float>(_605) * _651;
    float _659 = _651;
    float _661 = _504;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _665 = _607;
    if (!_508)
    {
        _659 = _607;
    }
    float _667 = _659;
    float _669 = 1.0 / _522;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _498 + _671;
    bool _675 = _631 > 0.5;
    int _677 = int(_603) + int(_649);
    int _679 = int(_649);
    bool _681 = _675;
    float _683 = _667;
    if (_508)
    {
        float _685 = -_607;
        float _687 = _685 + 1.0;
        _679 = as_type<int>(_687);
    }
    int _689 = _679;
    int _691 = _675 ? as_type<int>(_542) : as_type<int>(_504);
    float _693 = trunc(_657);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    if (_508)
    {
        bool _699 = _639 > 0.5;
        _681 = _699;
    }
    bool _701 = _681;
    float _703 = _639 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _705 = ~_528;
    int _707 = _705 + 1;
    float _709 = _520 ? as_type<float>(_691) : _504;
    if (_516)
    {
        float _711 = _655 ? _542 : _504;
        _661 = _711;
    }
    float _713 = _661;
    int _715 = _707 * _677;
    int _717 = _715 + _582;
    if (_508)
    {
        float _719 = _701 ? as_type<float>(_689) : _607;
        _683 = _719;
    }
    float _721 = _683;
    float _723 = _122 * _669;
    int _725 = ~_560;
    int _727 = _725 + 1;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    int _741 = int(_625) + int(_697);
    bool _743 = uint(_717) >= uint(_528);
    bool _745 = !_731;
    int _747 = _745 ? 0 : 1;
    int _749 = _727 * _741;
    int _751 = _749 + _594;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _755 = _753 != 0;
    bool _757 = !_743;
    int _759 = _757 ? 0 : (-1);
    bool _761 = !_735;
    int _763 = _761 ? 0 : 1;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _783 = _781 != 0;
    bool _785 = !_755;
    int _787 = _785 ? 0 : 1;
    bool _789 = uint(_751) >= uint(_560);
    bool _791 = !_783;
    int _793 = _791 ? 0 : 1;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _797 = _795 != 0;
    float _799 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _801 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _803 = !_789;
    int _805 = _803 ? 0 : (-1);
    bool _807 = !_771;
    int _809 = _807 ? 0 : 1;
    float _811 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _799);
    bool _813 = !_767;
    int _815 = _813 ? 0 : 1;
    float _817 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _801);
    bool _819 = !_775;
    int _821 = _819 ? 0 : 1;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _831 = _829 != 0;
    float _833 = -_823;
    float _835 = fma(_703, 2.0, _833);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _843 = _841 != 0;
    float _845 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
    if (_797)
    {
        _290 = 1.0;
    }
    float _847 = _290;
    float _849 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    float _851 = _847;
    if (!_797)
    {
        _851 = 7.345489978790283203125;
    }
    float _853 = _851;
    float _855 = _849 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _857 = _855;
    if (_797)
    {
        _663 = _639;
    }
    float _859 = _663;
    float _861 = _853 * _639;
    float _863 = 0.0;
    float _865 = _859;
    if (_797)
    {
        _863 = 1.0;
    }
    float _867 = _863;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _871 = _867;
    if (!_797)
    {
        _865 = _631;
    }
    float _873 = _865;
    float _875 = _631 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_797)
    {
        _871 = 1.2345600128173828125;
    }
    float _877 = _871;
    float _879 = floor(_861);
    int _881 = ~_677;
    int _883 = _881 + _759;
    int _885 = _883 + 1;
    float _887 = fma(_875, -2.0, _869);
    float _889 = float(_582);
    float _891 = _873 * _877;
    float _893 = float(_560);
    float _895 = fma(_637, _673, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _897 = _889 >= _566;
    bool _899 = isnan(_889);
    bool _901 = _897 || _899;
    bool _903 = isnan(_566);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = floor(_891);
    float _911 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _845);
    bool _913 = _613 >= _893;
    bool _915 = isnan(_613);
    bool _917 = _913 || _915;
    bool _919 = isnan(_893);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _817);
    int _927 = abs(_763);
    bool _929 = !_739;
    int _931 = _929 ? 0 : 1;
    float _933 = trunc(_907);
    int _935 = int(_933);
    float _937 = -_879;
    float _939 = _861 + _937;
    bool _941 = !_779;
    int _943 = _941 ? 0 : 1;
    bool _945 = _528 == 0;
    float _947 = _939 * _566;
    bool _949 = _631 > 0.5;
    float _951 = trunc(_923);
    int _953 = int(_951);
    float _955 = -_909;
    float _957 = _891 + _955;
    int _959 = _528 * _885;
    int _961 = _959 + _582;
    int _963 = ~_741;
    int _965 = _963 + _805;
    int _967 = _965 + 1;
    float _969 = _723 * _566;
    float _971 = _723 * _893;
    float _973 = _957 * _893;
    bool _975 = !_945;
    int _977 = _975 ? _961 : (-1);
    int _979 = _560 * _967;
    int _981 = _979 + _594;
    int _983 = ~_935;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    float _989 = trunc(_969);
    int _991 = int(_989);
    bool _993 = !_831;
    int _995 = _993 ? 0 : 1;
    bool _997 = _560 == 0;
    int _999 = _977 * _987;
    int _1001 = _528 + (-1);
    int _1003 = ~_953;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    float _1009 = trunc(_947);
    int _1011 = int(_1009);
    bool _1013 = !_997;
    int _1015 = _1013 ? _981 : (-1);
    int _1017 = _935 * _1001;
    int _1019 = _1017 + _999;
    int _1021 = _560 + (-1);
    int _1023 = abs(_747);
    int _1025 = _1015 * _1007;
    float _1027 = trunc(_973);
    int _1029 = int(_1027);
    int _1031 = _953 * _1021;
    int _1033 = _1031 + _1025;
    int _1035 = abs(_809);
    int _1037 = _1019 * _927;
    int _1039 = abs(_995);
    int _1041 = abs(_815);
    float _1043 = trunc(_971);
    int _1045 = int(_1043);
    int _1047 = abs(_787);
    int _1049 = _991 * _1023;
    int _1051 = _1049 + _1037;
    int _1053 = _1033 * _1035;
    int _1055 = _1011 * _1047;
    int _1057 = _1055 + _582;
    int _1059 = abs(_931);
    int _1061 = _1029 * _1039;
    int _1063 = _1061 + _594;
    int _1065 = abs(_793);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1069 = _498 + _1067;
    int _1071 = abs(_821);
    int _1073 = _1057 * _1059;
    int _1075 = _1073 + _1051;
    float _1077 = fma(_653, _1069, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1079 = abs(_943);
    int _1081 = _1045 * _1041;
    int _1083 = _1081 + _1053;
    float _1085 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1087 = _1011 * _1065;
    int _1089 = _1087 + _1075;
    bool _1091 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1093 = isnan(_498);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    int _1103 = _1063 * _1071;
    int _1105 = _1103 + _1083;
    bool _1107 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1109 = isnan(_498);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1121 = float(uint(_1089));
    int _1123 = _1029 * _1079;
    int _1125 = _1123 + _1105;
    float _1127 = -_1101;
    float _1129 = _1127 + 1.0;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1133 = _1037;
    if (_797)
    {
        _1133 = 0;
    }
    int _1135 = _1133;
    float _1137 = as_type<float>(_586) * _1121;
    float _1139 = float(uint(_1125));
    float _1141 = _1117 * _1129;
    float _1143 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    int _1145 = _1135;
    if (!_797)
    {
        _1145 = 2;
    }
    int _1147 = _1145;
    float _1149 = as_type<float>(_605) * _1139;
    float _1151 = trunc(_1137);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    bool _1157 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1159 = isnan(_498);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1143);
    float _1171 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _887);
    float _1173 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1175 = _1147 != 2;
    float _1177 = -_1117;
    float _1179 = _1177 + 1.0;
    float _1181 = -_1171;
    float _1183 = fma(_1169, _1085, _1181);
    float _1185 = trunc(_1149);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    int _1191 = ~_528;
    int _1193 = _1191 + 1;
    float _1195 = fma(_1173, _713, -0.5);
    int _1197 = as_type<int>(_1173);
    float _1199 = as_type<float>(_1193);
    if (_839)
    {
        float _1201 = -_607;
        float _1203 = _1201 + 1.0;
        _1197 = as_type<int>(_1203);
    }
    int _1205 = _1197;
    int _1207 = ~_560;
    int _1209 = _1207 + 1;
    float _1211 = _1167 * _1179;
    float _1213 = -_1167;
    float _1215 = _1213 + 1.0;
    if (!_839)
    {
        _1199 = _607;
    }
    float _1217 = _1199;
    float _1219 = _895 * _1211;
    float _1221 = _1217;
    if (_839)
    {
        float _1223 = _949 ? as_type<float>(_1205) : _607;
        _1221 = _1223;
    }
    float _1225 = _1221;
    int _1227 = _1193 * int(_1155);
    int _1229 = _1227 + _1089;
    float _1231 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1219);
    if (_1175)
    {
        _665 = _639;
    }
    float _1233 = _665;
    float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1237 = _1233;
    if (!_1175)
    {
        _1237 = _627;
    }
    float _1239 = _1237;
    int _1241 = _1209 * int(_1189);
    int _1243 = _1241 + _1125;
    float _1245 = float(uint(_1229));
    float _1247 = fma(_1077, _1141, _1231);
    float _1249 = float(uint(_1057));
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1253 = float(uint(_1243));
    float _1255 = as_type<float>(_586) * _1245;
    float _1257 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1247);
    float _1259 = as_type<float>(_605) * _1253;
    float _1261 = trunc(_1255);
    float _1263 = precise::max(_1261, 0.0);
    uint _1265 = uint(_1263);
    float _1267 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1271 = -_122;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1277 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1269);
    float _1279 = trunc(_1259);
    float _1281 = precise::max(_1279, 0.0);
    uint _1283 = uint(_1281);
    float _1285 = as_type<float>(_586) * _1249;
    float _1287 = float(uint(_1063));
    float _1289 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1277);
    float _1291 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1293 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1275);
    float _1295 = _1249;
    if (_1175)
    {
        _1295 = _631;
    }
    float _1297 = _1295;
    float _1299 = as_type<float>(_605) * _1287;
    float _1301 = trunc(_1285);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1309 = fma(_1289, _1267, _1273);
    float _1311 = fma(_1291, _1225, -0.5);
    int _1313 = ~_528;
    int _1315 = _1313 + 1;
    float _1317 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1307);
    float _1319 = _1297;
    if (!_1175)
    {
        _1319 = _639;
    }
    float _1321 = _1319;
    float _1323 = trunc(_1299);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    int _1329 = int(_1189) + int(_1283);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1333 = int(_1155) + int(_1265);
    float _1335 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1337 = ~_528;
    int _1339 = _1337 + 1;
    float _1341 = -_1331;
    float _1343 = fma(_1251, 2.0, _1341);
    int _1345 = ~_560;
    int _1347 = _1345 + 1;
    int _1349 = _1315 * int(_1305);
    int _1351 = _1349 + _1057;
    int _1353 = ~_560;
    int _1355 = _1353 + 1;
    int _1357 = _1339 * _1333;
    int _1359 = _1357 + _1089;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _855 + _1361;
    float _1365 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1293);
    float _1367 = float(uint(_1351));
    int _1369 = _1347 * _1329;
    int _1371 = _1369 + _1125;
    bool _1373 = uint(_1359) >= uint(_528);
    float _1375 = _925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1377 = -_122;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1343);
    float _1381 = as_type<float>(_586) * _1367;
    bool _1383 = uint(_1371) >= uint(_560);
    float _1385 = _911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1387 = _1355 * int(_1327);
    int _1389 = _1387 + _1063;
    bool _1391 = !_1373;
    int _1393 = _1391 ? 0 : (-1);
    float _1395 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1385 + _1397;
    float _1401 = trunc(_1381);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = ~_1333;
    int _1409 = _1407 + _1393;
    int _1411 = _1409 + 1;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1415 = _1375 + _1413;
    float _1417 = float(uint(_1389));
    float _1419 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1395);
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1423 = _528 * _1411;
    int _1425 = _1423 + _1089;
    float _1427 = _1309 + 0.5;
    float _1429 = as_type<float>(_605) * _1417;
    bool _1431 = !_1383;
    int _1433 = _1431 ? 0 : (-1);
    float _1435 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1419);
    float _1437 = fma(_1335, -2.0, _1421);
    bool _1439 = !_945;
    int _1441 = _1439 ? _1425 : (-1);
    int _1443 = ~_1329;
    int _1445 = _1443 + _1433;
    int _1447 = _1445 + 1;
    float _1449 = trunc(_1429);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    bool _1455 = _1435 >= 0.0;
    int _1457 = _1441 >> 31;
    int _1459 = _560 * _1447;
    int _1461 = _1459 + _1125;
    int _1463 = _1441 & 3;
    bool _1465 = _1463 != 0;
    int _1467 = int(_1305) + int(_1405);
    float _1469 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1437);
    int _1471 = _1457 & 3;
    int _1473 = ~_528;
    int _1475 = _1473 + 1;
    float _1477 = -_1469;
    float _1479 = fma(_1365, _1195, _1477);
    bool _1481 = !_1465;
    int _1483 = _1481 ? 0 : 1;
    if (_1455)
    {
        out.m_45.x = 0.0;
    }
    int _1485 = _1441 & 3;
    bool _1487 = _1485 != 0;
    bool _1489 = !_997;
    int _1491 = _1489 ? _1461 : (-1);
    int _1493 = _1441 + _1471;
    int _1495 = _1475 * _1467;
    int _1497 = _1495 + _1057;
    int _1499 = _1491 >> 31;
    bool _1501 = uint(_1463) > 1u;
    int _1503 = _1493 >> 2;
    int _1505 = int(_1327) + int(_1453);
    int _1507 = _1499 & 3;
    int _1509 = _1503 << 4;
    int _1511 = _1509 + 368;
    int _1513 = _1487 ? 0 : 1;
    bool _1515 = uint(_1497) >= uint(_528);
    int _1517 = _1491 + _1507;
    uint _1519 = uint(int(uint(_1511) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[int(_1529)][_1531];
    int _1535 = ~_1513;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    int _1541 = _1517 >> 2;
    int _1543 = _1539;
    if (!_1501)
    {
        int _1545 = ~_1513;
        int _1547 = _1545 + 1;
        _1543 = _1547;
    }
    int _1549 = _1543;
    float _1551 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1317);
    bool _1553 = uint(_1463) >= 2u;
    int _1555 = _1541 << 4;
    int _1557 = _1555 + 512;
    float _1559 = fma(_1551, _1311, _1379);
    int _1561 = ~_560;
    int _1563 = _1561 + 1;
    int _1565 = _1511 + 8;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
    int _1571 = int(_1567) & 3;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[int(_1569)][_1571];
    int _1575 = int(_1567) + 1;
    uint _1577 = uint(int(uint(_1575) >> uint(2)));
    int _1579 = _1575 & 3;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[int(_1577)][_1579];
    int _1583 = _1553 ? 0 : 1;
    float _1585 = _1183 + 0.5;
    bool _1587 = _1463 != 3;
    int _1589 = _1563 * _1505;
    int _1591 = _1589 + _1063;
    bool _1593 = !_1515;
    int _1595 = _1593 ? 0 : (-1);
    int _1597 = abs(_1549);
    uint _1599 = uint(int(uint(_1557) >> uint(2)));
    uint _1601 = uint(int(uint(int(_1599)) >> uint(2)));
    int _1603 = int(_1599) & 3;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[int(_1601)][_1603];
    int _1607 = int(_1599) + 1;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    int _1611 = _1607 & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = ~_1467;
    int _1617 = _1615 + _1595;
    int _1619 = _1617 + 1;
    out.m_57.x = _1427;
    out.m_57.y = _1585;
    bool _1621 = uint(_1591) >= uint(_560);
    int _1623 = ~_1583;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    int _1629 = _528 * _1619;
    int _1631 = _1629 + _1057;
    bool _1633 = !_1621;
    int _1635 = _1633 ? 0 : (-1);
    int _1637 = _1557 + 8;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[int(_1649)][_1651];
    int _1655 = _1627;
    if (_1587)
    {
        int _1657 = ~_1583;
        int _1659 = _1657 + 1;
        _1655 = _1659;
    }
    int _1661 = _1655;
    int _1663 = _1491 & 3;
    bool _1665 = _1663 != 0;
    int _1667 = _1491 & 3;
    bool _1669 = _1667 != 0;
    int _1671 = _1665 ? 0 : 1;
    bool _1673 = uint(_1667) > 1u;
    int _1675 = ~_1505;
    int _1677 = _1675 + _1635;
    int _1679 = _1677 + 1;
    bool _1681 = !_1669;
    int _1683 = _1681 ? 0 : 1;
    bool _1685 = uint(_1667) >= 2u;
    int _1687 = _560 * _1679;
    int _1689 = _1687 + _1063;
    int _1691 = _1685 ? 0 : 1;
    bool _1693 = _1667 != 3;
    int _1695 = ~_1671;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    int _1701 = _1699;
    if (!_1673)
    {
        int _1703 = ~_1671;
        int _1705 = _1703 + 1;
        _1701 = _1705;
    }
    int _1707 = _1701;
    int _1709 = ~_1597;
    int _1711 = _1709 + 1;
    int _1713 = _1711 + 1;
    int _1715 = abs(_1483);
    int _1717 = abs(_1707);
    int _1719 = _1713 * as_type<int>(_1533);
    int _1721 = ~_1691;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    int _1727 = _1725;
    if (_1693)
    {
        int _1729 = ~_1691;
        int _1731 = _1729 + 1;
        _1727 = _1731;
    }
    int _1733 = _1727;
    int _1735 = abs(_1683);
    int _1737 = ~_1717;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = abs(_1733);
    int _1745 = ~_1735;
    int _1747 = _1745 + 1;
    int _1749 = _1747 + 1;
    int _1751 = _1741 * as_type<int>(_1613);
    int _1753 = ~_1715;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    int _1759 = abs(_1661);
    int _1761 = _1749 * as_type<int>(_1605);
    int _1763 = _1761 + _1751;
    int _1765 = ~_1743;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    int _1771 = _1757 * as_type<int>(_1525);
    int _1773 = _1771 + _1719;
    bool _1775 = _1667 != 3;
    int _1777 = ~_1759;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    int _1783 = _1769 * as_type<int>(_1645);
    int _1785 = _1783 + _1763;
    bool _1787 = _1463 != 3;
    bool _1789 = !_1775;
    int _1791 = _1789 ? 0 : (-1);
    int _1793 = _1781 * as_type<int>(_1573);
    int _1795 = _1793 + _1773;
    bool _1797 = !_843;
    int _1799 = _1797 ? 0 : 1;
    bool _1801 = !_1787;
    int _1803 = _1801 ? 0 : (-1);
    int _1805 = abs(_1791);
    int _1807 = abs(_1799);
    int _1809 = abs(_1803);
    float _1811 = _1363 * _1363;
    bool _1813 = !_827;
    int _1815 = _1813 ? 0 : 1;
    float _1817 = fma(_1399, _1399, _1811);
    int _1819 = abs(_1815);
    int _1821 = ~_1809;
    int _1823 = _1821 + 1;
    int _1825 = _1823 + 1;
    float _1827 = fma(_1415, _1415, _1817);
    int _1829 = ~_1805;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    int _1835 = ~_1819;
    int _1837 = _1835 + 1;
    int _1839 = _1837 + 1;
    int _1841 = _1825 * as_type<int>(_1581);
    int _1843 = _1841 + _1795;
    int _1845 = ~_1807;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    int _1851 = _1833 * as_type<int>(_1653);
    int _1853 = _1851 + _1785;
    float _1855 = rsqrt(_1827);
    bool _1857 = !_945;
    float _1859 = _1857 ? as_type<float>(_1631) : as_type<float>(0xffffffffu /* nan */);
    int _1861 = _1843 * _1839;
    bool _1863 = !_997;
    int _1865 = _1863 ? _1689 : (-1);
    int _1867 = _1853 * _1849;
    float _1869 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1871 = as_type<int>(_1859) * _1819;
    int _1873 = _1871 + _1861;
    float _1875 = _1859;
    if (_1455)
    {
        _1875 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1877 = _1875;
    int _1879 = _1865 * _1807;
    int _1881 = _1879 + _1867;
    float _1883 = _1559 + 0.5;
    float _1885 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1887 = as_type<int>(_1877);
    float _1889 = _1885;
    if (_1455)
    {
        float _1891 = _1877 * 5.0;
        _1887 = as_type<int>(_1891);
    }
    int _1893 = _1887;
    float _1895 = _1479 + 0.5;
    float _1897 = float(_1873);
    float _1899 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1901 = float(_1881);
    float _1903 = _1885 * _1855;
    if (_1455)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5825 = as_type<float>(_1893);
        out.gl_Position.z = _5825;
    }
    float _1905 = _1399 * _1903;
    out.m_59.x = _1883;
    out.m_59.y = _1895;
    float _1907 = _1363 * _1903;
    out.m_61.x = _1897;
    out.m_61.y = _1901;
    out.m_63.w = _1899;
    if (_1455)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1909 = -_1907;
    float _1911 = _855 + _1909;
    float _1913 = _1415 * _1903;
    float _1915 = -_1905;
    float _1917 = _1385 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1921 = _1911 + _1919;
    float _1923 = -_1913;
    float _1925 = _1375 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1929 = _1917 + _1927;
    float _1931 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1935 = _1925 + _1933;
    float _1937 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1931);
    float _1939 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1937);
    bool _1941 = _1939 >= 0.0;
    float _1943 = _1935;
    float _1945 = _1913;
    if (_1941)
    {
        _1889 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1947 = _1889;
    int _1949 = as_type<int>(_1947);
    if (_1941)
    {
        out.m_45.x = 0.0;
    }
    if (_1941)
    {
        float _1951 = _1947 * 5.0;
        _1949 = as_type<int>(_1951);
    }
    int _1953 = _1949;
    if (_1941)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5926 = as_type<float>(_1953);
        out.gl_Position.z = _5926;
    }
    if (_1941)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1955 = -_855;
    float _1957 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1959 = -_1385;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1963 = -_1375;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1967 = _1957 * _1957;
    float _1969 = -_1907;
    float _1971 = _1363 + _1969;
    float _1973 = fma(_1961, _1961, _1967);
    float _1975 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1977 = fma(_1965, _1965, _1973);
    float _1979 = -_1905;
    float _1981 = _1399 + _1979;
    float _1983 = -_1975;
    float _1985 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1983);
    float _1987 = _1971 * _1971;
    float _1989 = rsqrt(_1977);
    float _1991 = -_1913;
    float _1993 = _1415 + _1991;
    float _1995 = fma(_1981, _1981, _1987);
    float _1997 = fma(_1993, _1993, _1995);
    float _1999 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2001 = sqrt(_1997);
    float _2003 = -_1999;
    float _2005 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2003);
    float _2007 = _1961 * _1989;
    float _2009 = _1965 * _1989;
    float _2011 = _1957 * _1989;
    float _2013 = _2007 * _2007;
    float _2015 = fma(_2009, _2009, _2013);
    float _2017 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2023 = rsqrt(_2015);
    float _2025 = -_2017;
    float _2027 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2025);
    float _2029 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2031 = -_2021;
    float _2033 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2031);
    float _2035 = -_2019;
    float _2037 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2035);
    float _2039 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2041 = _1855 * _2001;
    float _2043 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2045 = -_2029;
    float _2047 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2045);
    float _2049 = _1869 * _2041;
    float _2051 = -_2043;
    float _2053 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2051);
    float _2055 = -_2039;
    float _2057 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2055);
    float _2059 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2047);
    float _2061 = _2009 * _2023;
    float _2063 = _2007 * _2023;
    float _2065 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2057);
    float _2067 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2069 = -_2061;
    float _2071 = _2009 * _2069;
    float _2073 = -_2061;
    float _2075 = _2011 * _2073;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2079 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2081 = -_2071;
    float _2083 = fma(_2007, _2063, _2081);
    float _2085 = _2011 * _2063;
    float _2087 = -_2077;
    float _2089 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2087);
    float _2091 = -_2079;
    float _2093 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2091);
    float _2095 = _2083 * _2083;
    float _2097 = -_2067;
    float _2099 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2097);
    float _2101 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2093);
    float _2103 = fma(_2085, _2085, _2095);
    float _2105 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2107 = fma(_2075, _2075, _2103);
    float _2109 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2099);
    float _2111 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2113 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = 1.0 / _464;
    float _2117 = -_2109;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2105);
    float _2121 = -_2111;
    float _2123 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2121);
    float _2125 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2127 = -_2113;
    float _2129 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2131 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2123);
    float _2133 = -_2125;
    float _2135 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2133);
    float _2137 = rsqrt(_2107);
    float _2139 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2129);
    float _2141 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2135);
    float _2143 = 1.0 / _2119;
    float _2145 = _2083 * _2137;
    float _2147 = precise::clamp(_2145, 0.0, 1.0);
    float _2149 = 1.0 / _468;
    float _2151 = -_2147;
    float _2153 = _2151 + 1.0;
    float _2155 = fma(_2131, _2143, -1.0);
    float _2157 = _2153 * _2143;
    float _2159 = fma(_2153, _2155, 1.0);
    float _2161 = _2141 * _2157;
    float _2163 = _2139 * _2157;
    float _2165 = 1.0 / _466;
    float _2167 = _2159 * _2159;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2163, _2163, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = _2163 * _2173;
    float _2177 = _2161 * _2173;
    float _2179 = _2159 * _2173;
    float _2181 = -_2175;
    float _2183 = _2007 * _2181;
    float _2185 = -_2177;
    float _2187 = _2011 * _2185;
    float _2189 = _2009 * _2179;
    float _2191 = -_2177;
    float _2193 = -_2183;
    float _2195 = fma(_2009, _2191, _2193);
    float _2197 = -_2187;
    float _2199 = fma(_2007, _2179, _2197);
    float _2201 = -_2175;
    float _2203 = -_2189;
    float _2205 = fma(_2011, _2201, _2203);
    float _2207 = _2195 * _2195;
    float _2209 = fma(_2205, _2205, _2207);
    float _2211 = fma(_2199, _2199, _2209);
    float _2213 = rsqrt(_2211);
    float _2215 = _2205 * _2213;
    float _2217 = _2199 * _2213;
    float _2219 = _2195 * _2213;
    float _2221 = _2009 * _2215;
    float _2223 = _2011 * _2217;
    float _2225 = -_2221;
    float _2227 = fma(_2007, _2217, _2225);
    float _2229 = _2007 * _2219;
    float _2231 = -_2223;
    float _2233 = fma(_2009, _2219, _2231);
    float _2235 = _2227 * _2227;
    float _2237 = -_2229;
    float _2239 = fma(_2011, _2215, _2237);
    float _2241 = fma(_2233, _2233, _2235);
    float _2243 = fma(_2239, _2239, _2241);
    float _2245 = rsqrt(_2243);
    float _2247 = _2239 * _2245;
    float _2249 = _2227 * _2245;
    float _2251 = _2233 * _2245;
    float _2253 = _2007 * _2247;
    float _2255 = in.m_65.x;
    float _2257 = in.m_65.y;
    float _2259 = in.m_65.z;
    float _2261 = _2009 * _2249;
    float _2263 = _2011 * _2251;
    float _2265 = -_2253;
    float _2267 = fma(_2009, _2251, _2265);
    float _2269 = -_2261;
    float _2271 = fma(_2011, _2247, _2269);
    float _2273 = -_2263;
    float _2275 = fma(_2007, _2249, _2273);
    float _2277 = _2267 * _2267;
    float _2279 = fma(_2271, _2271, _2277);
    float _2281 = fma(_2275, _2275, _2279);
    float _2283 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2285 = rsqrt(_2281);
    float _2287 = _2115 * _2255;
    float _2289 = _2165 * _2257;
    float _2291 = _2283 * _2041;
    float _2293 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2287);
    float _2297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2289);
    float _2299 = _2149 * _2259;
    float _2301 = _2293 * _2041;
    float _2303 = _2049 * _2295;
    float _2305 = _2291 * _2297;
    float _2307 = _2299 * _2301;
    float _2309 = _2303 * _2285;
    float _2311 = _2305 * _2249;
    float _2313 = _2305 * _2251;
    float _2315 = _2305 * _2247;
    float _2317 = _2301 + (-1.0);
    float _2319 = fma(_2267, _2309, _2311);
    float _2321 = fma(_2271, _2309, _2313);
    float _2323 = fma(_2275, _2309, _2315);
    float _2325 = fma(_2011, _2307, _2319);
    float _2327 = fma(_2007, _2307, _2321);
    float _2329 = fma(_2009, _2307, _2323);
    float _2331 = _2291 + (-1.0);
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2335 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2337 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2333);
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2341 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2335);
    float _2343 = _855 + _2325;
    float _2345 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2337);
    float _2347 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2339);
    float _2349 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2341);
    float _2351 = _2049 + (-1.0);
    float _2353 = _2317 * _2345;
    float _2355 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2347);
    float _2357 = _2331 * _2349;
    float _2359 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2361 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2363 = _2355 * _2351;
    float _2365 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2367 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2359);
    float _2369 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2361);
    float _2371 = _1375 + _2329;
    float _2373 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2365);
    float _2375 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2367);
    float _2377 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2369);
    float _2379 = _1385 + _2327;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2373);
    float _2383 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2385 = _2371 + _2377;
    float _2387 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2389 = _2379 + _2381;
    float _2391 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2395 = _2385 + _2393;
    float _2397 = 1.0 / _2387;
    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2401 = _2389 + _2399;
    float _2403 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2391);
    float _2405 = _2395 * _2395;
    float _2407 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2383);
    float _2409 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2403);
    float _2411 = fma(_2401, _2401, _2405);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2407);
    bool _2415 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(0.5);
    bool _2423 = _2419 || _2421;
    float _2425 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2427 = sqrt(_2411);
    float _2429 = _2425 + _2387;
    float _2431 = _2429 * _2397;
    float _2433 = _2431 * 0.5;
    float _2435 = _2343 + _2413;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2439 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2437);
    bool _2441 = _2427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2443 = 1.0 / _2439;
    bool _2445 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(0.5);
    bool _2453 = _2449 || _2451;
    float _2455 = _2413;
    float _2457 = _2407;
    float _2459 = _2389;
    float _2461 = _2343;
    if (!_2441)
    {
        _2455 = _2385;
    }
    float _2463 = _2455;
    float _2465 = _2463;
    if (!_2441)
    {
        _2457 = _2435;
    }
    float _2467 = _2457;
    bool _2469 = !_2441;
    float _2471 = _2467;
    if (!_2469)
    {
        float _2473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2477 = _2427 + _2475;
        float _2479 = rsqrt(_2411);
        float _2481 = _2477 * _2473;
        float _2483 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2485 = _2481 * 0.15915493667125701904296875;
        float _2487 = _2485 * 6.283185482025146484375;
        float _2489 = cos(_2487);
        float _2491 = _2485 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        float _2495 = _2489 + (-1.0);
        float _2497 = fma(_2493, _2483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2499 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2501 = _2479 * _2497;
        float _2503 = fma(_2435, _2489, _2499);
        float _2505 = fma(_2401, _2501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2507 = fma(_2395, _2501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2459 = _2505;
        _2471 = _2503;
        _2465 = _2507;
        _2461 = _2501;
    }
    float _2509 = _2459;
    float _2511 = _2471;
    float _2513 = _2465;
    float _2515 = _2461;
    float _2517 = -_1905;
    float _2519 = _2517 + _2509;
    float _2521 = -_1907;
    float _2523 = _2521 + _2511;
    float _2525 = -_1913;
    float _2527 = _2525 + _2513;
    float _2529 = _2515;
    float _2531 = _2523;
    float _2533 = _2519;
    float _2535 = _2527;
    float _2537 = _2513;
    if (_2453)
    {
        _2529 = 1.0;
    }
    float _2539 = _2529;
    float _2541 = _2539;
    if (!_2423)
    {
        float _2543 = _1921 * _1921;
        float _2545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2547 = -_1375;
        float _2549 = _2547 + _2513;
        float _2551 = -_855;
        float _2553 = _2551 + _2511;
        float _2555 = fma(_1929, _1929, _2543);
        float _2557 = fma(_1935, _1935, _2555);
        float _2559 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2561 = sqrt(_2557);
        float _2563 = 1.0 / _2041;
        float _2565 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2567 = precise::min(_2561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2569 = _2567 * _2545;
        float _2571 = _2569 * _2563;
        float _2573 = -_1385;
        float _2575 = _2573 + _2509;
        float _2577 = _2565 * _2571;
        float _2579 = _2549 * _2571;
        float _2581 = fma(_2575, _2577, _1917);
        float _2583 = fma(_2553, _2577, _1911);
        float _2585 = fma(_2565, _2579, _1925);
        _2531 = _2583;
        _2533 = _2581;
        _2535 = _2585;
        _2537 = _2579;
    }
    float _2587 = _2531;
    float _2589 = _2533;
    float _2591 = _2535;
    float _2593 = _2537;
    float _2595 = _2593;
    if (_2453)
    {
        _2595 = 1.0;
    }
    float _2597 = _2595;
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2601 = _2443 * _2599;
    float _2603 = _2597;
    if (!_2453)
    {
        float _2605 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2607 = _2605 * 0.15915493667125701904296875;
        float _2609 = _2607 * 6.283185482025146484375;
        float _2611 = cos(_2609);
        float _2613 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2615 = _2613 * 0.15915493667125701904296875;
        float _2617 = _2607 * 6.283185482025146484375;
        float _2619 = sin(_2617);
        float _2621 = 1.0 / _2611;
        float _2623 = _2615 * 6.283185482025146484375;
        float _2625 = cos(_2623);
        float _2627 = _2619 * _2621;
        float _2629 = _2615 * 6.283185482025146484375;
        float _2631 = sin(_2629);
        float _2633 = _2625 * _2627;
        float _2635 = 1.0 / _2633;
        float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2639 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2637;
        float _2641 = 1.0 / _2639;
        float _2643 = _2631 * _2635;
        float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2647 = fma(_2601, _2643, _2645);
        float _2649 = _2647 * _2641;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        _857 = _2641;
        _2541 = _2651;
    }
    float _2653 = _857;
    float _2655 = _2541;
    float _2657 = _2653;
    if (!_2453)
    {
        float _2659 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2661 = _2659 * 0.15915493667125701904296875;
        float _2663 = _2661 * 6.283185482025146484375;
        float _2665 = cos(_2663);
        float _2667 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2669 = _2667 * 0.15915493667125701904296875;
        float _2671 = _2661 * 6.283185482025146484375;
        float _2673 = sin(_2671);
        float _2675 = 1.0 / _2665;
        float _2677 = _2669 * 6.283185482025146484375;
        float _2679 = cos(_2677);
        float _2681 = _2673 * _2675;
        float _2683 = _2669 * 6.283185482025146484375;
        float _2685 = sin(_2683);
        float _2687 = _2679 * _2681;
        float _2689 = 1.0 / _2687;
        float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2693 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2691;
        float _2695 = 1.0 / _2693;
        float _2697 = _2685 * _2689;
        float _2699 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2701 = fma(_2601, _2697, _2699);
        float _2703 = _2701 * _2695;
        float _2705 = precise::clamp(_2703, 0.0, 1.0);
        float _2707 = -_2705;
        float _2709 = _2707 + 1.0;
        _2657 = _2675;
        _2603 = _2709;
    }
    float _2711 = _2657;
    float _2713 = _2603;
    float _2715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2717 = _2587 + _2715;
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2721 = _2589 + _2719;
    float _2723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2725 = _2591 + _2723;
    float _2727 = _2717 * _2717;
    float _2729 = fma(_2721, _2721, _2727);
    float _2731 = fma(_2725, _2725, _2729);
    float _2733 = rsqrt(_2731);
    float _2735 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2737 = _2721 * _2735;
    float _2739 = _2725 * _2735;
    float _2741 = _2737 * _2737;
    float _2743 = _2739 * _2739;
    float _2745 = _2741 + _2743;
    float _2747 = sqrt(_2745);
    bool _2749 = _2747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2753 = _2747 + _2751;
    float _2755 = _2733;
    float _2757 = _2711;
    float _2759 = _2753;
    float _2761 = _2717;
    float _2763 = _2737;
    if (_2749)
    {
        float _2765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2755 = _2765;
    }
    float _2767 = _2755;
    if (_2749)
    {
        float _2769 = rsqrt(_2745);
        _2757 = _2769;
    }
    float _2771 = _2757;
    float _2773 = _2771;
    if (_2749)
    {
        float _2775 = _2753 * _2767;
        _2759 = _2775;
    }
    float _2777 = _2759;
    if (_2749)
    {
        float _2779 = _2777 * 0.15915493667125701904296875;
        _1943 = _2779;
    }
    float _2781 = _1943;
    float _2783 = _2725;
    if (_2749)
    {
        float _2785 = _2781 * 6.283185482025146484375;
        float _2787 = sin(_2785);
        _2783 = _2787;
    }
    float _2789 = _2783;
    float _2791 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2793 = precise::max(0.0, _2791);
    float _2795 = _2767;
    float _2797 = _2793;
    if (_2749)
    {
        float _2799 = _2781 * 6.283185482025146484375;
        float _2801 = cos(_2799);
        _2795 = _2801;
    }
    float _2803 = _2795;
    float _2805 = -_2735;
    float _2807 = -_2793;
    float _2809 = fma(_2717, _2805, _2807);
    float _2811 = _2809;
    if (_2749)
    {
        float _2813 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2761 = _2813;
    }
    float _2815 = _2761;
    float _2817 = sqrt(_2731);
    float _2819 = _2815;
    float _2821 = _2789;
    if (_2749)
    {
        float _2823 = fma(_2789, _2815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2819 = _2823;
    }
    float _2825 = _2819;
    float _2827 = _2825;
    if (!_2749)
    {
        _2821 = _2741;
    }
    float _2829 = _2821;
    float _2831 = _2829;
    if (_2749)
    {
        float _2833 = _2803 + (-1.0);
        _2797 = _2833;
    }
    float _2835 = _2797;
    float _2837 = _2835;
    if (_2749)
    {
        float _2839 = _2771 * _2825;
        _1945 = _2839;
    }
    float _2841 = _1945;
    if (!_2749)
    {
        _2827 = _2743;
    }
    float _2843 = _2827;
    float _2845 = _2843;
    if (_2749)
    {
        float _2847 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2773 = _2847;
    }
    float _2849 = _2773;
    if (_2749)
    {
        float _2851 = _2737 * _2841;
        _2763 = _2851;
    }
    float _2853 = _2763;
    if (!_2749)
    {
        _2837 = _2739;
    }
    float _2855 = _2837;
    float _2857 = _2855;
    if (_2749)
    {
        float _2859 = _2739 * _2841;
        _2857 = _2859;
    }
    float _2861 = _2857;
    if (_2749)
    {
        float _2863 = fma(_2809, _2803, _2849);
        _2811 = _2863;
    }
    float _2865 = _2811;
    if (_2749)
    {
        float _2867 = _2853 * _2853;
        _2831 = _2867;
    }
    float _2869 = _2831;
    if (_2749)
    {
        float _2871 = _2861 * _2861;
        _2845 = _2871;
    }
    float _2873 = _2845;
    float _2875 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2877 = fma(_2865, _2865, _2869);
    float _2879 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2883 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2881);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2875);
    float _2889 = _2877 + _2873;
    float _2891 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2893 = -_2885;
    float _2895 = _2893 + 1.0;
    float _2897 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2899 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2887);
    float _2901 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2891);
    float _2903 = rsqrt(_2889);
    float _2905 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2907 = _2899 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2909 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2901);
    float _2911 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2905);
    float _2913 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2897);
    float _2915 = _2909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2917 = abs(_2895);
    float _2919 = log2(_2917);
    float _2921 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2911);
    float _2923 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2925 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2913);
    float _2927 = _2921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2929 = -_2923;
    float _2931 = fma(_2929, _2879, 1.0);
    float _2933 = _2903 * _2853;
    float _2935 = _2903 * _2865;
    float _2937 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2939 = _2925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2941 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2943 = _2903 * _2861;
    float _2945 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2937);
    float _2947 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2949 = -_2941;
    float _2951 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2949);
    float _2953 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2955 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2945);
    float _2957 = log2(_2931);
    float _2959 = -_2943;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2951);
    float _2963 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2965 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2955);
    float _2967 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2947);
    float _2969 = fma(_2961, -0.5, 0.5);
    float _2971 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2963);
    float _2973 = fma(_2961, 0.5, 0.5);
    float _2975 = exp2(_2953);
    float _2977 = _2935 + 1.0;
    float _2979 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2967);
    float _2981 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2971);
    float _2983 = fma(_2973, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2985 = 1.0 / _2965;
    float _2987 = fma(_2973, _2983, -0.212114393711090087890625);
    float _2989 = _2957 * 0.693147182464599609375;
    float _2991 = fma(_2973, _2987, 1.570728778839111328125);
    float _2993 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2995 = sqrt(_2969);
    float _2997 = -_2935;
    float _2999 = fma(_2975, _2977, _2997);
    float _3001 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2979);
    float _3003 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2981);
    float _3005 = fma(_2999, 0.5, 0.5);
    float _3007 = _3001 * _2985;
    float _3009 = _3003 * _2985;
    float _3011 = fma(_3007, 0.5, 0.5);
    float _3013 = fma(_3009, -0.5, 0.5);
    float _3015 = _2995 * 0.636619746685028076171875;
    float3 _7629 = float3(_3011, _3013, _2993);
    float _3017 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7629, float3(0.0), isnan(_7629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7629, float3(0.0), isnan(_7629)), level(0.0)).x;
    float3 _7640 = float3(_3011, _3013, _2993);
    float4 _3020 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).xyzw;
    float _3022 = _3020.x;
    float _3024 = _3020.y;
    float _3026 = _3020.z;
    float _3028 = _3020.w;
    float _3030 = -_2991;
    float _3032 = fma(_3015, _3030, 1.0);
    float2 _7662 = float2(_3032, _3005);
    float3 _3036 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7662, float2(0.0), isnan(_7662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7662, float2(0.0), isnan(_7662)), level(0.0)).xyz;
    float _3038 = _3036.x;
    float _3040 = _3036.y;
    float _3042 = _3036.z;
    float _3044 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3046 = _2655 * _2713;
    float _3048 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3050 = _2655 > 0.0;
    bool _3052 = isnan(_2655);
    bool _3054 = _3050 || _3052;
    bool _3056 = isnan(0.0);
    bool _3058 = _3054 || _3056;
    out.m_53.w = _462;
    float _3060 = _3046 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3062 = exp2(_3044);
    float _3064 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3048);
    bool _3066 = _2713 <= 0.0;
    bool _3068 = !_3058;
    bool _3070 = _3066 || _3068;
    float _3072 = _3060 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3074 = _2965 * 0.5;
    float _3076 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3064);
    float _3078 = _3001 + _2965;
    out.m_63.w = _1899;
    float _3080 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3076);
    out.m_67.x = _1917;
    out.m_67.y = _1911;
    out.m_67.z = _1925;
    float _3082 = _3078 * 0.5;
    float _3084 = _3080 + _2965;
    out.m_45.x = _3072;
    float _3086 = -_3062;
    float _3088 = _3086 + 1.0;
    float _3090 = _3084 * 0.5;
    float _3092 = fma(_3003, -0.5, _3074);
    out.gl_Position.x = _3001;
    out.gl_Position.y = _3003;
    out.gl_Position.z = _3080;
    out.gl_Position.w = _2965;
    float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3082;
    out.m_69.y = _3092;
    out.m_69.z = _3090;
    out.m_69.w = _2965;
    float _3096 = -_3094;
    float _3098 = _3096 + 1.0;
    float _3100 = _3094 * _3017;
    float _3102 = _3028 * _3098;
    float _3104 = _3028 * _3100;
    float _3106 = _3042 * _3100;
    float _3108 = fma(_3038, _3104, _3022);
    float _3110 = fma(_3040, _3104, _3024);
    float _3112 = fma(_3028, _3106, _3026);
    out.m_71.x = _3108;
    out.m_71.y = _3110;
    out.m_71.z = _3112;
    out.m_71.w = _3102;
    if (!_3070)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3114 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3114;
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
    bool _490 = false;
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
        float _3170 = as_type<float>(_106);
        out.gl_Position.z = _3170;
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
        float _3238 = as_type<float>(_142);
        out.gl_Position.z = _3238;
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
    bool _328 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _330 = isnan(_318);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _348 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _350 = isnan(_318);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _326;
    float _362 = -_338;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _366;
    bool _370 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _372 = isnan(_318);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _358 * _364;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _390 = 1.0 / _342;
    float _392 = _380 * _386;
    float _394 = -_380;
    float _396 = _394 + 1.0;
    float _398 = 1.0 / _346;
    float _400 = _368 * _360;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _406 = fma(_400, _322, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _408 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _410 = isnan(_318);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _404 * _390;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _428 = _318 + _426;
    float _430 = _406 * _392;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _434 = _318 + _432;
    float _436 = fma(_420, _428, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _438 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _430);
    float _440 = _424 * _398;
    float _442 = -_418;
    float _444 = _442 + 1.0;
    float _446 = fma(_436, _382, _438);
    float _448 = fma(_440, _434, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _450 = _338 * _444;
    float _452 = fma(_448, _450, _446);
    float _454 = in.m_49.x;
    float _456 = in.m_49.y;
    float _458 = in.m_49.z;
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[118].x, _452);
    float _462 = _460 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _462;
    float _464 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _466 = _456 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _470 = !_388;
    float _488;
    if (!_470)
    {
        float _472 = in.m_51.x;
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_90);
        float _494 = 1.0 / _492;
        float _496 = _122 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _502 = int(_500);
    float _504 = in.m_55.y;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _508 = _506 != 0;
    float _510 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _512 = int(_510);
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _520 = _518 != 0;
    float _522 = float(_90);
    float _524 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _526 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _528 = int(_526);
    float _530 = float(_502);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _536 = 1.0 / _530;
    float _538 = float(_512);
    float _540 = -_504;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _556 = float(uint(_528));
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _560 = int(_558);
    int _562 = ~_528;
    int _564 = _562 + 1;
    float _566 = float(_528);
    float _568 = _122 * _536;
    float _570 = 1.0 / _538;
    float _572 = 1.0 / _556;
    float _574 = float(uint(_560));
    int _576 = ~_560;
    int _578 = _576 + 1;
    float _580 = trunc(_568);
    int _582 = int(_580);
    float _584 = _122 * _570;
    int _586 = as_type<int>(_572) + (-2);
    float _588 = 1.0 / _574;
    float _590 = float(uint(_582));
    float _592 = trunc(_584);
    int _594 = int(_592);
    float _596 = as_type<float>(_586) * _590;
    float _598 = trunc(_596);
    float _600 = precise::max(_598, 0.0);
    uint _603 = uint(_600);
    int _605 = as_type<int>(_588) + (-2);
    float _607 = in.m_55.x;
    float _609 = float(uint(_594));
    float _611 = 1.0 / _534;
    float _613 = float(_594);
    float _615 = as_type<float>(_605) * _609;
    int _617 = _564 * int(_603);
    int _619 = _617 + _582;
    float _621 = trunc(_615);
    float _623 = precise::max(_621, 0.0);
    uint _625 = uint(_623);
    float _627 = in.m_51.z;
    float _629 = float(uint(_619));
    float _631 = in.m_51.y;
    float _633 = 1.0 / _546;
    float _635 = as_type<float>(_586) * _629;
    float _637 = _550 * _611;
    float _639 = in.m_51.x;
    int _641 = _578 * int(_625);
    int _643 = _641 + _594;
    float _645 = trunc(_635);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    float _651 = float(uint(_643));
    float _653 = _554 * _633;
    bool _655 = _627 > 0.5;
    float _657 = as_type<float>(_605) * _651;
    float _659 = _651;
    float _661 = _504;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _665 = _607;
    if (!_508)
    {
        _659 = _607;
    }
    float _667 = _659;
    float _669 = 1.0 / _522;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _498 + _671;
    bool _675 = _631 > 0.5;
    int _677 = int(_603) + int(_649);
    int _679 = int(_649);
    bool _681 = _675;
    float _683 = _667;
    if (_508)
    {
        float _685 = -_607;
        float _687 = _685 + 1.0;
        _679 = as_type<int>(_687);
    }
    int _689 = _679;
    int _691 = _675 ? as_type<int>(_542) : as_type<int>(_504);
    float _693 = trunc(_657);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    if (_508)
    {
        bool _699 = _639 > 0.5;
        _681 = _699;
    }
    bool _701 = _681;
    float _703 = _639 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _705 = ~_528;
    int _707 = _705 + 1;
    float _709 = _520 ? as_type<float>(_691) : _504;
    if (_516)
    {
        float _711 = _655 ? _542 : _504;
        _661 = _711;
    }
    float _713 = _661;
    int _715 = _707 * _677;
    int _717 = _715 + _582;
    if (_508)
    {
        float _719 = _701 ? as_type<float>(_689) : _607;
        _683 = _719;
    }
    float _721 = _683;
    float _723 = _122 * _669;
    int _725 = ~_560;
    int _727 = _725 + 1;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    int _741 = int(_625) + int(_697);
    bool _743 = uint(_717) >= uint(_528);
    bool _745 = !_731;
    int _747 = _745 ? 0 : 1;
    int _749 = _727 * _741;
    int _751 = _749 + _594;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _755 = _753 != 0;
    bool _757 = !_743;
    int _759 = _757 ? 0 : (-1);
    bool _761 = !_735;
    int _763 = _761 ? 0 : 1;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _783 = _781 != 0;
    bool _785 = !_755;
    int _787 = _785 ? 0 : 1;
    bool _789 = uint(_751) >= uint(_560);
    bool _791 = !_783;
    int _793 = _791 ? 0 : 1;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _797 = _795 != 0;
    float _799 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _801 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _803 = !_789;
    int _805 = _803 ? 0 : (-1);
    bool _807 = !_771;
    int _809 = _807 ? 0 : 1;
    float _811 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _799);
    bool _813 = !_767;
    int _815 = _813 ? 0 : 1;
    float _817 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _801);
    bool _819 = !_775;
    int _821 = _819 ? 0 : 1;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _831 = _829 != 0;
    float _833 = -_823;
    float _835 = fma(_703, 2.0, _833);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _843 = _841 != 0;
    float _845 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
    if (_797)
    {
        _290 = 1.0;
    }
    float _847 = _290;
    float _849 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    float _851 = _847;
    if (!_797)
    {
        _851 = 7.345489978790283203125;
    }
    float _853 = _851;
    float _855 = _849 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _857 = _855;
    if (_797)
    {
        _663 = _639;
    }
    float _859 = _663;
    float _861 = _853 * _639;
    float _863 = 0.0;
    float _865 = _859;
    if (_797)
    {
        _863 = 1.0;
    }
    float _867 = _863;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _871 = _867;
    if (!_797)
    {
        _865 = _631;
    }
    float _873 = _865;
    float _875 = _631 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_797)
    {
        _871 = 1.2345600128173828125;
    }
    float _877 = _871;
    float _879 = floor(_861);
    int _881 = ~_677;
    int _883 = _881 + _759;
    int _885 = _883 + 1;
    float _887 = fma(_875, -2.0, _869);
    float _889 = float(_582);
    float _891 = _873 * _877;
    float _893 = float(_560);
    float _895 = fma(_637, _673, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _897 = _889 >= _566;
    bool _899 = isnan(_889);
    bool _901 = _897 || _899;
    bool _903 = isnan(_566);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = floor(_891);
    float _911 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _845);
    bool _913 = _613 >= _893;
    bool _915 = isnan(_613);
    bool _917 = _913 || _915;
    bool _919 = isnan(_893);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _817);
    int _927 = abs(_763);
    bool _929 = !_739;
    int _931 = _929 ? 0 : 1;
    float _933 = trunc(_907);
    int _935 = int(_933);
    float _937 = -_879;
    float _939 = _861 + _937;
    bool _941 = !_779;
    int _943 = _941 ? 0 : 1;
    bool _945 = _528 == 0;
    float _947 = _939 * _566;
    bool _949 = _631 > 0.5;
    float _951 = trunc(_923);
    int _953 = int(_951);
    float _955 = -_909;
    float _957 = _891 + _955;
    int _959 = _528 * _885;
    int _961 = _959 + _582;
    int _963 = ~_741;
    int _965 = _963 + _805;
    int _967 = _965 + 1;
    float _969 = _723 * _566;
    float _971 = _723 * _893;
    float _973 = _957 * _893;
    bool _975 = !_945;
    int _977 = _975 ? _961 : (-1);
    int _979 = _560 * _967;
    int _981 = _979 + _594;
    int _983 = ~_935;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    float _989 = trunc(_969);
    int _991 = int(_989);
    bool _993 = !_831;
    int _995 = _993 ? 0 : 1;
    bool _997 = _560 == 0;
    int _999 = _977 * _987;
    int _1001 = _528 + (-1);
    int _1003 = ~_953;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    float _1009 = trunc(_947);
    int _1011 = int(_1009);
    bool _1013 = !_997;
    int _1015 = _1013 ? _981 : (-1);
    int _1017 = _935 * _1001;
    int _1019 = _1017 + _999;
    int _1021 = _560 + (-1);
    int _1023 = abs(_747);
    int _1025 = _1015 * _1007;
    float _1027 = trunc(_973);
    int _1029 = int(_1027);
    int _1031 = _953 * _1021;
    int _1033 = _1031 + _1025;
    int _1035 = abs(_809);
    int _1037 = _1019 * _927;
    int _1039 = abs(_995);
    int _1041 = abs(_815);
    float _1043 = trunc(_971);
    int _1045 = int(_1043);
    int _1047 = abs(_787);
    int _1049 = _991 * _1023;
    int _1051 = _1049 + _1037;
    int _1053 = _1033 * _1035;
    int _1055 = _1011 * _1047;
    int _1057 = _1055 + _582;
    int _1059 = abs(_931);
    int _1061 = _1029 * _1039;
    int _1063 = _1061 + _594;
    int _1065 = abs(_793);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1069 = _498 + _1067;
    int _1071 = abs(_821);
    int _1073 = _1057 * _1059;
    int _1075 = _1073 + _1051;
    float _1077 = fma(_653, _1069, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1079 = abs(_943);
    int _1081 = _1045 * _1041;
    int _1083 = _1081 + _1053;
    float _1085 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1087 = _1011 * _1065;
    int _1089 = _1087 + _1075;
    bool _1091 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1093 = isnan(_498);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    int _1103 = _1063 * _1071;
    int _1105 = _1103 + _1083;
    bool _1107 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1109 = isnan(_498);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1121 = float(uint(_1089));
    int _1123 = _1029 * _1079;
    int _1125 = _1123 + _1105;
    float _1127 = -_1101;
    float _1129 = _1127 + 1.0;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1133 = _1037;
    if (_797)
    {
        _1133 = 0;
    }
    int _1135 = _1133;
    float _1137 = as_type<float>(_586) * _1121;
    float _1139 = float(uint(_1125));
    float _1141 = _1117 * _1129;
    float _1143 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    int _1145 = _1135;
    if (!_797)
    {
        _1145 = 2;
    }
    int _1147 = _1145;
    float _1149 = as_type<float>(_605) * _1139;
    float _1151 = trunc(_1137);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    bool _1157 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1159 = isnan(_498);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1143);
    float _1171 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _887);
    float _1173 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1175 = _1147 != 2;
    float _1177 = -_1117;
    float _1179 = _1177 + 1.0;
    float _1181 = -_1171;
    float _1183 = fma(_1169, _1085, _1181);
    float _1185 = trunc(_1149);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    int _1191 = ~_528;
    int _1193 = _1191 + 1;
    float _1195 = fma(_1173, _713, -0.5);
    int _1197 = as_type<int>(_1173);
    float _1199 = as_type<float>(_1193);
    if (_839)
    {
        float _1201 = -_607;
        float _1203 = _1201 + 1.0;
        _1197 = as_type<int>(_1203);
    }
    int _1205 = _1197;
    int _1207 = ~_560;
    int _1209 = _1207 + 1;
    float _1211 = _1167 * _1179;
    float _1213 = -_1167;
    float _1215 = _1213 + 1.0;
    if (!_839)
    {
        _1199 = _607;
    }
    float _1217 = _1199;
    float _1219 = _895 * _1211;
    float _1221 = _1217;
    if (_839)
    {
        float _1223 = _949 ? as_type<float>(_1205) : _607;
        _1221 = _1223;
    }
    float _1225 = _1221;
    int _1227 = _1193 * int(_1155);
    int _1229 = _1227 + _1089;
    float _1231 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1219);
    if (_1175)
    {
        _665 = _639;
    }
    float _1233 = _665;
    float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1237 = _1233;
    if (!_1175)
    {
        _1237 = _627;
    }
    float _1239 = _1237;
    int _1241 = _1209 * int(_1189);
    int _1243 = _1241 + _1125;
    float _1245 = float(uint(_1229));
    float _1247 = fma(_1077, _1141, _1231);
    float _1249 = float(uint(_1057));
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1253 = float(uint(_1243));
    float _1255 = as_type<float>(_586) * _1245;
    float _1257 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1247);
    float _1259 = as_type<float>(_605) * _1253;
    float _1261 = trunc(_1255);
    float _1263 = precise::max(_1261, 0.0);
    uint _1265 = uint(_1263);
    float _1267 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1271 = -_122;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1277 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1269);
    float _1279 = trunc(_1259);
    float _1281 = precise::max(_1279, 0.0);
    uint _1283 = uint(_1281);
    float _1285 = as_type<float>(_586) * _1249;
    float _1287 = float(uint(_1063));
    float _1289 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1277);
    float _1291 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1293 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1275);
    float _1295 = _1249;
    if (_1175)
    {
        _1295 = _631;
    }
    float _1297 = _1295;
    float _1299 = as_type<float>(_605) * _1287;
    float _1301 = trunc(_1285);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1309 = fma(_1289, _1267, _1273);
    float _1311 = fma(_1291, _1225, -0.5);
    int _1313 = ~_528;
    int _1315 = _1313 + 1;
    float _1317 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1307);
    float _1319 = _1297;
    if (!_1175)
    {
        _1319 = _639;
    }
    float _1321 = _1319;
    float _1323 = trunc(_1299);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    int _1329 = int(_1189) + int(_1283);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1333 = int(_1155) + int(_1265);
    float _1335 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1337 = ~_528;
    int _1339 = _1337 + 1;
    float _1341 = -_1331;
    float _1343 = fma(_1251, 2.0, _1341);
    int _1345 = ~_560;
    int _1347 = _1345 + 1;
    int _1349 = _1315 * int(_1305);
    int _1351 = _1349 + _1057;
    int _1353 = ~_560;
    int _1355 = _1353 + 1;
    int _1357 = _1339 * _1333;
    int _1359 = _1357 + _1089;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _855 + _1361;
    float _1365 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1293);
    float _1367 = float(uint(_1351));
    int _1369 = _1347 * _1329;
    int _1371 = _1369 + _1125;
    bool _1373 = uint(_1359) >= uint(_528);
    float _1375 = _925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1377 = -_122;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1343);
    float _1381 = as_type<float>(_586) * _1367;
    bool _1383 = uint(_1371) >= uint(_560);
    float _1385 = _911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1387 = _1355 * int(_1327);
    int _1389 = _1387 + _1063;
    bool _1391 = !_1373;
    int _1393 = _1391 ? 0 : (-1);
    float _1395 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1385 + _1397;
    float _1401 = trunc(_1381);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = ~_1333;
    int _1409 = _1407 + _1393;
    int _1411 = _1409 + 1;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1415 = _1375 + _1413;
    float _1417 = float(uint(_1389));
    float _1419 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1395);
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1423 = _528 * _1411;
    int _1425 = _1423 + _1089;
    float _1427 = _1309 + 0.5;
    float _1429 = as_type<float>(_605) * _1417;
    bool _1431 = !_1383;
    int _1433 = _1431 ? 0 : (-1);
    float _1435 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1419);
    float _1437 = fma(_1335, -2.0, _1421);
    bool _1439 = !_945;
    int _1441 = _1439 ? _1425 : (-1);
    int _1443 = ~_1329;
    int _1445 = _1443 + _1433;
    int _1447 = _1445 + 1;
    float _1449 = trunc(_1429);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    bool _1455 = _1435 >= 0.0;
    int _1457 = _1441 >> 31;
    int _1459 = _560 * _1447;
    int _1461 = _1459 + _1125;
    int _1463 = _1441 & 3;
    bool _1465 = _1463 != 0;
    int _1467 = int(_1305) + int(_1405);
    float _1469 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1437);
    int _1471 = _1457 & 3;
    int _1473 = ~_528;
    int _1475 = _1473 + 1;
    float _1477 = -_1469;
    float _1479 = fma(_1365, _1195, _1477);
    bool _1481 = !_1465;
    int _1483 = _1481 ? 0 : 1;
    if (_1455)
    {
        out.m_45.x = 0.0;
    }
    int _1485 = _1441 & 3;
    bool _1487 = _1485 != 0;
    bool _1489 = !_997;
    int _1491 = _1489 ? _1461 : (-1);
    int _1493 = _1441 + _1471;
    int _1495 = _1475 * _1467;
    int _1497 = _1495 + _1057;
    int _1499 = _1491 >> 31;
    bool _1501 = uint(_1463) > 1u;
    int _1503 = _1493 >> 2;
    int _1505 = int(_1327) + int(_1453);
    int _1507 = _1499 & 3;
    int _1509 = _1503 << 4;
    int _1511 = _1509 + 368;
    int _1513 = _1487 ? 0 : 1;
    bool _1515 = uint(_1497) >= uint(_528);
    int _1517 = _1491 + _1507;
    uint _1519 = uint(int(uint(_1511) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[int(_1529)][_1531];
    int _1535 = ~_1513;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    int _1541 = _1517 >> 2;
    int _1543 = _1539;
    if (!_1501)
    {
        int _1545 = ~_1513;
        int _1547 = _1545 + 1;
        _1543 = _1547;
    }
    int _1549 = _1543;
    float _1551 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1317);
    bool _1553 = uint(_1463) >= 2u;
    int _1555 = _1541 << 4;
    int _1557 = _1555 + 512;
    float _1559 = fma(_1551, _1311, _1379);
    int _1561 = ~_560;
    int _1563 = _1561 + 1;
    int _1565 = _1511 + 8;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
    int _1571 = int(_1567) & 3;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[int(_1569)][_1571];
    int _1575 = int(_1567) + 1;
    uint _1577 = uint(int(uint(_1575) >> uint(2)));
    int _1579 = _1575 & 3;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[int(_1577)][_1579];
    int _1583 = _1553 ? 0 : 1;
    float _1585 = _1183 + 0.5;
    bool _1587 = _1463 != 3;
    int _1589 = _1563 * _1505;
    int _1591 = _1589 + _1063;
    bool _1593 = !_1515;
    int _1595 = _1593 ? 0 : (-1);
    int _1597 = abs(_1549);
    uint _1599 = uint(int(uint(_1557) >> uint(2)));
    uint _1601 = uint(int(uint(int(_1599)) >> uint(2)));
    int _1603 = int(_1599) & 3;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[int(_1601)][_1603];
    int _1607 = int(_1599) + 1;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    int _1611 = _1607 & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = ~_1467;
    int _1617 = _1615 + _1595;
    int _1619 = _1617 + 1;
    out.m_57.x = _1427;
    out.m_57.y = _1585;
    bool _1621 = uint(_1591) >= uint(_560);
    int _1623 = ~_1583;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    int _1629 = _528 * _1619;
    int _1631 = _1629 + _1057;
    bool _1633 = !_1621;
    int _1635 = _1633 ? 0 : (-1);
    int _1637 = _1557 + 8;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[int(_1649)][_1651];
    int _1655 = _1627;
    if (_1587)
    {
        int _1657 = ~_1583;
        int _1659 = _1657 + 1;
        _1655 = _1659;
    }
    int _1661 = _1655;
    int _1663 = _1491 & 3;
    bool _1665 = _1663 != 0;
    int _1667 = _1491 & 3;
    bool _1669 = _1667 != 0;
    int _1671 = _1665 ? 0 : 1;
    bool _1673 = uint(_1667) > 1u;
    int _1675 = ~_1505;
    int _1677 = _1675 + _1635;
    int _1679 = _1677 + 1;
    bool _1681 = !_1669;
    int _1683 = _1681 ? 0 : 1;
    bool _1685 = uint(_1667) >= 2u;
    int _1687 = _560 * _1679;
    int _1689 = _1687 + _1063;
    int _1691 = _1685 ? 0 : 1;
    bool _1693 = _1667 != 3;
    int _1695 = ~_1671;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    int _1701 = _1699;
    if (!_1673)
    {
        int _1703 = ~_1671;
        int _1705 = _1703 + 1;
        _1701 = _1705;
    }
    int _1707 = _1701;
    int _1709 = ~_1597;
    int _1711 = _1709 + 1;
    int _1713 = _1711 + 1;
    int _1715 = abs(_1483);
    int _1717 = abs(_1707);
    int _1719 = _1713 * as_type<int>(_1533);
    int _1721 = ~_1691;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    int _1727 = _1725;
    if (_1693)
    {
        int _1729 = ~_1691;
        int _1731 = _1729 + 1;
        _1727 = _1731;
    }
    int _1733 = _1727;
    int _1735 = abs(_1683);
    int _1737 = ~_1717;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = abs(_1733);
    int _1745 = ~_1735;
    int _1747 = _1745 + 1;
    int _1749 = _1747 + 1;
    int _1751 = _1741 * as_type<int>(_1613);
    int _1753 = ~_1715;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    int _1759 = abs(_1661);
    int _1761 = _1749 * as_type<int>(_1605);
    int _1763 = _1761 + _1751;
    int _1765 = ~_1743;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    int _1771 = _1757 * as_type<int>(_1525);
    int _1773 = _1771 + _1719;
    bool _1775 = _1667 != 3;
    int _1777 = ~_1759;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    int _1783 = _1769 * as_type<int>(_1645);
    int _1785 = _1783 + _1763;
    bool _1787 = _1463 != 3;
    bool _1789 = !_1775;
    int _1791 = _1789 ? 0 : (-1);
    int _1793 = _1781 * as_type<int>(_1573);
    int _1795 = _1793 + _1773;
    bool _1797 = !_843;
    int _1799 = _1797 ? 0 : 1;
    bool _1801 = !_1787;
    int _1803 = _1801 ? 0 : (-1);
    int _1805 = abs(_1791);
    int _1807 = abs(_1799);
    int _1809 = abs(_1803);
    float _1811 = _1363 * _1363;
    bool _1813 = !_827;
    int _1815 = _1813 ? 0 : 1;
    float _1817 = fma(_1399, _1399, _1811);
    int _1819 = abs(_1815);
    int _1821 = ~_1809;
    int _1823 = _1821 + 1;
    int _1825 = _1823 + 1;
    float _1827 = fma(_1415, _1415, _1817);
    int _1829 = ~_1805;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    int _1835 = ~_1819;
    int _1837 = _1835 + 1;
    int _1839 = _1837 + 1;
    int _1841 = _1825 * as_type<int>(_1581);
    int _1843 = _1841 + _1795;
    int _1845 = ~_1807;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    int _1851 = _1833 * as_type<int>(_1653);
    int _1853 = _1851 + _1785;
    float _1855 = rsqrt(_1827);
    bool _1857 = !_945;
    float _1859 = _1857 ? as_type<float>(_1631) : as_type<float>(0xffffffffu /* nan */);
    int _1861 = _1843 * _1839;
    bool _1863 = !_997;
    int _1865 = _1863 ? _1689 : (-1);
    int _1867 = _1853 * _1849;
    float _1869 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1871 = as_type<int>(_1859) * _1819;
    int _1873 = _1871 + _1861;
    float _1875 = _1859;
    if (_1455)
    {
        _1875 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1877 = _1875;
    int _1879 = _1865 * _1807;
    int _1881 = _1879 + _1867;
    float _1883 = _1559 + 0.5;
    float _1885 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1887 = as_type<int>(_1877);
    float _1889 = _1885;
    if (_1455)
    {
        float _1891 = _1877 * 5.0;
        _1887 = as_type<int>(_1891);
    }
    int _1893 = _1887;
    float _1895 = _1479 + 0.5;
    float _1897 = float(_1873);
    float _1899 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1901 = float(_1881);
    float _1903 = _1885 * _1855;
    if (_1455)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5825 = as_type<float>(_1893);
        out.gl_Position.z = _5825;
    }
    float _1905 = _1399 * _1903;
    out.m_59.x = _1883;
    out.m_59.y = _1895;
    float _1907 = _1363 * _1903;
    out.m_61.x = _1897;
    out.m_61.y = _1901;
    out.m_63.w = _1899;
    if (_1455)
    {
        return out;
    }
    float _1909 = -_1907;
    float _1911 = _855 + _1909;
    float _1913 = _1415 * _1903;
    float _1915 = -_1905;
    float _1917 = _1385 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1921 = _1911 + _1919;
    float _1923 = -_1913;
    float _1925 = _1375 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1929 = _1917 + _1927;
    float _1931 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1935 = _1925 + _1933;
    float _1937 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1931);
    float _1939 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1937);
    bool _1941 = _1939 >= 0.0;
    float _1943 = _1935;
    float _1945 = _1913;
    if (_1941)
    {
        _1889 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1947 = _1889;
    int _1949 = as_type<int>(_1947);
    if (_1941)
    {
        out.m_45.x = 0.0;
    }
    if (_1941)
    {
        float _1951 = _1947 * 5.0;
        _1949 = as_type<int>(_1951);
    }
    int _1953 = _1949;
    if (_1941)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5926 = as_type<float>(_1953);
        out.gl_Position.z = _5926;
    }
    if (_1941)
    {
        return out;
    }
    float _1955 = -_855;
    float _1957 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1959 = -_1385;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1963 = -_1375;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1967 = _1957 * _1957;
    float _1969 = -_1907;
    float _1971 = _1363 + _1969;
    float _1973 = fma(_1961, _1961, _1967);
    float _1975 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1977 = fma(_1965, _1965, _1973);
    float _1979 = -_1905;
    float _1981 = _1399 + _1979;
    float _1983 = -_1975;
    float _1985 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1983);
    float _1987 = _1971 * _1971;
    float _1989 = rsqrt(_1977);
    float _1991 = -_1913;
    float _1993 = _1415 + _1991;
    float _1995 = fma(_1981, _1981, _1987);
    float _1997 = fma(_1993, _1993, _1995);
    float _1999 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2001 = sqrt(_1997);
    float _2003 = -_1999;
    float _2005 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2003);
    float _2007 = _1961 * _1989;
    float _2009 = _1965 * _1989;
    float _2011 = _1957 * _1989;
    float _2013 = _2007 * _2007;
    float _2015 = fma(_2009, _2009, _2013);
    float _2017 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2023 = rsqrt(_2015);
    float _2025 = -_2017;
    float _2027 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2025);
    float _2029 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2031 = -_2021;
    float _2033 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2031);
    float _2035 = -_2019;
    float _2037 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2035);
    float _2039 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2041 = _1855 * _2001;
    float _2043 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2045 = -_2029;
    float _2047 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2045);
    float _2049 = _1869 * _2041;
    float _2051 = -_2043;
    float _2053 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2051);
    float _2055 = -_2039;
    float _2057 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2055);
    float _2059 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2047);
    float _2061 = _2009 * _2023;
    float _2063 = _2007 * _2023;
    float _2065 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2057);
    float _2067 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2069 = -_2061;
    float _2071 = _2009 * _2069;
    float _2073 = -_2061;
    float _2075 = _2011 * _2073;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2079 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2081 = -_2071;
    float _2083 = fma(_2007, _2063, _2081);
    float _2085 = _2011 * _2063;
    float _2087 = -_2077;
    float _2089 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2087);
    float _2091 = -_2079;
    float _2093 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2091);
    float _2095 = _2083 * _2083;
    float _2097 = -_2067;
    float _2099 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2097);
    float _2101 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2093);
    float _2103 = fma(_2085, _2085, _2095);
    float _2105 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2107 = fma(_2075, _2075, _2103);
    float _2109 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2099);
    float _2111 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2113 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = 1.0 / _464;
    float _2117 = -_2109;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2105);
    float _2121 = -_2111;
    float _2123 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2121);
    float _2125 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2127 = -_2113;
    float _2129 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2131 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2123);
    float _2133 = -_2125;
    float _2135 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2133);
    float _2137 = rsqrt(_2107);
    float _2139 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2129);
    float _2141 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2135);
    float _2143 = 1.0 / _2119;
    float _2145 = _2083 * _2137;
    float _2147 = precise::clamp(_2145, 0.0, 1.0);
    float _2149 = 1.0 / _468;
    float _2151 = -_2147;
    float _2153 = _2151 + 1.0;
    float _2155 = fma(_2131, _2143, -1.0);
    float _2157 = _2153 * _2143;
    float _2159 = fma(_2153, _2155, 1.0);
    float _2161 = _2141 * _2157;
    float _2163 = _2139 * _2157;
    float _2165 = 1.0 / _466;
    float _2167 = _2159 * _2159;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2163, _2163, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = _2163 * _2173;
    float _2177 = _2161 * _2173;
    float _2179 = _2159 * _2173;
    float _2181 = -_2175;
    float _2183 = _2007 * _2181;
    float _2185 = -_2177;
    float _2187 = _2011 * _2185;
    float _2189 = _2009 * _2179;
    float _2191 = -_2177;
    float _2193 = -_2183;
    float _2195 = fma(_2009, _2191, _2193);
    float _2197 = -_2187;
    float _2199 = fma(_2007, _2179, _2197);
    float _2201 = -_2175;
    float _2203 = -_2189;
    float _2205 = fma(_2011, _2201, _2203);
    float _2207 = _2195 * _2195;
    float _2209 = fma(_2205, _2205, _2207);
    float _2211 = fma(_2199, _2199, _2209);
    float _2213 = rsqrt(_2211);
    float _2215 = _2205 * _2213;
    float _2217 = _2199 * _2213;
    float _2219 = _2195 * _2213;
    float _2221 = _2009 * _2215;
    float _2223 = _2011 * _2217;
    float _2225 = -_2221;
    float _2227 = fma(_2007, _2217, _2225);
    float _2229 = _2007 * _2219;
    float _2231 = -_2223;
    float _2233 = fma(_2009, _2219, _2231);
    float _2235 = _2227 * _2227;
    float _2237 = -_2229;
    float _2239 = fma(_2011, _2215, _2237);
    float _2241 = fma(_2233, _2233, _2235);
    float _2243 = fma(_2239, _2239, _2241);
    float _2245 = rsqrt(_2243);
    float _2247 = _2239 * _2245;
    float _2249 = _2227 * _2245;
    float _2251 = _2233 * _2245;
    float _2253 = _2007 * _2247;
    float _2255 = in.m_65.x;
    float _2257 = in.m_65.y;
    float _2259 = in.m_65.z;
    float _2261 = _2009 * _2249;
    float _2263 = _2011 * _2251;
    float _2265 = -_2253;
    float _2267 = fma(_2009, _2251, _2265);
    float _2269 = -_2261;
    float _2271 = fma(_2011, _2247, _2269);
    float _2273 = -_2263;
    float _2275 = fma(_2007, _2249, _2273);
    float _2277 = _2267 * _2267;
    float _2279 = fma(_2271, _2271, _2277);
    float _2281 = fma(_2275, _2275, _2279);
    float _2283 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2285 = rsqrt(_2281);
    float _2287 = _2115 * _2255;
    float _2289 = _2165 * _2257;
    float _2291 = _2283 * _2041;
    float _2293 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2287);
    float _2297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2289);
    float _2299 = _2149 * _2259;
    float _2301 = _2293 * _2041;
    float _2303 = _2049 * _2295;
    float _2305 = _2291 * _2297;
    float _2307 = _2299 * _2301;
    float _2309 = _2303 * _2285;
    float _2311 = _2305 * _2249;
    float _2313 = _2305 * _2251;
    float _2315 = _2305 * _2247;
    float _2317 = _2301 + (-1.0);
    float _2319 = fma(_2267, _2309, _2311);
    float _2321 = fma(_2271, _2309, _2313);
    float _2323 = fma(_2275, _2309, _2315);
    float _2325 = fma(_2011, _2307, _2319);
    float _2327 = fma(_2007, _2307, _2321);
    float _2329 = fma(_2009, _2307, _2323);
    float _2331 = _2291 + (-1.0);
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2335 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2337 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2333);
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2341 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2335);
    float _2343 = _855 + _2325;
    float _2345 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2337);
    float _2347 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2339);
    float _2349 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2341);
    float _2351 = _2049 + (-1.0);
    float _2353 = _2317 * _2345;
    float _2355 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2347);
    float _2357 = _2331 * _2349;
    float _2359 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2361 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2363 = _2355 * _2351;
    float _2365 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2367 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2359);
    float _2369 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2361);
    float _2371 = _1375 + _2329;
    float _2373 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2365);
    float _2375 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2367);
    float _2377 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2369);
    float _2379 = _1385 + _2327;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2373);
    float _2383 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2385 = _2371 + _2377;
    float _2387 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2389 = _2379 + _2381;
    float _2391 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2395 = _2385 + _2393;
    float _2397 = 1.0 / _2387;
    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2401 = _2389 + _2399;
    float _2403 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2391);
    float _2405 = _2395 * _2395;
    float _2407 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2383);
    float _2409 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2403);
    float _2411 = fma(_2401, _2401, _2405);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2407);
    bool _2415 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(0.5);
    bool _2423 = _2419 || _2421;
    float _2425 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2427 = sqrt(_2411);
    float _2429 = _2425 + _2387;
    float _2431 = _2429 * _2397;
    float _2433 = _2431 * 0.5;
    float _2435 = _2343 + _2413;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2439 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2437);
    bool _2441 = _2427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2443 = 1.0 / _2439;
    bool _2445 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(0.5);
    bool _2453 = _2449 || _2451;
    float _2455 = _2413;
    float _2457 = _2407;
    float _2459 = _2389;
    float _2461 = _2343;
    if (!_2441)
    {
        _2455 = _2385;
    }
    float _2463 = _2455;
    float _2465 = _2463;
    if (!_2441)
    {
        _2457 = _2435;
    }
    float _2467 = _2457;
    bool _2469 = !_2441;
    float _2471 = _2467;
    if (!_2469)
    {
        float _2473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2477 = _2427 + _2475;
        float _2479 = rsqrt(_2411);
        float _2481 = _2477 * _2473;
        float _2483 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2485 = _2481 * 0.15915493667125701904296875;
        float _2487 = _2485 * 6.283185482025146484375;
        float _2489 = cos(_2487);
        float _2491 = _2485 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        float _2495 = _2489 + (-1.0);
        float _2497 = fma(_2493, _2483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2499 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2501 = _2479 * _2497;
        float _2503 = fma(_2435, _2489, _2499);
        float _2505 = fma(_2401, _2501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2507 = fma(_2395, _2501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2459 = _2505;
        _2471 = _2503;
        _2465 = _2507;
        _2461 = _2501;
    }
    float _2509 = _2459;
    float _2511 = _2471;
    float _2513 = _2465;
    float _2515 = _2461;
    float _2517 = -_1905;
    float _2519 = _2517 + _2509;
    float _2521 = -_1907;
    float _2523 = _2521 + _2511;
    float _2525 = -_1913;
    float _2527 = _2525 + _2513;
    float _2529 = _2515;
    float _2531 = _2523;
    float _2533 = _2519;
    float _2535 = _2527;
    float _2537 = _2513;
    if (_2453)
    {
        _2529 = 1.0;
    }
    float _2539 = _2529;
    float _2541 = _2539;
    if (!_2423)
    {
        float _2543 = _1921 * _1921;
        float _2545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2547 = -_1375;
        float _2549 = _2547 + _2513;
        float _2551 = -_855;
        float _2553 = _2551 + _2511;
        float _2555 = fma(_1929, _1929, _2543);
        float _2557 = fma(_1935, _1935, _2555);
        float _2559 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2561 = sqrt(_2557);
        float _2563 = 1.0 / _2041;
        float _2565 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2567 = precise::min(_2561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2569 = _2567 * _2545;
        float _2571 = _2569 * _2563;
        float _2573 = -_1385;
        float _2575 = _2573 + _2509;
        float _2577 = _2565 * _2571;
        float _2579 = _2549 * _2571;
        float _2581 = fma(_2575, _2577, _1917);
        float _2583 = fma(_2553, _2577, _1911);
        float _2585 = fma(_2565, _2579, _1925);
        _2531 = _2583;
        _2533 = _2581;
        _2535 = _2585;
        _2537 = _2579;
    }
    float _2587 = _2531;
    float _2589 = _2533;
    float _2591 = _2535;
    float _2593 = _2537;
    float _2595 = _2593;
    if (_2453)
    {
        _2595 = 1.0;
    }
    float _2597 = _2595;
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2601 = _2443 * _2599;
    float _2603 = _2597;
    if (!_2453)
    {
        float _2605 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2607 = _2605 * 0.15915493667125701904296875;
        float _2609 = _2607 * 6.283185482025146484375;
        float _2611 = cos(_2609);
        float _2613 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2615 = _2613 * 0.15915493667125701904296875;
        float _2617 = _2607 * 6.283185482025146484375;
        float _2619 = sin(_2617);
        float _2621 = 1.0 / _2611;
        float _2623 = _2615 * 6.283185482025146484375;
        float _2625 = cos(_2623);
        float _2627 = _2619 * _2621;
        float _2629 = _2615 * 6.283185482025146484375;
        float _2631 = sin(_2629);
        float _2633 = _2625 * _2627;
        float _2635 = 1.0 / _2633;
        float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2639 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2637;
        float _2641 = 1.0 / _2639;
        float _2643 = _2631 * _2635;
        float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2647 = fma(_2601, _2643, _2645);
        float _2649 = _2647 * _2641;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        _857 = _2641;
        _2541 = _2651;
    }
    float _2653 = _857;
    float _2655 = _2541;
    float _2657 = _2653;
    if (!_2453)
    {
        float _2659 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2661 = _2659 * 0.15915493667125701904296875;
        float _2663 = _2661 * 6.283185482025146484375;
        float _2665 = cos(_2663);
        float _2667 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2669 = _2667 * 0.15915493667125701904296875;
        float _2671 = _2661 * 6.283185482025146484375;
        float _2673 = sin(_2671);
        float _2675 = 1.0 / _2665;
        float _2677 = _2669 * 6.283185482025146484375;
        float _2679 = cos(_2677);
        float _2681 = _2673 * _2675;
        float _2683 = _2669 * 6.283185482025146484375;
        float _2685 = sin(_2683);
        float _2687 = _2679 * _2681;
        float _2689 = 1.0 / _2687;
        float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2693 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2691;
        float _2695 = 1.0 / _2693;
        float _2697 = _2685 * _2689;
        float _2699 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2701 = fma(_2601, _2697, _2699);
        float _2703 = _2701 * _2695;
        float _2705 = precise::clamp(_2703, 0.0, 1.0);
        float _2707 = -_2705;
        float _2709 = _2707 + 1.0;
        _2657 = _2675;
        _2603 = _2709;
    }
    float _2711 = _2657;
    float _2713 = _2603;
    float _2715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2717 = _2587 + _2715;
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2721 = _2589 + _2719;
    float _2723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2725 = _2591 + _2723;
    float _2727 = _2717 * _2717;
    float _2729 = fma(_2721, _2721, _2727);
    float _2731 = fma(_2725, _2725, _2729);
    float _2733 = rsqrt(_2731);
    float _2735 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2737 = _2721 * _2735;
    float _2739 = _2725 * _2735;
    float _2741 = _2737 * _2737;
    float _2743 = _2739 * _2739;
    float _2745 = _2741 + _2743;
    float _2747 = sqrt(_2745);
    bool _2749 = _2747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2753 = _2747 + _2751;
    float _2755 = _2733;
    float _2757 = _2711;
    float _2759 = _2753;
    float _2761 = _2717;
    float _2763 = _2737;
    if (_2749)
    {
        float _2765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2755 = _2765;
    }
    float _2767 = _2755;
    if (_2749)
    {
        float _2769 = rsqrt(_2745);
        _2757 = _2769;
    }
    float _2771 = _2757;
    float _2773 = _2771;
    if (_2749)
    {
        float _2775 = _2753 * _2767;
        _2759 = _2775;
    }
    float _2777 = _2759;
    if (_2749)
    {
        float _2779 = _2777 * 0.15915493667125701904296875;
        _1943 = _2779;
    }
    float _2781 = _1943;
    float _2783 = _2725;
    if (_2749)
    {
        float _2785 = _2781 * 6.283185482025146484375;
        float _2787 = sin(_2785);
        _2783 = _2787;
    }
    float _2789 = _2783;
    float _2791 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2793 = precise::max(0.0, _2791);
    float _2795 = _2767;
    float _2797 = _2793;
    if (_2749)
    {
        float _2799 = _2781 * 6.283185482025146484375;
        float _2801 = cos(_2799);
        _2795 = _2801;
    }
    float _2803 = _2795;
    float _2805 = -_2735;
    float _2807 = -_2793;
    float _2809 = fma(_2717, _2805, _2807);
    float _2811 = _2809;
    if (_2749)
    {
        float _2813 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2761 = _2813;
    }
    float _2815 = _2761;
    float _2817 = sqrt(_2731);
    float _2819 = _2815;
    float _2821 = _2789;
    if (_2749)
    {
        float _2823 = fma(_2789, _2815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2819 = _2823;
    }
    float _2825 = _2819;
    float _2827 = _2825;
    if (!_2749)
    {
        _2821 = _2741;
    }
    float _2829 = _2821;
    float _2831 = _2829;
    if (_2749)
    {
        float _2833 = _2803 + (-1.0);
        _2797 = _2833;
    }
    float _2835 = _2797;
    float _2837 = _2835;
    if (_2749)
    {
        float _2839 = _2771 * _2825;
        _1945 = _2839;
    }
    float _2841 = _1945;
    if (!_2749)
    {
        _2827 = _2743;
    }
    float _2843 = _2827;
    float _2845 = _2843;
    if (_2749)
    {
        float _2847 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2773 = _2847;
    }
    float _2849 = _2773;
    if (_2749)
    {
        float _2851 = _2737 * _2841;
        _2763 = _2851;
    }
    float _2853 = _2763;
    if (!_2749)
    {
        _2837 = _2739;
    }
    float _2855 = _2837;
    float _2857 = _2855;
    if (_2749)
    {
        float _2859 = _2739 * _2841;
        _2857 = _2859;
    }
    float _2861 = _2857;
    if (_2749)
    {
        float _2863 = fma(_2809, _2803, _2849);
        _2811 = _2863;
    }
    float _2865 = _2811;
    if (_2749)
    {
        float _2867 = _2853 * _2853;
        _2831 = _2867;
    }
    float _2869 = _2831;
    if (_2749)
    {
        float _2871 = _2861 * _2861;
        _2845 = _2871;
    }
    float _2873 = _2845;
    float _2875 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2877 = fma(_2865, _2865, _2869);
    float _2879 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2883 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2881);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2875);
    float _2889 = _2877 + _2873;
    float _2891 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2893 = -_2885;
    float _2895 = _2893 + 1.0;
    float _2897 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2899 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2887);
    float _2901 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2891);
    float _2903 = rsqrt(_2889);
    float _2905 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2907 = _2899 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2909 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2901);
    float _2911 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2905);
    float _2913 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2897);
    float _2915 = _2909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2917 = abs(_2895);
    float _2919 = log2(_2917);
    float _2921 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2911);
    float _2923 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2925 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2913);
    float _2927 = _2921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2929 = -_2923;
    float _2931 = fma(_2929, _2879, 1.0);
    float _2933 = _2903 * _2853;
    float _2935 = _2903 * _2865;
    float _2937 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2939 = _2925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2941 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2943 = _2903 * _2861;
    float _2945 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2937);
    float _2947 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2949 = -_2941;
    float _2951 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2949);
    float _2953 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2955 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2945);
    float _2957 = log2(_2931);
    float _2959 = -_2943;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2951);
    float _2963 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2965 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2955);
    float _2967 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2947);
    float _2969 = fma(_2961, -0.5, 0.5);
    float _2971 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2963);
    float _2973 = fma(_2961, 0.5, 0.5);
    float _2975 = exp2(_2953);
    float _2977 = _2935 + 1.0;
    float _2979 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2967);
    float _2981 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2971);
    float _2983 = fma(_2973, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2985 = 1.0 / _2965;
    float _2987 = fma(_2973, _2983, -0.212114393711090087890625);
    float _2989 = _2957 * 0.693147182464599609375;
    float _2991 = fma(_2973, _2987, 1.570728778839111328125);
    float _2993 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2995 = sqrt(_2969);
    float _2997 = -_2935;
    float _2999 = fma(_2975, _2977, _2997);
    float _3001 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2979);
    float _3003 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2981);
    float _3005 = fma(_2999, 0.5, 0.5);
    float _3007 = _3001 * _2985;
    float _3009 = _3003 * _2985;
    float _3011 = fma(_3007, 0.5, 0.5);
    float _3013 = fma(_3009, -0.5, 0.5);
    float _3015 = _2995 * 0.636619746685028076171875;
    float3 _7629 = float3(_3011, _3013, _2993);
    float _3017 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7629, float3(0.0), isnan(_7629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7629, float3(0.0), isnan(_7629)), level(0.0)).x;
    float3 _7640 = float3(_3011, _3013, _2993);
    float4 _3020 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).xyzw;
    float _3022 = _3020.x;
    float _3024 = _3020.y;
    float _3026 = _3020.z;
    float _3028 = _3020.w;
    float _3030 = -_2991;
    float _3032 = fma(_3015, _3030, 1.0);
    float2 _7662 = float2(_3032, _3005);
    float3 _3036 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7662, float2(0.0), isnan(_7662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7662, float2(0.0), isnan(_7662)), level(0.0)).xyz;
    float _3038 = _3036.x;
    float _3040 = _3036.y;
    float _3042 = _3036.z;
    float _3044 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3046 = _2655 * _2713;
    float _3048 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3050 = _2655 > 0.0;
    bool _3052 = isnan(_2655);
    bool _3054 = _3050 || _3052;
    bool _3056 = isnan(0.0);
    bool _3058 = _3054 || _3056;
    out.m_53.w = _462;
    float _3060 = _3046 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3062 = exp2(_3044);
    float _3064 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3048);
    bool _3066 = _2713 <= 0.0;
    bool _3068 = !_3058;
    bool _3070 = _3066 || _3068;
    float _3072 = _3060 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3074 = _2965 * 0.5;
    float _3076 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3064);
    float _3078 = _3001 + _2965;
    out.m_63.w = _1899;
    float _3080 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3076);
    out.m_67.x = _1917;
    out.m_67.y = _1911;
    out.m_67.z = _1925;
    float _3082 = _3078 * 0.5;
    float _3084 = _3080 + _2965;
    out.m_45.x = _3072;
    float _3086 = -_3062;
    float _3088 = _3086 + 1.0;
    float _3090 = _3084 * 0.5;
    float _3092 = fma(_3003, -0.5, _3074);
    out.gl_Position.x = _3001;
    out.gl_Position.y = _3003;
    out.gl_Position.z = _3080;
    out.gl_Position.w = _2965;
    float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3082;
    out.m_69.y = _3092;
    out.m_69.z = _3090;
    out.m_69.w = _2965;
    float _3096 = -_3094;
    float _3098 = _3096 + 1.0;
    float _3100 = _3094 * _3017;
    float _3102 = _3028 * _3098;
    float _3104 = _3028 * _3100;
    float _3106 = _3042 * _3100;
    float _3108 = fma(_3038, _3104, _3022);
    float _3110 = fma(_3040, _3104, _3024);
    float _3112 = fma(_3028, _3106, _3026);
    out.m_71.x = _3108;
    out.m_71.y = _3110;
    out.m_71.z = _3112;
    out.m_71.w = _3102;
    if (!_3070)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3114 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3114;
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
    bool _490 = false;
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
        float _3170 = as_type<float>(_106);
        out.gl_Position.z = _3170;
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
        float _3238 = as_type<float>(_142);
        out.gl_Position.z = _3238;
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
    bool _328 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _330 = isnan(_318);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _348 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _350 = isnan(_318);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _326;
    float _362 = -_338;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _366;
    bool _370 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _372 = isnan(_318);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _358 * _364;
    float _384 = -_358;
    float _386 = _384 + 1.0;
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _390 = 1.0 / _342;
    float _392 = _380 * _386;
    float _394 = -_380;
    float _396 = _394 + 1.0;
    float _398 = 1.0 / _346;
    float _400 = _368 * _360;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _406 = fma(_400, _322, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _408 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _410 = isnan(_318);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _404 * _390;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _428 = _318 + _426;
    float _430 = _406 * _392;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _434 = _318 + _432;
    float _436 = fma(_420, _428, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _438 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[115].x, _430);
    float _440 = _424 * _398;
    float _442 = -_418;
    float _444 = _442 + 1.0;
    float _446 = fma(_436, _382, _438);
    float _448 = fma(_440, _434, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _450 = _338 * _444;
    float _452 = fma(_448, _450, _446);
    float _454 = in.m_49.x;
    float _456 = in.m_49.y;
    float _458 = in.m_49.z;
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[118].x, _452);
    float _462 = _460 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _462;
    float _464 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _466 = _456 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _470 = !_388;
    float _488;
    if (!_470)
    {
        float _472 = in.m_51.x;
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _476 = _472 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _478 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _480 = _478 * _474;
        float _482 = floor(_480);
        float _484 = -_482;
        float _486 = _480 + _484;
        _488 = _486;
        _490 = true;
    }
    else
    {
        float _492 = float(_90);
        float _494 = 1.0 / _492;
        float _496 = _122 * _494;
        _488 = _496;
    }
    _490 = false;
    float _498 = _488;
    float _500 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _502 = int(_500);
    float _504 = in.m_55.y;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _508 = _506 != 0;
    float _510 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _512 = int(_510);
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _520 = _518 != 0;
    float _522 = float(_90);
    float _524 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _526 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _528 = int(_526);
    float _530 = float(_502);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _536 = 1.0 / _530;
    float _538 = float(_512);
    float _540 = -_504;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _556 = float(uint(_528));
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _560 = int(_558);
    int _562 = ~_528;
    int _564 = _562 + 1;
    float _566 = float(_528);
    float _568 = _122 * _536;
    float _570 = 1.0 / _538;
    float _572 = 1.0 / _556;
    float _574 = float(uint(_560));
    int _576 = ~_560;
    int _578 = _576 + 1;
    float _580 = trunc(_568);
    int _582 = int(_580);
    float _584 = _122 * _570;
    int _586 = as_type<int>(_572) + (-2);
    float _588 = 1.0 / _574;
    float _590 = float(uint(_582));
    float _592 = trunc(_584);
    int _594 = int(_592);
    float _596 = as_type<float>(_586) * _590;
    float _598 = trunc(_596);
    float _600 = precise::max(_598, 0.0);
    uint _603 = uint(_600);
    int _605 = as_type<int>(_588) + (-2);
    float _607 = in.m_55.x;
    float _609 = float(uint(_594));
    float _611 = 1.0 / _534;
    float _613 = float(_594);
    float _615 = as_type<float>(_605) * _609;
    int _617 = _564 * int(_603);
    int _619 = _617 + _582;
    float _621 = trunc(_615);
    float _623 = precise::max(_621, 0.0);
    uint _625 = uint(_623);
    float _627 = in.m_51.z;
    float _629 = float(uint(_619));
    float _631 = in.m_51.y;
    float _633 = 1.0 / _546;
    float _635 = as_type<float>(_586) * _629;
    float _637 = _550 * _611;
    float _639 = in.m_51.x;
    int _641 = _578 * int(_625);
    int _643 = _641 + _594;
    float _645 = trunc(_635);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    float _651 = float(uint(_643));
    float _653 = _554 * _633;
    bool _655 = _627 > 0.5;
    float _657 = as_type<float>(_605) * _651;
    float _659 = _651;
    float _661 = _504;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _665 = _607;
    if (!_508)
    {
        _659 = _607;
    }
    float _667 = _659;
    float _669 = 1.0 / _522;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _498 + _671;
    bool _675 = _631 > 0.5;
    int _677 = int(_603) + int(_649);
    int _679 = int(_649);
    bool _681 = _675;
    float _683 = _667;
    if (_508)
    {
        float _685 = -_607;
        float _687 = _685 + 1.0;
        _679 = as_type<int>(_687);
    }
    int _689 = _679;
    int _691 = _675 ? as_type<int>(_542) : as_type<int>(_504);
    float _693 = trunc(_657);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    if (_508)
    {
        bool _699 = _639 > 0.5;
        _681 = _699;
    }
    bool _701 = _681;
    float _703 = _639 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _705 = ~_528;
    int _707 = _705 + 1;
    float _709 = _520 ? as_type<float>(_691) : _504;
    if (_516)
    {
        float _711 = _655 ? _542 : _504;
        _661 = _711;
    }
    float _713 = _661;
    int _715 = _707 * _677;
    int _717 = _715 + _582;
    if (_508)
    {
        float _719 = _701 ? as_type<float>(_689) : _607;
        _683 = _719;
    }
    float _721 = _683;
    float _723 = _122 * _669;
    int _725 = ~_560;
    int _727 = _725 + 1;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _735 = _733 != 0;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _739 = _737 != 0;
    int _741 = int(_625) + int(_697);
    bool _743 = uint(_717) >= uint(_528);
    bool _745 = !_731;
    int _747 = _745 ? 0 : 1;
    int _749 = _727 * _741;
    int _751 = _749 + _594;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _755 = _753 != 0;
    bool _757 = !_743;
    int _759 = _757 ? 0 : (-1);
    bool _761 = !_735;
    int _763 = _761 ? 0 : 1;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _783 = _781 != 0;
    bool _785 = !_755;
    int _787 = _785 ? 0 : 1;
    bool _789 = uint(_751) >= uint(_560);
    bool _791 = !_783;
    int _793 = _791 ? 0 : 1;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _797 = _795 != 0;
    float _799 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _801 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _803 = !_789;
    int _805 = _803 ? 0 : (-1);
    bool _807 = !_771;
    int _809 = _807 ? 0 : 1;
    float _811 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _799);
    bool _813 = !_767;
    int _815 = _813 ? 0 : 1;
    float _817 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _801);
    bool _819 = !_775;
    int _821 = _819 ? 0 : 1;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _831 = _829 != 0;
    float _833 = -_823;
    float _835 = fma(_703, 2.0, _833);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _843 = _841 != 0;
    float _845 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
    if (_797)
    {
        _290 = 1.0;
    }
    float _847 = _290;
    float _849 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    float _851 = _847;
    if (!_797)
    {
        _851 = 7.345489978790283203125;
    }
    float _853 = _851;
    float _855 = _849 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _857 = _855;
    if (_797)
    {
        _663 = _639;
    }
    float _859 = _663;
    float _861 = _853 * _639;
    float _863 = 0.0;
    float _865 = _859;
    if (_797)
    {
        _863 = 1.0;
    }
    float _867 = _863;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _871 = _867;
    if (!_797)
    {
        _865 = _631;
    }
    float _873 = _865;
    float _875 = _631 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_797)
    {
        _871 = 1.2345600128173828125;
    }
    float _877 = _871;
    float _879 = floor(_861);
    int _881 = ~_677;
    int _883 = _881 + _759;
    int _885 = _883 + 1;
    float _887 = fma(_875, -2.0, _869);
    float _889 = float(_582);
    float _891 = _873 * _877;
    float _893 = float(_560);
    float _895 = fma(_637, _673, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _897 = _889 >= _566;
    bool _899 = isnan(_889);
    bool _901 = _897 || _899;
    bool _903 = isnan(_566);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = floor(_891);
    float _911 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _845);
    bool _913 = _613 >= _893;
    bool _915 = isnan(_613);
    bool _917 = _913 || _915;
    bool _919 = isnan(_893);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _817);
    int _927 = abs(_763);
    bool _929 = !_739;
    int _931 = _929 ? 0 : 1;
    float _933 = trunc(_907);
    int _935 = int(_933);
    float _937 = -_879;
    float _939 = _861 + _937;
    bool _941 = !_779;
    int _943 = _941 ? 0 : 1;
    bool _945 = _528 == 0;
    float _947 = _939 * _566;
    bool _949 = _631 > 0.5;
    float _951 = trunc(_923);
    int _953 = int(_951);
    float _955 = -_909;
    float _957 = _891 + _955;
    int _959 = _528 * _885;
    int _961 = _959 + _582;
    int _963 = ~_741;
    int _965 = _963 + _805;
    int _967 = _965 + 1;
    float _969 = _723 * _566;
    float _971 = _723 * _893;
    float _973 = _957 * _893;
    bool _975 = !_945;
    int _977 = _975 ? _961 : (-1);
    int _979 = _560 * _967;
    int _981 = _979 + _594;
    int _983 = ~_935;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    float _989 = trunc(_969);
    int _991 = int(_989);
    bool _993 = !_831;
    int _995 = _993 ? 0 : 1;
    bool _997 = _560 == 0;
    int _999 = _977 * _987;
    int _1001 = _528 + (-1);
    int _1003 = ~_953;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    float _1009 = trunc(_947);
    int _1011 = int(_1009);
    bool _1013 = !_997;
    int _1015 = _1013 ? _981 : (-1);
    int _1017 = _935 * _1001;
    int _1019 = _1017 + _999;
    int _1021 = _560 + (-1);
    int _1023 = abs(_747);
    int _1025 = _1015 * _1007;
    float _1027 = trunc(_973);
    int _1029 = int(_1027);
    int _1031 = _953 * _1021;
    int _1033 = _1031 + _1025;
    int _1035 = abs(_809);
    int _1037 = _1019 * _927;
    int _1039 = abs(_995);
    int _1041 = abs(_815);
    float _1043 = trunc(_971);
    int _1045 = int(_1043);
    int _1047 = abs(_787);
    int _1049 = _991 * _1023;
    int _1051 = _1049 + _1037;
    int _1053 = _1033 * _1035;
    int _1055 = _1011 * _1047;
    int _1057 = _1055 + _582;
    int _1059 = abs(_931);
    int _1061 = _1029 * _1039;
    int _1063 = _1061 + _594;
    int _1065 = abs(_793);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1069 = _498 + _1067;
    int _1071 = abs(_821);
    int _1073 = _1057 * _1059;
    int _1075 = _1073 + _1051;
    float _1077 = fma(_653, _1069, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1079 = abs(_943);
    int _1081 = _1045 * _1041;
    int _1083 = _1081 + _1053;
    float _1085 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1087 = _1011 * _1065;
    int _1089 = _1087 + _1075;
    bool _1091 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1093 = isnan(_498);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    int _1103 = _1063 * _1071;
    int _1105 = _1103 + _1083;
    bool _1107 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1109 = isnan(_498);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1121 = float(uint(_1089));
    int _1123 = _1029 * _1079;
    int _1125 = _1123 + _1105;
    float _1127 = -_1101;
    float _1129 = _1127 + 1.0;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1133 = _1037;
    if (_797)
    {
        _1133 = 0;
    }
    int _1135 = _1133;
    float _1137 = as_type<float>(_586) * _1121;
    float _1139 = float(uint(_1125));
    float _1141 = _1117 * _1129;
    float _1143 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    int _1145 = _1135;
    if (!_797)
    {
        _1145 = 2;
    }
    int _1147 = _1145;
    float _1149 = as_type<float>(_605) * _1139;
    float _1151 = trunc(_1137);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    bool _1157 = _498 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1159 = isnan(_498);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1143);
    float _1171 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _887);
    float _1173 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1175 = _1147 != 2;
    float _1177 = -_1117;
    float _1179 = _1177 + 1.0;
    float _1181 = -_1171;
    float _1183 = fma(_1169, _1085, _1181);
    float _1185 = trunc(_1149);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    int _1191 = ~_528;
    int _1193 = _1191 + 1;
    float _1195 = fma(_1173, _713, -0.5);
    int _1197 = as_type<int>(_1173);
    float _1199 = as_type<float>(_1193);
    if (_839)
    {
        float _1201 = -_607;
        float _1203 = _1201 + 1.0;
        _1197 = as_type<int>(_1203);
    }
    int _1205 = _1197;
    int _1207 = ~_560;
    int _1209 = _1207 + 1;
    float _1211 = _1167 * _1179;
    float _1213 = -_1167;
    float _1215 = _1213 + 1.0;
    if (!_839)
    {
        _1199 = _607;
    }
    float _1217 = _1199;
    float _1219 = _895 * _1211;
    float _1221 = _1217;
    if (_839)
    {
        float _1223 = _949 ? as_type<float>(_1205) : _607;
        _1221 = _1223;
    }
    float _1225 = _1221;
    int _1227 = _1193 * int(_1155);
    int _1229 = _1227 + _1089;
    float _1231 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1219);
    if (_1175)
    {
        _665 = _639;
    }
    float _1233 = _665;
    float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1237 = _1233;
    if (!_1175)
    {
        _1237 = _627;
    }
    float _1239 = _1237;
    int _1241 = _1209 * int(_1189);
    int _1243 = _1241 + _1125;
    float _1245 = float(uint(_1229));
    float _1247 = fma(_1077, _1141, _1231);
    float _1249 = float(uint(_1057));
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1253 = float(uint(_1243));
    float _1255 = as_type<float>(_586) * _1245;
    float _1257 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1247);
    float _1259 = as_type<float>(_605) * _1253;
    float _1261 = trunc(_1255);
    float _1263 = precise::max(_1261, 0.0);
    uint _1265 = uint(_1263);
    float _1267 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1271 = -_122;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1277 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1269);
    float _1279 = trunc(_1259);
    float _1281 = precise::max(_1279, 0.0);
    uint _1283 = uint(_1281);
    float _1285 = as_type<float>(_586) * _1249;
    float _1287 = float(uint(_1063));
    float _1289 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1277);
    float _1291 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1293 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1275);
    float _1295 = _1249;
    if (_1175)
    {
        _1295 = _631;
    }
    float _1297 = _1295;
    float _1299 = as_type<float>(_605) * _1287;
    float _1301 = trunc(_1285);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1309 = fma(_1289, _1267, _1273);
    float _1311 = fma(_1291, _1225, -0.5);
    int _1313 = ~_528;
    int _1315 = _1313 + 1;
    float _1317 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1307);
    float _1319 = _1297;
    if (!_1175)
    {
        _1319 = _639;
    }
    float _1321 = _1319;
    float _1323 = trunc(_1299);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    int _1329 = int(_1189) + int(_1283);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1333 = int(_1155) + int(_1265);
    float _1335 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1337 = ~_528;
    int _1339 = _1337 + 1;
    float _1341 = -_1331;
    float _1343 = fma(_1251, 2.0, _1341);
    int _1345 = ~_560;
    int _1347 = _1345 + 1;
    int _1349 = _1315 * int(_1305);
    int _1351 = _1349 + _1057;
    int _1353 = ~_560;
    int _1355 = _1353 + 1;
    int _1357 = _1339 * _1333;
    int _1359 = _1357 + _1089;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _855 + _1361;
    float _1365 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1293);
    float _1367 = float(uint(_1351));
    int _1369 = _1347 * _1329;
    int _1371 = _1369 + _1125;
    bool _1373 = uint(_1359) >= uint(_528);
    float _1375 = _925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1377 = -_122;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1343);
    float _1381 = as_type<float>(_586) * _1367;
    bool _1383 = uint(_1371) >= uint(_560);
    float _1385 = _911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1387 = _1355 * int(_1327);
    int _1389 = _1387 + _1063;
    bool _1391 = !_1373;
    int _1393 = _1391 ? 0 : (-1);
    float _1395 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1385 + _1397;
    float _1401 = trunc(_1381);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = ~_1333;
    int _1409 = _1407 + _1393;
    int _1411 = _1409 + 1;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1415 = _1375 + _1413;
    float _1417 = float(uint(_1389));
    float _1419 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1395);
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1423 = _528 * _1411;
    int _1425 = _1423 + _1089;
    float _1427 = _1309 + 0.5;
    float _1429 = as_type<float>(_605) * _1417;
    bool _1431 = !_1383;
    int _1433 = _1431 ? 0 : (-1);
    float _1435 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1419);
    float _1437 = fma(_1335, -2.0, _1421);
    bool _1439 = !_945;
    int _1441 = _1439 ? _1425 : (-1);
    int _1443 = ~_1329;
    int _1445 = _1443 + _1433;
    int _1447 = _1445 + 1;
    float _1449 = trunc(_1429);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    bool _1455 = _1435 >= 0.0;
    int _1457 = _1441 >> 31;
    int _1459 = _560 * _1447;
    int _1461 = _1459 + _1125;
    int _1463 = _1441 & 3;
    bool _1465 = _1463 != 0;
    int _1467 = int(_1305) + int(_1405);
    float _1469 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1437);
    int _1471 = _1457 & 3;
    int _1473 = ~_528;
    int _1475 = _1473 + 1;
    float _1477 = -_1469;
    float _1479 = fma(_1365, _1195, _1477);
    bool _1481 = !_1465;
    int _1483 = _1481 ? 0 : 1;
    if (_1455)
    {
        out.m_45.x = 0.0;
    }
    int _1485 = _1441 & 3;
    bool _1487 = _1485 != 0;
    bool _1489 = !_997;
    int _1491 = _1489 ? _1461 : (-1);
    int _1493 = _1441 + _1471;
    int _1495 = _1475 * _1467;
    int _1497 = _1495 + _1057;
    int _1499 = _1491 >> 31;
    bool _1501 = uint(_1463) > 1u;
    int _1503 = _1493 >> 2;
    int _1505 = int(_1327) + int(_1453);
    int _1507 = _1499 & 3;
    int _1509 = _1503 << 4;
    int _1511 = _1509 + 368;
    int _1513 = _1487 ? 0 : 1;
    bool _1515 = uint(_1497) >= uint(_528);
    int _1517 = _1491 + _1507;
    uint _1519 = uint(int(uint(_1511) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[int(_1529)][_1531];
    int _1535 = ~_1513;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    int _1541 = _1517 >> 2;
    int _1543 = _1539;
    if (!_1501)
    {
        int _1545 = ~_1513;
        int _1547 = _1545 + 1;
        _1543 = _1547;
    }
    int _1549 = _1543;
    float _1551 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1317);
    bool _1553 = uint(_1463) >= 2u;
    int _1555 = _1541 << 4;
    int _1557 = _1555 + 512;
    float _1559 = fma(_1551, _1311, _1379);
    int _1561 = ~_560;
    int _1563 = _1561 + 1;
    int _1565 = _1511 + 8;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
    int _1571 = int(_1567) & 3;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[int(_1569)][_1571];
    int _1575 = int(_1567) + 1;
    uint _1577 = uint(int(uint(_1575) >> uint(2)));
    int _1579 = _1575 & 3;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[int(_1577)][_1579];
    int _1583 = _1553 ? 0 : 1;
    float _1585 = _1183 + 0.5;
    bool _1587 = _1463 != 3;
    int _1589 = _1563 * _1505;
    int _1591 = _1589 + _1063;
    bool _1593 = !_1515;
    int _1595 = _1593 ? 0 : (-1);
    int _1597 = abs(_1549);
    uint _1599 = uint(int(uint(_1557) >> uint(2)));
    uint _1601 = uint(int(uint(int(_1599)) >> uint(2)));
    int _1603 = int(_1599) & 3;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[int(_1601)][_1603];
    int _1607 = int(_1599) + 1;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    int _1611 = _1607 & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = ~_1467;
    int _1617 = _1615 + _1595;
    int _1619 = _1617 + 1;
    out.m_57.x = _1427;
    out.m_57.y = _1585;
    bool _1621 = uint(_1591) >= uint(_560);
    int _1623 = ~_1583;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    int _1629 = _528 * _1619;
    int _1631 = _1629 + _1057;
    bool _1633 = !_1621;
    int _1635 = _1633 ? 0 : (-1);
    int _1637 = _1557 + 8;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[int(_1649)][_1651];
    int _1655 = _1627;
    if (_1587)
    {
        int _1657 = ~_1583;
        int _1659 = _1657 + 1;
        _1655 = _1659;
    }
    int _1661 = _1655;
    int _1663 = _1491 & 3;
    bool _1665 = _1663 != 0;
    int _1667 = _1491 & 3;
    bool _1669 = _1667 != 0;
    int _1671 = _1665 ? 0 : 1;
    bool _1673 = uint(_1667) > 1u;
    int _1675 = ~_1505;
    int _1677 = _1675 + _1635;
    int _1679 = _1677 + 1;
    bool _1681 = !_1669;
    int _1683 = _1681 ? 0 : 1;
    bool _1685 = uint(_1667) >= 2u;
    int _1687 = _560 * _1679;
    int _1689 = _1687 + _1063;
    int _1691 = _1685 ? 0 : 1;
    bool _1693 = _1667 != 3;
    int _1695 = ~_1671;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    int _1701 = _1699;
    if (!_1673)
    {
        int _1703 = ~_1671;
        int _1705 = _1703 + 1;
        _1701 = _1705;
    }
    int _1707 = _1701;
    int _1709 = ~_1597;
    int _1711 = _1709 + 1;
    int _1713 = _1711 + 1;
    int _1715 = abs(_1483);
    int _1717 = abs(_1707);
    int _1719 = _1713 * as_type<int>(_1533);
    int _1721 = ~_1691;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    int _1727 = _1725;
    if (_1693)
    {
        int _1729 = ~_1691;
        int _1731 = _1729 + 1;
        _1727 = _1731;
    }
    int _1733 = _1727;
    int _1735 = abs(_1683);
    int _1737 = ~_1717;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = abs(_1733);
    int _1745 = ~_1735;
    int _1747 = _1745 + 1;
    int _1749 = _1747 + 1;
    int _1751 = _1741 * as_type<int>(_1613);
    int _1753 = ~_1715;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    int _1759 = abs(_1661);
    int _1761 = _1749 * as_type<int>(_1605);
    int _1763 = _1761 + _1751;
    int _1765 = ~_1743;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    int _1771 = _1757 * as_type<int>(_1525);
    int _1773 = _1771 + _1719;
    bool _1775 = _1667 != 3;
    int _1777 = ~_1759;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    int _1783 = _1769 * as_type<int>(_1645);
    int _1785 = _1783 + _1763;
    bool _1787 = _1463 != 3;
    bool _1789 = !_1775;
    int _1791 = _1789 ? 0 : (-1);
    int _1793 = _1781 * as_type<int>(_1573);
    int _1795 = _1793 + _1773;
    bool _1797 = !_843;
    int _1799 = _1797 ? 0 : 1;
    bool _1801 = !_1787;
    int _1803 = _1801 ? 0 : (-1);
    int _1805 = abs(_1791);
    int _1807 = abs(_1799);
    int _1809 = abs(_1803);
    float _1811 = _1363 * _1363;
    bool _1813 = !_827;
    int _1815 = _1813 ? 0 : 1;
    float _1817 = fma(_1399, _1399, _1811);
    int _1819 = abs(_1815);
    int _1821 = ~_1809;
    int _1823 = _1821 + 1;
    int _1825 = _1823 + 1;
    float _1827 = fma(_1415, _1415, _1817);
    int _1829 = ~_1805;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    int _1835 = ~_1819;
    int _1837 = _1835 + 1;
    int _1839 = _1837 + 1;
    int _1841 = _1825 * as_type<int>(_1581);
    int _1843 = _1841 + _1795;
    int _1845 = ~_1807;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    int _1851 = _1833 * as_type<int>(_1653);
    int _1853 = _1851 + _1785;
    float _1855 = rsqrt(_1827);
    bool _1857 = !_945;
    float _1859 = _1857 ? as_type<float>(_1631) : as_type<float>(0xffffffffu /* nan */);
    int _1861 = _1843 * _1839;
    bool _1863 = !_997;
    int _1865 = _1863 ? _1689 : (-1);
    int _1867 = _1853 * _1849;
    float _1869 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1871 = as_type<int>(_1859) * _1819;
    int _1873 = _1871 + _1861;
    float _1875 = _1859;
    if (_1455)
    {
        _1875 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1877 = _1875;
    int _1879 = _1865 * _1807;
    int _1881 = _1879 + _1867;
    float _1883 = _1559 + 0.5;
    float _1885 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1887 = as_type<int>(_1877);
    float _1889 = _1885;
    if (_1455)
    {
        float _1891 = _1877 * 5.0;
        _1887 = as_type<int>(_1891);
    }
    int _1893 = _1887;
    float _1895 = _1479 + 0.5;
    float _1897 = float(_1873);
    float _1899 = _1257 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1901 = float(_1881);
    float _1903 = _1885 * _1855;
    if (_1455)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5825 = as_type<float>(_1893);
        out.gl_Position.z = _5825;
    }
    float _1905 = _1399 * _1903;
    out.m_59.x = _1883;
    out.m_59.y = _1895;
    float _1907 = _1363 * _1903;
    out.m_61.x = _1897;
    out.m_61.y = _1901;
    out.m_63.w = _1899;
    if (_1455)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1909 = -_1907;
    float _1911 = _855 + _1909;
    float _1913 = _1415 * _1903;
    float _1915 = -_1905;
    float _1917 = _1385 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1921 = _1911 + _1919;
    float _1923 = -_1913;
    float _1925 = _1375 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1929 = _1917 + _1927;
    float _1931 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1935 = _1925 + _1933;
    float _1937 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1931);
    float _1939 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1937);
    bool _1941 = _1939 >= 0.0;
    float _1943 = _1935;
    float _1945 = _1913;
    if (_1941)
    {
        _1889 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1947 = _1889;
    int _1949 = as_type<int>(_1947);
    if (_1941)
    {
        out.m_45.x = 0.0;
    }
    if (_1941)
    {
        float _1951 = _1947 * 5.0;
        _1949 = as_type<int>(_1951);
    }
    int _1953 = _1949;
    if (_1941)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5926 = as_type<float>(_1953);
        out.gl_Position.z = _5926;
    }
    if (_1941)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1955 = -_855;
    float _1957 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1959 = -_1385;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1963 = -_1375;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1967 = _1957 * _1957;
    float _1969 = -_1907;
    float _1971 = _1363 + _1969;
    float _1973 = fma(_1961, _1961, _1967);
    float _1975 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1977 = fma(_1965, _1965, _1973);
    float _1979 = -_1905;
    float _1981 = _1399 + _1979;
    float _1983 = -_1975;
    float _1985 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1983);
    float _1987 = _1971 * _1971;
    float _1989 = rsqrt(_1977);
    float _1991 = -_1913;
    float _1993 = _1415 + _1991;
    float _1995 = fma(_1981, _1981, _1987);
    float _1997 = fma(_1993, _1993, _1995);
    float _1999 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2001 = sqrt(_1997);
    float _2003 = -_1999;
    float _2005 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2003);
    float _2007 = _1961 * _1989;
    float _2009 = _1965 * _1989;
    float _2011 = _1957 * _1989;
    float _2013 = _2007 * _2007;
    float _2015 = fma(_2009, _2009, _2013);
    float _2017 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2023 = rsqrt(_2015);
    float _2025 = -_2017;
    float _2027 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2025);
    float _2029 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2031 = -_2021;
    float _2033 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2031);
    float _2035 = -_2019;
    float _2037 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2035);
    float _2039 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2041 = _1855 * _2001;
    float _2043 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2045 = -_2029;
    float _2047 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2045);
    float _2049 = _1869 * _2041;
    float _2051 = -_2043;
    float _2053 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2051);
    float _2055 = -_2039;
    float _2057 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2055);
    float _2059 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2047);
    float _2061 = _2009 * _2023;
    float _2063 = _2007 * _2023;
    float _2065 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2057);
    float _2067 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2069 = -_2061;
    float _2071 = _2009 * _2069;
    float _2073 = -_2061;
    float _2075 = _2011 * _2073;
    float _2077 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2079 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2081 = -_2071;
    float _2083 = fma(_2007, _2063, _2081);
    float _2085 = _2011 * _2063;
    float _2087 = -_2077;
    float _2089 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2087);
    float _2091 = -_2079;
    float _2093 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2091);
    float _2095 = _2083 * _2083;
    float _2097 = -_2067;
    float _2099 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2097);
    float _2101 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2093);
    float _2103 = fma(_2085, _2085, _2095);
    float _2105 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2107 = fma(_2075, _2075, _2103);
    float _2109 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2099);
    float _2111 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2113 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = 1.0 / _464;
    float _2117 = -_2109;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2105);
    float _2121 = -_2111;
    float _2123 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2121);
    float _2125 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2127 = -_2113;
    float _2129 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2131 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2123);
    float _2133 = -_2125;
    float _2135 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2133);
    float _2137 = rsqrt(_2107);
    float _2139 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2129);
    float _2141 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2135);
    float _2143 = 1.0 / _2119;
    float _2145 = _2083 * _2137;
    float _2147 = precise::clamp(_2145, 0.0, 1.0);
    float _2149 = 1.0 / _468;
    float _2151 = -_2147;
    float _2153 = _2151 + 1.0;
    float _2155 = fma(_2131, _2143, -1.0);
    float _2157 = _2153 * _2143;
    float _2159 = fma(_2153, _2155, 1.0);
    float _2161 = _2141 * _2157;
    float _2163 = _2139 * _2157;
    float _2165 = 1.0 / _466;
    float _2167 = _2159 * _2159;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2163, _2163, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = _2163 * _2173;
    float _2177 = _2161 * _2173;
    float _2179 = _2159 * _2173;
    float _2181 = -_2175;
    float _2183 = _2007 * _2181;
    float _2185 = -_2177;
    float _2187 = _2011 * _2185;
    float _2189 = _2009 * _2179;
    float _2191 = -_2177;
    float _2193 = -_2183;
    float _2195 = fma(_2009, _2191, _2193);
    float _2197 = -_2187;
    float _2199 = fma(_2007, _2179, _2197);
    float _2201 = -_2175;
    float _2203 = -_2189;
    float _2205 = fma(_2011, _2201, _2203);
    float _2207 = _2195 * _2195;
    float _2209 = fma(_2205, _2205, _2207);
    float _2211 = fma(_2199, _2199, _2209);
    float _2213 = rsqrt(_2211);
    float _2215 = _2205 * _2213;
    float _2217 = _2199 * _2213;
    float _2219 = _2195 * _2213;
    float _2221 = _2009 * _2215;
    float _2223 = _2011 * _2217;
    float _2225 = -_2221;
    float _2227 = fma(_2007, _2217, _2225);
    float _2229 = _2007 * _2219;
    float _2231 = -_2223;
    float _2233 = fma(_2009, _2219, _2231);
    float _2235 = _2227 * _2227;
    float _2237 = -_2229;
    float _2239 = fma(_2011, _2215, _2237);
    float _2241 = fma(_2233, _2233, _2235);
    float _2243 = fma(_2239, _2239, _2241);
    float _2245 = rsqrt(_2243);
    float _2247 = _2239 * _2245;
    float _2249 = _2227 * _2245;
    float _2251 = _2233 * _2245;
    float _2253 = _2007 * _2247;
    float _2255 = in.m_65.x;
    float _2257 = in.m_65.y;
    float _2259 = in.m_65.z;
    float _2261 = _2009 * _2249;
    float _2263 = _2011 * _2251;
    float _2265 = -_2253;
    float _2267 = fma(_2009, _2251, _2265);
    float _2269 = -_2261;
    float _2271 = fma(_2011, _2247, _2269);
    float _2273 = -_2263;
    float _2275 = fma(_2007, _2249, _2273);
    float _2277 = _2267 * _2267;
    float _2279 = fma(_2271, _2271, _2277);
    float _2281 = fma(_2275, _2275, _2279);
    float _2283 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2285 = rsqrt(_2281);
    float _2287 = _2115 * _2255;
    float _2289 = _2165 * _2257;
    float _2291 = _2283 * _2041;
    float _2293 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2287);
    float _2297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2289);
    float _2299 = _2149 * _2259;
    float _2301 = _2293 * _2041;
    float _2303 = _2049 * _2295;
    float _2305 = _2291 * _2297;
    float _2307 = _2299 * _2301;
    float _2309 = _2303 * _2285;
    float _2311 = _2305 * _2249;
    float _2313 = _2305 * _2251;
    float _2315 = _2305 * _2247;
    float _2317 = _2301 + (-1.0);
    float _2319 = fma(_2267, _2309, _2311);
    float _2321 = fma(_2271, _2309, _2313);
    float _2323 = fma(_2275, _2309, _2315);
    float _2325 = fma(_2011, _2307, _2319);
    float _2327 = fma(_2007, _2307, _2321);
    float _2329 = fma(_2009, _2307, _2323);
    float _2331 = _2291 + (-1.0);
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2335 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2337 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2333);
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2341 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2335);
    float _2343 = _855 + _2325;
    float _2345 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2337);
    float _2347 = fma(_2327, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2339);
    float _2349 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2341);
    float _2351 = _2049 + (-1.0);
    float _2353 = _2317 * _2345;
    float _2355 = fma(_2329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2347);
    float _2357 = _2331 * _2349;
    float _2359 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2361 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2363 = _2355 * _2351;
    float _2365 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2367 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2359);
    float _2369 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2361);
    float _2371 = _1375 + _2329;
    float _2373 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2365);
    float _2375 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2367);
    float _2377 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2369);
    float _2379 = _1385 + _2327;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2373);
    float _2383 = _2353 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2385 = _2371 + _2377;
    float _2387 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2389 = _2379 + _2381;
    float _2391 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2395 = _2385 + _2393;
    float _2397 = 1.0 / _2387;
    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2401 = _2389 + _2399;
    float _2403 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2391);
    float _2405 = _2395 * _2395;
    float _2407 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2383);
    float _2409 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2403);
    float _2411 = fma(_2401, _2401, _2405);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2407);
    bool _2415 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(0.5);
    bool _2423 = _2419 || _2421;
    float _2425 = _2409 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2427 = sqrt(_2411);
    float _2429 = _2425 + _2387;
    float _2431 = _2429 * _2397;
    float _2433 = _2431 * 0.5;
    float _2435 = _2343 + _2413;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2439 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2437);
    bool _2441 = _2427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2443 = 1.0 / _2439;
    bool _2445 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(0.5);
    bool _2453 = _2449 || _2451;
    float _2455 = _2413;
    float _2457 = _2407;
    float _2459 = _2389;
    float _2461 = _2343;
    if (!_2441)
    {
        _2455 = _2385;
    }
    float _2463 = _2455;
    float _2465 = _2463;
    if (!_2441)
    {
        _2457 = _2435;
    }
    float _2467 = _2457;
    bool _2469 = !_2441;
    float _2471 = _2467;
    if (!_2469)
    {
        float _2473 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2477 = _2427 + _2475;
        float _2479 = rsqrt(_2411);
        float _2481 = _2477 * _2473;
        float _2483 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2485 = _2481 * 0.15915493667125701904296875;
        float _2487 = _2485 * 6.283185482025146484375;
        float _2489 = cos(_2487);
        float _2491 = _2485 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        float _2495 = _2489 + (-1.0);
        float _2497 = fma(_2493, _2483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2499 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2501 = _2479 * _2497;
        float _2503 = fma(_2435, _2489, _2499);
        float _2505 = fma(_2401, _2501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2507 = fma(_2395, _2501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2459 = _2505;
        _2471 = _2503;
        _2465 = _2507;
        _2461 = _2501;
    }
    float _2509 = _2459;
    float _2511 = _2471;
    float _2513 = _2465;
    float _2515 = _2461;
    float _2517 = -_1905;
    float _2519 = _2517 + _2509;
    float _2521 = -_1907;
    float _2523 = _2521 + _2511;
    float _2525 = -_1913;
    float _2527 = _2525 + _2513;
    float _2529 = _2515;
    float _2531 = _2523;
    float _2533 = _2519;
    float _2535 = _2527;
    float _2537 = _2513;
    if (_2453)
    {
        _2529 = 1.0;
    }
    float _2539 = _2529;
    float _2541 = _2539;
    if (!_2423)
    {
        float _2543 = _1921 * _1921;
        float _2545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2547 = -_1375;
        float _2549 = _2547 + _2513;
        float _2551 = -_855;
        float _2553 = _2551 + _2511;
        float _2555 = fma(_1929, _1929, _2543);
        float _2557 = fma(_1935, _1935, _2555);
        float _2559 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2561 = sqrt(_2557);
        float _2563 = 1.0 / _2041;
        float _2565 = _2559 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2567 = precise::min(_2561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2569 = _2567 * _2545;
        float _2571 = _2569 * _2563;
        float _2573 = -_1385;
        float _2575 = _2573 + _2509;
        float _2577 = _2565 * _2571;
        float _2579 = _2549 * _2571;
        float _2581 = fma(_2575, _2577, _1917);
        float _2583 = fma(_2553, _2577, _1911);
        float _2585 = fma(_2565, _2579, _1925);
        _2531 = _2583;
        _2533 = _2581;
        _2535 = _2585;
        _2537 = _2579;
    }
    float _2587 = _2531;
    float _2589 = _2533;
    float _2591 = _2535;
    float _2593 = _2537;
    float _2595 = _2593;
    if (_2453)
    {
        _2595 = 1.0;
    }
    float _2597 = _2595;
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2601 = _2443 * _2599;
    float _2603 = _2597;
    if (!_2453)
    {
        float _2605 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2607 = _2605 * 0.15915493667125701904296875;
        float _2609 = _2607 * 6.283185482025146484375;
        float _2611 = cos(_2609);
        float _2613 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2615 = _2613 * 0.15915493667125701904296875;
        float _2617 = _2607 * 6.283185482025146484375;
        float _2619 = sin(_2617);
        float _2621 = 1.0 / _2611;
        float _2623 = _2615 * 6.283185482025146484375;
        float _2625 = cos(_2623);
        float _2627 = _2619 * _2621;
        float _2629 = _2615 * 6.283185482025146484375;
        float _2631 = sin(_2629);
        float _2633 = _2625 * _2627;
        float _2635 = 1.0 / _2633;
        float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2639 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2637;
        float _2641 = 1.0 / _2639;
        float _2643 = _2631 * _2635;
        float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2647 = fma(_2601, _2643, _2645);
        float _2649 = _2647 * _2641;
        float _2651 = precise::clamp(_2649, 0.0, 1.0);
        _857 = _2641;
        _2541 = _2651;
    }
    float _2653 = _857;
    float _2655 = _2541;
    float _2657 = _2653;
    if (!_2453)
    {
        float _2659 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2661 = _2659 * 0.15915493667125701904296875;
        float _2663 = _2661 * 6.283185482025146484375;
        float _2665 = cos(_2663);
        float _2667 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2669 = _2667 * 0.15915493667125701904296875;
        float _2671 = _2661 * 6.283185482025146484375;
        float _2673 = sin(_2671);
        float _2675 = 1.0 / _2665;
        float _2677 = _2669 * 6.283185482025146484375;
        float _2679 = cos(_2677);
        float _2681 = _2673 * _2675;
        float _2683 = _2669 * 6.283185482025146484375;
        float _2685 = sin(_2683);
        float _2687 = _2679 * _2681;
        float _2689 = 1.0 / _2687;
        float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2693 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2691;
        float _2695 = 1.0 / _2693;
        float _2697 = _2685 * _2689;
        float _2699 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2701 = fma(_2601, _2697, _2699);
        float _2703 = _2701 * _2695;
        float _2705 = precise::clamp(_2703, 0.0, 1.0);
        float _2707 = -_2705;
        float _2709 = _2707 + 1.0;
        _2657 = _2675;
        _2603 = _2709;
    }
    float _2711 = _2657;
    float _2713 = _2603;
    float _2715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2717 = _2587 + _2715;
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2721 = _2589 + _2719;
    float _2723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2725 = _2591 + _2723;
    float _2727 = _2717 * _2717;
    float _2729 = fma(_2721, _2721, _2727);
    float _2731 = fma(_2725, _2725, _2729);
    float _2733 = rsqrt(_2731);
    float _2735 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2737 = _2721 * _2735;
    float _2739 = _2725 * _2735;
    float _2741 = _2737 * _2737;
    float _2743 = _2739 * _2739;
    float _2745 = _2741 + _2743;
    float _2747 = sqrt(_2745);
    bool _2749 = _2747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2753 = _2747 + _2751;
    float _2755 = _2733;
    float _2757 = _2711;
    float _2759 = _2753;
    float _2761 = _2717;
    float _2763 = _2737;
    if (_2749)
    {
        float _2765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2755 = _2765;
    }
    float _2767 = _2755;
    if (_2749)
    {
        float _2769 = rsqrt(_2745);
        _2757 = _2769;
    }
    float _2771 = _2757;
    float _2773 = _2771;
    if (_2749)
    {
        float _2775 = _2753 * _2767;
        _2759 = _2775;
    }
    float _2777 = _2759;
    if (_2749)
    {
        float _2779 = _2777 * 0.15915493667125701904296875;
        _1943 = _2779;
    }
    float _2781 = _1943;
    float _2783 = _2725;
    if (_2749)
    {
        float _2785 = _2781 * 6.283185482025146484375;
        float _2787 = sin(_2785);
        _2783 = _2787;
    }
    float _2789 = _2783;
    float _2791 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2793 = precise::max(0.0, _2791);
    float _2795 = _2767;
    float _2797 = _2793;
    if (_2749)
    {
        float _2799 = _2781 * 6.283185482025146484375;
        float _2801 = cos(_2799);
        _2795 = _2801;
    }
    float _2803 = _2795;
    float _2805 = -_2735;
    float _2807 = -_2793;
    float _2809 = fma(_2717, _2805, _2807);
    float _2811 = _2809;
    if (_2749)
    {
        float _2813 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2761 = _2813;
    }
    float _2815 = _2761;
    float _2817 = sqrt(_2731);
    float _2819 = _2815;
    float _2821 = _2789;
    if (_2749)
    {
        float _2823 = fma(_2789, _2815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2819 = _2823;
    }
    float _2825 = _2819;
    float _2827 = _2825;
    if (!_2749)
    {
        _2821 = _2741;
    }
    float _2829 = _2821;
    float _2831 = _2829;
    if (_2749)
    {
        float _2833 = _2803 + (-1.0);
        _2797 = _2833;
    }
    float _2835 = _2797;
    float _2837 = _2835;
    if (_2749)
    {
        float _2839 = _2771 * _2825;
        _1945 = _2839;
    }
    float _2841 = _1945;
    if (!_2749)
    {
        _2827 = _2743;
    }
    float _2843 = _2827;
    float _2845 = _2843;
    if (_2749)
    {
        float _2847 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2773 = _2847;
    }
    float _2849 = _2773;
    if (_2749)
    {
        float _2851 = _2737 * _2841;
        _2763 = _2851;
    }
    float _2853 = _2763;
    if (!_2749)
    {
        _2837 = _2739;
    }
    float _2855 = _2837;
    float _2857 = _2855;
    if (_2749)
    {
        float _2859 = _2739 * _2841;
        _2857 = _2859;
    }
    float _2861 = _2857;
    if (_2749)
    {
        float _2863 = fma(_2809, _2803, _2849);
        _2811 = _2863;
    }
    float _2865 = _2811;
    if (_2749)
    {
        float _2867 = _2853 * _2853;
        _2831 = _2867;
    }
    float _2869 = _2831;
    if (_2749)
    {
        float _2871 = _2861 * _2861;
        _2845 = _2871;
    }
    float _2873 = _2845;
    float _2875 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2877 = fma(_2865, _2865, _2869);
    float _2879 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2883 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2881);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2875);
    float _2889 = _2877 + _2873;
    float _2891 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2893 = -_2885;
    float _2895 = _2893 + 1.0;
    float _2897 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2899 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2887);
    float _2901 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2891);
    float _2903 = rsqrt(_2889);
    float _2905 = _2587 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2907 = _2899 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2909 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2901);
    float _2911 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2905);
    float _2913 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2897);
    float _2915 = _2909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2917 = abs(_2895);
    float _2919 = log2(_2917);
    float _2921 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2911);
    float _2923 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2925 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2913);
    float _2927 = _2921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2929 = -_2923;
    float _2931 = fma(_2929, _2879, 1.0);
    float _2933 = _2903 * _2853;
    float _2935 = _2903 * _2865;
    float _2937 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2939 = _2925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2941 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2943 = _2903 * _2861;
    float _2945 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2937);
    float _2947 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2949 = -_2941;
    float _2951 = fma(_2935, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2949);
    float _2953 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2955 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2945);
    float _2957 = log2(_2931);
    float _2959 = -_2943;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2951);
    float _2963 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2965 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2955);
    float _2967 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2947);
    float _2969 = fma(_2961, -0.5, 0.5);
    float _2971 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2963);
    float _2973 = fma(_2961, 0.5, 0.5);
    float _2975 = exp2(_2953);
    float _2977 = _2935 + 1.0;
    float _2979 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2967);
    float _2981 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2971);
    float _2983 = fma(_2973, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2985 = 1.0 / _2965;
    float _2987 = fma(_2973, _2983, -0.212114393711090087890625);
    float _2989 = _2957 * 0.693147182464599609375;
    float _2991 = fma(_2973, _2987, 1.570728778839111328125);
    float _2993 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2995 = sqrt(_2969);
    float _2997 = -_2935;
    float _2999 = fma(_2975, _2977, _2997);
    float _3001 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2979);
    float _3003 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2981);
    float _3005 = fma(_2999, 0.5, 0.5);
    float _3007 = _3001 * _2985;
    float _3009 = _3003 * _2985;
    float _3011 = fma(_3007, 0.5, 0.5);
    float _3013 = fma(_3009, -0.5, 0.5);
    float _3015 = _2995 * 0.636619746685028076171875;
    float3 _7629 = float3(_3011, _3013, _2993);
    float _3017 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7629, float3(0.0), isnan(_7629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7629, float3(0.0), isnan(_7629)), level(0.0)).x;
    float3 _7640 = float3(_3011, _3013, _2993);
    float4 _3020 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).xyzw;
    float _3022 = _3020.x;
    float _3024 = _3020.y;
    float _3026 = _3020.z;
    float _3028 = _3020.w;
    float _3030 = -_2991;
    float _3032 = fma(_3015, _3030, 1.0);
    float2 _7662 = float2(_3032, _3005);
    float3 _3036 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7662, float2(0.0), isnan(_7662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7662, float2(0.0), isnan(_7662)), level(0.0)).xyz;
    float _3038 = _3036.x;
    float _3040 = _3036.y;
    float _3042 = _3036.z;
    float _3044 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3046 = _2655 * _2713;
    float _3048 = _2927 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3050 = _2655 > 0.0;
    bool _3052 = isnan(_2655);
    bool _3054 = _3050 || _3052;
    bool _3056 = isnan(0.0);
    bool _3058 = _3054 || _3056;
    out.m_53.w = _462;
    float _3060 = _3046 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3062 = exp2(_3044);
    float _3064 = fma(_2907, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3048);
    bool _3066 = _2713 <= 0.0;
    bool _3068 = !_3058;
    bool _3070 = _3066 || _3068;
    float _3072 = _3060 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3074 = _2965 * 0.5;
    float _3076 = fma(_2915, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3064);
    float _3078 = _3001 + _2965;
    out.m_63.w = _1899;
    float _3080 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3076);
    out.m_67.x = _1917;
    out.m_67.y = _1911;
    out.m_67.z = _1925;
    float _3082 = _3078 * 0.5;
    float _3084 = _3080 + _2965;
    out.m_45.x = _3072;
    float _3086 = -_3062;
    float _3088 = _3086 + 1.0;
    float _3090 = _3084 * 0.5;
    float _3092 = fma(_3003, -0.5, _3074);
    out.gl_Position.x = _3001;
    out.gl_Position.y = _3003;
    out.gl_Position.z = _3080;
    out.gl_Position.w = _2965;
    float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3082;
    out.m_69.y = _3092;
    out.m_69.z = _3090;
    out.m_69.w = _2965;
    float _3096 = -_3094;
    float _3098 = _3096 + 1.0;
    float _3100 = _3094 * _3017;
    float _3102 = _3028 * _3098;
    float _3104 = _3028 * _3100;
    float _3106 = _3042 * _3100;
    float _3108 = fma(_3038, _3104, _3022);
    float _3110 = fma(_3040, _3104, _3024);
    float _3112 = fma(_3028, _3106, _3026);
    out.m_71.x = _3108;
    out.m_71.y = _3110;
    out.m_71.z = _3112;
    out.m_71.w = _3102;
    if (!_3070)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3114 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3114;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

