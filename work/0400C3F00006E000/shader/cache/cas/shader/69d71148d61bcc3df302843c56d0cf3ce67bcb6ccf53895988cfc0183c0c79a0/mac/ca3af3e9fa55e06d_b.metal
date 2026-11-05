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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    sampler vp_t_tcb_24Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_51 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_53 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2819 = false;
    bool _422 = false;
    bool _298 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_37.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_40.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_116);
        out.gl_Position.z = _3124;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_42.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_40.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3193 = as_type<float>(_154);
        out.gl_Position.z = _3193;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = as_type<float>(int(gl_VertexIndex));
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _160 = as_type<int>(_156) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_156) & 2;
    bool _166 = _164 != 0;
    bool _168 = !_162;
    float _170 = _168 ? (-0.5) : 0.5;
    bool _172 = !_166;
    float _174 = _172 ? (-0.5) : 0.5;
    bool _176 = !_158;
    float _194;
    if (!_176)
    {
        float _178 = in.m_47.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_100);
        float _200 = 1.0 / _198;
        float _202 = _134 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -_220;
    float _228 = _226 + 1.0;
    bool _230 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_204);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _224;
    float _250 = _240 * _228;
    float _252 = -_240;
    float _254 = _252 + 1.0;
    float _256 = _208 * _248;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = fma(_244, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _264 = fma(_260, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _262 * _250;
    float _268 = _264 * _250;
    float _270 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _272 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _276 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    bool _278 = !_246;
    float _296;
    if (!_278)
    {
        float _280 = in.m_47.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = in.m_49.x;
    float _310 = in.m_49.y;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _346 = _306 + _344;
    float _348 = -_322;
    float _350 = _348 + 1.0;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _354 = 1.0 / _326;
    float _356 = _338 * _350;
    float _358 = -_338;
    float _360 = _358 + 1.0;
    float _362 = _276 * _310;
    float _364 = _274 * _308;
    float _366 = _342 * _354;
    float _368 = fma(_366, _346, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _370 = _368 * _356;
    float _372 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[115].x, _370);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _380 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[116].x, _372);
    float _382 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = _376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _386 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _388 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_51.x = _382;
    out.m_51.y = _384;
    out.m_51.z = _386;
    out.m_51.w = _388;
    bool _390 = !_352;
    float _392 = _386;
    float _416;
    float _418;
    float _420;
    if (!_390)
    {
        float _394 = in.m_47.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _398 = float(_100);
        float _400 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _402 = 1.0 / _398;
        float _404 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _406 = _404 * _396;
        float _408 = floor(_406);
        float _410 = _134 * _402;
        float _412 = -_408;
        float _414 = _406 + _412;
        _416 = _410;
        _418 = _398;
        _420 = _414;
        _422 = true;
    }
    else
    {
        float _424 = float(_100);
        float _426 = 1.0 / _424;
        float _428 = _134 * _426;
        _416 = _428;
        _418 = _424;
        _420 = _428;
    }
    _422 = false;
    float _430 = _416;
    float _432 = _418;
    float _434 = _420;
    float _436 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _438 = int(_436);
    float _440 = in.m_47.x;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    float _446 = in.m_37.x;
    float _448 = in.m_37.y;
    float _450 = in.m_37.z;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _454 = int(_452);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _458 = _456 != 0;
    float _460 = in.m_53.x;
    float _462 = in.m_53.y;
    float _464 = in.m_53.z;
    float _466 = in.m_53.w;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _472 = float(_438);
    float _474 = _388;
    if (!_444)
    {
        float _476 = in.m_47.y;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _484 = 0.0;
    if (!_444)
    {
        float _486 = in.m_47.z;
        _484 = _486;
    }
    float _488 = _484;
    float _490 = 1.0 / _472;
    float _492 = float(uint(_454));
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _498 = float(_454);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _504 = ~_454;
    int _506 = _504 + 1;
    bool _508 = _454 == 0;
    float _510 = 1.0 / _492;
    float _512 = _448 * _462;
    float _514 = 0.0;
    if (_444)
    {
        _514 = _440;
    }
    float _516 = _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _522 = fma(_446, _460, _512);
    float _524 = _490 * _134;
    int _526 = ~_454;
    int _528 = _526 + 1;
    float _530 = 1.0 / _470;
    float _532 = 0.0;
    float _534 = _516;
    if (!_444)
    {
        _532 = _478;
    }
    float _536 = _532;
    float _538 = _536;
    if (!_444)
    {
        _392 = _536;
    }
    float _540 = _392;
    int _542 = as_type<int>(_510) + (-2);
    float _544 = trunc(_524);
    int _546 = int(_544);
    float _548 = 0.0;
    float _550 = _488;
    if (!_444)
    {
        _548 = _488;
    }
    float _552 = _548;
    float _554 = _540;
    float _556 = _478;
    float _558 = _552;
    if (_444)
    {
        float _560 = in.m_47.x;
        float _562 = in.m_47.y;
        _554 = _560;
        _556 = _562;
    }
    float _564 = _554;
    float _566 = _556;
    bool _568 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _570 = isnan(_430);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = 1.0 / _482;
    float _582 = float(uint(_546));
    float _584 = 1.0 / _496;
    float _586 = as_type<float>(_542) * _582;
    float _588 = trunc(_586);
    float _590 = precise::max(_588, 0.0);
    uint _593 = uint(_590);
    if (_444)
    {
        _538 = _566;
    }
    float _595 = _538;
    float _597 = _595;
    if (_444)
    {
        _558 = _595;
    }
    float _599 = _558;
    float _601 = 1.0 / _502;
    if (_444)
    {
        _550 = _595;
    }
    float _603 = _550;
    if (!_444)
    {
        _597 = _440;
    }
    float _605 = _597;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _609 = _528 * int(_593);
    int _611 = _609 + _546;
    float _613 = 1.0 / _520;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _617 = float(uint(_611));
    float _619 = as_type<float>(_542) * _617;
    float _621 = float(_546);
    bool _623 = !_444;
    float _625 = _623 ? 1.2345600128173828125 : 1.0;
    bool _627 = _621 >= _498;
    bool _629 = isnan(_621);
    bool _631 = _627 || _629;
    bool _633 = isnan(_498);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = trunc(_619);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    bool _645 = !_444;
    float _647 = _645 ? _566 : _440;
    float _649 = _625 * _647;
    float _651 = trunc(_637);
    int _653 = int(_651);
    int _655 = int(_593) + int(_643);
    float _657 = floor(_649);
    int _659 = _506 * _655;
    int _661 = _659 + _546;
    float _663 = 1.0 / _432;
    bool _665 = uint(_661) >= uint(_454);
    bool _667 = !_665;
    int _669 = _667 ? 0 : (-1);
    float _671 = -_657;
    float _673 = _649 + _671;
    int _675 = ~_653;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    int _681 = ~_655;
    int _683 = _681 + _669;
    int _685 = _683 + 1;
    float _687 = _498 * _673;
    float _689 = _498 * _134;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _697 = _695 != 0;
    int _699 = _454 * _685;
    int _701 = _699 + _546;
    float _703 = _689 * _663;
    float _705 = trunc(_687);
    int _707 = int(_705);
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _711 = _709 != 0;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _715 = _713 != 0;
    bool _717 = !_508;
    int _719 = _717 ? _701 : (-1);
    bool _721 = !_697;
    int _723 = _721 ? 0 : 1;
    int _725 = _719 * _679;
    int _727 = _454 + (-1);
    float _729 = trunc(_703);
    int _731 = int(_729);
    bool _733 = !_458;
    int _735 = _733 ? 0 : 1;
    int _737 = abs(_723);
    int _739 = _653 * _727;
    int _741 = _739 + _725;
    bool _743 = !_693;
    int _745 = _743 ? 0 : 1;
    int _747 = abs(_735);
    int _749 = _741 * _737;
    bool _751 = !_711;
    int _753 = _751 ? 0 : 1;
    int _755 = abs(_745);
    int _757 = _707 * _747;
    int _759 = _757 + _546;
    int _761 = abs(_753);
    bool _763 = !_715;
    int _765 = _763 ? 0 : 1;
    float _767 = in.m_47.z;
    float _769 = in.m_47.w;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    int _775 = _731 * _755;
    int _777 = _775 + _749;
    int _779 = abs(_765);
    float _781 = float(uint(_759));
    int _783 = _759 * _761;
    int _785 = _783 + _777;
    int _787 = ~_454;
    int _789 = _787 + 1;
    int _791 = _707 * _779;
    int _793 = _791 + _785;
    float _795 = as_type<float>(_542) * _781;
    int _797 = ~_454;
    int _799 = _797 + 1;
    float _801 = float(uint(_793));
    float _803 = trunc(_795);
    float _805 = precise::max(_803, 0.0);
    uint _807 = uint(_805);
    float _809 = as_type<float>(_542) * _801;
    bool _811 = _769 > 0.5;
    float _813 = trunc(_809);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    bool _819 = _767 > 0.5;
    float _821 = -_174;
    int _823 = _811 ? as_type<int>(_821) : as_type<int>(_174);
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _827 = _825 != 0;
    int _829 = _799 * int(_807);
    int _831 = _829 + _759;
    float _833 = -_170;
    int _835 = _819 ? as_type<int>(_833) : as_type<int>(_170);
    bool _837 = !_773;
    float _839 = _837 ? _174 : as_type<float>(_823);
    float _841 = float(uint(_831));
    if (!_444)
    {
        _534 = _767;
    }
    float _843 = _534;
    bool _845 = !_827;
    float _847 = _845 ? _170 : as_type<float>(_835);
    int _849 = _789 * int(_817);
    int _851 = _849 + _793;
    float _853 = as_type<float>(_542) * _841;
    float _855 = float(uint(_851));
    float _857 = trunc(_853);
    float _859 = precise::max(_857, 0.0);
    uint _861 = uint(_859);
    float _863 = as_type<float>(_542) * _855;
    float _865 = trunc(_863);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    int _871 = int(_807) + int(_861);
    int _873 = ~_454;
    int _875 = _873 + 1;
    int _877 = int(_817) + int(_869);
    float _879 = in.m_55.x;
    float _881 = in.m_55.y;
    float _883 = in.m_55.z;
    float _885 = in.m_55.w;
    int _887 = _789 * _871;
    int _889 = _887 + _759;
    int _891 = _875 * _877;
    int _893 = _891 + _793;
    bool _895 = uint(_889) >= uint(_454);
    bool _897 = uint(_893) >= uint(_454);
    float _899 = in.m_57.x;
    float _901 = in.m_57.y;
    float _903 = in.m_57.z;
    float _905 = in.m_57.w;
    bool _907 = !_895;
    int _909 = _907 ? 0 : (-1);
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _913 = _911 != 0;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _917 = _915 != 0;
    bool _919 = !_897;
    int _921 = _919 ? 0 : (-1);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _933 = _931 != 0;
    float _935 = _448 * _881;
    int _937 = ~_877;
    int _939 = _937 + _921;
    int _941 = _939 + 1;
    int _943 = ~_871;
    int _945 = _943 + _909;
    int _947 = _945 + 1;
    float _949 = _448 * _901;
    float _951 = fma(_446, _879, _935);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = fma(_446, _899, _949);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _963 = fma(_450, _464, _522);
    float _965 = 1.0 / _955;
    float _967 = fma(_450, _903, _957);
    float _969 = fma(_450, _883, _951);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _979;
    float _983 = 1.0 / _961;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _985;
    float _989 = _977 * _530;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _995 = _981 * _584;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _999 = _997 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1001 = _987 * _580;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1003;
    float _1007 = _973 * _601;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1011 = _430 + _1009;
    bool _1013 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1015 = isnan(_430);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = 1.0 / _999;
    float _1027 = _1005 * _965;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1033 = _993 * _983;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1037 = _430 + _1035;
    float _1039 = fma(_989, _1011, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1041 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1043 = isnan(_430);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = -_1023;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1007, _1037, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1065 = _434 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1069 = _430 + _1067;
    float _1071 = _1031 * _613;
    bool _1073 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1075 = isnan(_430);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_995, _1065, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1087 = fma(_1001, _1069, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1091 = _430 + _1089;
    bool _1093 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1095 = isnan(_430);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = _1051 * _1055;
    float _1107 = -_1051;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(_1071, _1091, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1115 = _430 + _1113;
    float _1117 = _1061 * _1025;
    float _1119 = _1103 * _1109;
    float _1121 = -_1103;
    float _1123 = _1121 + 1.0;
    float _1125 = fma(_1027, _1115, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1129 = _430 + _1127;
    bool _1131 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1133 = isnan(_430);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _1083 * _1123;
    float _1145 = -_1083;
    float _1147 = _1145 + 1.0;
    bool _1149 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1151 = isnan(_430);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_1033, _1129, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1163 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1165 = isnan(_434);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1171 = _1167 || _1169;
    float _1173 = float(_1171);
    float _1175 = _1141 * _1147;
    float _1177 = -_1141;
    float _1179 = _1177 + 1.0;
    float _1181 = -_1159;
    float _1183 = _1181 + 1.0;
    bool _1185 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1187 = isnan(_434);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = -_1173;
    float _1199 = _1197 + 1.0;
    float _1201 = _1159 * _1179;
    bool _1203 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1205 = isnan(_430);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1211 = _1207 || _1209;
    float _1213 = float(_1211);
    float _1215 = _578 * _1183;
    float _1217 = -_578;
    float _1219 = _1217 + 1.0;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1223 = _430 + _1221;
    float _1225 = _963 + _466;
    float _1227 = _1213 * _1219;
    float _1229 = -_1213;
    float _1231 = _1229 + 1.0;
    float _1233 = _1195 * _1199;
    float _1235 = fma(_1117, _1223, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1237 = _1057 * _1227;
    float _1239 = _969 + _885;
    int _1241 = _454 * _941;
    int _1243 = _1241 + _793;
    float _1245 = _967 + _905;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1249 = _843 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1251 = !_508;
    int _1253 = _1251 ? _1243 : (-1);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1257 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1237);
    float _1259 = _1085 * _1233;
    float _1261 = -_1195;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1255);
    int _1267 = _1253 >> 31;
    float _1269 = -_1247;
    float _1271 = fma(_1249, 2.0, _1269);
    float _1273 = fma(_1039, _1215, _1257);
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1259);
    int _1277 = _1267 & 3;
    float _1279 = fma(_1087, _1201, _1273);
    float _1281 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1275);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1285 = _1253 + _1277;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1293 = _1285 >> 2;
    float _1295 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = fma(_1111, _1175, _1279);
    int _1303 = _1293 << 4;
    int _1305 = _1303 + 512;
    int _1307 = _454 * _947;
    int _1309 = _1307 + _759;
    float _1311 = -_174;
    int _1313 = _819 ? as_type<int>(_1311) : as_type<int>(_174);
    out.m_59.x = _1295;
    out.m_59.y = _1297;
    out.m_59.z = _1299;
    out.m_59.w = _1289;
    bool _1315 = _566 > 0.5;
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1319 = !_917;
    float _1321 = _1319 ? _174 : as_type<float>(_1313);
    float _1323 = _564 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1325 = -_170;
    int _1327 = _1315 ? as_type<int>(_1325) : as_type<int>(_170);
    float _1329 = fma(_1125, _1143, _1301);
    int _1331 = _1253 & 3;
    bool _1333 = _1331 != 0;
    float _1335 = -_134;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1271);
    bool _1339 = !_913;
    float _1341 = _1339 ? _170 : as_type<float>(_1327);
    float _1343 = _847 + 0.5;
    int _1345 = _1253 & 3;
    bool _1347 = _1345 != 0;
    int _1349 = _1333 ? 0 : 1;
    uint _1351 = uint(int(uint(_1305) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[int(_1361)][_1363];
    bool _1367 = uint(_1345) > 1u;
    bool _1369 = !_508;
    int _1371 = _1369 ? _1309 : (-1);
    float _1373 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1375 = uint(_1345) >= 2u;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1225 + _1377;
    int _1381 = _1305 + 8;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[int(_1393)][_1395];
    int _1399 = _1375 ? 0 : 1;
    bool _1401 = _1345 != 3;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1405 = ~_1349;
    int _1407 = _1405 + 1;
    int _1409 = _1407 + 1;
    int _1411 = _1409;
    float _1413 = _1225;
    if (!_1367)
    {
        int _1415 = ~_1349;
        int _1417 = _1415 + 1;
        _1411 = _1417;
    }
    int _1419 = _1411;
    float _1421 = -_1403;
    float _1423 = fma(_1323, 2.0, _1421);
    bool _1425 = _1345 != 3;
    float _1427 = -_134;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1423);
    bool _1431 = !_1347;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1437 = abs(_1419);
    float _1439 = _1341 + 0.5;
    int _1441 = abs(_1433);
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1445 = ~_1437;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = fma(_615, -2.0, _1435);
    int _1453 = ~_1399;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = fma(_1373, _1439, _1337);
    int _1461 = _1457;
    if (_1401)
    {
        int _1463 = ~_1399;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    float _1469 = fma(_607, -2.0, _1443);
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1473 = _1245 + _1471;
    bool _1475 = !_1425;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1429);
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1495 = _1239 + _1493;
    bool _1497 = !_925;
    int _1499 = _1497 ? 0 : 1;
    int _1501 = abs(_1467);
    int _1503 = abs(_1499);
    int _1505 = abs(_1477);
    int _1507 = _1449 * as_type<int>(_1365);
    int _1509 = ~_1441;
    int _1511 = _1509 + 1;
    int _1513 = _1511 + 1;
    int _1515 = ~_1501;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1523 = _1513 * as_type<int>(_1357);
    int _1525 = _1523 + _1507;
    float _1527 = fma(_1161, _1119, _1329);
    int _1529 = ~_1505;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1469);
    int _1537 = _1519 * as_type<int>(_1389);
    int _1539 = _1537 + _1525;
    float _1541 = _839 + (-0.5);
    float _1543 = fma(_1235, _1105, _1527);
    int _1545 = _1533 * as_type<int>(_1397);
    int _1547 = _1545 + _1539;
    float _1549 = -_1541;
    float _1551 = -_1535;
    float _1553 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1551);
    int _1555 = ~_1503;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1567 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1451);
    int _1569 = _1547 * _1559;
    float _1571 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1573 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1565);
    float _1575 = _1321 + (-0.5);
    float _1577 = -_174;
    int _1579 = _1315 ? as_type<int>(_1577) : as_type<int>(_174);
    float _1581 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1561);
    bool _1583 = _440 > 0.5;
    float _1585 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1573);
    float _1587 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1589 = -_1571;
    float _1591 = -_1567;
    float _1593 = fma(_1589, _1575, _1591);
    float _1595 = -_170;
    int _1597 = _1583 ? as_type<int>(_1595) : as_type<int>(_170);
    int _1599 = _1371 * _1503;
    int _1601 = _1599 + _1569;
    float _1603 = -_1585;
    float _1605 = _1603 + 1.0;
    float _1607 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1587);
    bool _1609 = !_929;
    float _1611 = _1609 ? _170 : as_type<float>(_1597);
    float _1613 = -_1605;
    float _1615 = fma(_1341, _1613, _1459);
    float _1617 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1265);
    float _1619 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1607);
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1623 = _1473 * _1473;
    float _1625 = _1611 + 0.5;
    bool _1627 = !_933;
    float _1629 = _1627 ? _174 : as_type<float>(_1579);
    float _1631 = -_1617;
    float _1633 = _1631 + 1.0;
    bool _1635 = _1619 >= 0.0;
    float _1637 = fma(_1379, _1379, _1623);
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1641 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = -_1629;
    float _1645 = _1643 + 0.5;
    float _1647 = -_1633;
    float _1649 = fma(_847, _1647, _1479);
    float _1651 = fma(_1495, _1495, _1637);
    float _1653 = _1641 * _1563;
    float _1655 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1621);
    float _1657 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1581);
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1661 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1543);
    float _1663 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1655);
    float _1665 = rsqrt(_1651);
    float _1667 = as_type<float>(_1559);
    int _1669 = as_type<int>(_1663);
    if (_1635)
    {
        _1667 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1671 = _1667;
    float _1673 = -_1657;
    float _1675 = _1673 + 1.0;
    float _1677 = -_1663;
    float _1679 = _1677 + 1.0;
    float _1681 = float(_1601);
    float _1683 = _1659 * _1639;
    if (_1635)
    {
        float _1685 = _1671 * 5.0;
        _1669 = as_type<int>(_1685);
    }
    int _1687 = _1669;
    float _1689 = fma(_839, _1675, _1553);
    float _1691 = fma(_1321, _1679, _1593);
    out.m_61.x = _1661;
    bool _1693 = !_1487;
    int _1695 = _1693 ? 0 : 1;
    bool _1697 = !_1491;
    int _1699 = _1697 ? 0 : 1;
    float _1701 = as_type<float>(_1687);
    if (_1635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5534 = as_type<float>(_1687);
        out.gl_Position.z = _5534;
    }
    bool _1703 = !_1483;
    int _1705 = _1703 ? 0 : 1;
    float _1707 = _1473 * _1665;
    float _1709 = _1379 * _1665;
    out.m_63.x = _1653;
    out.m_63.y = _1683;
    out.m_63.z = _1649;
    out.m_63.w = _1689;
    out.m_65.x = _1615;
    out.m_65.y = _1691;
    out.m_67.y = _1681;
    float _1711 = _1707;
    if (_1635)
    {
        out.m_40.x = 0.0;
    }
    if (_1635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1713 = -_1707;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1717 = _1495 * _1665;
    float _1719 = -_1709;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1725 = _1715 + _1723;
    float _1727 = -_1717;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1733 = _1721 + _1731;
    float _1735 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1739 = _1729 + _1737;
    float _1741 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1735);
    float _1743 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1741);
    bool _1745 = _1743 >= 0.0;
    if (_1745)
    {
        _1701 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1747 = _1701;
    int _1749 = as_type<int>(_1747);
    if (_1745)
    {
        out.m_40.x = 0.0;
    }
    if (_1745)
    {
        float _1751 = _1747 * 5.0;
        _1749 = as_type<int>(_1751);
    }
    int _1753 = _1749;
    if (_1745)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5653 = as_type<float>(_1753);
        out.gl_Position.z = _5653;
    }
    if (_1745)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1755 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1757 = fma(_1729, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1759 = floor(_1755);
    float _1761 = floor(_1757);
    float _1763 = -_1759;
    float _1765 = _1755 + _1763;
    float _1767 = -_1761;
    float _1769 = _1757 + _1767;
    float2 _5689 = float2(_1765, _1769);
    float _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).x;
    float _1773 = _767 * 2.0;
    float _1775 = _440 * 2.0;
    float _1777 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1779 = log2(_1777);
    float _1781 = _566 * 2.0;
    int _1783 = abs(_1705);
    float _1785 = -_1707;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    int _1789 = abs(_1695);
    float _1791 = -_1717;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1495);
    float _1795 = float(_1783);
    float _1797 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1799 = floor(_1773);
    int _1801 = abs(_1699);
    float _1803 = floor(_1775);
    bool _1805 = _1799 > 0.0;
    float _1807 = _1779 * _134;
    bool _1809 = _1799 >= 0.0;
    bool _1811 = isnan(_1799);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    float _1819 = _566 + _440;
    float _1821 = floor(_1781);
    int _1823 = _1817 ? 0 : 1;
    float _1825 = _1819 + (-1.0);
    bool _1827 = _1803 >= 0.0;
    bool _1829 = isnan(_1803);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.0);
    bool _1835 = _1831 || _1833;
    int _1837 = ~_1823;
    int _1839 = _1837 + 1;
    int _1841 = _1839 + 1;
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1845 = exp2(_1807);
    int _1847 = _1841;
    if (!_1805)
    {
        int _1849 = ~_1823;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    float _1855 = _767 + _566;
    bool _1857 = _1803 > 0.0;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1861 = 1.0 + _1859;
    float _1863 = _1855 + (-1.0);
    bool _1865 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1867 = isnan(1.0);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1873 = _1869 || _1871;
    float _1875 = 1.0 / _1861;
    float _1877 = float(_1853);
    float _1879 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1881 = _1835 ? 0 : 1;
    float _1883 = in.m_69.x;
    float _1885 = in.m_69.y;
    float _1887 = in.m_69.z;
    bool _1889 = _1821 > 0.0;
    float _1891 = _1795 * _1877;
    int _1893 = ~_1881;
    int _1895 = _1893 + 1;
    int _1897 = _1895 + 1;
    float _1899 = -_1845;
    float _1901 = _1899 + 1.0;
    int _1903 = _1897;
    if (!_1857)
    {
        int _1905 = ~_1881;
        int _1907 = _1905 + 1;
        _1903 = _1907;
    }
    int _1909 = _1903;
    float _1911 = _1787 * _1787;
    float _1913 = -_1709;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    bool _1917 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1919 = isnan(0.0);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1925 = _1921 || _1923;
    float _1927 = _1891 * (-2.0);
    float _1929 = float(_1909);
    float _1931 = fma(_1915, _1915, _1911);
    float _1933 = float(_1789);
    float _1935 = _566 + (-0.5);
    float _1937 = _1925 ? _1901 : 0.0;
    float _1939 = fma(_1793, _1793, _1931);
    bool _1941 = _1821 >= 0.0;
    bool _1943 = isnan(_1821);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan(0.0);
    bool _1949 = _1945 || _1947;
    float _1951 = _1933 * _1929;
    float _1953 = _440 + (-0.5);
    if (_1873)
    {
        float _1955 = _1937 * _1875;
        _138 = _1955;
    }
    float _1957 = _138;
    int _1959 = _1949 ? 0 : 1;
    float _1961 = _1951 * (-2.0);
    float _1963 = _767 + _440;
    float _1965 = fma(_1927, _1883, _1883);
    int _1967 = ~_1959;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    float _1973 = fma(_1879, _1961, _1879);
    int _1975 = _1971;
    if (!_1889)
    {
        int _1977 = ~_1959;
        int _1979 = _1977 + 1;
        _1975 = _1979;
    }
    int _1981 = _1975;
    float _1983 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1965);
    float _1985 = fma(_1961, _1885, _1885);
    float _1987 = _1963 + (-1.0);
    float _1989 = float(_1981);
    float _1991 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1985);
    float _1993 = float(_1801);
    float _1995 = _767 + (-0.5);
    float _1997 = fma(_1973, _1957, _1991);
    float _1999 = fma(_1843, _1927, _1843);
    float _2001 = _1993 * _1989;
    bool _2003 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2005 = isnan(0.5);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2011 = _2007 || _2009;
    float _2013 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2015 = fma(_1999, _1957, _1983);
    float _2017 = _2001 * (-2.0);
    float _2019 = _1997 * 0.15915493667125701904296875;
    float _2021 = sqrt(_1939);
    float _2023 = _2015 * 0.15915493667125701904296875;
    float _2025 = fma(_2017, _1887, _1887);
    float _2027 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2029 = fma(_2013, _2017, _2013);
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2025);
    float _2033 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2027);
    float _2035 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2037 = _2023 * 6.283185482025146484375;
    float _2039 = sin(_2037);
    float _2041 = fma(_2029, _1957, _2031);
    float _2043 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2045 = _2041 * 0.15915493667125701904296875;
    float _2047 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2049 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2035);
    float _2051 = _2023 * 6.283185482025146484375;
    float _2053 = cos(_2051);
    float _2055 = _1665 * _2021;
    float _2057 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2059 = _2055 * _1797;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2063 = _2019 * 6.283185482025146484375;
    float _2065 = sin(_2063);
    float _2067 = _2061 + _2047;
    float _2069 = _2019 * 6.283185482025146484375;
    float _2071 = cos(_2069);
    float _2073 = 1.0 / _2047;
    float _2075 = _2039 * _2065;
    float _2077 = _2053 * _2065;
    float _2079 = _2045 * 6.283185482025146484375;
    float _2081 = sin(_2079);
    float _2083 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2085 = _2053 * _2071;
    float _2087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _174);
    float _2089 = _174 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2091 = _2055 * _2083;
    float _2093 = _2045 * 6.283185482025146484375;
    float _2095 = cos(_2093);
    float _2097 = _2067 * _2073;
    float _2099 = _2097 * 0.5;
    float _2101 = _2039 * _2071;
    float _2103 = _2087 * _2091;
    float _2105 = fma(_2081, _2085, _2075);
    float _2107 = fma(_2081, _2075, _2085);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    float _2113 = -_2103;
    float _2115 = _2081 * _2113;
    float _2117 = 1.0 / _2111;
    float _2119 = _2053 * _2095;
    float _2121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _170);
    float _2123 = _2071 * _2095;
    float _2125 = _2039 * _2095;
    float _2127 = _2065 * _2095;
    float _2129 = -_2077;
    float _2131 = fma(_2081, _2101, _2129);
    float _2133 = -_2101;
    float _2135 = fma(_2081, _2077, _2133);
    float _2137 = _2121 * _2059;
    float _2139 = _2119 * _2103;
    float _2141 = _2125 * _2103;
    float _2143 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2145 = _2143 * 0.5;
    float _2147 = fma(_2123, _2137, _2115);
    float _2149 = fma(_2105, _2137, _2139);
    float _2151 = fma(_2131, _2137, _2141);
    float _2153 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2155 = fma(_2127, _2145, _2147);
    float _2157 = fma(_2135, _2145, _2149);
    float _2159 = fma(_2107, _2145, _2151);
    float _2161 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2163 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2165 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2167 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2169 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2153);
    float _2171 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2163);
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2165);
    float _2175 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2167);
    float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2179 = _2117 * _2177;
    float _2181 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2161);
    float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2173);
    float _2185 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2175);
    float _2187 = abs(_2179);
    float _2189 = log2(_2187);
    float _2191 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2197 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2199 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2201 = _1239 + _2193;
    float _2203 = _1225 + _2195;
    float _2205 = -_2081;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2209 = -_2081;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2197);
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2215 = _2201 + _2213;
    float _2217 = -_2081;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2223 = _2203 + _2221;
    float _2225 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2227 = _2215 * _2215;
    float _2229 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2231 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2233 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2235 = fma(_2223, _2223, _2227);
    float _2237 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2181);
    float _2239 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2241 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2169);
    float _2243 = sqrt(_2235);
    float _2245 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2225);
    float _2247 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2171);
    float _2249 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2229);
    float _2251 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2233);
    float _2253 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2239);
    float _2255 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2207);
    float _2257 = exp2(_2231);
    float _2259 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2245);
    float _2261 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2249);
    float _2263 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2251);
    float _2265 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2211);
    float _2267 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2269 = _170 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2271 = _2243 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2273 = _2089 * _2255;
    float _2275 = _1245 + _2267;
    float _2277 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2279 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2253);
    float _2281 = fma(_2269, _2241, _2273);
    float _2283 = _2089 * _2265;
    float _2285 = _2089 * _2277;
    float _2287 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2289 = precise::clamp(_2287, 0.0, 1.0);
    float _2291 = fma(_2289, -2.0, 3.0);
    float _2293 = _2289 * _2289;
    float _2295 = _2273;
    float _2297 = _2203;
    float _2299 = _2201;
    if (!_2271)
    {
        _2295 = _2275;
    }
    float _2301 = _2295;
    float _2303 = _2293 * _2291;
    bool _2305 = !_2271;
    float _2307 = _2301;
    if (!_2305)
    {
        float _2309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2313 = _2243 + _2311;
        float _2315 = rsqrt(_2235);
        float _2317 = _2313 * _2309;
        float _2319 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2321 = _2317 * 0.15915493667125701904296875;
        float _2323 = _2321 * 6.283185482025146484375;
        float _2325 = cos(_2323);
        float _2327 = _2321 * 6.283185482025146484375;
        float _2329 = sin(_2327);
        float _2331 = _2325 + (-1.0);
        float _2333 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2335 = fma(_2329, _2319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2337 = fma(_2275, _2325, _2333);
        float _2339 = _2315 * _2335;
        float _2341 = fma(_2223, _2339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2343 = fma(_2215, _2339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2341;
        _2307 = _2337;
        _2299 = _2343;
    }
    float _2345 = _2297;
    float _2347 = _2307;
    float _2349 = _2299;
    float _2351 = -_1709;
    float _2353 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2345);
    float _2355 = -_1707;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2347);
    float _2359 = -_2303;
    float _2361 = _2359 + 1.0;
    float _2363 = -_1717;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    float _2367 = fma(_2269, _2237, _2283);
    float _2369 = _2353;
    float _2371 = _2365;
    float _2373 = _2349;
    if (_2011)
    {
        _1711 = _2353;
    }
    float _2375 = _1711;
    float _2377 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2303);
    float _2379 = _2375;
    if (_2011)
    {
        _2369 = _2357;
    }
    float _2381 = _2369;
    float _2383 = _2381;
    if (!_2011)
    {
        float _2385 = _1725 * _1725;
        float _2387 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2389 = -_1239;
        float _2391 = _2389 + _2349;
        float _2393 = -_1225;
        float _2395 = _2393 + _2345;
        float _2397 = fma(_1733, _1733, _2385);
        float _2399 = -_1245;
        float _2401 = _2399 + _2347;
        float _2403 = fma(_1739, _1739, _2397);
        float _2405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2407 = sqrt(_2403);
        float _2409 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2411 = 1.0 / _2055;
        float _2413 = precise::min(_2407, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2415 = _2413 * _2405;
        float _2417 = _2415 * _2411;
        float _2419 = _2409 * _2417;
        float _2421 = _2391 * _2417;
        float _2423 = fma(_2395, _2419, _1721);
        float _2425 = fma(_2401, _2419, _1715);
        float _2427 = fma(_2409, _2421, _1729);
        _2383 = _2425;
        _2379 = _2423;
        _2371 = _2427;
    }
    float _2429 = _2383;
    float _2431 = _2379;
    float _2433 = _2371;
    float _2435 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2437 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2439 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2443 = isnan(0.5);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2449 = _2445 || _2447;
    float _2451 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2435);
    float _2453 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2437);
    float _2455 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2457 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2439);
    float _2459 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2451);
    float _2461 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2453);
    float _2463 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2455);
    float _2465 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2457);
    float _2467 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2469 = _2461 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2471 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2463);
    float _2473 = _2465 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2475 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2477 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2479 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2481 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2483 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2475);
    float _2485 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2477);
    float _2487 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2479);
    float _2489 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2481);
    float _2491 = _2471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2493 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2495 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2485);
    float _2497 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2487);
    float _2499 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2489);
    float _2501 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2493);
    float _2503 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2495);
    float _2505 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2497);
    float _2507 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2499);
    float _2509 = _2505;
    float _2511 = _2503;
    float _2513 = _2501;
    if (_2449)
    {
        _1413 = 1.0;
    }
    float _2515 = _1413;
    float _2517 = _2515;
    if (_2449)
    {
        _2373 = 1.0;
    }
    float _2519 = _2373;
    float _2521 = _2519;
    if (!_2449)
    {
        float _2523 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2529 = _2525 * 6.283185482025146484375;
        float _2531 = cos(_2529);
        float _2533 = _2527 * 0.15915493667125701904296875;
        float _2535 = _2525 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = 1.0 / _2531;
        float _2541 = _2533 * 6.283185482025146484375;
        float _2543 = cos(_2541);
        float _2545 = _2537 * _2539;
        float _2547 = _2533 * 6.283185482025146484375;
        float _2549 = sin(_2547);
        float _2551 = _2543 * _2545;
        float _2553 = 1.0 / _2551;
        float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2557 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2555;
        float _2559 = 1.0 / _2557;
        float _2561 = _2549 * _2553;
        float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2565 = fma(_2179, _2561, _2563);
        float _2567 = _2565 * _2559;
        float _2569 = precise::clamp(_2567, 0.0, 1.0);
        _2521 = _2569;
    }
    float _2571 = _2521;
    if (!_2449)
    {
        float _2573 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2575 = _2573 * 0.15915493667125701904296875;
        float _2577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2579 = _2575 * 6.283185482025146484375;
        float _2581 = cos(_2579);
        float _2583 = _2577 * 0.15915493667125701904296875;
        float _2585 = _2575 * 6.283185482025146484375;
        float _2587 = sin(_2585);
        float _2589 = 1.0 / _2581;
        float _2591 = _2583 * 6.283185482025146484375;
        float _2593 = cos(_2591);
        float _2595 = _2587 * _2589;
        float _2597 = _2583 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2593 * _2595;
        float _2603 = 1.0 / _2601;
        float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2607 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2605;
        float _2609 = 1.0 / _2607;
        float _2611 = _2599 * _2603;
        float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2615 = fma(_2179, _2611, _2613);
        float _2617 = _2615 * _2609;
        float _2619 = precise::clamp(_2617, 0.0, 1.0);
        float _2621 = -_2619;
        float _2623 = _2621 + 1.0;
        _2517 = _2623;
    }
    float _2625 = _2517;
    float _2627 = in.m_71.x;
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2631 = _2429 + _2629;
    bool _2633 = _2179 <= 8000.0;
    bool _2635 = isnan(_2179);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan(8000.0);
    bool _2641 = _2637 || _2639;
    float _2643 = float(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2647 = _2431 + _2645;
    float _2649 = fma(_2269, _2247, _2285);
    float _2651 = _2631 * _2631;
    float _2653 = -_1771;
    float _2655 = _2653 + 1.0;
    float _2657 = _2643 * _2377;
    float _2659 = _2279 + _2649;
    float _2661 = fma(_2647, _2647, _2651);
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2665 = _2433 + _2663;
    float _2667 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2669 = _2507 * 0.5;
    float _2671 = _2501 + _2507;
    float _2673 = fma(_2665, _2665, _2661);
    float _2675 = _2655 * _2667;
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2505 + _2507;
    float _2681 = fma(_2503, -0.5, _2669);
    float _2683 = -_2677;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2687 = sqrt(_2673);
    out.gl_Position.x = _2501;
    out.gl_Position.y = _2503;
    out.gl_Position.z = _2505;
    out.gl_Position.w = _2507;
    float _2689 = _2259 + _2281;
    float _2691 = _2685 * _2627;
    float _2693 = _2263 + _2367;
    float _2695 = _2671 * 0.5;
    float _2697 = _2679 * 0.5;
    float _2699 = _2571 * _2625;
    out.m_73.x = _2689;
    out.m_73.y = _2693;
    out.m_73.z = _2659;
    out.m_75.x = _2695;
    out.m_75.y = _2681;
    out.m_75.z = _2697;
    out.m_75.w = _2507;
    float _2701 = _2691 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2703 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2705 = isnan(_2687);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2711 = _2707 || _2709;
    out.m_77.x = _2701;
    float _2713 = _2699 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2715 = _2655;
    float _2717 = _2691;
    float _2719 = _2699;
    if (!_2711)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2721 = _2509;
    float _2723 = _2721;
    float _2725 = _2721;
    if (!_2711)
    {
        _2511 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2727 = _2511;
    float _2729 = _2727;
    float _2731 = _2727;
    if (!_2711)
    {
        _2513 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2733 = _2513;
    float _2735 = _2733;
    float _2737 = _2733;
    if (!_2711)
    {
        _2715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2739 = _2715;
    float _2741 = _2739;
    float _2743 = _2739;
    if (!_2711)
    {
        _2717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2745 = _2717;
    float _2747 = _2745;
    float _2749 = _2745;
    if (!_2711)
    {
        _2719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2751 = _2719;
    bool _2753 = !_2711;
    float _2755 = _2751;
    float _2757 = _2751;
    if (!_2753)
    {
        bool _2759 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2761 = isnan(_2687);
        bool _2763 = _2759 || _2761;
        bool _2765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2767 = _2763 || _2765;
        if (!_2767)
        {
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = _2687 + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2773;
            float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2779 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2781 = 1.0 / _2775;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2799 = _2771 * _2781;
            float _2801 = precise::clamp(_2799, 0.0, 1.0);
            float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2807 = fma(_2801, _2779, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2801, _2805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2811 = fma(_2801, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2813 = fma(_2801, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2815 = fma(_2801, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2817 = fma(_2801, _2797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2731 = _2807;
            _2749 = _2815;
            _2725 = _2811;
            _2743 = _2813;
            _2737 = _2809;
            _2757 = _2817;
            _2819 = true;
        }
        else
        {
            bool _2821 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2823 = isnan(_2687);
            bool _2825 = _2821 || _2823;
            bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2829 = _2825 || _2827;
            if (!_2829)
            {
                _2723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2831 = _2723;
            _2725 = _2831;
            if (!_2829)
            {
                _2729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2833 = _2729;
            _2731 = _2833;
            if (!_2829)
            {
                _2735 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2835 = _2735;
            _2737 = _2835;
            if (!_2829)
            {
                _2741 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2837 = _2741;
            _2743 = _2837;
            if (!_2829)
            {
                _2747 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2839 = _2747;
            _2749 = _2839;
            if (!_2829)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2841 = _2755;
            bool _2843 = !_2829;
            _2757 = _2841;
            if (!_2843)
            {
                bool _2845 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2847 = isnan(_2687);
                bool _2849 = _2845 || _2847;
                bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2853 = _2849 || _2851;
                if (!_2853)
                {
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = _2687 + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2859;
                    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2867 = 1.0 / _2861;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2885 = _2857 * _2867;
                    float _2887 = precise::clamp(_2885, 0.0, 1.0);
                    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2893 = fma(_2887, _2865, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2887, _2891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2887, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2887, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2901 = fma(_2887, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2903 = fma(_2887, _2883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2731 = _2893;
                    _2749 = _2901;
                    _2725 = _2897;
                    _2743 = _2899;
                    _2737 = _2895;
                    _2757 = _2903;
                    _2819 = true;
                }
                else
                {
                    _2731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2749 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2743 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2737 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2819 = false;
    float _2905 = _2731;
    float _2907 = _2749;
    float _2909 = _2725;
    float _2911 = _2743;
    float _2913 = _2737;
    float _2915 = _2757;
    float _2917 = _2713 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2919 = fma(_2693, -0.5, 0.5);
    float _2921 = precise::clamp(_2919, 0.0, 1.0);
    float _2923 = -_2905;
    float _2925 = _2923 + _2907;
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    out.m_40.x = _2917;
    float _2931 = fma(_2921, _2925, _2905);
    float _2933 = -_2913;
    float _2935 = _2933 + _2915;
    float _2937 = fma(_2921, _2929, _2909);
    float _2939 = _2931 * 0.586610972881317138671875;
    bool _2941 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2943 = fma(_2921, _2935, _2913);
    out.m_79.x = 0.0;
    float _2945 = fma(_2937, 0.298911988735198974609375, _2939);
    bool _2947 = _2571 > 0.0;
    bool _2949 = isnan(_2571);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    float _2957 = fma(_2943, 0.114477999508380889892578125, _2945);
    bool _2959 = _2625 <= 0.0;
    bool _2961 = !_2955;
    bool _2963 = _2959 || _2961;
    float _2965 = -_2957;
    float _2967 = _2937 + _2965;
    float _2969 = -_2957;
    float _2971 = _2931 + _2969;
    float _2973 = -_2957;
    float _2975 = _2943 + _2973;
    float _2977 = fma(_2967, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2979 = fma(_2971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2981 = fma(_2975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    bool _2983 = !_2941;
    if (!_2983)
    {
        float _2985 = -_2429;
        float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2989 = -_2431;
        float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2993 = -_2433;
        float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2997 = _2987 * _2987;
        float _2999 = fma(_2991, _2991, _2997);
        float _3001 = fma(_2995, _2995, _2999);
        float _3003 = sqrt(_3001);
        float _3005 = rsqrt(_3001);
        float _3007 = -_3003;
        float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3011 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = _2991 * _3005;
        float _3017 = _2987 * _3005;
        float _3019 = abs(_3013);
        float _3021 = log2(_3019);
        float _3023 = _2995 * _3005;
        float _3025 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3027 = _2693 * _3017;
        float _3029 = -_3017;
        float _3031 = -_3025;
        float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3031);
        float _3035 = fma(_2689, _3015, _3027);
        float _3037 = -_3023;
        float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3033);
        float _3041 = fma(_2659, _3023, _3035);
        float _3043 = precise::clamp(_3041, 0.0, 1.0);
        float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3047 = _3039 + _3045;
        float _3049 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        float _3055 = exp2(_3049);
        float _3057 = _3055 * _3053;
        float _3059 = _3043 * _3057;
        float _3061 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3063 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3065 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _3061;
        out.m_79.y = _3063;
        out.m_79.z = _3065;
    }
    out.m_81.x = _2977;
    out.m_81.y = _2979;
    out.m_81.z = _2981;
    if (!_2963)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3067 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_40.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3067;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2819 = false;
    bool _422 = false;
    bool _298 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_37.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_40.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_116);
        out.gl_Position.z = _3124;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_42.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_40.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3193 = as_type<float>(_154);
        out.gl_Position.z = _3193;
    }
    if (_148)
    {
        return out;
    }
    float _156 = as_type<float>(int(gl_VertexIndex));
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _160 = as_type<int>(_156) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_156) & 2;
    bool _166 = _164 != 0;
    bool _168 = !_162;
    float _170 = _168 ? (-0.5) : 0.5;
    bool _172 = !_166;
    float _174 = _172 ? (-0.5) : 0.5;
    bool _176 = !_158;
    float _194;
    if (!_176)
    {
        float _178 = in.m_47.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_100);
        float _200 = 1.0 / _198;
        float _202 = _134 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -_220;
    float _228 = _226 + 1.0;
    bool _230 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_204);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _224;
    float _250 = _240 * _228;
    float _252 = -_240;
    float _254 = _252 + 1.0;
    float _256 = _208 * _248;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = fma(_244, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _264 = fma(_260, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _262 * _250;
    float _268 = _264 * _250;
    float _270 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _272 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _276 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    bool _278 = !_246;
    float _296;
    if (!_278)
    {
        float _280 = in.m_47.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = in.m_49.x;
    float _310 = in.m_49.y;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _346 = _306 + _344;
    float _348 = -_322;
    float _350 = _348 + 1.0;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _354 = 1.0 / _326;
    float _356 = _338 * _350;
    float _358 = -_338;
    float _360 = _358 + 1.0;
    float _362 = _276 * _310;
    float _364 = _274 * _308;
    float _366 = _342 * _354;
    float _368 = fma(_366, _346, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _370 = _368 * _356;
    float _372 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[115].x, _370);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _380 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[116].x, _372);
    float _382 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = _376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _386 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _388 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_51.x = _382;
    out.m_51.y = _384;
    out.m_51.z = _386;
    out.m_51.w = _388;
    bool _390 = !_352;
    float _392 = _386;
    float _416;
    float _418;
    float _420;
    if (!_390)
    {
        float _394 = in.m_47.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _398 = float(_100);
        float _400 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _402 = 1.0 / _398;
        float _404 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _406 = _404 * _396;
        float _408 = floor(_406);
        float _410 = _134 * _402;
        float _412 = -_408;
        float _414 = _406 + _412;
        _416 = _410;
        _418 = _398;
        _420 = _414;
        _422 = true;
    }
    else
    {
        float _424 = float(_100);
        float _426 = 1.0 / _424;
        float _428 = _134 * _426;
        _416 = _428;
        _418 = _424;
        _420 = _428;
    }
    _422 = false;
    float _430 = _416;
    float _432 = _418;
    float _434 = _420;
    float _436 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _438 = int(_436);
    float _440 = in.m_47.x;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    float _446 = in.m_37.x;
    float _448 = in.m_37.y;
    float _450 = in.m_37.z;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _454 = int(_452);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _458 = _456 != 0;
    float _460 = in.m_53.x;
    float _462 = in.m_53.y;
    float _464 = in.m_53.z;
    float _466 = in.m_53.w;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _472 = float(_438);
    float _474 = _388;
    if (!_444)
    {
        float _476 = in.m_47.y;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _484 = 0.0;
    if (!_444)
    {
        float _486 = in.m_47.z;
        _484 = _486;
    }
    float _488 = _484;
    float _490 = 1.0 / _472;
    float _492 = float(uint(_454));
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _498 = float(_454);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _504 = ~_454;
    int _506 = _504 + 1;
    bool _508 = _454 == 0;
    float _510 = 1.0 / _492;
    float _512 = _448 * _462;
    float _514 = 0.0;
    if (_444)
    {
        _514 = _440;
    }
    float _516 = _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _522 = fma(_446, _460, _512);
    float _524 = _490 * _134;
    int _526 = ~_454;
    int _528 = _526 + 1;
    float _530 = 1.0 / _470;
    float _532 = 0.0;
    float _534 = _516;
    if (!_444)
    {
        _532 = _478;
    }
    float _536 = _532;
    float _538 = _536;
    if (!_444)
    {
        _392 = _536;
    }
    float _540 = _392;
    int _542 = as_type<int>(_510) + (-2);
    float _544 = trunc(_524);
    int _546 = int(_544);
    float _548 = 0.0;
    float _550 = _488;
    if (!_444)
    {
        _548 = _488;
    }
    float _552 = _548;
    float _554 = _540;
    float _556 = _478;
    float _558 = _552;
    if (_444)
    {
        float _560 = in.m_47.x;
        float _562 = in.m_47.y;
        _554 = _560;
        _556 = _562;
    }
    float _564 = _554;
    float _566 = _556;
    bool _568 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _570 = isnan(_430);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = 1.0 / _482;
    float _582 = float(uint(_546));
    float _584 = 1.0 / _496;
    float _586 = as_type<float>(_542) * _582;
    float _588 = trunc(_586);
    float _590 = precise::max(_588, 0.0);
    uint _593 = uint(_590);
    if (_444)
    {
        _538 = _566;
    }
    float _595 = _538;
    float _597 = _595;
    if (_444)
    {
        _558 = _595;
    }
    float _599 = _558;
    float _601 = 1.0 / _502;
    if (_444)
    {
        _550 = _595;
    }
    float _603 = _550;
    if (!_444)
    {
        _597 = _440;
    }
    float _605 = _597;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _609 = _528 * int(_593);
    int _611 = _609 + _546;
    float _613 = 1.0 / _520;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _617 = float(uint(_611));
    float _619 = as_type<float>(_542) * _617;
    float _621 = float(_546);
    bool _623 = !_444;
    float _625 = _623 ? 1.2345600128173828125 : 1.0;
    bool _627 = _621 >= _498;
    bool _629 = isnan(_621);
    bool _631 = _627 || _629;
    bool _633 = isnan(_498);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = trunc(_619);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    bool _645 = !_444;
    float _647 = _645 ? _566 : _440;
    float _649 = _625 * _647;
    float _651 = trunc(_637);
    int _653 = int(_651);
    int _655 = int(_593) + int(_643);
    float _657 = floor(_649);
    int _659 = _506 * _655;
    int _661 = _659 + _546;
    float _663 = 1.0 / _432;
    bool _665 = uint(_661) >= uint(_454);
    bool _667 = !_665;
    int _669 = _667 ? 0 : (-1);
    float _671 = -_657;
    float _673 = _649 + _671;
    int _675 = ~_653;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    int _681 = ~_655;
    int _683 = _681 + _669;
    int _685 = _683 + 1;
    float _687 = _498 * _673;
    float _689 = _498 * _134;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _697 = _695 != 0;
    int _699 = _454 * _685;
    int _701 = _699 + _546;
    float _703 = _689 * _663;
    float _705 = trunc(_687);
    int _707 = int(_705);
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _711 = _709 != 0;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _715 = _713 != 0;
    bool _717 = !_508;
    int _719 = _717 ? _701 : (-1);
    bool _721 = !_697;
    int _723 = _721 ? 0 : 1;
    int _725 = _719 * _679;
    int _727 = _454 + (-1);
    float _729 = trunc(_703);
    int _731 = int(_729);
    bool _733 = !_458;
    int _735 = _733 ? 0 : 1;
    int _737 = abs(_723);
    int _739 = _653 * _727;
    int _741 = _739 + _725;
    bool _743 = !_693;
    int _745 = _743 ? 0 : 1;
    int _747 = abs(_735);
    int _749 = _741 * _737;
    bool _751 = !_711;
    int _753 = _751 ? 0 : 1;
    int _755 = abs(_745);
    int _757 = _707 * _747;
    int _759 = _757 + _546;
    int _761 = abs(_753);
    bool _763 = !_715;
    int _765 = _763 ? 0 : 1;
    float _767 = in.m_47.z;
    float _769 = in.m_47.w;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    int _775 = _731 * _755;
    int _777 = _775 + _749;
    int _779 = abs(_765);
    float _781 = float(uint(_759));
    int _783 = _759 * _761;
    int _785 = _783 + _777;
    int _787 = ~_454;
    int _789 = _787 + 1;
    int _791 = _707 * _779;
    int _793 = _791 + _785;
    float _795 = as_type<float>(_542) * _781;
    int _797 = ~_454;
    int _799 = _797 + 1;
    float _801 = float(uint(_793));
    float _803 = trunc(_795);
    float _805 = precise::max(_803, 0.0);
    uint _807 = uint(_805);
    float _809 = as_type<float>(_542) * _801;
    bool _811 = _769 > 0.5;
    float _813 = trunc(_809);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    bool _819 = _767 > 0.5;
    float _821 = -_174;
    int _823 = _811 ? as_type<int>(_821) : as_type<int>(_174);
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _827 = _825 != 0;
    int _829 = _799 * int(_807);
    int _831 = _829 + _759;
    float _833 = -_170;
    int _835 = _819 ? as_type<int>(_833) : as_type<int>(_170);
    bool _837 = !_773;
    float _839 = _837 ? _174 : as_type<float>(_823);
    float _841 = float(uint(_831));
    if (!_444)
    {
        _534 = _767;
    }
    float _843 = _534;
    bool _845 = !_827;
    float _847 = _845 ? _170 : as_type<float>(_835);
    int _849 = _789 * int(_817);
    int _851 = _849 + _793;
    float _853 = as_type<float>(_542) * _841;
    float _855 = float(uint(_851));
    float _857 = trunc(_853);
    float _859 = precise::max(_857, 0.0);
    uint _861 = uint(_859);
    float _863 = as_type<float>(_542) * _855;
    float _865 = trunc(_863);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    int _871 = int(_807) + int(_861);
    int _873 = ~_454;
    int _875 = _873 + 1;
    int _877 = int(_817) + int(_869);
    float _879 = in.m_55.x;
    float _881 = in.m_55.y;
    float _883 = in.m_55.z;
    float _885 = in.m_55.w;
    int _887 = _789 * _871;
    int _889 = _887 + _759;
    int _891 = _875 * _877;
    int _893 = _891 + _793;
    bool _895 = uint(_889) >= uint(_454);
    bool _897 = uint(_893) >= uint(_454);
    float _899 = in.m_57.x;
    float _901 = in.m_57.y;
    float _903 = in.m_57.z;
    float _905 = in.m_57.w;
    bool _907 = !_895;
    int _909 = _907 ? 0 : (-1);
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _913 = _911 != 0;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _917 = _915 != 0;
    bool _919 = !_897;
    int _921 = _919 ? 0 : (-1);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _933 = _931 != 0;
    float _935 = _448 * _881;
    int _937 = ~_877;
    int _939 = _937 + _921;
    int _941 = _939 + 1;
    int _943 = ~_871;
    int _945 = _943 + _909;
    int _947 = _945 + 1;
    float _949 = _448 * _901;
    float _951 = fma(_446, _879, _935);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = fma(_446, _899, _949);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _963 = fma(_450, _464, _522);
    float _965 = 1.0 / _955;
    float _967 = fma(_450, _903, _957);
    float _969 = fma(_450, _883, _951);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _979;
    float _983 = 1.0 / _961;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _985;
    float _989 = _977 * _530;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _995 = _981 * _584;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _999 = _997 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1001 = _987 * _580;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1003;
    float _1007 = _973 * _601;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1011 = _430 + _1009;
    bool _1013 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1015 = isnan(_430);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = 1.0 / _999;
    float _1027 = _1005 * _965;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1033 = _993 * _983;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1037 = _430 + _1035;
    float _1039 = fma(_989, _1011, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1041 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1043 = isnan(_430);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = -_1023;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1007, _1037, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1065 = _434 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1069 = _430 + _1067;
    float _1071 = _1031 * _613;
    bool _1073 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1075 = isnan(_430);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_995, _1065, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1087 = fma(_1001, _1069, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1091 = _430 + _1089;
    bool _1093 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1095 = isnan(_430);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = _1051 * _1055;
    float _1107 = -_1051;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(_1071, _1091, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1115 = _430 + _1113;
    float _1117 = _1061 * _1025;
    float _1119 = _1103 * _1109;
    float _1121 = -_1103;
    float _1123 = _1121 + 1.0;
    float _1125 = fma(_1027, _1115, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1129 = _430 + _1127;
    bool _1131 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1133 = isnan(_430);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _1083 * _1123;
    float _1145 = -_1083;
    float _1147 = _1145 + 1.0;
    bool _1149 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1151 = isnan(_430);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_1033, _1129, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1163 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1165 = isnan(_434);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1171 = _1167 || _1169;
    float _1173 = float(_1171);
    float _1175 = _1141 * _1147;
    float _1177 = -_1141;
    float _1179 = _1177 + 1.0;
    float _1181 = -_1159;
    float _1183 = _1181 + 1.0;
    bool _1185 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1187 = isnan(_434);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = -_1173;
    float _1199 = _1197 + 1.0;
    float _1201 = _1159 * _1179;
    bool _1203 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1205 = isnan(_430);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1211 = _1207 || _1209;
    float _1213 = float(_1211);
    float _1215 = _578 * _1183;
    float _1217 = -_578;
    float _1219 = _1217 + 1.0;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1223 = _430 + _1221;
    float _1225 = _963 + _466;
    float _1227 = _1213 * _1219;
    float _1229 = -_1213;
    float _1231 = _1229 + 1.0;
    float _1233 = _1195 * _1199;
    float _1235 = fma(_1117, _1223, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1237 = _1057 * _1227;
    float _1239 = _969 + _885;
    int _1241 = _454 * _941;
    int _1243 = _1241 + _793;
    float _1245 = _967 + _905;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1249 = _843 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1251 = !_508;
    int _1253 = _1251 ? _1243 : (-1);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1257 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1237);
    float _1259 = _1085 * _1233;
    float _1261 = -_1195;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1255);
    int _1267 = _1253 >> 31;
    float _1269 = -_1247;
    float _1271 = fma(_1249, 2.0, _1269);
    float _1273 = fma(_1039, _1215, _1257);
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1259);
    int _1277 = _1267 & 3;
    float _1279 = fma(_1087, _1201, _1273);
    float _1281 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1275);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1285 = _1253 + _1277;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1293 = _1285 >> 2;
    float _1295 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = fma(_1111, _1175, _1279);
    int _1303 = _1293 << 4;
    int _1305 = _1303 + 512;
    int _1307 = _454 * _947;
    int _1309 = _1307 + _759;
    float _1311 = -_174;
    int _1313 = _819 ? as_type<int>(_1311) : as_type<int>(_174);
    out.m_59.x = _1295;
    out.m_59.y = _1297;
    out.m_59.z = _1299;
    out.m_59.w = _1289;
    bool _1315 = _566 > 0.5;
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1319 = !_917;
    float _1321 = _1319 ? _174 : as_type<float>(_1313);
    float _1323 = _564 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1325 = -_170;
    int _1327 = _1315 ? as_type<int>(_1325) : as_type<int>(_170);
    float _1329 = fma(_1125, _1143, _1301);
    int _1331 = _1253 & 3;
    bool _1333 = _1331 != 0;
    float _1335 = -_134;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1271);
    bool _1339 = !_913;
    float _1341 = _1339 ? _170 : as_type<float>(_1327);
    float _1343 = _847 + 0.5;
    int _1345 = _1253 & 3;
    bool _1347 = _1345 != 0;
    int _1349 = _1333 ? 0 : 1;
    uint _1351 = uint(int(uint(_1305) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[int(_1361)][_1363];
    bool _1367 = uint(_1345) > 1u;
    bool _1369 = !_508;
    int _1371 = _1369 ? _1309 : (-1);
    float _1373 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1375 = uint(_1345) >= 2u;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1225 + _1377;
    int _1381 = _1305 + 8;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[int(_1393)][_1395];
    int _1399 = _1375 ? 0 : 1;
    bool _1401 = _1345 != 3;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1405 = ~_1349;
    int _1407 = _1405 + 1;
    int _1409 = _1407 + 1;
    int _1411 = _1409;
    float _1413 = _1225;
    if (!_1367)
    {
        int _1415 = ~_1349;
        int _1417 = _1415 + 1;
        _1411 = _1417;
    }
    int _1419 = _1411;
    float _1421 = -_1403;
    float _1423 = fma(_1323, 2.0, _1421);
    bool _1425 = _1345 != 3;
    float _1427 = -_134;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1423);
    bool _1431 = !_1347;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1437 = abs(_1419);
    float _1439 = _1341 + 0.5;
    int _1441 = abs(_1433);
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1445 = ~_1437;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = fma(_615, -2.0, _1435);
    int _1453 = ~_1399;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = fma(_1373, _1439, _1337);
    int _1461 = _1457;
    if (_1401)
    {
        int _1463 = ~_1399;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    float _1469 = fma(_607, -2.0, _1443);
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1473 = _1245 + _1471;
    bool _1475 = !_1425;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1429);
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1495 = _1239 + _1493;
    bool _1497 = !_925;
    int _1499 = _1497 ? 0 : 1;
    int _1501 = abs(_1467);
    int _1503 = abs(_1499);
    int _1505 = abs(_1477);
    int _1507 = _1449 * as_type<int>(_1365);
    int _1509 = ~_1441;
    int _1511 = _1509 + 1;
    int _1513 = _1511 + 1;
    int _1515 = ~_1501;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1523 = _1513 * as_type<int>(_1357);
    int _1525 = _1523 + _1507;
    float _1527 = fma(_1161, _1119, _1329);
    int _1529 = ~_1505;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1469);
    int _1537 = _1519 * as_type<int>(_1389);
    int _1539 = _1537 + _1525;
    float _1541 = _839 + (-0.5);
    float _1543 = fma(_1235, _1105, _1527);
    int _1545 = _1533 * as_type<int>(_1397);
    int _1547 = _1545 + _1539;
    float _1549 = -_1541;
    float _1551 = -_1535;
    float _1553 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1551);
    int _1555 = ~_1503;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1567 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1451);
    int _1569 = _1547 * _1559;
    float _1571 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1573 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1565);
    float _1575 = _1321 + (-0.5);
    float _1577 = -_174;
    int _1579 = _1315 ? as_type<int>(_1577) : as_type<int>(_174);
    float _1581 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1561);
    bool _1583 = _440 > 0.5;
    float _1585 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1573);
    float _1587 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1589 = -_1571;
    float _1591 = -_1567;
    float _1593 = fma(_1589, _1575, _1591);
    float _1595 = -_170;
    int _1597 = _1583 ? as_type<int>(_1595) : as_type<int>(_170);
    int _1599 = _1371 * _1503;
    int _1601 = _1599 + _1569;
    float _1603 = -_1585;
    float _1605 = _1603 + 1.0;
    float _1607 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1587);
    bool _1609 = !_929;
    float _1611 = _1609 ? _170 : as_type<float>(_1597);
    float _1613 = -_1605;
    float _1615 = fma(_1341, _1613, _1459);
    float _1617 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1265);
    float _1619 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1607);
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1623 = _1473 * _1473;
    float _1625 = _1611 + 0.5;
    bool _1627 = !_933;
    float _1629 = _1627 ? _174 : as_type<float>(_1579);
    float _1631 = -_1617;
    float _1633 = _1631 + 1.0;
    bool _1635 = _1619 >= 0.0;
    float _1637 = fma(_1379, _1379, _1623);
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1641 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = -_1629;
    float _1645 = _1643 + 0.5;
    float _1647 = -_1633;
    float _1649 = fma(_847, _1647, _1479);
    float _1651 = fma(_1495, _1495, _1637);
    float _1653 = _1641 * _1563;
    float _1655 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1621);
    float _1657 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1581);
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1661 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1543);
    float _1663 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1655);
    float _1665 = rsqrt(_1651);
    float _1667 = as_type<float>(_1559);
    int _1669 = as_type<int>(_1663);
    if (_1635)
    {
        _1667 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1671 = _1667;
    float _1673 = -_1657;
    float _1675 = _1673 + 1.0;
    float _1677 = -_1663;
    float _1679 = _1677 + 1.0;
    float _1681 = float(_1601);
    float _1683 = _1659 * _1639;
    if (_1635)
    {
        float _1685 = _1671 * 5.0;
        _1669 = as_type<int>(_1685);
    }
    int _1687 = _1669;
    float _1689 = fma(_839, _1675, _1553);
    float _1691 = fma(_1321, _1679, _1593);
    out.m_61.x = _1661;
    bool _1693 = !_1487;
    int _1695 = _1693 ? 0 : 1;
    bool _1697 = !_1491;
    int _1699 = _1697 ? 0 : 1;
    float _1701 = as_type<float>(_1687);
    if (_1635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5534 = as_type<float>(_1687);
        out.gl_Position.z = _5534;
    }
    bool _1703 = !_1483;
    int _1705 = _1703 ? 0 : 1;
    float _1707 = _1473 * _1665;
    float _1709 = _1379 * _1665;
    out.m_63.x = _1653;
    out.m_63.y = _1683;
    out.m_63.z = _1649;
    out.m_63.w = _1689;
    out.m_65.x = _1615;
    out.m_65.y = _1691;
    out.m_67.y = _1681;
    float _1711 = _1707;
    if (_1635)
    {
        out.m_40.x = 0.0;
    }
    if (_1635)
    {
        return out;
    }
    float _1713 = -_1707;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1717 = _1495 * _1665;
    float _1719 = -_1709;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1725 = _1715 + _1723;
    float _1727 = -_1717;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1733 = _1721 + _1731;
    float _1735 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1739 = _1729 + _1737;
    float _1741 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1735);
    float _1743 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1741);
    bool _1745 = _1743 >= 0.0;
    if (_1745)
    {
        _1701 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1747 = _1701;
    int _1749 = as_type<int>(_1747);
    if (_1745)
    {
        out.m_40.x = 0.0;
    }
    if (_1745)
    {
        float _1751 = _1747 * 5.0;
        _1749 = as_type<int>(_1751);
    }
    int _1753 = _1749;
    if (_1745)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5653 = as_type<float>(_1753);
        out.gl_Position.z = _5653;
    }
    if (_1745)
    {
        return out;
    }
    float _1755 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1757 = fma(_1729, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1759 = floor(_1755);
    float _1761 = floor(_1757);
    float _1763 = -_1759;
    float _1765 = _1755 + _1763;
    float _1767 = -_1761;
    float _1769 = _1757 + _1767;
    float2 _5689 = float2(_1765, _1769);
    float _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).x;
    float _1773 = _767 * 2.0;
    float _1775 = _440 * 2.0;
    float _1777 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1779 = log2(_1777);
    float _1781 = _566 * 2.0;
    int _1783 = abs(_1705);
    float _1785 = -_1707;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    int _1789 = abs(_1695);
    float _1791 = -_1717;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1495);
    float _1795 = float(_1783);
    float _1797 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1799 = floor(_1773);
    int _1801 = abs(_1699);
    float _1803 = floor(_1775);
    bool _1805 = _1799 > 0.0;
    float _1807 = _1779 * _134;
    bool _1809 = _1799 >= 0.0;
    bool _1811 = isnan(_1799);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    float _1819 = _566 + _440;
    float _1821 = floor(_1781);
    int _1823 = _1817 ? 0 : 1;
    float _1825 = _1819 + (-1.0);
    bool _1827 = _1803 >= 0.0;
    bool _1829 = isnan(_1803);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.0);
    bool _1835 = _1831 || _1833;
    int _1837 = ~_1823;
    int _1839 = _1837 + 1;
    int _1841 = _1839 + 1;
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1845 = exp2(_1807);
    int _1847 = _1841;
    if (!_1805)
    {
        int _1849 = ~_1823;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    float _1855 = _767 + _566;
    bool _1857 = _1803 > 0.0;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1861 = 1.0 + _1859;
    float _1863 = _1855 + (-1.0);
    bool _1865 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1867 = isnan(1.0);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1873 = _1869 || _1871;
    float _1875 = 1.0 / _1861;
    float _1877 = float(_1853);
    float _1879 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1881 = _1835 ? 0 : 1;
    float _1883 = in.m_69.x;
    float _1885 = in.m_69.y;
    float _1887 = in.m_69.z;
    bool _1889 = _1821 > 0.0;
    float _1891 = _1795 * _1877;
    int _1893 = ~_1881;
    int _1895 = _1893 + 1;
    int _1897 = _1895 + 1;
    float _1899 = -_1845;
    float _1901 = _1899 + 1.0;
    int _1903 = _1897;
    if (!_1857)
    {
        int _1905 = ~_1881;
        int _1907 = _1905 + 1;
        _1903 = _1907;
    }
    int _1909 = _1903;
    float _1911 = _1787 * _1787;
    float _1913 = -_1709;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    bool _1917 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1919 = isnan(0.0);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1925 = _1921 || _1923;
    float _1927 = _1891 * (-2.0);
    float _1929 = float(_1909);
    float _1931 = fma(_1915, _1915, _1911);
    float _1933 = float(_1789);
    float _1935 = _566 + (-0.5);
    float _1937 = _1925 ? _1901 : 0.0;
    float _1939 = fma(_1793, _1793, _1931);
    bool _1941 = _1821 >= 0.0;
    bool _1943 = isnan(_1821);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan(0.0);
    bool _1949 = _1945 || _1947;
    float _1951 = _1933 * _1929;
    float _1953 = _440 + (-0.5);
    if (_1873)
    {
        float _1955 = _1937 * _1875;
        _138 = _1955;
    }
    float _1957 = _138;
    int _1959 = _1949 ? 0 : 1;
    float _1961 = _1951 * (-2.0);
    float _1963 = _767 + _440;
    float _1965 = fma(_1927, _1883, _1883);
    int _1967 = ~_1959;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    float _1973 = fma(_1879, _1961, _1879);
    int _1975 = _1971;
    if (!_1889)
    {
        int _1977 = ~_1959;
        int _1979 = _1977 + 1;
        _1975 = _1979;
    }
    int _1981 = _1975;
    float _1983 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1965);
    float _1985 = fma(_1961, _1885, _1885);
    float _1987 = _1963 + (-1.0);
    float _1989 = float(_1981);
    float _1991 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1985);
    float _1993 = float(_1801);
    float _1995 = _767 + (-0.5);
    float _1997 = fma(_1973, _1957, _1991);
    float _1999 = fma(_1843, _1927, _1843);
    float _2001 = _1993 * _1989;
    bool _2003 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2005 = isnan(0.5);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2011 = _2007 || _2009;
    float _2013 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2015 = fma(_1999, _1957, _1983);
    float _2017 = _2001 * (-2.0);
    float _2019 = _1997 * 0.15915493667125701904296875;
    float _2021 = sqrt(_1939);
    float _2023 = _2015 * 0.15915493667125701904296875;
    float _2025 = fma(_2017, _1887, _1887);
    float _2027 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2029 = fma(_2013, _2017, _2013);
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2025);
    float _2033 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2027);
    float _2035 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2037 = _2023 * 6.283185482025146484375;
    float _2039 = sin(_2037);
    float _2041 = fma(_2029, _1957, _2031);
    float _2043 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2045 = _2041 * 0.15915493667125701904296875;
    float _2047 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2049 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2035);
    float _2051 = _2023 * 6.283185482025146484375;
    float _2053 = cos(_2051);
    float _2055 = _1665 * _2021;
    float _2057 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2059 = _2055 * _1797;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2063 = _2019 * 6.283185482025146484375;
    float _2065 = sin(_2063);
    float _2067 = _2061 + _2047;
    float _2069 = _2019 * 6.283185482025146484375;
    float _2071 = cos(_2069);
    float _2073 = 1.0 / _2047;
    float _2075 = _2039 * _2065;
    float _2077 = _2053 * _2065;
    float _2079 = _2045 * 6.283185482025146484375;
    float _2081 = sin(_2079);
    float _2083 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2085 = _2053 * _2071;
    float _2087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _174);
    float _2089 = _174 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2091 = _2055 * _2083;
    float _2093 = _2045 * 6.283185482025146484375;
    float _2095 = cos(_2093);
    float _2097 = _2067 * _2073;
    float _2099 = _2097 * 0.5;
    float _2101 = _2039 * _2071;
    float _2103 = _2087 * _2091;
    float _2105 = fma(_2081, _2085, _2075);
    float _2107 = fma(_2081, _2075, _2085);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    float _2113 = -_2103;
    float _2115 = _2081 * _2113;
    float _2117 = 1.0 / _2111;
    float _2119 = _2053 * _2095;
    float _2121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _170);
    float _2123 = _2071 * _2095;
    float _2125 = _2039 * _2095;
    float _2127 = _2065 * _2095;
    float _2129 = -_2077;
    float _2131 = fma(_2081, _2101, _2129);
    float _2133 = -_2101;
    float _2135 = fma(_2081, _2077, _2133);
    float _2137 = _2121 * _2059;
    float _2139 = _2119 * _2103;
    float _2141 = _2125 * _2103;
    float _2143 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2145 = _2143 * 0.5;
    float _2147 = fma(_2123, _2137, _2115);
    float _2149 = fma(_2105, _2137, _2139);
    float _2151 = fma(_2131, _2137, _2141);
    float _2153 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2155 = fma(_2127, _2145, _2147);
    float _2157 = fma(_2135, _2145, _2149);
    float _2159 = fma(_2107, _2145, _2151);
    float _2161 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2163 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2165 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2167 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2169 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2153);
    float _2171 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2163);
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2165);
    float _2175 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2167);
    float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2179 = _2117 * _2177;
    float _2181 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2161);
    float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2173);
    float _2185 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2175);
    float _2187 = abs(_2179);
    float _2189 = log2(_2187);
    float _2191 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2197 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2199 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2201 = _1239 + _2193;
    float _2203 = _1225 + _2195;
    float _2205 = -_2081;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2209 = -_2081;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2197);
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2215 = _2201 + _2213;
    float _2217 = -_2081;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2223 = _2203 + _2221;
    float _2225 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2227 = _2215 * _2215;
    float _2229 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2231 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2233 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2235 = fma(_2223, _2223, _2227);
    float _2237 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2181);
    float _2239 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2241 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2169);
    float _2243 = sqrt(_2235);
    float _2245 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2225);
    float _2247 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2171);
    float _2249 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2229);
    float _2251 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2233);
    float _2253 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2239);
    float _2255 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2207);
    float _2257 = exp2(_2231);
    float _2259 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2245);
    float _2261 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2249);
    float _2263 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2251);
    float _2265 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2211);
    float _2267 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2269 = _170 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2271 = _2243 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2273 = _2089 * _2255;
    float _2275 = _1245 + _2267;
    float _2277 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2279 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2253);
    float _2281 = fma(_2269, _2241, _2273);
    float _2283 = _2089 * _2265;
    float _2285 = _2089 * _2277;
    float _2287 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2289 = precise::clamp(_2287, 0.0, 1.0);
    float _2291 = fma(_2289, -2.0, 3.0);
    float _2293 = _2289 * _2289;
    float _2295 = _2273;
    float _2297 = _2203;
    float _2299 = _2201;
    if (!_2271)
    {
        _2295 = _2275;
    }
    float _2301 = _2295;
    float _2303 = _2293 * _2291;
    bool _2305 = !_2271;
    float _2307 = _2301;
    if (!_2305)
    {
        float _2309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2313 = _2243 + _2311;
        float _2315 = rsqrt(_2235);
        float _2317 = _2313 * _2309;
        float _2319 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2321 = _2317 * 0.15915493667125701904296875;
        float _2323 = _2321 * 6.283185482025146484375;
        float _2325 = cos(_2323);
        float _2327 = _2321 * 6.283185482025146484375;
        float _2329 = sin(_2327);
        float _2331 = _2325 + (-1.0);
        float _2333 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2335 = fma(_2329, _2319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2337 = fma(_2275, _2325, _2333);
        float _2339 = _2315 * _2335;
        float _2341 = fma(_2223, _2339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2343 = fma(_2215, _2339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2341;
        _2307 = _2337;
        _2299 = _2343;
    }
    float _2345 = _2297;
    float _2347 = _2307;
    float _2349 = _2299;
    float _2351 = -_1709;
    float _2353 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2345);
    float _2355 = -_1707;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2347);
    float _2359 = -_2303;
    float _2361 = _2359 + 1.0;
    float _2363 = -_1717;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    float _2367 = fma(_2269, _2237, _2283);
    float _2369 = _2353;
    float _2371 = _2365;
    float _2373 = _2349;
    if (_2011)
    {
        _1711 = _2353;
    }
    float _2375 = _1711;
    float _2377 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2303);
    float _2379 = _2375;
    if (_2011)
    {
        _2369 = _2357;
    }
    float _2381 = _2369;
    float _2383 = _2381;
    if (!_2011)
    {
        float _2385 = _1725 * _1725;
        float _2387 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2389 = -_1239;
        float _2391 = _2389 + _2349;
        float _2393 = -_1225;
        float _2395 = _2393 + _2345;
        float _2397 = fma(_1733, _1733, _2385);
        float _2399 = -_1245;
        float _2401 = _2399 + _2347;
        float _2403 = fma(_1739, _1739, _2397);
        float _2405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2407 = sqrt(_2403);
        float _2409 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2411 = 1.0 / _2055;
        float _2413 = precise::min(_2407, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2415 = _2413 * _2405;
        float _2417 = _2415 * _2411;
        float _2419 = _2409 * _2417;
        float _2421 = _2391 * _2417;
        float _2423 = fma(_2395, _2419, _1721);
        float _2425 = fma(_2401, _2419, _1715);
        float _2427 = fma(_2409, _2421, _1729);
        _2383 = _2425;
        _2379 = _2423;
        _2371 = _2427;
    }
    float _2429 = _2383;
    float _2431 = _2379;
    float _2433 = _2371;
    float _2435 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2437 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2439 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2443 = isnan(0.5);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2449 = _2445 || _2447;
    float _2451 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2435);
    float _2453 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2437);
    float _2455 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2457 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2439);
    float _2459 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2451);
    float _2461 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2453);
    float _2463 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2455);
    float _2465 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2457);
    float _2467 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2469 = _2461 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2471 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2463);
    float _2473 = _2465 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2475 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2477 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2479 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2481 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2483 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2475);
    float _2485 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2477);
    float _2487 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2479);
    float _2489 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2481);
    float _2491 = _2471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2493 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2495 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2485);
    float _2497 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2487);
    float _2499 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2489);
    float _2501 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2493);
    float _2503 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2495);
    float _2505 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2497);
    float _2507 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2499);
    float _2509 = _2505;
    float _2511 = _2503;
    float _2513 = _2501;
    if (_2449)
    {
        _1413 = 1.0;
    }
    float _2515 = _1413;
    float _2517 = _2515;
    if (_2449)
    {
        _2373 = 1.0;
    }
    float _2519 = _2373;
    float _2521 = _2519;
    if (!_2449)
    {
        float _2523 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2529 = _2525 * 6.283185482025146484375;
        float _2531 = cos(_2529);
        float _2533 = _2527 * 0.15915493667125701904296875;
        float _2535 = _2525 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = 1.0 / _2531;
        float _2541 = _2533 * 6.283185482025146484375;
        float _2543 = cos(_2541);
        float _2545 = _2537 * _2539;
        float _2547 = _2533 * 6.283185482025146484375;
        float _2549 = sin(_2547);
        float _2551 = _2543 * _2545;
        float _2553 = 1.0 / _2551;
        float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2557 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2555;
        float _2559 = 1.0 / _2557;
        float _2561 = _2549 * _2553;
        float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2565 = fma(_2179, _2561, _2563);
        float _2567 = _2565 * _2559;
        float _2569 = precise::clamp(_2567, 0.0, 1.0);
        _2521 = _2569;
    }
    float _2571 = _2521;
    if (!_2449)
    {
        float _2573 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2575 = _2573 * 0.15915493667125701904296875;
        float _2577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2579 = _2575 * 6.283185482025146484375;
        float _2581 = cos(_2579);
        float _2583 = _2577 * 0.15915493667125701904296875;
        float _2585 = _2575 * 6.283185482025146484375;
        float _2587 = sin(_2585);
        float _2589 = 1.0 / _2581;
        float _2591 = _2583 * 6.283185482025146484375;
        float _2593 = cos(_2591);
        float _2595 = _2587 * _2589;
        float _2597 = _2583 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2593 * _2595;
        float _2603 = 1.0 / _2601;
        float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2607 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2605;
        float _2609 = 1.0 / _2607;
        float _2611 = _2599 * _2603;
        float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2615 = fma(_2179, _2611, _2613);
        float _2617 = _2615 * _2609;
        float _2619 = precise::clamp(_2617, 0.0, 1.0);
        float _2621 = -_2619;
        float _2623 = _2621 + 1.0;
        _2517 = _2623;
    }
    float _2625 = _2517;
    float _2627 = in.m_71.x;
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2631 = _2429 + _2629;
    bool _2633 = _2179 <= 8000.0;
    bool _2635 = isnan(_2179);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan(8000.0);
    bool _2641 = _2637 || _2639;
    float _2643 = float(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2647 = _2431 + _2645;
    float _2649 = fma(_2269, _2247, _2285);
    float _2651 = _2631 * _2631;
    float _2653 = -_1771;
    float _2655 = _2653 + 1.0;
    float _2657 = _2643 * _2377;
    float _2659 = _2279 + _2649;
    float _2661 = fma(_2647, _2647, _2651);
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2665 = _2433 + _2663;
    float _2667 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2669 = _2507 * 0.5;
    float _2671 = _2501 + _2507;
    float _2673 = fma(_2665, _2665, _2661);
    float _2675 = _2655 * _2667;
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2505 + _2507;
    float _2681 = fma(_2503, -0.5, _2669);
    float _2683 = -_2677;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2687 = sqrt(_2673);
    out.gl_Position.x = _2501;
    out.gl_Position.y = _2503;
    out.gl_Position.z = _2505;
    out.gl_Position.w = _2507;
    float _2689 = _2259 + _2281;
    float _2691 = _2685 * _2627;
    float _2693 = _2263 + _2367;
    float _2695 = _2671 * 0.5;
    float _2697 = _2679 * 0.5;
    float _2699 = _2571 * _2625;
    out.m_73.x = _2689;
    out.m_73.y = _2693;
    out.m_73.z = _2659;
    out.m_75.x = _2695;
    out.m_75.y = _2681;
    out.m_75.z = _2697;
    out.m_75.w = _2507;
    float _2701 = _2691 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2703 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2705 = isnan(_2687);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2711 = _2707 || _2709;
    out.m_77.x = _2701;
    float _2713 = _2699 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2715 = _2655;
    float _2717 = _2691;
    float _2719 = _2699;
    if (!_2711)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2721 = _2509;
    float _2723 = _2721;
    float _2725 = _2721;
    if (!_2711)
    {
        _2511 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2727 = _2511;
    float _2729 = _2727;
    float _2731 = _2727;
    if (!_2711)
    {
        _2513 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2733 = _2513;
    float _2735 = _2733;
    float _2737 = _2733;
    if (!_2711)
    {
        _2715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2739 = _2715;
    float _2741 = _2739;
    float _2743 = _2739;
    if (!_2711)
    {
        _2717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2745 = _2717;
    float _2747 = _2745;
    float _2749 = _2745;
    if (!_2711)
    {
        _2719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2751 = _2719;
    bool _2753 = !_2711;
    float _2755 = _2751;
    float _2757 = _2751;
    if (!_2753)
    {
        bool _2759 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2761 = isnan(_2687);
        bool _2763 = _2759 || _2761;
        bool _2765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2767 = _2763 || _2765;
        if (!_2767)
        {
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = _2687 + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2773;
            float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2779 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2781 = 1.0 / _2775;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2799 = _2771 * _2781;
            float _2801 = precise::clamp(_2799, 0.0, 1.0);
            float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2807 = fma(_2801, _2779, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2801, _2805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2811 = fma(_2801, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2813 = fma(_2801, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2815 = fma(_2801, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2817 = fma(_2801, _2797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2731 = _2807;
            _2749 = _2815;
            _2725 = _2811;
            _2743 = _2813;
            _2737 = _2809;
            _2757 = _2817;
            _2819 = true;
        }
        else
        {
            bool _2821 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2823 = isnan(_2687);
            bool _2825 = _2821 || _2823;
            bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2829 = _2825 || _2827;
            if (!_2829)
            {
                _2723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2831 = _2723;
            _2725 = _2831;
            if (!_2829)
            {
                _2729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2833 = _2729;
            _2731 = _2833;
            if (!_2829)
            {
                _2735 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2835 = _2735;
            _2737 = _2835;
            if (!_2829)
            {
                _2741 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2837 = _2741;
            _2743 = _2837;
            if (!_2829)
            {
                _2747 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2839 = _2747;
            _2749 = _2839;
            if (!_2829)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2841 = _2755;
            bool _2843 = !_2829;
            _2757 = _2841;
            if (!_2843)
            {
                bool _2845 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2847 = isnan(_2687);
                bool _2849 = _2845 || _2847;
                bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2853 = _2849 || _2851;
                if (!_2853)
                {
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = _2687 + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2859;
                    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2867 = 1.0 / _2861;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2885 = _2857 * _2867;
                    float _2887 = precise::clamp(_2885, 0.0, 1.0);
                    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2893 = fma(_2887, _2865, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2887, _2891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2887, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2887, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2901 = fma(_2887, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2903 = fma(_2887, _2883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2731 = _2893;
                    _2749 = _2901;
                    _2725 = _2897;
                    _2743 = _2899;
                    _2737 = _2895;
                    _2757 = _2903;
                    _2819 = true;
                }
                else
                {
                    _2731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2749 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2743 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2737 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2819 = false;
    float _2905 = _2731;
    float _2907 = _2749;
    float _2909 = _2725;
    float _2911 = _2743;
    float _2913 = _2737;
    float _2915 = _2757;
    float _2917 = _2713 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2919 = fma(_2693, -0.5, 0.5);
    float _2921 = precise::clamp(_2919, 0.0, 1.0);
    float _2923 = -_2905;
    float _2925 = _2923 + _2907;
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    out.m_40.x = _2917;
    float _2931 = fma(_2921, _2925, _2905);
    float _2933 = -_2913;
    float _2935 = _2933 + _2915;
    float _2937 = fma(_2921, _2929, _2909);
    float _2939 = _2931 * 0.586610972881317138671875;
    bool _2941 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2943 = fma(_2921, _2935, _2913);
    out.m_79.x = 0.0;
    float _2945 = fma(_2937, 0.298911988735198974609375, _2939);
    bool _2947 = _2571 > 0.0;
    bool _2949 = isnan(_2571);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    float _2957 = fma(_2943, 0.114477999508380889892578125, _2945);
    bool _2959 = _2625 <= 0.0;
    bool _2961 = !_2955;
    bool _2963 = _2959 || _2961;
    float _2965 = -_2957;
    float _2967 = _2937 + _2965;
    float _2969 = -_2957;
    float _2971 = _2931 + _2969;
    float _2973 = -_2957;
    float _2975 = _2943 + _2973;
    float _2977 = fma(_2967, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2979 = fma(_2971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2981 = fma(_2975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    bool _2983 = !_2941;
    if (!_2983)
    {
        float _2985 = -_2429;
        float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2989 = -_2431;
        float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2993 = -_2433;
        float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2997 = _2987 * _2987;
        float _2999 = fma(_2991, _2991, _2997);
        float _3001 = fma(_2995, _2995, _2999);
        float _3003 = sqrt(_3001);
        float _3005 = rsqrt(_3001);
        float _3007 = -_3003;
        float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3011 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = _2991 * _3005;
        float _3017 = _2987 * _3005;
        float _3019 = abs(_3013);
        float _3021 = log2(_3019);
        float _3023 = _2995 * _3005;
        float _3025 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3027 = _2693 * _3017;
        float _3029 = -_3017;
        float _3031 = -_3025;
        float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3031);
        float _3035 = fma(_2689, _3015, _3027);
        float _3037 = -_3023;
        float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3033);
        float _3041 = fma(_2659, _3023, _3035);
        float _3043 = precise::clamp(_3041, 0.0, 1.0);
        float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3047 = _3039 + _3045;
        float _3049 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        float _3055 = exp2(_3049);
        float _3057 = _3055 * _3053;
        float _3059 = _3043 * _3057;
        float _3061 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3063 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3065 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _3061;
        out.m_79.y = _3063;
        out.m_79.z = _3065;
    }
    out.m_81.x = _2977;
    out.m_81.y = _2979;
    out.m_81.z = _2981;
    if (!_2963)
    {
        return out;
    }
    float _3067 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_40.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3067;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2819 = false;
    bool _422 = false;
    bool _298 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_37.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_40.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_116);
        out.gl_Position.z = _3124;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_42.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_40.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3193 = as_type<float>(_154);
        out.gl_Position.z = _3193;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = as_type<float>(int(gl_VertexIndex));
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _160 = as_type<int>(_156) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_156) & 2;
    bool _166 = _164 != 0;
    bool _168 = !_162;
    float _170 = _168 ? (-0.5) : 0.5;
    bool _172 = !_166;
    float _174 = _172 ? (-0.5) : 0.5;
    bool _176 = !_158;
    float _194;
    if (!_176)
    {
        float _178 = in.m_47.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_100);
        float _200 = 1.0 / _198;
        float _202 = _134 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -_220;
    float _228 = _226 + 1.0;
    bool _230 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_204);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _224;
    float _250 = _240 * _228;
    float _252 = -_240;
    float _254 = _252 + 1.0;
    float _256 = _208 * _248;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = fma(_244, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _264 = fma(_260, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _266 = _262 * _250;
    float _268 = _264 * _250;
    float _270 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _272 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _276 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    bool _278 = !_246;
    float _296;
    if (!_278)
    {
        float _280 = in.m_47.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = in.m_49.x;
    float _310 = in.m_49.y;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _330 = isnan(_306);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _346 = _306 + _344;
    float _348 = -_322;
    float _350 = _348 + 1.0;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _354 = 1.0 / _326;
    float _356 = _338 * _350;
    float _358 = -_338;
    float _360 = _358 + 1.0;
    float _362 = _276 * _310;
    float _364 = _274 * _308;
    float _366 = _342 * _354;
    float _368 = fma(_366, _346, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _370 = _368 * _356;
    float _372 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[115].x, _370);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _380 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[116].x, _372);
    float _382 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = _376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _386 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _388 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_51.x = _382;
    out.m_51.y = _384;
    out.m_51.z = _386;
    out.m_51.w = _388;
    bool _390 = !_352;
    float _392 = _386;
    float _416;
    float _418;
    float _420;
    if (!_390)
    {
        float _394 = in.m_47.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _398 = float(_100);
        float _400 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _402 = 1.0 / _398;
        float _404 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _406 = _404 * _396;
        float _408 = floor(_406);
        float _410 = _134 * _402;
        float _412 = -_408;
        float _414 = _406 + _412;
        _416 = _410;
        _418 = _398;
        _420 = _414;
        _422 = true;
    }
    else
    {
        float _424 = float(_100);
        float _426 = 1.0 / _424;
        float _428 = _134 * _426;
        _416 = _428;
        _418 = _424;
        _420 = _428;
    }
    _422 = false;
    float _430 = _416;
    float _432 = _418;
    float _434 = _420;
    float _436 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _438 = int(_436);
    float _440 = in.m_47.x;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    float _446 = in.m_37.x;
    float _448 = in.m_37.y;
    float _450 = in.m_37.z;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _454 = int(_452);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _458 = _456 != 0;
    float _460 = in.m_53.x;
    float _462 = in.m_53.y;
    float _464 = in.m_53.z;
    float _466 = in.m_53.w;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _472 = float(_438);
    float _474 = _388;
    if (!_444)
    {
        float _476 = in.m_47.y;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _484 = 0.0;
    if (!_444)
    {
        float _486 = in.m_47.z;
        _484 = _486;
    }
    float _488 = _484;
    float _490 = 1.0 / _472;
    float _492 = float(uint(_454));
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _498 = float(_454);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _504 = ~_454;
    int _506 = _504 + 1;
    bool _508 = _454 == 0;
    float _510 = 1.0 / _492;
    float _512 = _448 * _462;
    float _514 = 0.0;
    if (_444)
    {
        _514 = _440;
    }
    float _516 = _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _522 = fma(_446, _460, _512);
    float _524 = _490 * _134;
    int _526 = ~_454;
    int _528 = _526 + 1;
    float _530 = 1.0 / _470;
    float _532 = 0.0;
    float _534 = _516;
    if (!_444)
    {
        _532 = _478;
    }
    float _536 = _532;
    float _538 = _536;
    if (!_444)
    {
        _392 = _536;
    }
    float _540 = _392;
    int _542 = as_type<int>(_510) + (-2);
    float _544 = trunc(_524);
    int _546 = int(_544);
    float _548 = 0.0;
    float _550 = _488;
    if (!_444)
    {
        _548 = _488;
    }
    float _552 = _548;
    float _554 = _540;
    float _556 = _478;
    float _558 = _552;
    if (_444)
    {
        float _560 = in.m_47.x;
        float _562 = in.m_47.y;
        _554 = _560;
        _556 = _562;
    }
    float _564 = _554;
    float _566 = _556;
    bool _568 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _570 = isnan(_430);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = 1.0 / _482;
    float _582 = float(uint(_546));
    float _584 = 1.0 / _496;
    float _586 = as_type<float>(_542) * _582;
    float _588 = trunc(_586);
    float _590 = precise::max(_588, 0.0);
    uint _593 = uint(_590);
    if (_444)
    {
        _538 = _566;
    }
    float _595 = _538;
    float _597 = _595;
    if (_444)
    {
        _558 = _595;
    }
    float _599 = _558;
    float _601 = 1.0 / _502;
    if (_444)
    {
        _550 = _595;
    }
    float _603 = _550;
    if (!_444)
    {
        _597 = _440;
    }
    float _605 = _597;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _609 = _528 * int(_593);
    int _611 = _609 + _546;
    float _613 = 1.0 / _520;
    float _615 = _605 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _617 = float(uint(_611));
    float _619 = as_type<float>(_542) * _617;
    float _621 = float(_546);
    bool _623 = !_444;
    float _625 = _623 ? 1.2345600128173828125 : 1.0;
    bool _627 = _621 >= _498;
    bool _629 = isnan(_621);
    bool _631 = _627 || _629;
    bool _633 = isnan(_498);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = trunc(_619);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    bool _645 = !_444;
    float _647 = _645 ? _566 : _440;
    float _649 = _625 * _647;
    float _651 = trunc(_637);
    int _653 = int(_651);
    int _655 = int(_593) + int(_643);
    float _657 = floor(_649);
    int _659 = _506 * _655;
    int _661 = _659 + _546;
    float _663 = 1.0 / _432;
    bool _665 = uint(_661) >= uint(_454);
    bool _667 = !_665;
    int _669 = _667 ? 0 : (-1);
    float _671 = -_657;
    float _673 = _649 + _671;
    int _675 = ~_653;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    int _681 = ~_655;
    int _683 = _681 + _669;
    int _685 = _683 + 1;
    float _687 = _498 * _673;
    float _689 = _498 * _134;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _697 = _695 != 0;
    int _699 = _454 * _685;
    int _701 = _699 + _546;
    float _703 = _689 * _663;
    float _705 = trunc(_687);
    int _707 = int(_705);
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _711 = _709 != 0;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _715 = _713 != 0;
    bool _717 = !_508;
    int _719 = _717 ? _701 : (-1);
    bool _721 = !_697;
    int _723 = _721 ? 0 : 1;
    int _725 = _719 * _679;
    int _727 = _454 + (-1);
    float _729 = trunc(_703);
    int _731 = int(_729);
    bool _733 = !_458;
    int _735 = _733 ? 0 : 1;
    int _737 = abs(_723);
    int _739 = _653 * _727;
    int _741 = _739 + _725;
    bool _743 = !_693;
    int _745 = _743 ? 0 : 1;
    int _747 = abs(_735);
    int _749 = _741 * _737;
    bool _751 = !_711;
    int _753 = _751 ? 0 : 1;
    int _755 = abs(_745);
    int _757 = _707 * _747;
    int _759 = _757 + _546;
    int _761 = abs(_753);
    bool _763 = !_715;
    int _765 = _763 ? 0 : 1;
    float _767 = in.m_47.z;
    float _769 = in.m_47.w;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    int _775 = _731 * _755;
    int _777 = _775 + _749;
    int _779 = abs(_765);
    float _781 = float(uint(_759));
    int _783 = _759 * _761;
    int _785 = _783 + _777;
    int _787 = ~_454;
    int _789 = _787 + 1;
    int _791 = _707 * _779;
    int _793 = _791 + _785;
    float _795 = as_type<float>(_542) * _781;
    int _797 = ~_454;
    int _799 = _797 + 1;
    float _801 = float(uint(_793));
    float _803 = trunc(_795);
    float _805 = precise::max(_803, 0.0);
    uint _807 = uint(_805);
    float _809 = as_type<float>(_542) * _801;
    bool _811 = _769 > 0.5;
    float _813 = trunc(_809);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    bool _819 = _767 > 0.5;
    float _821 = -_174;
    int _823 = _811 ? as_type<int>(_821) : as_type<int>(_174);
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _827 = _825 != 0;
    int _829 = _799 * int(_807);
    int _831 = _829 + _759;
    float _833 = -_170;
    int _835 = _819 ? as_type<int>(_833) : as_type<int>(_170);
    bool _837 = !_773;
    float _839 = _837 ? _174 : as_type<float>(_823);
    float _841 = float(uint(_831));
    if (!_444)
    {
        _534 = _767;
    }
    float _843 = _534;
    bool _845 = !_827;
    float _847 = _845 ? _170 : as_type<float>(_835);
    int _849 = _789 * int(_817);
    int _851 = _849 + _793;
    float _853 = as_type<float>(_542) * _841;
    float _855 = float(uint(_851));
    float _857 = trunc(_853);
    float _859 = precise::max(_857, 0.0);
    uint _861 = uint(_859);
    float _863 = as_type<float>(_542) * _855;
    float _865 = trunc(_863);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    int _871 = int(_807) + int(_861);
    int _873 = ~_454;
    int _875 = _873 + 1;
    int _877 = int(_817) + int(_869);
    float _879 = in.m_55.x;
    float _881 = in.m_55.y;
    float _883 = in.m_55.z;
    float _885 = in.m_55.w;
    int _887 = _789 * _871;
    int _889 = _887 + _759;
    int _891 = _875 * _877;
    int _893 = _891 + _793;
    bool _895 = uint(_889) >= uint(_454);
    bool _897 = uint(_893) >= uint(_454);
    float _899 = in.m_57.x;
    float _901 = in.m_57.y;
    float _903 = in.m_57.z;
    float _905 = in.m_57.w;
    bool _907 = !_895;
    int _909 = _907 ? 0 : (-1);
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _913 = _911 != 0;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _917 = _915 != 0;
    bool _919 = !_897;
    int _921 = _919 ? 0 : (-1);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _933 = _931 != 0;
    float _935 = _448 * _881;
    int _937 = ~_877;
    int _939 = _937 + _921;
    int _941 = _939 + 1;
    int _943 = ~_871;
    int _945 = _943 + _909;
    int _947 = _945 + 1;
    float _949 = _448 * _901;
    float _951 = fma(_446, _879, _935);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = fma(_446, _899, _949);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _963 = fma(_450, _464, _522);
    float _965 = 1.0 / _955;
    float _967 = fma(_450, _903, _957);
    float _969 = fma(_450, _883, _951);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _979;
    float _983 = 1.0 / _961;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _985;
    float _989 = _977 * _530;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _995 = _981 * _584;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _999 = _997 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1001 = _987 * _580;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1003;
    float _1007 = _973 * _601;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1011 = _430 + _1009;
    bool _1013 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1015 = isnan(_430);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = 1.0 / _999;
    float _1027 = _1005 * _965;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1033 = _993 * _983;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1037 = _430 + _1035;
    float _1039 = fma(_989, _1011, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1041 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1043 = isnan(_430);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = -_1023;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1007, _1037, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1065 = _434 + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1069 = _430 + _1067;
    float _1071 = _1031 * _613;
    bool _1073 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1075 = isnan(_430);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_995, _1065, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1087 = fma(_1001, _1069, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1091 = _430 + _1089;
    bool _1093 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1095 = isnan(_430);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = _1051 * _1055;
    float _1107 = -_1051;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(_1071, _1091, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1115 = _430 + _1113;
    float _1117 = _1061 * _1025;
    float _1119 = _1103 * _1109;
    float _1121 = -_1103;
    float _1123 = _1121 + 1.0;
    float _1125 = fma(_1027, _1115, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1129 = _430 + _1127;
    bool _1131 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1133 = isnan(_430);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = _1083 * _1123;
    float _1145 = -_1083;
    float _1147 = _1145 + 1.0;
    bool _1149 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1151 = isnan(_430);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_1033, _1129, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1163 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1165 = isnan(_434);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1171 = _1167 || _1169;
    float _1173 = float(_1171);
    float _1175 = _1141 * _1147;
    float _1177 = -_1141;
    float _1179 = _1177 + 1.0;
    float _1181 = -_1159;
    float _1183 = _1181 + 1.0;
    bool _1185 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1187 = isnan(_434);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    float _1197 = -_1173;
    float _1199 = _1197 + 1.0;
    float _1201 = _1159 * _1179;
    bool _1203 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1205 = isnan(_430);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1211 = _1207 || _1209;
    float _1213 = float(_1211);
    float _1215 = _578 * _1183;
    float _1217 = -_578;
    float _1219 = _1217 + 1.0;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1223 = _430 + _1221;
    float _1225 = _963 + _466;
    float _1227 = _1213 * _1219;
    float _1229 = -_1213;
    float _1231 = _1229 + 1.0;
    float _1233 = _1195 * _1199;
    float _1235 = fma(_1117, _1223, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1237 = _1057 * _1227;
    float _1239 = _969 + _885;
    int _1241 = _454 * _941;
    int _1243 = _1241 + _793;
    float _1245 = _967 + _905;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1249 = _843 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1251 = !_508;
    int _1253 = _1251 ? _1243 : (-1);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1257 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1237);
    float _1259 = _1085 * _1233;
    float _1261 = -_1195;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1255);
    int _1267 = _1253 >> 31;
    float _1269 = -_1247;
    float _1271 = fma(_1249, 2.0, _1269);
    float _1273 = fma(_1039, _1215, _1257);
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1259);
    int _1277 = _1267 & 3;
    float _1279 = fma(_1087, _1201, _1273);
    float _1281 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1275);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1285 = _1253 + _1277;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1293 = _1285 >> 2;
    float _1295 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = fma(_1111, _1175, _1279);
    int _1303 = _1293 << 4;
    int _1305 = _1303 + 512;
    int _1307 = _454 * _947;
    int _1309 = _1307 + _759;
    float _1311 = -_174;
    int _1313 = _819 ? as_type<int>(_1311) : as_type<int>(_174);
    out.m_59.x = _1295;
    out.m_59.y = _1297;
    out.m_59.z = _1299;
    out.m_59.w = _1289;
    bool _1315 = _566 > 0.5;
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1319 = !_917;
    float _1321 = _1319 ? _174 : as_type<float>(_1313);
    float _1323 = _564 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1325 = -_170;
    int _1327 = _1315 ? as_type<int>(_1325) : as_type<int>(_170);
    float _1329 = fma(_1125, _1143, _1301);
    int _1331 = _1253 & 3;
    bool _1333 = _1331 != 0;
    float _1335 = -_134;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1271);
    bool _1339 = !_913;
    float _1341 = _1339 ? _170 : as_type<float>(_1327);
    float _1343 = _847 + 0.5;
    int _1345 = _1253 & 3;
    bool _1347 = _1345 != 0;
    int _1349 = _1333 ? 0 : 1;
    uint _1351 = uint(int(uint(_1305) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[int(_1361)][_1363];
    bool _1367 = uint(_1345) > 1u;
    bool _1369 = !_508;
    int _1371 = _1369 ? _1309 : (-1);
    float _1373 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1375 = uint(_1345) >= 2u;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1225 + _1377;
    int _1381 = _1305 + 8;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[int(_1393)][_1395];
    int _1399 = _1375 ? 0 : 1;
    bool _1401 = _1345 != 3;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1405 = ~_1349;
    int _1407 = _1405 + 1;
    int _1409 = _1407 + 1;
    int _1411 = _1409;
    float _1413 = _1225;
    if (!_1367)
    {
        int _1415 = ~_1349;
        int _1417 = _1415 + 1;
        _1411 = _1417;
    }
    int _1419 = _1411;
    float _1421 = -_1403;
    float _1423 = fma(_1323, 2.0, _1421);
    bool _1425 = _1345 != 3;
    float _1427 = -_134;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1423);
    bool _1431 = !_1347;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1437 = abs(_1419);
    float _1439 = _1341 + 0.5;
    int _1441 = abs(_1433);
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1445 = ~_1437;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    float _1451 = fma(_615, -2.0, _1435);
    int _1453 = ~_1399;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = fma(_1373, _1439, _1337);
    int _1461 = _1457;
    if (_1401)
    {
        int _1463 = ~_1399;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    float _1469 = fma(_607, -2.0, _1443);
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1473 = _1245 + _1471;
    bool _1475 = !_1425;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1429);
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1495 = _1239 + _1493;
    bool _1497 = !_925;
    int _1499 = _1497 ? 0 : 1;
    int _1501 = abs(_1467);
    int _1503 = abs(_1499);
    int _1505 = abs(_1477);
    int _1507 = _1449 * as_type<int>(_1365);
    int _1509 = ~_1441;
    int _1511 = _1509 + 1;
    int _1513 = _1511 + 1;
    int _1515 = ~_1501;
    int _1517 = _1515 + 1;
    int _1519 = _1517 + 1;
    float _1521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1523 = _1513 * as_type<int>(_1357);
    int _1525 = _1523 + _1507;
    float _1527 = fma(_1161, _1119, _1329);
    int _1529 = ~_1505;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1469);
    int _1537 = _1519 * as_type<int>(_1389);
    int _1539 = _1537 + _1525;
    float _1541 = _839 + (-0.5);
    float _1543 = fma(_1235, _1105, _1527);
    int _1545 = _1533 * as_type<int>(_1397);
    int _1547 = _1545 + _1539;
    float _1549 = -_1541;
    float _1551 = -_1535;
    float _1553 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1551);
    int _1555 = ~_1503;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1567 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1451);
    int _1569 = _1547 * _1559;
    float _1571 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1573 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1565);
    float _1575 = _1321 + (-0.5);
    float _1577 = -_174;
    int _1579 = _1315 ? as_type<int>(_1577) : as_type<int>(_174);
    float _1581 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1561);
    bool _1583 = _440 > 0.5;
    float _1585 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1573);
    float _1587 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1589 = -_1571;
    float _1591 = -_1567;
    float _1593 = fma(_1589, _1575, _1591);
    float _1595 = -_170;
    int _1597 = _1583 ? as_type<int>(_1595) : as_type<int>(_170);
    int _1599 = _1371 * _1503;
    int _1601 = _1599 + _1569;
    float _1603 = -_1585;
    float _1605 = _1603 + 1.0;
    float _1607 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1587);
    bool _1609 = !_929;
    float _1611 = _1609 ? _170 : as_type<float>(_1597);
    float _1613 = -_1605;
    float _1615 = fma(_1341, _1613, _1459);
    float _1617 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1265);
    float _1619 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1607);
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1623 = _1473 * _1473;
    float _1625 = _1611 + 0.5;
    bool _1627 = !_933;
    float _1629 = _1627 ? _174 : as_type<float>(_1579);
    float _1631 = -_1617;
    float _1633 = _1631 + 1.0;
    bool _1635 = _1619 >= 0.0;
    float _1637 = fma(_1379, _1379, _1623);
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1641 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1643 = -_1629;
    float _1645 = _1643 + 0.5;
    float _1647 = -_1633;
    float _1649 = fma(_847, _1647, _1479);
    float _1651 = fma(_1495, _1495, _1637);
    float _1653 = _1641 * _1563;
    float _1655 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1621);
    float _1657 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1581);
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1661 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1543);
    float _1663 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1655);
    float _1665 = rsqrt(_1651);
    float _1667 = as_type<float>(_1559);
    int _1669 = as_type<int>(_1663);
    if (_1635)
    {
        _1667 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1671 = _1667;
    float _1673 = -_1657;
    float _1675 = _1673 + 1.0;
    float _1677 = -_1663;
    float _1679 = _1677 + 1.0;
    float _1681 = float(_1601);
    float _1683 = _1659 * _1639;
    if (_1635)
    {
        float _1685 = _1671 * 5.0;
        _1669 = as_type<int>(_1685);
    }
    int _1687 = _1669;
    float _1689 = fma(_839, _1675, _1553);
    float _1691 = fma(_1321, _1679, _1593);
    out.m_61.x = _1661;
    bool _1693 = !_1487;
    int _1695 = _1693 ? 0 : 1;
    bool _1697 = !_1491;
    int _1699 = _1697 ? 0 : 1;
    float _1701 = as_type<float>(_1687);
    if (_1635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5534 = as_type<float>(_1687);
        out.gl_Position.z = _5534;
    }
    bool _1703 = !_1483;
    int _1705 = _1703 ? 0 : 1;
    float _1707 = _1473 * _1665;
    float _1709 = _1379 * _1665;
    out.m_63.x = _1653;
    out.m_63.y = _1683;
    out.m_63.z = _1649;
    out.m_63.w = _1689;
    out.m_65.x = _1615;
    out.m_65.y = _1691;
    out.m_67.y = _1681;
    float _1711 = _1707;
    if (_1635)
    {
        out.m_40.x = 0.0;
    }
    if (_1635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1713 = -_1707;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1717 = _1495 * _1665;
    float _1719 = -_1709;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1725 = _1715 + _1723;
    float _1727 = -_1717;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1733 = _1721 + _1731;
    float _1735 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1739 = _1729 + _1737;
    float _1741 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1735);
    float _1743 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1741);
    bool _1745 = _1743 >= 0.0;
    if (_1745)
    {
        _1701 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1747 = _1701;
    int _1749 = as_type<int>(_1747);
    if (_1745)
    {
        out.m_40.x = 0.0;
    }
    if (_1745)
    {
        float _1751 = _1747 * 5.0;
        _1749 = as_type<int>(_1751);
    }
    int _1753 = _1749;
    if (_1745)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5653 = as_type<float>(_1753);
        out.gl_Position.z = _5653;
    }
    if (_1745)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1755 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1757 = fma(_1729, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1759 = floor(_1755);
    float _1761 = floor(_1757);
    float _1763 = -_1759;
    float _1765 = _1755 + _1763;
    float _1767 = -_1761;
    float _1769 = _1757 + _1767;
    float2 _5689 = float2(_1765, _1769);
    float _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).x;
    float _1773 = _767 * 2.0;
    float _1775 = _440 * 2.0;
    float _1777 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1779 = log2(_1777);
    float _1781 = _566 * 2.0;
    int _1783 = abs(_1705);
    float _1785 = -_1707;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    int _1789 = abs(_1695);
    float _1791 = -_1717;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1495);
    float _1795 = float(_1783);
    float _1797 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1799 = floor(_1773);
    int _1801 = abs(_1699);
    float _1803 = floor(_1775);
    bool _1805 = _1799 > 0.0;
    float _1807 = _1779 * _134;
    bool _1809 = _1799 >= 0.0;
    bool _1811 = isnan(_1799);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    float _1819 = _566 + _440;
    float _1821 = floor(_1781);
    int _1823 = _1817 ? 0 : 1;
    float _1825 = _1819 + (-1.0);
    bool _1827 = _1803 >= 0.0;
    bool _1829 = isnan(_1803);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.0);
    bool _1835 = _1831 || _1833;
    int _1837 = ~_1823;
    int _1839 = _1837 + 1;
    int _1841 = _1839 + 1;
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1845 = exp2(_1807);
    int _1847 = _1841;
    if (!_1805)
    {
        int _1849 = ~_1823;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    float _1855 = _767 + _566;
    bool _1857 = _1803 > 0.0;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1861 = 1.0 + _1859;
    float _1863 = _1855 + (-1.0);
    bool _1865 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1867 = isnan(1.0);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1873 = _1869 || _1871;
    float _1875 = 1.0 / _1861;
    float _1877 = float(_1853);
    float _1879 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1881 = _1835 ? 0 : 1;
    float _1883 = in.m_69.x;
    float _1885 = in.m_69.y;
    float _1887 = in.m_69.z;
    bool _1889 = _1821 > 0.0;
    float _1891 = _1795 * _1877;
    int _1893 = ~_1881;
    int _1895 = _1893 + 1;
    int _1897 = _1895 + 1;
    float _1899 = -_1845;
    float _1901 = _1899 + 1.0;
    int _1903 = _1897;
    if (!_1857)
    {
        int _1905 = ~_1881;
        int _1907 = _1905 + 1;
        _1903 = _1907;
    }
    int _1909 = _1903;
    float _1911 = _1787 * _1787;
    float _1913 = -_1709;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    bool _1917 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1919 = isnan(0.0);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1925 = _1921 || _1923;
    float _1927 = _1891 * (-2.0);
    float _1929 = float(_1909);
    float _1931 = fma(_1915, _1915, _1911);
    float _1933 = float(_1789);
    float _1935 = _566 + (-0.5);
    float _1937 = _1925 ? _1901 : 0.0;
    float _1939 = fma(_1793, _1793, _1931);
    bool _1941 = _1821 >= 0.0;
    bool _1943 = isnan(_1821);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan(0.0);
    bool _1949 = _1945 || _1947;
    float _1951 = _1933 * _1929;
    float _1953 = _440 + (-0.5);
    if (_1873)
    {
        float _1955 = _1937 * _1875;
        _138 = _1955;
    }
    float _1957 = _138;
    int _1959 = _1949 ? 0 : 1;
    float _1961 = _1951 * (-2.0);
    float _1963 = _767 + _440;
    float _1965 = fma(_1927, _1883, _1883);
    int _1967 = ~_1959;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    float _1973 = fma(_1879, _1961, _1879);
    int _1975 = _1971;
    if (!_1889)
    {
        int _1977 = ~_1959;
        int _1979 = _1977 + 1;
        _1975 = _1979;
    }
    int _1981 = _1975;
    float _1983 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1965);
    float _1985 = fma(_1961, _1885, _1885);
    float _1987 = _1963 + (-1.0);
    float _1989 = float(_1981);
    float _1991 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1985);
    float _1993 = float(_1801);
    float _1995 = _767 + (-0.5);
    float _1997 = fma(_1973, _1957, _1991);
    float _1999 = fma(_1843, _1927, _1843);
    float _2001 = _1993 * _1989;
    bool _2003 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2005 = isnan(0.5);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2011 = _2007 || _2009;
    float _2013 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2015 = fma(_1999, _1957, _1983);
    float _2017 = _2001 * (-2.0);
    float _2019 = _1997 * 0.15915493667125701904296875;
    float _2021 = sqrt(_1939);
    float _2023 = _2015 * 0.15915493667125701904296875;
    float _2025 = fma(_2017, _1887, _1887);
    float _2027 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2029 = fma(_2013, _2017, _2013);
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2025);
    float _2033 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2027);
    float _2035 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2037 = _2023 * 6.283185482025146484375;
    float _2039 = sin(_2037);
    float _2041 = fma(_2029, _1957, _2031);
    float _2043 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2045 = _2041 * 0.15915493667125701904296875;
    float _2047 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2049 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2035);
    float _2051 = _2023 * 6.283185482025146484375;
    float _2053 = cos(_2051);
    float _2055 = _1665 * _2021;
    float _2057 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2059 = _2055 * _1797;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2063 = _2019 * 6.283185482025146484375;
    float _2065 = sin(_2063);
    float _2067 = _2061 + _2047;
    float _2069 = _2019 * 6.283185482025146484375;
    float _2071 = cos(_2069);
    float _2073 = 1.0 / _2047;
    float _2075 = _2039 * _2065;
    float _2077 = _2053 * _2065;
    float _2079 = _2045 * 6.283185482025146484375;
    float _2081 = sin(_2079);
    float _2083 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2085 = _2053 * _2071;
    float _2087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _174);
    float _2089 = _174 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2091 = _2055 * _2083;
    float _2093 = _2045 * 6.283185482025146484375;
    float _2095 = cos(_2093);
    float _2097 = _2067 * _2073;
    float _2099 = _2097 * 0.5;
    float _2101 = _2039 * _2071;
    float _2103 = _2087 * _2091;
    float _2105 = fma(_2081, _2085, _2075);
    float _2107 = fma(_2081, _2075, _2085);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2109);
    float _2113 = -_2103;
    float _2115 = _2081 * _2113;
    float _2117 = 1.0 / _2111;
    float _2119 = _2053 * _2095;
    float _2121 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _170);
    float _2123 = _2071 * _2095;
    float _2125 = _2039 * _2095;
    float _2127 = _2065 * _2095;
    float _2129 = -_2077;
    float _2131 = fma(_2081, _2101, _2129);
    float _2133 = -_2101;
    float _2135 = fma(_2081, _2077, _2133);
    float _2137 = _2121 * _2059;
    float _2139 = _2119 * _2103;
    float _2141 = _2125 * _2103;
    float _2143 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2145 = _2143 * 0.5;
    float _2147 = fma(_2123, _2137, _2115);
    float _2149 = fma(_2105, _2137, _2139);
    float _2151 = fma(_2131, _2137, _2141);
    float _2153 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2155 = fma(_2127, _2145, _2147);
    float _2157 = fma(_2135, _2145, _2149);
    float _2159 = fma(_2107, _2145, _2151);
    float _2161 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2163 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2165 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2167 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2169 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2153);
    float _2171 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2163);
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2165);
    float _2175 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2167);
    float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2179 = _2117 * _2177;
    float _2181 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2161);
    float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2173);
    float _2185 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2175);
    float _2187 = abs(_2179);
    float _2189 = log2(_2187);
    float _2191 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2197 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2199 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2201 = _1239 + _2193;
    float _2203 = _1225 + _2195;
    float _2205 = -_2081;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2209 = -_2081;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2197);
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2215 = _2201 + _2213;
    float _2217 = -_2081;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2223 = _2203 + _2221;
    float _2225 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2227 = _2215 * _2215;
    float _2229 = _2157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2231 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2233 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2235 = fma(_2223, _2223, _2227);
    float _2237 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2181);
    float _2239 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2241 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2169);
    float _2243 = sqrt(_2235);
    float _2245 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2225);
    float _2247 = fma(_2131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2171);
    float _2249 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2229);
    float _2251 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2233);
    float _2253 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2239);
    float _2255 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2207);
    float _2257 = exp2(_2231);
    float _2259 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2245);
    float _2261 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2249);
    float _2263 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2251);
    float _2265 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2211);
    float _2267 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2269 = _170 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2271 = _2243 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2273 = _2089 * _2255;
    float _2275 = _1245 + _2267;
    float _2277 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2279 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2253);
    float _2281 = fma(_2269, _2241, _2273);
    float _2283 = _2089 * _2265;
    float _2285 = _2089 * _2277;
    float _2287 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2289 = precise::clamp(_2287, 0.0, 1.0);
    float _2291 = fma(_2289, -2.0, 3.0);
    float _2293 = _2289 * _2289;
    float _2295 = _2273;
    float _2297 = _2203;
    float _2299 = _2201;
    if (!_2271)
    {
        _2295 = _2275;
    }
    float _2301 = _2295;
    float _2303 = _2293 * _2291;
    bool _2305 = !_2271;
    float _2307 = _2301;
    if (!_2305)
    {
        float _2309 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2313 = _2243 + _2311;
        float _2315 = rsqrt(_2235);
        float _2317 = _2313 * _2309;
        float _2319 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2321 = _2317 * 0.15915493667125701904296875;
        float _2323 = _2321 * 6.283185482025146484375;
        float _2325 = cos(_2323);
        float _2327 = _2321 * 6.283185482025146484375;
        float _2329 = sin(_2327);
        float _2331 = _2325 + (-1.0);
        float _2333 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2335 = fma(_2329, _2319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2337 = fma(_2275, _2325, _2333);
        float _2339 = _2315 * _2335;
        float _2341 = fma(_2223, _2339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2343 = fma(_2215, _2339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2297 = _2341;
        _2307 = _2337;
        _2299 = _2343;
    }
    float _2345 = _2297;
    float _2347 = _2307;
    float _2349 = _2299;
    float _2351 = -_1709;
    float _2353 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2345);
    float _2355 = -_1707;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2347);
    float _2359 = -_2303;
    float _2361 = _2359 + 1.0;
    float _2363 = -_1717;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    float _2367 = fma(_2269, _2237, _2283);
    float _2369 = _2353;
    float _2371 = _2365;
    float _2373 = _2349;
    if (_2011)
    {
        _1711 = _2353;
    }
    float _2375 = _1711;
    float _2377 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2303);
    float _2379 = _2375;
    if (_2011)
    {
        _2369 = _2357;
    }
    float _2381 = _2369;
    float _2383 = _2381;
    if (!_2011)
    {
        float _2385 = _1725 * _1725;
        float _2387 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2389 = -_1239;
        float _2391 = _2389 + _2349;
        float _2393 = -_1225;
        float _2395 = _2393 + _2345;
        float _2397 = fma(_1733, _1733, _2385);
        float _2399 = -_1245;
        float _2401 = _2399 + _2347;
        float _2403 = fma(_1739, _1739, _2397);
        float _2405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2407 = sqrt(_2403);
        float _2409 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2411 = 1.0 / _2055;
        float _2413 = precise::min(_2407, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2415 = _2413 * _2405;
        float _2417 = _2415 * _2411;
        float _2419 = _2409 * _2417;
        float _2421 = _2391 * _2417;
        float _2423 = fma(_2395, _2419, _1721);
        float _2425 = fma(_2401, _2419, _1715);
        float _2427 = fma(_2409, _2421, _1729);
        _2383 = _2425;
        _2379 = _2423;
        _2371 = _2427;
    }
    float _2429 = _2383;
    float _2431 = _2379;
    float _2433 = _2371;
    float _2435 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2437 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2439 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2443 = isnan(0.5);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2449 = _2445 || _2447;
    float _2451 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2435);
    float _2453 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2437);
    float _2455 = _2429 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2457 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2439);
    float _2459 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2451);
    float _2461 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2453);
    float _2463 = fma(_2431, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2455);
    float _2465 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2457);
    float _2467 = _2459 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2469 = _2461 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2471 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2463);
    float _2473 = _2465 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2475 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2477 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2479 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2481 = _2467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2483 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2475);
    float _2485 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2477);
    float _2487 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2479);
    float _2489 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2481);
    float _2491 = _2471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2493 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2483);
    float _2495 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2485);
    float _2497 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2487);
    float _2499 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2489);
    float _2501 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2493);
    float _2503 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2495);
    float _2505 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2497);
    float _2507 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2499);
    float _2509 = _2505;
    float _2511 = _2503;
    float _2513 = _2501;
    if (_2449)
    {
        _1413 = 1.0;
    }
    float _2515 = _1413;
    float _2517 = _2515;
    if (_2449)
    {
        _2373 = 1.0;
    }
    float _2519 = _2373;
    float _2521 = _2519;
    if (!_2449)
    {
        float _2523 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2525 = _2523 * 0.15915493667125701904296875;
        float _2527 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2529 = _2525 * 6.283185482025146484375;
        float _2531 = cos(_2529);
        float _2533 = _2527 * 0.15915493667125701904296875;
        float _2535 = _2525 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = 1.0 / _2531;
        float _2541 = _2533 * 6.283185482025146484375;
        float _2543 = cos(_2541);
        float _2545 = _2537 * _2539;
        float _2547 = _2533 * 6.283185482025146484375;
        float _2549 = sin(_2547);
        float _2551 = _2543 * _2545;
        float _2553 = 1.0 / _2551;
        float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2557 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2555;
        float _2559 = 1.0 / _2557;
        float _2561 = _2549 * _2553;
        float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2565 = fma(_2179, _2561, _2563);
        float _2567 = _2565 * _2559;
        float _2569 = precise::clamp(_2567, 0.0, 1.0);
        _2521 = _2569;
    }
    float _2571 = _2521;
    if (!_2449)
    {
        float _2573 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2575 = _2573 * 0.15915493667125701904296875;
        float _2577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2579 = _2575 * 6.283185482025146484375;
        float _2581 = cos(_2579);
        float _2583 = _2577 * 0.15915493667125701904296875;
        float _2585 = _2575 * 6.283185482025146484375;
        float _2587 = sin(_2585);
        float _2589 = 1.0 / _2581;
        float _2591 = _2583 * 6.283185482025146484375;
        float _2593 = cos(_2591);
        float _2595 = _2587 * _2589;
        float _2597 = _2583 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2593 * _2595;
        float _2603 = 1.0 / _2601;
        float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2607 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2605;
        float _2609 = 1.0 / _2607;
        float _2611 = _2599 * _2603;
        float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2615 = fma(_2179, _2611, _2613);
        float _2617 = _2615 * _2609;
        float _2619 = precise::clamp(_2617, 0.0, 1.0);
        float _2621 = -_2619;
        float _2623 = _2621 + 1.0;
        _2517 = _2623;
    }
    float _2625 = _2517;
    float _2627 = in.m_71.x;
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2631 = _2429 + _2629;
    bool _2633 = _2179 <= 8000.0;
    bool _2635 = isnan(_2179);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan(8000.0);
    bool _2641 = _2637 || _2639;
    float _2643 = float(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2647 = _2431 + _2645;
    float _2649 = fma(_2269, _2247, _2285);
    float _2651 = _2631 * _2631;
    float _2653 = -_1771;
    float _2655 = _2653 + 1.0;
    float _2657 = _2643 * _2377;
    float _2659 = _2279 + _2649;
    float _2661 = fma(_2647, _2647, _2651);
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2665 = _2433 + _2663;
    float _2667 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2669 = _2507 * 0.5;
    float _2671 = _2501 + _2507;
    float _2673 = fma(_2665, _2665, _2661);
    float _2675 = _2655 * _2667;
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2505 + _2507;
    float _2681 = fma(_2503, -0.5, _2669);
    float _2683 = -_2677;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2687 = sqrt(_2673);
    out.gl_Position.x = _2501;
    out.gl_Position.y = _2503;
    out.gl_Position.z = _2505;
    out.gl_Position.w = _2507;
    float _2689 = _2259 + _2281;
    float _2691 = _2685 * _2627;
    float _2693 = _2263 + _2367;
    float _2695 = _2671 * 0.5;
    float _2697 = _2679 * 0.5;
    float _2699 = _2571 * _2625;
    out.m_73.x = _2689;
    out.m_73.y = _2693;
    out.m_73.z = _2659;
    out.m_75.x = _2695;
    out.m_75.y = _2681;
    out.m_75.z = _2697;
    out.m_75.w = _2507;
    float _2701 = _2691 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2703 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2705 = isnan(_2687);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2711 = _2707 || _2709;
    out.m_77.x = _2701;
    float _2713 = _2699 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2715 = _2655;
    float _2717 = _2691;
    float _2719 = _2699;
    if (!_2711)
    {
        _2509 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2721 = _2509;
    float _2723 = _2721;
    float _2725 = _2721;
    if (!_2711)
    {
        _2511 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2727 = _2511;
    float _2729 = _2727;
    float _2731 = _2727;
    if (!_2711)
    {
        _2513 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2733 = _2513;
    float _2735 = _2733;
    float _2737 = _2733;
    if (!_2711)
    {
        _2715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2739 = _2715;
    float _2741 = _2739;
    float _2743 = _2739;
    if (!_2711)
    {
        _2717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2745 = _2717;
    float _2747 = _2745;
    float _2749 = _2745;
    if (!_2711)
    {
        _2719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2751 = _2719;
    bool _2753 = !_2711;
    float _2755 = _2751;
    float _2757 = _2751;
    if (!_2753)
    {
        bool _2759 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2761 = isnan(_2687);
        bool _2763 = _2759 || _2761;
        bool _2765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2767 = _2763 || _2765;
        if (!_2767)
        {
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = _2687 + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2773;
            float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2779 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2781 = 1.0 / _2775;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2799 = _2771 * _2781;
            float _2801 = precise::clamp(_2799, 0.0, 1.0);
            float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2807 = fma(_2801, _2779, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2801, _2805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2811 = fma(_2801, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2813 = fma(_2801, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2815 = fma(_2801, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2817 = fma(_2801, _2797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2731 = _2807;
            _2749 = _2815;
            _2725 = _2811;
            _2743 = _2813;
            _2737 = _2809;
            _2757 = _2817;
            _2819 = true;
        }
        else
        {
            bool _2821 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2823 = isnan(_2687);
            bool _2825 = _2821 || _2823;
            bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2829 = _2825 || _2827;
            if (!_2829)
            {
                _2723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2831 = _2723;
            _2725 = _2831;
            if (!_2829)
            {
                _2729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2833 = _2729;
            _2731 = _2833;
            if (!_2829)
            {
                _2735 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2835 = _2735;
            _2737 = _2835;
            if (!_2829)
            {
                _2741 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2837 = _2741;
            _2743 = _2837;
            if (!_2829)
            {
                _2747 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2839 = _2747;
            _2749 = _2839;
            if (!_2829)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2841 = _2755;
            bool _2843 = !_2829;
            _2757 = _2841;
            if (!_2843)
            {
                bool _2845 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2847 = isnan(_2687);
                bool _2849 = _2845 || _2847;
                bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2853 = _2849 || _2851;
                if (!_2853)
                {
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = _2687 + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2859;
                    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2867 = 1.0 / _2861;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2885 = _2857 * _2867;
                    float _2887 = precise::clamp(_2885, 0.0, 1.0);
                    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2893 = fma(_2887, _2865, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2887, _2891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2887, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2887, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2901 = fma(_2887, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2903 = fma(_2887, _2883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2731 = _2893;
                    _2749 = _2901;
                    _2725 = _2897;
                    _2743 = _2899;
                    _2737 = _2895;
                    _2757 = _2903;
                    _2819 = true;
                }
                else
                {
                    _2731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2749 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2743 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2737 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2819 = false;
    float _2905 = _2731;
    float _2907 = _2749;
    float _2909 = _2725;
    float _2911 = _2743;
    float _2913 = _2737;
    float _2915 = _2757;
    float _2917 = _2713 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2919 = fma(_2693, -0.5, 0.5);
    float _2921 = precise::clamp(_2919, 0.0, 1.0);
    float _2923 = -_2905;
    float _2925 = _2923 + _2907;
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    out.m_40.x = _2917;
    float _2931 = fma(_2921, _2925, _2905);
    float _2933 = -_2913;
    float _2935 = _2933 + _2915;
    float _2937 = fma(_2921, _2929, _2909);
    float _2939 = _2931 * 0.586610972881317138671875;
    bool _2941 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2943 = fma(_2921, _2935, _2913);
    out.m_79.x = 0.0;
    float _2945 = fma(_2937, 0.298911988735198974609375, _2939);
    bool _2947 = _2571 > 0.0;
    bool _2949 = isnan(_2571);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    float _2957 = fma(_2943, 0.114477999508380889892578125, _2945);
    bool _2959 = _2625 <= 0.0;
    bool _2961 = !_2955;
    bool _2963 = _2959 || _2961;
    float _2965 = -_2957;
    float _2967 = _2937 + _2965;
    float _2969 = -_2957;
    float _2971 = _2931 + _2969;
    float _2973 = -_2957;
    float _2975 = _2943 + _2973;
    float _2977 = fma(_2967, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2979 = fma(_2971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2981 = fma(_2975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    bool _2983 = !_2941;
    if (!_2983)
    {
        float _2985 = -_2429;
        float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2989 = -_2431;
        float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2993 = -_2433;
        float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2997 = _2987 * _2987;
        float _2999 = fma(_2991, _2991, _2997);
        float _3001 = fma(_2995, _2995, _2999);
        float _3003 = sqrt(_3001);
        float _3005 = rsqrt(_3001);
        float _3007 = -_3003;
        float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3011 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = _2991 * _3005;
        float _3017 = _2987 * _3005;
        float _3019 = abs(_3013);
        float _3021 = log2(_3019);
        float _3023 = _2995 * _3005;
        float _3025 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3027 = _2693 * _3017;
        float _3029 = -_3017;
        float _3031 = -_3025;
        float _3033 = fma(_3029, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3031);
        float _3035 = fma(_2689, _3015, _3027);
        float _3037 = -_3023;
        float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3033);
        float _3041 = fma(_2659, _3023, _3035);
        float _3043 = precise::clamp(_3041, 0.0, 1.0);
        float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3047 = _3039 + _3045;
        float _3049 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        float _3055 = exp2(_3049);
        float _3057 = _3055 * _3053;
        float _3059 = _3043 * _3057;
        float _3061 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3063 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3065 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _3061;
        out.m_79.y = _3063;
        out.m_79.z = _3065;
    }
    out.m_81.x = _2977;
    out.m_81.y = _2979;
    out.m_81.z = _2981;
    if (!_2963)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3067 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_40.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3067;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

