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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_105 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_97 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_107 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_67 [[attribute(12)]];
    float4 m_71 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3432 = false;
    bool _2467 = false;
    bool _374 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_50.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_53.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3791 = as_type<float>(_142);
        out.gl_Position.z = _3791;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_55.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_53.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3861 = as_type<float>(_180);
        out.gl_Position.z = _3861;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = in.m_63.x;
    float _204 = in.m_63.y;
    float _206 = in.m_63.z;
    float _208 = _184 * _192;
    float _210 = _184 * _198;
    float _212 = fma(_182, _190, _208);
    float _214 = _184 * _204;
    float _216 = fma(_182, _196, _210);
    float _218 = fma(_182, _202, _214);
    float _220 = fma(_186, _194, _212);
    float _222 = fma(_186, _200, _216);
    float _224 = fma(_186, _206, _218);
    bool _226 = !_188;
    float _228 = _220;
    float _246;
    if (!_226)
    {
        float _230 = in.m_65.x;
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _230 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_126);
        float _252 = 1.0 / _250;
        float _254 = _160 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _256 + _258;
    bool _262 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _264 = isnan(_256);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    bool _278 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _280 = isnan(_256);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -_272;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = 1.0 / _276;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = _288 * _292;
    float _304 = -_288;
    float _306 = _304 + 1.0;
    float _308 = _260 * _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = fma(_296, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = _314 * _302;
    float _324 = fma(_318, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = _320 * _302;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _330 = _324 * _302;
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _334 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].x, _328);
    float _336 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _338 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].y, _336);
    float _340 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].z, _332);
    bool _342 = !_300;
    int _344 = as_type<int>(_308);
    float _368;
    float _370;
    float _372;
    if (!_342)
    {
        float _346 = in.m_65.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = float(_126);
        float _352 = 1.0 / _350;
        float _354 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = _160 * _352;
        float _358 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _360 = _358 * _348;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = _350;
        _372 = _356;
        _374 = true;
    }
    else
    {
        float _376 = float(_126);
        float _378 = 1.0 / _376;
        float _380 = _160 * _378;
        _368 = _380;
        _370 = _376;
        _372 = _380;
    }
    _374 = false;
    float _382 = _368;
    float _384 = _370;
    float _386 = _372;
    float _388 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _390 = int(_388);
    float _392 = in.m_67.y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _396 = _382 + _394;
    float _398 = in.m_65.w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _402 = _400 != 0;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _406 = int(_404);
    float _408 = in.m_65.y;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _416 = _414 != 0;
    float _418 = in.m_67.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _422 = _420 != 0;
    float _424 = float(_390);
    float _426 = in.m_65.x;
    float _428 = 1.0 / _384;
    float _430 = in.m_65.z;
    bool _432 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _434 = isnan(_382);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = float(uint(_406));
    float _446 = in.m_69.y;
    int _448 = ~_406;
    int _450 = _448 + 1;
    float _452 = 1.0 / _424;
    float _454 = float(_406);
    float _456 = in.m_71.y;
    bool _458 = _398 > 0.5;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _464 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _466 = isnan(_386);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = in.m_71.x;
    bool _478 = _408 > 0.5;
    float _480 = 1.0 / _444;
    bool _482 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _484 = isnan(_386);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = in.m_71.z;
    float _496 = 0.0;
    float _498 = _392;
    bool _500 = _458;
    bool _502 = _412;
    float _504 = _418;
    if (!_412)
    {
        _496 = _418;
    }
    float _506 = _496;
    float _508 = -_474;
    float _510 = _508 + 1.0;
    float _512 = in.m_63.w;
    bool _514 = !_422;
    float _516 = _514 ? _408 : _426;
    float _518 = _452 * _160;
    int _520 = ~_406;
    int _522 = _520 + 1;
    float _524 = 1.0 / _462;
    float _526 = in.m_61.w;
    int _528 = as_type<int>(_480) + (-2);
    float _530 = trunc(_518);
    int _532 = int(_530);
    out.m_73.y = _456;
    out.m_73.x = _476;
    out.m_73.z = _494;
    float _534 = float(uint(_532));
    float _536 = float(_532);
    float _538 = as_type<float>(_528) * _534;
    bool _540 = _536 >= _454;
    bool _542 = isnan(_536);
    bool _544 = _540 || _542;
    bool _546 = isnan(_454);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = trunc(_538);
    float _554 = precise::max(_552, 0.0);
    uint _557 = uint(_554);
    float _559 = trunc(_550);
    int _561 = int(_559);
    int _563 = _522 * int(_557);
    int _565 = _563 + _532;
    float _567 = float(uint(_565));
    float _569 = -_392;
    float _571 = _569 + 1.0;
    int _573 = ~_561;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    float _579 = as_type<float>(_528) * _567;
    int _581 = _458 ? as_type<int>(_571) : as_type<int>(_392);
    float _583 = _416 ? as_type<float>(_581) : _392;
    float _585 = trunc(_579);
    float _587 = precise::max(_585, 0.0);
    uint _589 = uint(_587);
    int _591 = as_type<int>(_571);
    float _593 = _506;
    if (_402)
    {
        float _595 = _478 ? _571 : _392;
        _498 = _595;
    }
    float _597 = _498;
    if (_412)
    {
        float _599 = -_418;
        float _601 = _599 + 1.0;
        _591 = as_type<int>(_601);
    }
    int _603 = _591;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    bool _609 = !_422;
    float _611 = _609 ? 1.2345600128173828125 : 1.0;
    if (_412)
    {
        bool _613 = _426 > 0.5;
        _500 = _613;
    }
    bool _615 = _500;
    float _617 = _516 * _611;
    if (_412)
    {
        float _619 = _615 ? as_type<float>(_603) : _418;
        _593 = _619;
    }
    float _621 = _593;
    float _623 = in.m_75.x;
    float _625 = in.m_75.y;
    float _627 = in.m_75.z;
    float _629 = floor(_617);
    int _631 = int(_557) + int(_589);
    if (_607)
    {
        float _633 = -_418;
        float _635 = _633 + 1.0;
        _344 = as_type<int>(_635);
    }
    int _637 = _344;
    float _639 = in.m_50.x;
    float _641 = in.m_50.y;
    float _643 = in.m_50.z;
    if (_607)
    {
        bool _645 = _430 > 0.5;
        _502 = _645;
    }
    bool _647 = _502;
    int _649 = _450 * _631;
    int _651 = _649 + _532;
    if (_607)
    {
        float _653 = _647 ? as_type<float>(_637) : _418;
        _504 = _653;
    }
    float _655 = _504;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _671 = _669 != 0;
    bool _673 = !_663;
    int _675 = _673 ? 0 : 1;
    float _677 = -_629;
    float _679 = _617 + _677;
    bool _681 = uint(_651) >= uint(_406);
    bool _683 = !_659;
    int _685 = _683 ? 0 : 1;
    float _687 = _679 * _454;
    bool _689 = !_681;
    int _691 = _689 ? 0 : (-1);
    float _693 = _334 * _623;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _705 = _703 != 0;
    float _707 = _454 * _160;
    int _709 = ~_631;
    int _711 = _709 + _691;
    int _713 = _711 + 1;
    float _715 = trunc(_687);
    int _717 = int(_715);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _721 = _719 != 0;
    float _723 = _198 * _641;
    float _725 = _204 * _641;
    float _727 = _641 + _446;
    bool _729 = !_721;
    int _731 = _729 ? 0 : 1;
    int _733 = _406 * _713;
    int _735 = _733 + _532;
    bool _737 = _406 == 0;
    float _739 = _707 * _428;
    int _741 = abs(_731);
    float _743 = _408 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _745 = !_737;
    int _747 = _745 ? _735 : (-1);
    float _749 = fma(_202, _639, _725);
    int _751 = _406 + (-1);
    float _753 = trunc(_739);
    int _755 = int(_753);
    bool _757 = !_667;
    int _759 = _757 ? 0 : 1;
    int _761 = _747 * _577;
    int _763 = abs(_685);
    int _765 = _717 * _741;
    int _767 = _765 + _532;
    int _769 = abs(_759);
    int _771 = _561 * _751;
    int _773 = _771 + _761;
    int _775 = abs(_675);
    float _777 = fma(_196, _639, _723);
    bool _779 = !_671;
    int _781 = _779 ? 0 : 1;
    float _783 = fma(_206, _643, _749);
    int _785 = _773 * _775;
    int _787 = abs(_781);
    float _789 = fma(_200, _643, _777);
    int _791 = _755 * _763;
    int _793 = _791 + _785;
    float _795 = in.m_71.w;
    int _797 = _767 * _769;
    int _799 = _797 + _793;
    int _801 = _717 * _787;
    int _803 = _801 + _799;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _815 = float(uint(_803));
    float _817 = fma(_743, -2.0, _809);
    float _819 = 1.0 / _807;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _823 = as_type<float>(_528) * _815;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _827 = ~_406;
    int _829 = _827 + 1;
    float _831 = trunc(_823);
    float _833 = precise::max(_831, 0.0);
    uint _835 = uint(_833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = 1.0 / _813;
    float _847 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _861 = _829 * int(_835);
    int _863 = _861 + _803;
    float _865 = 1.0 / _841;
    out.m_77.x = _847;
    out.m_77.y = _849;
    out.m_77.z = _851;
    out.m_77.w = _843;
    float _867 = _855 * _819;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _877 = float(uint(_863));
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _883 = 1.0 / _859;
    float _885 = _875 * _845;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_73.w = _795;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _895 = 1.0 / _871;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _899;
    float _903 = as_type<float>(_528) * _877;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _913 = 1.0 / _881;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _919 = _907 * _524;
    float _921 = _426 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _923 = fma(_867, _396, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _927 = _386 + _925;
    float _929 = trunc(_903);
    float _931 = precise::max(_929, 0.0);
    uint _933 = uint(_931);
    float _935 = -_897;
    float _937 = fma(_921, 2.0, _935);
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _941 = _939 != 0;
    bool _943 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _945 = isnan(_386);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    bool _955 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _957 = isnan(_382);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _889;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _971 = _969 != 0;
    float _973 = -_965;
    float _975 = _973 + 1.0;
    float _977 = _749;
    if (!_941)
    {
        _977 = _408;
    }
    float _979 = _977;
    float _981 = 1.0 / _893;
    int _983 = int(_835) + int(_933);
    float _985 = _426 + _408;
    float _987 = 0.0;
    float _989 = _979;
    if (!_941)
    {
        _987 = _430;
    }
    float _991 = _987;
    float _993 = _991;
    if (_941)
    {
        _989 = _426;
    }
    float _995 = _989;
    float _997 = _985 + (-1.0);
    if (_941)
    {
        _993 = _408;
    }
    float _999 = _993;
    float _1001 = _911 * _967;
    float _1003 = _901 * _865;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1005;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1011 = _408 + _430;
    float _1013 = fma(_1001, _927, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1015 = _1007 * _883;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1029 = _917 * _895;
    float _1031 = 1.0 / _1019;
    float _1033 = _1027 * _913;
    float _1035 = _426 * 2.0;
    int _1037 = ~_406;
    int _1039 = _1037 + 1;
    float _1041 = _1023 * _981;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1045 = _382 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1049 = _386 + _1047;
    bool _1051 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1053 = isnan(_386);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = floor(_1035);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1065;
    float _1069 = _430 * 2.0;
    int _1071 = _1039 * _983;
    int _1073 = _1071 + _803;
    float _1075 = fma(_1003, _1045, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1077 = fma(_1041, _1049, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1081 = _386 + _1079;
    bool _1083 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1085 = isnan(_386);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = floor(_1069);
    bool _1097 = uint(_1073) >= uint(_406);
    float _1099 = _1011 + (-1.0);
    float _1101 = _1067 * _1031;
    bool _1103 = !_1097;
    int _1105 = _1103 ? 0 : (-1);
    float _1107 = fma(_1015, _1081, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1109 = -_1093;
    float _1111 = _1109 + 1.0;
    bool _1113 = _1063 >= 0.0;
    bool _1115 = isnan(_1063);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.0);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1127 = _382 + _1125;
    float _1129 = _1011;
    if (!_941)
    {
        _1129 = _430;
    }
    float _1131 = _1129;
    float _1133 = _1061 * _510;
    int _1135 = _1121 ? 0 : 1;
    float _1137 = fma(_885, _1127, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1141 = _386 + _1139;
    bool _1143 = _1095 >= 0.0;
    bool _1145 = isnan(_1095);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1155 = _386 + _1153;
    float _1157 = _1131;
    if (_941)
    {
        _1157 = _408;
    }
    float _1159 = _1157;
    float _1161 = fma(_1029, _1141, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1163 = _1151 ? 0 : 1;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1167 = _386 + _1165;
    bool _1169 = _1095 > 0.0;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1173 = _386 + _1171;
    float _1175 = fma(_919, _1155, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1177 = fma(_1101, _1167, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1179 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1181 = isnan(_382);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1187 = _1183 || _1185;
    float _1189 = float(_1187);
    float _1191 = fma(_1033, _1173, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1193 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1195 = isnan(_382);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _953 * _1111;
    bool _1207 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1209 = isnan(_386);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -_953;
    float _1221 = _1219 + 1.0;
    bool _1223 = _1063 > 0.0;
    float _1225 = -_1189;
    float _1227 = _1225 + 1.0;
    bool _1229 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1231 = isnan(_386);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = _1217 * _1221;
    float _1243 = -_1217;
    float _1245 = _1243 + 1.0;
    bool _1247 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1249 = isnan(_386);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = _1203 * _975;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1263 = _1239 * _1245;
    float _1265 = -_1239;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1257;
    float _1271 = _1269 + 1.0;
    float _1273 = _1175 * _1133;
    float _1275 = _1257 * _1267;
    float _1277 = _965 * _1227;
    float _1279 = _492 * _1271;
    float _1281 = -_492;
    float _1283 = _1281 + 1.0;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1287 = -_1203;
    float _1289 = _1287 + 1.0;
    float _1291 = _789 + _526;
    float _1293 = _474 * _1283;
    float _1295 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1285);
    float _1297 = _783 + _512;
    float _1299 = _442 * _1289;
    float _1301 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1303 = -_442;
    float _1305 = _1303 + 1.0;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1309 = _923 * _1299;
    float _1311 = fma(_1301, _597, -0.5);
    float _1313 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1307);
    float _1315 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1309);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1319 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1313);
    float _1321 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _817);
    float _1323 = fma(_1137, _1259, _1315);
    float _1325 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1317);
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1329 = -_1321;
    float _1331 = fma(_1319, _1311, _1329);
    int _1333 = ~_983;
    int _1335 = _1333 + _1105;
    int _1337 = _1335 + 1;
    float _1339 = -_1061;
    float _1341 = _1339 + 1.0;
    int _1343 = ~_1135;
    int _1345 = _1343 + 1;
    int _1347 = _1345 + 1;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1351 = _1347;
    float _1353 = _1297;
    if (!_1223)
    {
        int _1355 = ~_1135;
        int _1357 = _1355 + 1;
        _1351 = _1357;
    }
    int _1359 = _1351;
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1273);
    int _1363 = _406 * _1337;
    int _1365 = _1363 + _803;
    float _1367 = float(uint(_767));
    float _1369 = _995 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1371 = fma(_1013, _1293, _1361);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1375 = !_737;
    int _1377 = _1375 ? _1365 : (-1);
    float _1379 = as_type<float>(_528) * _1367;
    float _1381 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1383 = -_1327;
    float _1385 = fma(_1369, 2.0, _1383);
    int _1387 = _1377 >> 31;
    float _1389 = fma(_1381, -2.0, _1373);
    float _1391 = trunc(_1379);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    int _1397 = _1387 & 3;
    float _1399 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1401 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1389);
    int _1403 = _1377 + _1397;
    float _1405 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1295);
    float _1407 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1409 = _1403 >> 2;
    float _1411 = fma(_1399, _621, -0.5);
    int _1413 = ~_1163;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    float _1419 = -_1401;
    float _1421 = fma(_1405, _1407, _1419);
    int _1423 = ~_406;
    int _1425 = _1423 + 1;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1429 = _1417;
    if (!_1169)
    {
        int _1431 = ~_1163;
        int _1433 = _1431 + 1;
        _1429 = _1433;
    }
    int _1435 = _1429;
    float _1437 = fma(_1075, _1277, _1323);
    int _1439 = _1377 & 3;
    bool _1441 = _1439 != 0;
    int _1443 = _1425 * int(_1395);
    int _1445 = _1443 + _767;
    int _1447 = _1409 << 4;
    int _1449 = _1447 + 512;
    float _1451 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    int _1453 = _1377 & 3;
    bool _1455 = _1453 != 0;
    float _1457 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1437);
    int _1459 = _1441 ? 0 : 1;
    uint _1461 = uint(int(uint(_1449) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[int(_1471)][_1473];
    bool _1477 = uint(_1453) > 1u;
    float _1479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1481 = log2(_1479);
    float _1483 = float(uint(_1445));
    float _1485 = fma(_1107, _1279, _1371);
    float _1487 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1451);
    float _1489 = -_160;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _937);
    int _1493 = ~_1459;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    int _1499 = _1449 + 8;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    float _1517 = as_type<float>(_528) * _1483;
    bool _1519 = !_697;
    int _1521 = _1519 ? 0 : 1;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1525 = _727 + _1523;
    float _1527 = -_160;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1385);
    float _1531 = float(_1435);
    float _1533 = fma(_1487, _1411, _1491);
    int _1535 = _1497;
    if (!_1477)
    {
        int _1537 = ~_1459;
        int _1539 = _1537 + 1;
        _1535 = _1539;
    }
    int _1541 = _1535;
    float _1543 = trunc(_1517);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    bool _1549 = uint(_1453) >= 2u;
    float _1551 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1325);
    int _1553 = abs(_1521);
    float _1555 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    int _1557 = _1549 ? 0 : 1;
    float _1559 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1561 = _1453 != 3;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = _1291 + _1563;
    float _1567 = float(_1553);
    float _1569 = fma(_1551, _1555, _1529);
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1573 = _1297 + _1571;
    float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1559);
    int _1577 = ~_406;
    int _1579 = _1577 + 1;
    float _1581 = _1567 * _1531;
    int _1583 = ~_1557;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    float _1589 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1575);
    int _1591 = int(_1395) + int(_1547);
    float _1593 = fma(_1161, _1275, _1485);
    int _1595 = _1587;
    if (_1561)
    {
        int _1597 = ~_1557;
        int _1599 = _1597 + 1;
        _1595 = _1599;
    }
    int _1601 = _1595;
    int _1603 = abs(_1541);
    float _1605 = fma(_1077, _1263, _1593);
    bool _1607 = !_1455;
    int _1609 = _1607 ? 0 : 1;
    float _1611 = _1569 + 0.5;
    bool _1613 = _1453 != 3;
    int _1615 = _1579 * _1591;
    int _1617 = _1615 + _767;
    bool _1619 = _1589 >= 0.0;
    float _1621 = fma(_1191, _1241, _1605);
    int _1623 = abs(_1609);
    float _1625 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1627 = !_1613;
    int _1629 = _1627 ? 0 : (-1);
    float _1631 = fma(_1177, _1205, _1621);
    bool _1633 = uint(_1617) >= uint(_406);
    float _1635 = _408 * 2.0;
    int _1637 = ~_1603;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    int _1643 = abs(_1601);
    int _1645 = _1641 * as_type<int>(_1475);
    int _1647 = abs(_1629);
    if (_1619)
    {
        out.m_53.x = 0.0;
    }
    int _1649 = ~_1623;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    bool _1655 = !_971;
    int _1657 = _1655 ? 0 : 1;
    int _1659 = _1653 * as_type<int>(_1467);
    int _1661 = _1659 + _1645;
    int _1663 = ~_1643;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    int _1669 = abs(_1657);
    int _1671 = _1667 * as_type<int>(_1507);
    int _1673 = _1671 + _1661;
    bool _1675 = !_1633;
    int _1677 = _1675 ? 0 : (-1);
    int _1679 = ~_1647;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = _1331 + 0.5;
    int _1687 = ~_1591;
    int _1689 = _1687 + _1677;
    int _1691 = _1689 + 1;
    int _1693 = _1683 * as_type<int>(_1515);
    int _1695 = _1693 + _1673;
    int _1697 = ~_1669;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    float _1703 = _1533 + 0.5;
    int _1705 = _406 * _1691;
    int _1707 = _1705 + _767;
    float _1709 = _1421 + 0.5;
    int _1711 = _1695 * _1701;
    float _1713 = _1525 * _1525;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_79.x = _1703;
    out.m_79.y = _1685;
    out.m_79.z = _1611;
    out.m_79.w = _1709;
    float _1717 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1719 = !_737;
    int _1721 = _1719 ? _1707 : (-1);
    bool _1723 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1725 = isnan(0.0);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1731 = _1727 || _1729;
    int _1733 = _1721 * _1669;
    int _1735 = _1733 + _1711;
    bool _1737 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1739 = isnan(1.0);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1745 = _1741 || _1743;
    float _1747 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1749 = fma(_1565, _1565, _1713);
    float _1751 = _1713;
    int _1753 = as_type<int>(_1749);
    if (_1619)
    {
        _1751 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1755 = _1751;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1761 = fma(_1573, _1573, _1749);
    float _1763 = _1481 * _160;
    if (_1619)
    {
        float _1765 = _1755 * 5.0;
        _1753 = as_type<int>(_1765);
    }
    int _1767 = _1753;
    float _1769 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1631);
    float _1771 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1773 = in.m_81.x;
    float _1775 = in.m_81.y;
    float _1777 = in.m_81.z;
    float _1779 = rsqrt(_1761);
    float _1781 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1783 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1785 = float(_1735);
    if (_1619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6287 = as_type<float>(_1767);
        out.gl_Position.z = _6287;
    }
    out.m_83.x = _1747;
    out.m_83.y = _1771;
    out.m_83.z = _1781;
    out.m_83.w = _1783;
    float _1787 = exp2(_1763);
    out.m_85.x = _1769;
    float _1789 = _1717 * _1779;
    out.m_87.y = _1785;
    bool _1791 = !_705;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1565 * _1789;
    float _1797 = floor(_1635);
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1801 = 1.0 + _1799;
    bool _1803 = !_701;
    int _1805 = _1803 ? 0 : 1;
    float _1807 = _1525 * _1789;
    if (_1619)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1809 = -_1807;
    float _1811 = _727 + _1809;
    float _1813 = _1573 * _1789;
    float _1815 = -_1795;
    float _1817 = _1291 + _1815;
    float _1819 = 1.0 / _1801;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = _1811 + _1821;
    float _1825 = -_1813;
    float _1827 = _1297 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1831 = _1817 + _1829;
    int _1833 = abs(_1805);
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1839 = _1827 + _1837;
    float _1841 = -_1787;
    float _1843 = _1841 + 1.0;
    bool _1845 = _1797 > 0.0;
    float _1847 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1835);
    float _1849 = float(_1833);
    float _1851 = _408 + (-0.5);
    float _1853 = float(_1359);
    float _1855 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    float _1857 = _1581 * (-2.0);
    float _1859 = _1731 ? _1843 : 0.0;
    float _1861 = _1849 * _1853;
    float _1863 = _426 + (-0.5);
    float _1865 = fma(_1857, _1773, _1773);
    bool _1867 = _1797 >= 0.0;
    bool _1869 = isnan(_1797);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.0);
    bool _1875 = _1871 || _1873;
    float _1877 = _1861 * (-2.0);
    bool _1879 = _1855 >= 0.0;
    float _1881 = _1877;
    if (_1745)
    {
        float _1883 = _1859 * _1819;
        _162 = _1883;
    }
    float _1885 = _162;
    float _1887 = fma(_1009, _1857, _1009);
    float _1889 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1865);
    float _1891 = fma(_1877, _1775, _1775);
    float _1893 = fma(_1123, _1877, _1123);
    float _1895 = fma(_1887, _1885, _1889);
    float _1897 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1891);
    int _1899 = _1875 ? 0 : 1;
    float _1901 = _426 + _430;
    float _1903 = _1895 * 0.15915493667125701904296875;
    float _1905 = fma(_1893, _1885, _1897);
    if (_1879)
    {
        _1881 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1907 = _1881;
    int _1909 = as_type<int>(_1907);
    if (_1879)
    {
        out.m_53.x = 0.0;
    }
    float _1911 = _1903 * 6.283185482025146484375;
    float _1913 = sin(_1911);
    int _1915 = ~_1899;
    int _1917 = _1915 + 1;
    int _1919 = _1917 + 1;
    int _1921 = _1919;
    if (_1879)
    {
        float _1923 = _1907 * 5.0;
        _1909 = as_type<int>(_1923);
    }
    int _1925 = _1909;
    if (!_1845)
    {
        int _1927 = ~_1899;
        int _1929 = _1927 + 1;
        _1921 = _1929;
    }
    int _1931 = _1921;
    int _1933 = abs(_1793);
    float _1935 = _1903 * 6.283185482025146484375;
    float _1937 = cos(_1935);
    if (_1879)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6527 = as_type<float>(_1925);
        out.gl_Position.z = _6527;
    }
    if (_1879)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1939 = -_727;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1943 = _1905 * 0.15915493667125701904296875;
    float _1945 = -_1291;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = float(_1931);
    float _1951 = _1941 * _1941;
    float _1953 = -_1297;
    float _1955 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1957 = float(_1933);
    float _1959 = _1901 + (-1.0);
    float _1961 = fma(_1947, _1947, _1951);
    float _1963 = -_1807;
    float _1965 = _1525 + _1963;
    float _1967 = -_1795;
    float _1969 = _1565 + _1967;
    float _1971 = _1957 * _1949;
    float _1973 = fma(_1955, _1955, _1961);
    float _1975 = fma(_1959, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1977 = _1965 * _1965;
    float _1979 = _1971 * (-2.0);
    float _1981 = _430 + (-0.5);
    float _1983 = -_1813;
    float _1985 = _1573 + _1983;
    float _1987 = rsqrt(_1973);
    float _1989 = fma(_1975, _1979, _1975);
    float _1991 = fma(_1979, _1777, _1777);
    float _1993 = fma(_1969, _1969, _1977);
    float _1995 = _340 * _627;
    float _1997 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1991);
    float _1999 = fma(_1985, _1985, _1993);
    float _2001 = _338 * _625;
    float _2003 = _1943 * 6.283185482025146484375;
    float _2005 = sin(_2003);
    float _2007 = fma(_1989, _1885, _1997);
    float _2009 = _2007 * 0.15915493667125701904296875;
    float _2011 = _1947 * _1987;
    float _2013 = _1955 * _1987;
    float _2015 = _1943 * 6.283185482025146484375;
    float _2017 = cos(_2015);
    float _2019 = in.m_89.x;
    float _2021 = in.m_89.y;
    float _2023 = in.m_89.z;
    float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2027 = _2011 * _2025;
    float _2029 = _1941 * _1987;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = _2013 * _2031;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2037 = -_2027;
    float _2039 = fma(_2013, _2035, _2037);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2043 = _2029 * _2041;
    float _2045 = _2009 * 6.283185482025146484375;
    float _2047 = sin(_2045);
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2051 = -_2033;
    float _2053 = fma(_2029, _2049, _2051);
    float _2055 = _2039 * _2039;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2059 = -_2043;
    float _2061 = fma(_2011, _2057, _2059);
    float _2063 = _1913 * _2005;
    float _2065 = fma(_2053, _2053, _2055);
    float _2067 = sqrt(_1999);
    float _2069 = _1937 * _2017;
    float _2071 = fma(_2061, _2061, _2065);
    float _2073 = _1913 * _2017;
    float _2075 = _2009 * 6.283185482025146484375;
    float _2077 = cos(_2075);
    float _2079 = fma(_2047, _2069, _2063);
    float _2081 = fma(_2047, _2063, _2069);
    float _2083 = _2001 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2085 = _2021 != 0.0;
    bool _2087 = isnan(_2021);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.0);
    bool _2093 = _2089 || _2091;
    float _2095 = rsqrt(_2071);
    float _2097 = _1779 * _2067;
    float _2099 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2101 = _1937 * _2005;
    bool _2103 = _2019 == 0.0;
    bool _2105 = !_2093;
    bool _2107 = _2103 && _2105;
    float _2109 = _2097 * _2083;
    float _2111 = _2097 * _2099;
    float _2113 = _1937 * _2077;
    float _2115 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2021);
    float _2117 = _2017 * _2077;
    float _2119 = _1913 * _2077;
    float _2121 = _2005 * _2077;
    float _2123 = _2115 * _2109;
    float _2125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2023);
    float _2127 = _1625 * _2097;
    float _2129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2019);
    float _2131 = -_2101;
    float _2133 = fma(_2047, _2073, _2131);
    float _2135 = -_2073;
    float _2137 = fma(_2047, _2101, _2135);
    float _2139 = _2125 * _2111;
    float _2141 = _2129 * _2127;
    float _2143 = _2113 * _2123;
    float _2145 = _2053 * _2095;
    float _2147 = _2039 * _2095;
    float _2149 = _2061 * _2095;
    float _2151 = fma(_2079, _2141, _2143);
    float _2153 = -_2123;
    float _2155 = _2047 * _2153;
    float _2157 = _2013 * _2147;
    float _2159 = _2029 * _2145;
    float _2161 = _2119 * _2123;
    float _2163 = fma(_2117, _2141, _2155);
    float _2165 = fma(_2137, _2139, _2151);
    float _2167 = -_2157;
    float _2169 = fma(_2029, _2149, _2167);
    float _2171 = -_2159;
    float _2173 = fma(_2011, _2147, _2171);
    float _2175 = fma(_2133, _2141, _2161);
    float _2177 = fma(_2121, _2139, _2163);
    float _2179 = _2169 * _2165;
    float _2181 = _2173 * _2165;
    float _2183 = fma(_2081, _2139, _2175);
    bool _2185 = _2023 == 0.0;
    bool _2187 = _2185 && _2107;
    float _2189 = in.m_91.x;
    float _2191 = in.m_91.y;
    float _2193 = in.m_91.z;
    float _2195 = fma(_2145, _2177, _2179);
    float _2197 = fma(_2149, _2177, _2181);
    float _2199 = _2011 * _2149;
    float _2201 = _2113 * _2169;
    float _2203 = fma(_2011, _2183, _2195);
    float _2205 = fma(_2013, _2183, _2197);
    float _2207 = -_2199;
    float _2209 = fma(_2013, _2145, _2207);
    float _2211 = _2137 * _2169;
    float _2213 = _1291 + _2203;
    float _2215 = _1297 + _2205;
    float _2217 = _2209 * _2165;
    float _2219 = _2137 * _2173;
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2223 = _2213 + _2221;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2227 = _2215 + _2225;
    float _2229 = _2137 * _2209;
    float _2231 = -_2047;
    float _2233 = fma(_2231, _2145, _2201);
    float _2235 = _2223 * _2223;
    float _2237 = _2227 * _2227;
    float _2239 = fma(_2147, _2177, _2217);
    float _2241 = _2113 * _2173;
    float _2243 = _2235 + _2237;
    float _2245 = fma(_2029, _2183, _2239);
    float _2247 = _2189;
    float _2249 = _2191;
    float _2251 = _2193;
    float _2253 = _2047;
    float _2255 = _2235;
    float _2257 = _2237;
    float _2259 = _2213;
    float _2261 = _2215;
    if (!_2187)
    {
        float _2263 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2189);
        _2247 = _2263;
    }
    float _2265 = _2247;
    float _2267 = _2265;
    if (!_2187)
    {
        float _2269 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2249 = _2269;
    }
    float _2271 = _2249;
    float _2273 = sqrt(_2243);
    if (!_2187)
    {
        float _2275 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2193);
        _2251 = _2275;
    }
    float _2277 = _2251;
    float _2279 = _2113 * _2209;
    float _2281 = _2079 * _2169;
    float _2283 = _2079 * _2209;
    float _2285 = _2079 * _2173;
    float _2287 = _727 + _2245;
    float _2289 = -_2047;
    float _2291 = fma(_2289, _2147, _2279);
    float _2293 = -_2047;
    float _2295 = fma(_2293, _2149, _2241);
    float _2297 = fma(_2117, _2145, _2281);
    float _2299 = fma(_2117, _2147, _2283);
    float _2301 = fma(_2117, _2149, _2285);
    float _2303 = fma(_2121, _2145, _2211);
    float _2305 = fma(_2121, _2147, _2229);
    float _2307 = fma(_2119, _2011, _2233);
    float _2309 = fma(_2121, _2149, _2219);
    bool _2311 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2313 = fma(_2119, _2029, _2291);
    float _2315 = fma(_2119, _2013, _2295);
    float _2317 = _2303;
    if (!_2311)
    {
        _2253 = _2287;
    }
    float _2319 = _2253;
    bool _2321 = !_2311;
    float _2323 = _2319;
    if (!_2321)
    {
        float _2325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2329 = _2273 + _2327;
        float _2331 = rsqrt(_2243);
        float _2333 = _2329 * _2325;
        float _2335 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2337 = _2333 * 0.15915493667125701904296875;
        float _2339 = _2337 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        float _2343 = _2337 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = fma(_2341, _2335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2349 = _2331 * _2347;
        float _2351 = fma(_2223, _2349, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2353 = _2345 + (-1.0);
        float _2355 = fma(_2227, _2349, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2359 = _2351 + _2357;
        float _2361 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2365 = _2355 + _2363;
        float _2367 = _2359 * _2359;
        float _2369 = fma(_2287, _2345, _2361);
        float _2371 = _2365 * _2365;
        _2323 = _2369;
        _2255 = _2367;
        _2257 = _2371;
        _2259 = _2351;
        _2261 = _2355;
    }
    float _2373 = _2323;
    float _2375 = _2255;
    float _2377 = _2257;
    float _2379 = _2259;
    float _2381 = _2261;
    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2385 = _2373 + _2383;
    float _2387 = fma(_2133, _2011, _2297);
    float _2389 = fma(_2133, _2029, _2299);
    float _2391 = fma(_2133, _2013, _2301);
    float _2393 = fma(_2385, _2385, _2375);
    float _2395 = _2307 * _2271;
    float _2397 = _2313 * _2271;
    float _2399 = _2315 * _2271;
    float _2401 = _2393 + _2377;
    float _2403 = fma(_2081, _2011, _2303);
    float _2405 = fma(_2081, _2029, _2305);
    float _2407 = fma(_2081, _2013, _2309);
    float _2409 = fma(_2387, _2265, _2395);
    float _2411 = fma(_2389, _2265, _2397);
    float _2413 = sqrt(_2401);
    float _2415 = fma(_2391, _2265, _2399);
    float _2417 = fma(_2403, _2277, _2409);
    float _2419 = fma(_2405, _2277, _2411);
    float _2421 = fma(_2407, _2277, _2415);
    out.m_93.x = _2417;
    out.m_93.y = _2419;
    out.m_93.z = _2421;
    bool _2423 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2425 = isnan(_2413);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2431 = _2427 || _2429;
    if (!_2431)
    {
        _2267 = 1.0;
    }
    float _2433 = _2267;
    bool _2435 = !_2431;
    float _2437 = _2433;
    if (!_2435)
    {
        bool _2439 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2441 = isnan(_2413);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2447 = _2443 || _2445;
        if (!_2447)
        {
            float _2449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2451 = _2413 + _2449;
            float _2453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2455 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2453;
            float _2457 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2461 = 1.0 / _2455;
            float _2463 = _2451 * _2461;
            float _2465 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2437 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2471 = isnan(_2413);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                float _2479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2481 = _2413 + _2479;
                float _2483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2485 = _2483 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2487 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2489 = _2487 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2491 = 1.0 / _2485;
                float _2493 = _2481 * _2491;
                float _2495 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2437 = _2495;
                _2467 = true;
            }
            else
            {
                _2437 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2467 = false;
    float _2497 = _2437;
    float _2499 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2501 = _2379 + _2499;
    float _2503 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2505 = _2381 + _2503;
    float _2507 = fma(_2501, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2509 = fma(_2505, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2513 = _2507 + _2511;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2517 = _2509 + _2515;
    float _2519 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2521 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7459 = float2(_2519, _2521);
    float _2523 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7459, float2(0.0), isnan(_7459)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7459, float2(0.0), isnan(_7459)), level(0.0)).x;
    float _2525 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2527 = _2373 + _2525;
    float _2529 = -_1291;
    float _2531 = _2529 + _2507;
    float _2533 = -_1297;
    float _2535 = _2533 + _2509;
    float _2537 = fma(_2527, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2539 = -_727;
    float _2541 = _2539 + _2537;
    float _2543 = fma(_2523, 100.0, _727);
    float _2545 = _2541 * _2541;
    float _2547 = fma(_2523, 100.0, _2537);
    float _2549 = -_1807;
    float _2551 = _2549 + _2543;
    float _2553 = fma(_2531, _2531, _2545);
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2557 = fma(_2535, _2535, _2553);
    float _2559 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2555);
    float _2561 = sqrt(_2557);
    float _2563 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2559);
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2567 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2569 = 1.0 / _2565;
    float _2571 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2567);
    float _2573 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2571);
    bool _2575 = _2561 > 0.0;
    float _2577 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2579 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2581 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan(0.5);
    bool _2587 = _2583 || _2585;
    float _2589 = _2577 + _2565;
    float _2591 = _2589 * _2569;
    float _2593 = _2591 * 0.5;
    float _2595 = _2537;
    float _2597 = _2523;
    float _2599 = _2543;
    float _2601 = _2557;
    if (!_2575)
    {
        _2317 = _2507;
    }
    float _2603 = _2317;
    float _2605 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2607 = fma(_2593, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2605);
    float _2609 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2611 = _2603;
    float _2613 = _2603;
    if (!_2575)
    {
        _2595 = _2509;
    }
    float _2615 = _2595;
    bool _2617 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(0.5);
    bool _2625 = _2621 || _2623;
    float _2627 = 1.0 / _2607;
    float _2629 = _2615;
    if (!_2575)
    {
        _2609 = _2547;
    }
    float _2631 = _2609;
    bool _2633 = !_2575;
    float _2635 = _2631;
    float _2637 = _2631;
    if (!_2633)
    {
        float _2639 = _220 * _220;
        float _2641 = fma(_222, _222, _2639);
        float _2643 = rsqrt(_2557);
        float _2645 = fma(_224, _224, _2641);
        float _2647 = sqrt(_2645);
        float _2649 = _2531 * _2643;
        float _2651 = _2541 * _2643;
        float _2653 = _2535 * _2643;
        bool _2655 = _2647 > 0.0;
        float _2657 = _2647;
        _2597 = _2645;
        if (!_2655)
        {
            _2611 = _2507;
        }
        float _2659 = _2611;
        _2613 = _2659;
        if (!_2655)
        {
            _2635 = _2547;
        }
        float _2661 = _2635;
        _2637 = _2661;
        if (!_2655)
        {
            _2657 = _2509;
        }
        float _2663 = _2657;
        bool _2665 = !_2655;
        _2629 = _2663;
        if (!_2665)
        {
            float _2667 = rsqrt(_2645);
            float _2669 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2671 = _220 * _2667;
            float _2673 = _222 * _2667;
            float _2675 = _2651 * _2671;
            float _2677 = _224 * _2667;
            float _2679 = fma(_2649, _2673, _2675);
            float _2681 = _2669 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2683 = fma(_2653, _2677, _2679);
            float _2685 = _2683 * _2681;
            float _2687 = fma(_222, _2685, _2507);
            float _2689 = fma(_220, _2685, _2547);
            float _2691 = fma(_224, _2685, _2509);
            _2613 = _2687;
            _2629 = _2691;
            _2637 = _2689;
            _2597 = _2667;
        }
    }
    float _2693 = _2613;
    float _2695 = _2629;
    float _2697 = _2637;
    float _2699 = _2597;
    float _2701 = -_1795;
    float _2703 = _2701 + _2693;
    float _2705 = -_1813;
    float _2707 = _2705 + _2695;
    float _2709 = -_1807;
    float _2711 = _2709 + _2697;
    float _2713 = _2699;
    float _2715 = _2711;
    float _2717 = _2703;
    float _2719 = _2707;
    if (_2625)
    {
        _2713 = 1.0;
    }
    float _2721 = _2713;
    float _2723 = _2721;
    if (!_2587)
    {
        float _2725 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2727 = _2551 + _2725;
        float _2729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2731 = -_1297;
        float _2733 = _2731 + _2695;
        float _2735 = _2727 * _2727;
        float _2737 = fma(_1831, _1831, _2735);
        float _2739 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2741 = fma(_1839, _1839, _2737);
        float _2743 = 1.0 / _2097;
        float _2745 = sqrt(_2741);
        float _2747 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2749 = precise::min(_2745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2751 = _2749 * _2729;
        float _2753 = -_2543;
        float _2755 = _2753 + _2697;
        float _2757 = _2751 * _2743;
        float _2759 = -_1291;
        float _2761 = _2759 + _2693;
        float _2763 = _2747 * _2757;
        float _2765 = _2733 * _2757;
        float _2767 = fma(_2755, _2763, _2551);
        float _2769 = fma(_2761, _2763, _1817);
        float _2771 = fma(_2747, _2765, _1827);
        _2599 = _2763;
        _2715 = _2767;
        _2717 = _2769;
        _2719 = _2771;
        _228 = _2757;
    }
    float _2773 = _2599;
    float _2775 = _2715;
    float _2777 = _2717;
    float _2779 = _2719;
    float _2781 = _228;
    float _2783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2785 = _2627 * _2783;
    float _2787 = _2773;
    float _2789 = _2781;
    if (!_2625)
    {
        float _2791 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2793 = _2791 * 0.15915493667125701904296875;
        float _2795 = _2793 * 6.283185482025146484375;
        float _2797 = cos(_2795);
        float _2799 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2801 = _2799 * 0.15915493667125701904296875;
        float _2803 = _2793 * 6.283185482025146484375;
        float _2805 = sin(_2803);
        float _2807 = 1.0 / _2797;
        float _2809 = _2801 * 6.283185482025146484375;
        float _2811 = cos(_2809);
        float _2813 = _2805 * _2807;
        float _2815 = _2801 * 6.283185482025146484375;
        float _2817 = sin(_2815);
        float _2819 = _2811 * _2813;
        float _2821 = 1.0 / _2819;
        float _2823 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2825 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2823;
        float _2827 = 1.0 / _2825;
        float _2829 = _2817 * _2821;
        float _2831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2833 = fma(_2785, _2829, _2831);
        float _2835 = _2833 * _2827;
        float _2837 = precise::clamp(_2835, 0.0, 1.0);
        _2787 = _2807;
        _2789 = _2801;
        _2723 = _2837;
    }
    float _2839 = _2787;
    float _2841 = _2789;
    float _2843 = _2723;
    float _2845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2847 = _2775 + _2845;
    float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2851 = _2777 + _2849;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2855 = _2779 + _2853;
    float _2857 = _2847 * _2847;
    float _2859 = fma(_2851, _2851, _2857);
    float _2861 = fma(_2855, _2855, _2859);
    float _2863 = rsqrt(_2861);
    float _2865 = _2851 * _2863;
    float _2867 = _2855 * _2863;
    float _2869 = _2847 * _2863;
    float _2871 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2873 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2875 = _2871 * _2871;
    float _2877 = _2873 * _2873;
    float _2879 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2881 = sqrt(_2861);
    float _2883 = _2875 + _2877;
    float _2885 = sqrt(_2883);
    bool _2887 = _2885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2891 = _2885 + _2889;
    float _2893 = _2839;
    float _2895 = _2841;
    float _2897 = _2891;
    float _2899 = _2883;
    if (_2887)
    {
        float _2901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2893 = _2901;
    }
    float _2903 = _2893;
    if (_2887)
    {
        float _2905 = rsqrt(_2883);
        _2895 = _2905;
    }
    float _2907 = _2895;
    float _2909 = _2907;
    if (_2887)
    {
        float _2911 = _2891 * _2903;
        _2897 = _2911;
    }
    float _2913 = _2897;
    if (_2887)
    {
        float _2915 = _2913 * 0.15915493667125701904296875;
        _1353 = _2915;
    }
    float _2917 = _1353;
    float _2919 = _2903;
    float _2921 = _2917;
    if (_2887)
    {
        float _2923 = _2917 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        _2919 = _2925;
    }
    float _2927 = _2919;
    float _2929 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2931 = precise::max(0.0, _2929);
    float _2933 = _1291;
    float _2935 = _2931;
    if (_2887)
    {
        float _2937 = _2917 * 6.283185482025146484375;
        float _2939 = cos(_2937);
        _2933 = _2939;
    }
    float _2941 = _2933;
    float _2943 = -_2869;
    float _2945 = -_2931;
    float _2947 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2945);
    if (_2887)
    {
        float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2935 = _2949;
    }
    float _2951 = _2935;
    float _2953 = _2951;
    if (!_2887)
    {
        _2921 = _2871;
    }
    float _2955 = _2921;
    float _2957 = _2927;
    float _2959 = _2955;
    if (_2887)
    {
        float _2961 = fma(_2927, _2951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2957 = _2961;
    }
    float _2963 = _2957;
    float _2965 = _2963;
    float _2967 = _2941;
    if (_2887)
    {
        float _2969 = _2941 + (-1.0);
        _2953 = _2969;
    }
    float _2971 = _2953;
    float _2973 = _2971;
    if (_2887)
    {
        float _2975 = _2907 * _2963;
        _2601 = _2975;
    }
    float _2977 = _2601;
    if (!_2887)
    {
        _2909 = _2947;
    }
    float _2979 = _2909;
    float _2981 = _2979;
    if (_2887)
    {
        float _2983 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2983;
    }
    float _2985 = _2899;
    if (_2887)
    {
        float _2987 = _2871 * _2977;
        _2959 = _2987;
    }
    float _2989 = _2959;
    if (!_2887)
    {
        _2973 = _2873;
    }
    float _2991 = _2973;
    float _2993 = _2991;
    if (_2887)
    {
        float _2995 = _2873 * _2977;
        _2993 = _2995;
    }
    float _2997 = _2993;
    if (!_2887)
    {
        _2965 = _2875;
    }
    float _2999 = _2965;
    float _3001 = _2999;
    if (_2887)
    {
        float _3003 = fma(_2947, _2941, _2985);
        _2981 = _3003;
    }
    float _3005 = _2981;
    if (_2887)
    {
        float _3007 = _2989 * _2989;
        _3001 = _3007;
    }
    float _3009 = _3001;
    if (!_2887)
    {
        _2967 = _2877;
    }
    float _3011 = _2967;
    float _3013 = _3011;
    if (_2887)
    {
        float _3015 = _2997 * _2997;
        _3013 = _3015;
    }
    float _3017 = _3013;
    float _3019 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3021 = fma(_3005, _3005, _3009);
    float _3023 = floor(_2879);
    float _3025 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3019);
    float _3027 = _3021 + _3017;
    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3031 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3029);
    float _3033 = precise::clamp(_3031, 0.0, 1.0);
    float _3035 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3037 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3025);
    float _3039 = -_3033;
    float _3041 = _3039 + 1.0;
    float _3043 = rsqrt(_3027);
    float _3045 = _3037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3047 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3049 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3051 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3053 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3047);
    float _3055 = abs(_3041);
    float _3057 = log2(_3055);
    float _3059 = -_3051;
    float _3061 = fma(_3059, _3035, 1.0);
    float _3063 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3065 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3053);
    float _3067 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3069 = -_3023;
    float _3071 = _2879 + _3069;
    float _3073 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3063);
    float _3075 = _3065 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3077 = _3043 * _2989;
    float _3079 = _3043 * _3005;
    float _3081 = _3043 * _2997;
    float _3083 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3073);
    float _3085 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3087 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3067);
    float _3089 = floor(_3049);
    float _3091 = _3083 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3093 = -_3085;
    float _3095 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3093);
    float _3097 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3099 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3101 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3103 = -_3081;
    float _3105 = fma(_3103, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3095);
    float _3107 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3097);
    float _3109 = _3099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3111 = fma(_3105, -0.5, 0.5);
    float _3113 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3107);
    float _3115 = exp2(_3101);
    float _3117 = fma(_3105, 0.5, 0.5);
    float _3119 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3121 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3123 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3125 = fma(_3117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3127 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3119);
    float _3129 = -_3089;
    float _3131 = _3049 + _3129;
    float _3133 = 1.0 / _3121;
    float _3135 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3123);
    float _3137 = fma(_3117, _3125, -0.212114393711090087890625);
    float _3139 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3127);
    float _3141 = _3079 + 1.0;
    float _3143 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3135);
    float _3145 = fma(_3117, _3137, 1.570728778839111328125);
    float _3147 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3139);
    float _3149 = log2(_3061);
    float _3151 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3143);
    float _3153 = -_3079;
    float _3155 = fma(_3115, _3141, _3153);
    float _3157 = sqrt(_3111);
    float _3159 = _3147 * _3133;
    float _3161 = _3151 * _3133;
    float2 _8479 = float2(_3071, _3131);
    float _3163 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8479, float2(0.0), isnan(_8479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8479, float2(0.0), isnan(_8479)), level(0.0)).x;
    float _3165 = fma(_3159, 0.5, 0.5);
    float _3167 = fma(_3161, -0.5, 0.5);
    float _3169 = _3149 * 0.693147182464599609375;
    float _3171 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3173 = fma(_3155, 0.5, 0.5);
    float _3175 = _3157 * 0.636619746685028076171875;
    float3 _8504 = float3(_3165, _3167, _3171);
    float _3177 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8504, float3(0.0), isnan(_8504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8504, float3(0.0), isnan(_8504)), level(0.0)).x;
    float3 _8515 = float3(_3165, _3167, _3171);
    float4 _3180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8515, float3(0.0), isnan(_8515)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8515, float3(0.0), isnan(_8515)), level(0.0)).xyzw;
    float _3182 = _3180.x;
    float _3184 = _3180.y;
    float _3186 = _3180.z;
    float _3188 = _3180.w;
    float _3190 = -_3145;
    float _3192 = fma(_3175, _3190, 1.0);
    float2 _8536 = float2(_3192, _3173);
    float3 _3196 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8536, float2(0.0), isnan(_8536)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8536, float2(0.0), isnan(_8536)), level(0.0)).xyz;
    float _3198 = _3196.x;
    float _3200 = _3196.y;
    float _3202 = _3196.z;
    float _3204 = abs(_2785);
    float _3206 = log2(_3204);
    float _3208 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _2777;
    out.m_95.y = _2775;
    out.m_95.z = _2779;
    bool _3210 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3212 = isnan(_2881);
    bool _3214 = _3210 || _3212;
    bool _3216 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3218 = _3214 || _3216;
    float _3220 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3208);
    bool _3222 = _2785 <= 8000.0;
    bool _3224 = isnan(_2785);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan(8000.0);
    bool _3230 = _3226 || _3228;
    float _3232 = float(_3230);
    float _3234 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3220);
    float _3236 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3238 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3234);
    float _3240 = _3121 * 0.5;
    float _3242 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3244 = exp2(_3236);
    float _3246 = fma(_3151, -0.5, _3240);
    float _3248 = _3238 + _3121;
    out.gl_Position.x = _3147;
    out.gl_Position.y = _3151;
    out.gl_Position.z = _3238;
    out.gl_Position.w = _3121;
    float _3250 = exp2(_3242);
    float _3252 = _3248 * 0.5;
    float _3254 = -_3244;
    float _3256 = _3254 + 1.0;
    float _3258 = _3238;
    float _3260 = _3151;
    float _3262 = _3121;
    if (!_3218)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3264 = _3258;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3218)
    {
        _3260 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3272 = _3260;
    float _3274 = fma(_3250, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3276 = precise::clamp(_3274, 0.0, 1.0);
    float _3278 = fma(_3276, -2.0, 3.0);
    float _3280 = _3276 * _3276;
    float _3282 = _3280 * _3278;
    float _3284 = -_3282;
    float _3286 = _3284 + 1.0;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3282);
    float _3290 = _3147 + _3121;
    float _3292 = in.m_69.x;
    float _3294 = -_3266;
    float _3296 = _3294 + 1.0;
    float _3298 = _3232 * _3288;
    float _3300 = _3290 * 0.5;
    float _3302 = _3296;
    float _3304 = _3272;
    float _3306 = _3272;
    if (!_3218)
    {
        _3262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3308 = _3262;
    float _3310 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.x = _3300;
    out.m_97.y = _3246;
    out.m_97.z = _3252;
    out.m_97.w = _3121;
    float _3312 = -_3163;
    float _3314 = _3312 + 1.0;
    float _3316 = _3314 * _3310;
    float _3318 = precise::clamp(_3316, 0.0, 1.0);
    float _3320 = -_3318;
    float _3322 = fma(_3320, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3324 = _3322 * _3292;
    float _3326 = _3266 * _3177;
    float _3328 = _3188 * _3296;
    float _3330 = _3182;
    float _3332 = _3308;
    float _3334 = _3308;
    if (!_3218)
    {
        _3302 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3336 = _3302;
    float _3338 = _3324 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3340 = _3188 * _3326;
    out.m_99.x = _3338;
    float _3342 = _3202 * _3326;
    float _3344 = fma(_3198, _3340, _3182);
    float _3346 = fma(_3200, _3340, _3184);
    float _3348 = _2843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3350 = fma(_3188, _3342, _3186);
    float _3352 = _3340;
    float _3354 = _3336;
    float _3356 = _3336;
    if (!_3218)
    {
        _3352 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3358 = _3352;
    float _3360 = _3358;
    float _3362 = _3358;
    if (!_3218)
    {
        _3330 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3364 = _3330;
    out.m_101.x = _3344;
    out.m_101.y = _3346;
    out.m_101.z = _3350;
    out.m_101.w = _3328;
    bool _3366 = !_3218;
    float _3368 = _3364;
    float _3370 = _3364;
    if (!_3366)
    {
        bool _3372 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3374 = isnan(_2881);
        bool _3376 = _3372 || _3374;
        bool _3378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3380 = _3376 || _3378;
        if (!_3380)
        {
            float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3384 = _2881 + _3382;
            float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3388 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3386;
            float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3394 = 1.0 / _3388;
            float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3412 = _3384 * _3394;
            float _3414 = precise::clamp(_3412, 0.0, 1.0);
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3420 = fma(_3414, _3392, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3422 = fma(_3414, _3418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3424 = fma(_3414, _3398, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3426 = fma(_3414, _3402, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3428 = fma(_3414, _3406, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3430 = fma(_3414, _3410, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3370 = _3424;
            _3306 = _3428;
            _3362 = _3420;
            _3270 = _3426;
            _3334 = _3422;
            _3356 = _3430;
            _3432 = true;
        }
        else
        {
            bool _3434 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3436 = isnan(_2881);
            bool _3438 = _3434 || _3436;
            bool _3440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3442 = _3438 || _3440;
            if (!_3442)
            {
                _3360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3444 = _3360;
            _3362 = _3444;
            if (!_3442)
            {
                _3368 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3446 = _3368;
            _3370 = _3446;
            if (!_3442)
            {
                _3332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3448 = _3332;
            _3334 = _3448;
            if (!_3442)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3450 = _3268;
            _3270 = _3450;
            if (!_3442)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3452 = _3304;
            _3306 = _3452;
            if (!_3442)
            {
                _3354 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3454 = _3354;
            bool _3456 = !_3442;
            _3356 = _3454;
            if (!_3456)
            {
                bool _3458 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3460 = isnan(_2881);
                bool _3462 = _3458 || _3460;
                bool _3464 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3466 = _3462 || _3464;
                if (!_3466)
                {
                    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3470 = _2881 + _3468;
                    float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3474 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3472;
                    float _3476 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3478 = _3476 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3480 = 1.0 / _3474;
                    float _3482 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3484 = _3482 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3486 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3488 = _3486 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3490 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3492 = _3490 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3494 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3496 = _3494 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3498 = _3470 * _3480;
                    float _3500 = precise::clamp(_3498, 0.0, 1.0);
                    float _3502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3506 = fma(_3500, _3478, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3508 = fma(_3500, _3504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3510 = fma(_3500, _3484, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3512 = fma(_3500, _3488, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3514 = fma(_3500, _3492, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3516 = fma(_3500, _3496, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3370 = _3510;
                    _3306 = _3514;
                    _3362 = _3506;
                    _3270 = _3512;
                    _3334 = _3508;
                    _3356 = _3516;
                    _3432 = true;
                }
                else
                {
                    _3370 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3356 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3432 = false;
    float _3518 = _3370;
    float _3520 = _3306;
    float _3522 = _3362;
    float _3524 = _3270;
    float _3526 = _3334;
    float _3528 = _3356;
    float _3530 = fma(_2419, -0.5, 0.5);
    float _3532 = precise::clamp(_3530, 0.0, 1.0);
    float _3534 = -_3518;
    float _3536 = _3534 + _3520;
    float _3538 = _3348 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3540 = -_3522;
    float _3542 = _3540 + _3524;
    float _3544 = fma(_3532, _3536, _3518);
    out.m_103.x = 0.0;
    float _3546 = -_3526;
    float _3548 = _3546 + _3528;
    float _3550 = fma(_3532, _3542, _3522);
    float _3552 = _3544 * 0.586610972881317138671875;
    out.m_53.x = _3538;
    bool _3554 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3556 = fma(_3532, _3548, _3526);
    float _3558 = fma(_3550, 0.298911988735198974609375, _3552);
    bool _3560 = _2843 > 0.0;
    bool _3562 = isnan(_2843);
    bool _3564 = _3560 || _3562;
    bool _3566 = isnan(0.0);
    bool _3568 = _3564 || _3566;
    float _3570 = fma(_3556, 0.114477999508380889892578125, _3558);
    out.m_105.x = 0.0;
    float _3572 = -_3570;
    float _3574 = _3550 + _3572;
    float _3576 = -_3570;
    float _3578 = _3544 + _3576;
    float _3580 = -_3570;
    float _3582 = _3556 + _3580;
    float _3584 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    float _3586 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    float _3588 = fma(_3582, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    bool _3590 = !_3554;
    if (!_3590)
    {
        float _3592 = -_2775;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3596 = -_2777;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3600 = -_2779;
        float _3602 = _3600 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3604 = _3594 * _3594;
        float _3606 = fma(_3598, _3598, _3604);
        float _3608 = fma(_3602, _3602, _3606);
        float _3610 = rsqrt(_3608);
        float _3612 = _3594 * _3610;
        float _3614 = _3598 * _3610;
        float _3616 = _3602 * _3610;
        float _3618 = sqrt(_3608);
        float _3620 = -_2869;
        float _3622 = _3620 + _3612;
        float _3624 = -_2865;
        float _3626 = _3624 + _3614;
        float _3628 = -_2867;
        float _3630 = _3628 + _3616;
        float _3632 = _3622 * _3622;
        float _3634 = fma(_3626, _3626, _3632);
        float _3636 = fma(_3630, _3630, _3634);
        float _3638 = -_3618;
        float _3640 = _3638 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3642 = rsqrt(_3636);
        float _3644 = _3640 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = abs(_3646);
        float _3650 = log2(_3648);
        float _3652 = _3622 * _3642;
        float _3654 = _3626 * _3642;
        float _3656 = _3630 * _3642;
        float _3658 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3660 = _2419 * _3652;
        float _3662 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3664 = precise::clamp(_3662, 0.0, 1.0);
        float _3666 = _2419 * _3612;
        float _3668 = fma(_2417, _3654, _3660);
        float _3670 = _3664 * _3664;
        float _3672 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3674 = fma(_2417, _3614, _3666);
        float _3676 = fma(_2421, _3656, _3668);
        float _3678 = precise::clamp(_3676, 0.0, 1.0);
        float _3680 = _3670 + (-1.0);
        float _3682 = fma(_2421, _3616, _3674);
        float _3684 = precise::clamp(_3682, 0.0, 1.0);
        float _3686 = _3678 * _3678;
        float _3688 = exp2(_3672);
        float _3690 = fma(_3686, _3680, 1.0);
        float _3692 = -_3612;
        float _3694 = -_3658;
        float _3696 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3694);
        float _3698 = _3690 * _3690;
        float _3700 = -_3616;
        float _3702 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3696);
        float _3704 = 1.0 / _3698;
        float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3708 = _3702 + _3706;
        float _3710 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3712 = precise::clamp(_3710, 0.0, 1.0);
        float _3714 = _3688 * _3712;
        float _3716 = _3684 * _3714;
        float _3718 = _3670 * _3704;
        float _3720 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3722 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3724 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3726 = _3716 * _3718;
        float _3728 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3730 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3732 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3720;
        out.m_103.y = _3722;
        out.m_103.z = _3724;
        out.m_105.x = _3728;
        out.m_105.y = _3730;
        out.m_105.z = _3732;
    }
    out.m_107.x = _3584;
    out.m_107.y = _3586;
    out.m_107.z = _3588;
    if (_3568)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3734 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3734;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3432 = false;
    bool _2467 = false;
    bool _374 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_50.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_53.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3791 = as_type<float>(_142);
        out.gl_Position.z = _3791;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_55.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_53.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3861 = as_type<float>(_180);
        out.gl_Position.z = _3861;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = in.m_63.x;
    float _204 = in.m_63.y;
    float _206 = in.m_63.z;
    float _208 = _184 * _192;
    float _210 = _184 * _198;
    float _212 = fma(_182, _190, _208);
    float _214 = _184 * _204;
    float _216 = fma(_182, _196, _210);
    float _218 = fma(_182, _202, _214);
    float _220 = fma(_186, _194, _212);
    float _222 = fma(_186, _200, _216);
    float _224 = fma(_186, _206, _218);
    bool _226 = !_188;
    float _228 = _220;
    float _246;
    if (!_226)
    {
        float _230 = in.m_65.x;
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _230 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_126);
        float _252 = 1.0 / _250;
        float _254 = _160 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _256 + _258;
    bool _262 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _264 = isnan(_256);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    bool _278 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _280 = isnan(_256);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -_272;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = 1.0 / _276;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = _288 * _292;
    float _304 = -_288;
    float _306 = _304 + 1.0;
    float _308 = _260 * _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = fma(_296, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = _314 * _302;
    float _324 = fma(_318, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = _320 * _302;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _330 = _324 * _302;
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _334 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].x, _328);
    float _336 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _338 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].y, _336);
    float _340 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].z, _332);
    bool _342 = !_300;
    int _344 = as_type<int>(_308);
    float _368;
    float _370;
    float _372;
    if (!_342)
    {
        float _346 = in.m_65.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = float(_126);
        float _352 = 1.0 / _350;
        float _354 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = _160 * _352;
        float _358 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _360 = _358 * _348;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = _350;
        _372 = _356;
        _374 = true;
    }
    else
    {
        float _376 = float(_126);
        float _378 = 1.0 / _376;
        float _380 = _160 * _378;
        _368 = _380;
        _370 = _376;
        _372 = _380;
    }
    _374 = false;
    float _382 = _368;
    float _384 = _370;
    float _386 = _372;
    float _388 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _390 = int(_388);
    float _392 = in.m_67.y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _396 = _382 + _394;
    float _398 = in.m_65.w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _402 = _400 != 0;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _406 = int(_404);
    float _408 = in.m_65.y;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _416 = _414 != 0;
    float _418 = in.m_67.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _422 = _420 != 0;
    float _424 = float(_390);
    float _426 = in.m_65.x;
    float _428 = 1.0 / _384;
    float _430 = in.m_65.z;
    bool _432 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _434 = isnan(_382);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = float(uint(_406));
    float _446 = in.m_69.y;
    int _448 = ~_406;
    int _450 = _448 + 1;
    float _452 = 1.0 / _424;
    float _454 = float(_406);
    float _456 = in.m_71.y;
    bool _458 = _398 > 0.5;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _464 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _466 = isnan(_386);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = in.m_71.x;
    bool _478 = _408 > 0.5;
    float _480 = 1.0 / _444;
    bool _482 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _484 = isnan(_386);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = in.m_71.z;
    float _496 = 0.0;
    float _498 = _392;
    bool _500 = _458;
    bool _502 = _412;
    float _504 = _418;
    if (!_412)
    {
        _496 = _418;
    }
    float _506 = _496;
    float _508 = -_474;
    float _510 = _508 + 1.0;
    float _512 = in.m_63.w;
    bool _514 = !_422;
    float _516 = _514 ? _408 : _426;
    float _518 = _452 * _160;
    int _520 = ~_406;
    int _522 = _520 + 1;
    float _524 = 1.0 / _462;
    float _526 = in.m_61.w;
    int _528 = as_type<int>(_480) + (-2);
    float _530 = trunc(_518);
    int _532 = int(_530);
    out.m_73.y = _456;
    out.m_73.x = _476;
    out.m_73.z = _494;
    float _534 = float(uint(_532));
    float _536 = float(_532);
    float _538 = as_type<float>(_528) * _534;
    bool _540 = _536 >= _454;
    bool _542 = isnan(_536);
    bool _544 = _540 || _542;
    bool _546 = isnan(_454);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = trunc(_538);
    float _554 = precise::max(_552, 0.0);
    uint _557 = uint(_554);
    float _559 = trunc(_550);
    int _561 = int(_559);
    int _563 = _522 * int(_557);
    int _565 = _563 + _532;
    float _567 = float(uint(_565));
    float _569 = -_392;
    float _571 = _569 + 1.0;
    int _573 = ~_561;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    float _579 = as_type<float>(_528) * _567;
    int _581 = _458 ? as_type<int>(_571) : as_type<int>(_392);
    float _583 = _416 ? as_type<float>(_581) : _392;
    float _585 = trunc(_579);
    float _587 = precise::max(_585, 0.0);
    uint _589 = uint(_587);
    int _591 = as_type<int>(_571);
    float _593 = _506;
    if (_402)
    {
        float _595 = _478 ? _571 : _392;
        _498 = _595;
    }
    float _597 = _498;
    if (_412)
    {
        float _599 = -_418;
        float _601 = _599 + 1.0;
        _591 = as_type<int>(_601);
    }
    int _603 = _591;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    bool _609 = !_422;
    float _611 = _609 ? 1.2345600128173828125 : 1.0;
    if (_412)
    {
        bool _613 = _426 > 0.5;
        _500 = _613;
    }
    bool _615 = _500;
    float _617 = _516 * _611;
    if (_412)
    {
        float _619 = _615 ? as_type<float>(_603) : _418;
        _593 = _619;
    }
    float _621 = _593;
    float _623 = in.m_75.x;
    float _625 = in.m_75.y;
    float _627 = in.m_75.z;
    float _629 = floor(_617);
    int _631 = int(_557) + int(_589);
    if (_607)
    {
        float _633 = -_418;
        float _635 = _633 + 1.0;
        _344 = as_type<int>(_635);
    }
    int _637 = _344;
    float _639 = in.m_50.x;
    float _641 = in.m_50.y;
    float _643 = in.m_50.z;
    if (_607)
    {
        bool _645 = _430 > 0.5;
        _502 = _645;
    }
    bool _647 = _502;
    int _649 = _450 * _631;
    int _651 = _649 + _532;
    if (_607)
    {
        float _653 = _647 ? as_type<float>(_637) : _418;
        _504 = _653;
    }
    float _655 = _504;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _671 = _669 != 0;
    bool _673 = !_663;
    int _675 = _673 ? 0 : 1;
    float _677 = -_629;
    float _679 = _617 + _677;
    bool _681 = uint(_651) >= uint(_406);
    bool _683 = !_659;
    int _685 = _683 ? 0 : 1;
    float _687 = _679 * _454;
    bool _689 = !_681;
    int _691 = _689 ? 0 : (-1);
    float _693 = _334 * _623;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _705 = _703 != 0;
    float _707 = _454 * _160;
    int _709 = ~_631;
    int _711 = _709 + _691;
    int _713 = _711 + 1;
    float _715 = trunc(_687);
    int _717 = int(_715);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _721 = _719 != 0;
    float _723 = _198 * _641;
    float _725 = _204 * _641;
    float _727 = _641 + _446;
    bool _729 = !_721;
    int _731 = _729 ? 0 : 1;
    int _733 = _406 * _713;
    int _735 = _733 + _532;
    bool _737 = _406 == 0;
    float _739 = _707 * _428;
    int _741 = abs(_731);
    float _743 = _408 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _745 = !_737;
    int _747 = _745 ? _735 : (-1);
    float _749 = fma(_202, _639, _725);
    int _751 = _406 + (-1);
    float _753 = trunc(_739);
    int _755 = int(_753);
    bool _757 = !_667;
    int _759 = _757 ? 0 : 1;
    int _761 = _747 * _577;
    int _763 = abs(_685);
    int _765 = _717 * _741;
    int _767 = _765 + _532;
    int _769 = abs(_759);
    int _771 = _561 * _751;
    int _773 = _771 + _761;
    int _775 = abs(_675);
    float _777 = fma(_196, _639, _723);
    bool _779 = !_671;
    int _781 = _779 ? 0 : 1;
    float _783 = fma(_206, _643, _749);
    int _785 = _773 * _775;
    int _787 = abs(_781);
    float _789 = fma(_200, _643, _777);
    int _791 = _755 * _763;
    int _793 = _791 + _785;
    float _795 = in.m_71.w;
    int _797 = _767 * _769;
    int _799 = _797 + _793;
    int _801 = _717 * _787;
    int _803 = _801 + _799;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _815 = float(uint(_803));
    float _817 = fma(_743, -2.0, _809);
    float _819 = 1.0 / _807;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _823 = as_type<float>(_528) * _815;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _827 = ~_406;
    int _829 = _827 + 1;
    float _831 = trunc(_823);
    float _833 = precise::max(_831, 0.0);
    uint _835 = uint(_833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = 1.0 / _813;
    float _847 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _861 = _829 * int(_835);
    int _863 = _861 + _803;
    float _865 = 1.0 / _841;
    out.m_77.x = _847;
    out.m_77.y = _849;
    out.m_77.z = _851;
    out.m_77.w = _843;
    float _867 = _855 * _819;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _877 = float(uint(_863));
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _883 = 1.0 / _859;
    float _885 = _875 * _845;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_73.w = _795;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _895 = 1.0 / _871;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _899;
    float _903 = as_type<float>(_528) * _877;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _913 = 1.0 / _881;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _919 = _907 * _524;
    float _921 = _426 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _923 = fma(_867, _396, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _927 = _386 + _925;
    float _929 = trunc(_903);
    float _931 = precise::max(_929, 0.0);
    uint _933 = uint(_931);
    float _935 = -_897;
    float _937 = fma(_921, 2.0, _935);
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _941 = _939 != 0;
    bool _943 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _945 = isnan(_386);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    bool _955 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _957 = isnan(_382);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _889;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _971 = _969 != 0;
    float _973 = -_965;
    float _975 = _973 + 1.0;
    float _977 = _749;
    if (!_941)
    {
        _977 = _408;
    }
    float _979 = _977;
    float _981 = 1.0 / _893;
    int _983 = int(_835) + int(_933);
    float _985 = _426 + _408;
    float _987 = 0.0;
    float _989 = _979;
    if (!_941)
    {
        _987 = _430;
    }
    float _991 = _987;
    float _993 = _991;
    if (_941)
    {
        _989 = _426;
    }
    float _995 = _989;
    float _997 = _985 + (-1.0);
    if (_941)
    {
        _993 = _408;
    }
    float _999 = _993;
    float _1001 = _911 * _967;
    float _1003 = _901 * _865;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1005;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1011 = _408 + _430;
    float _1013 = fma(_1001, _927, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1015 = _1007 * _883;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1029 = _917 * _895;
    float _1031 = 1.0 / _1019;
    float _1033 = _1027 * _913;
    float _1035 = _426 * 2.0;
    int _1037 = ~_406;
    int _1039 = _1037 + 1;
    float _1041 = _1023 * _981;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1045 = _382 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1049 = _386 + _1047;
    bool _1051 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1053 = isnan(_386);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = floor(_1035);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1065;
    float _1069 = _430 * 2.0;
    int _1071 = _1039 * _983;
    int _1073 = _1071 + _803;
    float _1075 = fma(_1003, _1045, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1077 = fma(_1041, _1049, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1081 = _386 + _1079;
    bool _1083 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1085 = isnan(_386);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = floor(_1069);
    bool _1097 = uint(_1073) >= uint(_406);
    float _1099 = _1011 + (-1.0);
    float _1101 = _1067 * _1031;
    bool _1103 = !_1097;
    int _1105 = _1103 ? 0 : (-1);
    float _1107 = fma(_1015, _1081, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1109 = -_1093;
    float _1111 = _1109 + 1.0;
    bool _1113 = _1063 >= 0.0;
    bool _1115 = isnan(_1063);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.0);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1127 = _382 + _1125;
    float _1129 = _1011;
    if (!_941)
    {
        _1129 = _430;
    }
    float _1131 = _1129;
    float _1133 = _1061 * _510;
    int _1135 = _1121 ? 0 : 1;
    float _1137 = fma(_885, _1127, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1141 = _386 + _1139;
    bool _1143 = _1095 >= 0.0;
    bool _1145 = isnan(_1095);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1155 = _386 + _1153;
    float _1157 = _1131;
    if (_941)
    {
        _1157 = _408;
    }
    float _1159 = _1157;
    float _1161 = fma(_1029, _1141, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1163 = _1151 ? 0 : 1;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1167 = _386 + _1165;
    bool _1169 = _1095 > 0.0;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1173 = _386 + _1171;
    float _1175 = fma(_919, _1155, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1177 = fma(_1101, _1167, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1179 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1181 = isnan(_382);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1187 = _1183 || _1185;
    float _1189 = float(_1187);
    float _1191 = fma(_1033, _1173, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1193 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1195 = isnan(_382);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _953 * _1111;
    bool _1207 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1209 = isnan(_386);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -_953;
    float _1221 = _1219 + 1.0;
    bool _1223 = _1063 > 0.0;
    float _1225 = -_1189;
    float _1227 = _1225 + 1.0;
    bool _1229 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1231 = isnan(_386);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = _1217 * _1221;
    float _1243 = -_1217;
    float _1245 = _1243 + 1.0;
    bool _1247 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1249 = isnan(_386);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = _1203 * _975;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1263 = _1239 * _1245;
    float _1265 = -_1239;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1257;
    float _1271 = _1269 + 1.0;
    float _1273 = _1175 * _1133;
    float _1275 = _1257 * _1267;
    float _1277 = _965 * _1227;
    float _1279 = _492 * _1271;
    float _1281 = -_492;
    float _1283 = _1281 + 1.0;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1287 = -_1203;
    float _1289 = _1287 + 1.0;
    float _1291 = _789 + _526;
    float _1293 = _474 * _1283;
    float _1295 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1285);
    float _1297 = _783 + _512;
    float _1299 = _442 * _1289;
    float _1301 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1303 = -_442;
    float _1305 = _1303 + 1.0;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1309 = _923 * _1299;
    float _1311 = fma(_1301, _597, -0.5);
    float _1313 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1307);
    float _1315 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1309);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1319 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1313);
    float _1321 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _817);
    float _1323 = fma(_1137, _1259, _1315);
    float _1325 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1317);
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1329 = -_1321;
    float _1331 = fma(_1319, _1311, _1329);
    int _1333 = ~_983;
    int _1335 = _1333 + _1105;
    int _1337 = _1335 + 1;
    float _1339 = -_1061;
    float _1341 = _1339 + 1.0;
    int _1343 = ~_1135;
    int _1345 = _1343 + 1;
    int _1347 = _1345 + 1;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1351 = _1347;
    float _1353 = _1297;
    if (!_1223)
    {
        int _1355 = ~_1135;
        int _1357 = _1355 + 1;
        _1351 = _1357;
    }
    int _1359 = _1351;
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1273);
    int _1363 = _406 * _1337;
    int _1365 = _1363 + _803;
    float _1367 = float(uint(_767));
    float _1369 = _995 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1371 = fma(_1013, _1293, _1361);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1375 = !_737;
    int _1377 = _1375 ? _1365 : (-1);
    float _1379 = as_type<float>(_528) * _1367;
    float _1381 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1383 = -_1327;
    float _1385 = fma(_1369, 2.0, _1383);
    int _1387 = _1377 >> 31;
    float _1389 = fma(_1381, -2.0, _1373);
    float _1391 = trunc(_1379);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    int _1397 = _1387 & 3;
    float _1399 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1401 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1389);
    int _1403 = _1377 + _1397;
    float _1405 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1295);
    float _1407 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1409 = _1403 >> 2;
    float _1411 = fma(_1399, _621, -0.5);
    int _1413 = ~_1163;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    float _1419 = -_1401;
    float _1421 = fma(_1405, _1407, _1419);
    int _1423 = ~_406;
    int _1425 = _1423 + 1;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1429 = _1417;
    if (!_1169)
    {
        int _1431 = ~_1163;
        int _1433 = _1431 + 1;
        _1429 = _1433;
    }
    int _1435 = _1429;
    float _1437 = fma(_1075, _1277, _1323);
    int _1439 = _1377 & 3;
    bool _1441 = _1439 != 0;
    int _1443 = _1425 * int(_1395);
    int _1445 = _1443 + _767;
    int _1447 = _1409 << 4;
    int _1449 = _1447 + 512;
    float _1451 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    int _1453 = _1377 & 3;
    bool _1455 = _1453 != 0;
    float _1457 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1437);
    int _1459 = _1441 ? 0 : 1;
    uint _1461 = uint(int(uint(_1449) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[int(_1471)][_1473];
    bool _1477 = uint(_1453) > 1u;
    float _1479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1481 = log2(_1479);
    float _1483 = float(uint(_1445));
    float _1485 = fma(_1107, _1279, _1371);
    float _1487 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1451);
    float _1489 = -_160;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _937);
    int _1493 = ~_1459;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    int _1499 = _1449 + 8;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    float _1517 = as_type<float>(_528) * _1483;
    bool _1519 = !_697;
    int _1521 = _1519 ? 0 : 1;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1525 = _727 + _1523;
    float _1527 = -_160;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1385);
    float _1531 = float(_1435);
    float _1533 = fma(_1487, _1411, _1491);
    int _1535 = _1497;
    if (!_1477)
    {
        int _1537 = ~_1459;
        int _1539 = _1537 + 1;
        _1535 = _1539;
    }
    int _1541 = _1535;
    float _1543 = trunc(_1517);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    bool _1549 = uint(_1453) >= 2u;
    float _1551 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1325);
    int _1553 = abs(_1521);
    float _1555 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    int _1557 = _1549 ? 0 : 1;
    float _1559 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1561 = _1453 != 3;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = _1291 + _1563;
    float _1567 = float(_1553);
    float _1569 = fma(_1551, _1555, _1529);
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1573 = _1297 + _1571;
    float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1559);
    int _1577 = ~_406;
    int _1579 = _1577 + 1;
    float _1581 = _1567 * _1531;
    int _1583 = ~_1557;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    float _1589 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1575);
    int _1591 = int(_1395) + int(_1547);
    float _1593 = fma(_1161, _1275, _1485);
    int _1595 = _1587;
    if (_1561)
    {
        int _1597 = ~_1557;
        int _1599 = _1597 + 1;
        _1595 = _1599;
    }
    int _1601 = _1595;
    int _1603 = abs(_1541);
    float _1605 = fma(_1077, _1263, _1593);
    bool _1607 = !_1455;
    int _1609 = _1607 ? 0 : 1;
    float _1611 = _1569 + 0.5;
    bool _1613 = _1453 != 3;
    int _1615 = _1579 * _1591;
    int _1617 = _1615 + _767;
    bool _1619 = _1589 >= 0.0;
    float _1621 = fma(_1191, _1241, _1605);
    int _1623 = abs(_1609);
    float _1625 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1627 = !_1613;
    int _1629 = _1627 ? 0 : (-1);
    float _1631 = fma(_1177, _1205, _1621);
    bool _1633 = uint(_1617) >= uint(_406);
    float _1635 = _408 * 2.0;
    int _1637 = ~_1603;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    int _1643 = abs(_1601);
    int _1645 = _1641 * as_type<int>(_1475);
    int _1647 = abs(_1629);
    if (_1619)
    {
        out.m_53.x = 0.0;
    }
    int _1649 = ~_1623;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    bool _1655 = !_971;
    int _1657 = _1655 ? 0 : 1;
    int _1659 = _1653 * as_type<int>(_1467);
    int _1661 = _1659 + _1645;
    int _1663 = ~_1643;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    int _1669 = abs(_1657);
    int _1671 = _1667 * as_type<int>(_1507);
    int _1673 = _1671 + _1661;
    bool _1675 = !_1633;
    int _1677 = _1675 ? 0 : (-1);
    int _1679 = ~_1647;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = _1331 + 0.5;
    int _1687 = ~_1591;
    int _1689 = _1687 + _1677;
    int _1691 = _1689 + 1;
    int _1693 = _1683 * as_type<int>(_1515);
    int _1695 = _1693 + _1673;
    int _1697 = ~_1669;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    float _1703 = _1533 + 0.5;
    int _1705 = _406 * _1691;
    int _1707 = _1705 + _767;
    float _1709 = _1421 + 0.5;
    int _1711 = _1695 * _1701;
    float _1713 = _1525 * _1525;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_79.x = _1703;
    out.m_79.y = _1685;
    out.m_79.z = _1611;
    out.m_79.w = _1709;
    float _1717 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1719 = !_737;
    int _1721 = _1719 ? _1707 : (-1);
    bool _1723 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1725 = isnan(0.0);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1731 = _1727 || _1729;
    int _1733 = _1721 * _1669;
    int _1735 = _1733 + _1711;
    bool _1737 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1739 = isnan(1.0);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1745 = _1741 || _1743;
    float _1747 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1749 = fma(_1565, _1565, _1713);
    float _1751 = _1713;
    int _1753 = as_type<int>(_1749);
    if (_1619)
    {
        _1751 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1755 = _1751;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1761 = fma(_1573, _1573, _1749);
    float _1763 = _1481 * _160;
    if (_1619)
    {
        float _1765 = _1755 * 5.0;
        _1753 = as_type<int>(_1765);
    }
    int _1767 = _1753;
    float _1769 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1631);
    float _1771 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1773 = in.m_81.x;
    float _1775 = in.m_81.y;
    float _1777 = in.m_81.z;
    float _1779 = rsqrt(_1761);
    float _1781 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1783 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1785 = float(_1735);
    if (_1619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6287 = as_type<float>(_1767);
        out.gl_Position.z = _6287;
    }
    out.m_83.x = _1747;
    out.m_83.y = _1771;
    out.m_83.z = _1781;
    out.m_83.w = _1783;
    float _1787 = exp2(_1763);
    out.m_85.x = _1769;
    float _1789 = _1717 * _1779;
    out.m_87.y = _1785;
    bool _1791 = !_705;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1565 * _1789;
    float _1797 = floor(_1635);
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1801 = 1.0 + _1799;
    bool _1803 = !_701;
    int _1805 = _1803 ? 0 : 1;
    float _1807 = _1525 * _1789;
    if (_1619)
    {
        return out;
    }
    float _1809 = -_1807;
    float _1811 = _727 + _1809;
    float _1813 = _1573 * _1789;
    float _1815 = -_1795;
    float _1817 = _1291 + _1815;
    float _1819 = 1.0 / _1801;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = _1811 + _1821;
    float _1825 = -_1813;
    float _1827 = _1297 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1831 = _1817 + _1829;
    int _1833 = abs(_1805);
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1839 = _1827 + _1837;
    float _1841 = -_1787;
    float _1843 = _1841 + 1.0;
    bool _1845 = _1797 > 0.0;
    float _1847 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1835);
    float _1849 = float(_1833);
    float _1851 = _408 + (-0.5);
    float _1853 = float(_1359);
    float _1855 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    float _1857 = _1581 * (-2.0);
    float _1859 = _1731 ? _1843 : 0.0;
    float _1861 = _1849 * _1853;
    float _1863 = _426 + (-0.5);
    float _1865 = fma(_1857, _1773, _1773);
    bool _1867 = _1797 >= 0.0;
    bool _1869 = isnan(_1797);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.0);
    bool _1875 = _1871 || _1873;
    float _1877 = _1861 * (-2.0);
    bool _1879 = _1855 >= 0.0;
    float _1881 = _1877;
    if (_1745)
    {
        float _1883 = _1859 * _1819;
        _162 = _1883;
    }
    float _1885 = _162;
    float _1887 = fma(_1009, _1857, _1009);
    float _1889 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1865);
    float _1891 = fma(_1877, _1775, _1775);
    float _1893 = fma(_1123, _1877, _1123);
    float _1895 = fma(_1887, _1885, _1889);
    float _1897 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1891);
    int _1899 = _1875 ? 0 : 1;
    float _1901 = _426 + _430;
    float _1903 = _1895 * 0.15915493667125701904296875;
    float _1905 = fma(_1893, _1885, _1897);
    if (_1879)
    {
        _1881 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1907 = _1881;
    int _1909 = as_type<int>(_1907);
    if (_1879)
    {
        out.m_53.x = 0.0;
    }
    float _1911 = _1903 * 6.283185482025146484375;
    float _1913 = sin(_1911);
    int _1915 = ~_1899;
    int _1917 = _1915 + 1;
    int _1919 = _1917 + 1;
    int _1921 = _1919;
    if (_1879)
    {
        float _1923 = _1907 * 5.0;
        _1909 = as_type<int>(_1923);
    }
    int _1925 = _1909;
    if (!_1845)
    {
        int _1927 = ~_1899;
        int _1929 = _1927 + 1;
        _1921 = _1929;
    }
    int _1931 = _1921;
    int _1933 = abs(_1793);
    float _1935 = _1903 * 6.283185482025146484375;
    float _1937 = cos(_1935);
    if (_1879)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6527 = as_type<float>(_1925);
        out.gl_Position.z = _6527;
    }
    if (_1879)
    {
        return out;
    }
    float _1939 = -_727;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1943 = _1905 * 0.15915493667125701904296875;
    float _1945 = -_1291;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = float(_1931);
    float _1951 = _1941 * _1941;
    float _1953 = -_1297;
    float _1955 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1957 = float(_1933);
    float _1959 = _1901 + (-1.0);
    float _1961 = fma(_1947, _1947, _1951);
    float _1963 = -_1807;
    float _1965 = _1525 + _1963;
    float _1967 = -_1795;
    float _1969 = _1565 + _1967;
    float _1971 = _1957 * _1949;
    float _1973 = fma(_1955, _1955, _1961);
    float _1975 = fma(_1959, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1977 = _1965 * _1965;
    float _1979 = _1971 * (-2.0);
    float _1981 = _430 + (-0.5);
    float _1983 = -_1813;
    float _1985 = _1573 + _1983;
    float _1987 = rsqrt(_1973);
    float _1989 = fma(_1975, _1979, _1975);
    float _1991 = fma(_1979, _1777, _1777);
    float _1993 = fma(_1969, _1969, _1977);
    float _1995 = _340 * _627;
    float _1997 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1991);
    float _1999 = fma(_1985, _1985, _1993);
    float _2001 = _338 * _625;
    float _2003 = _1943 * 6.283185482025146484375;
    float _2005 = sin(_2003);
    float _2007 = fma(_1989, _1885, _1997);
    float _2009 = _2007 * 0.15915493667125701904296875;
    float _2011 = _1947 * _1987;
    float _2013 = _1955 * _1987;
    float _2015 = _1943 * 6.283185482025146484375;
    float _2017 = cos(_2015);
    float _2019 = in.m_89.x;
    float _2021 = in.m_89.y;
    float _2023 = in.m_89.z;
    float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2027 = _2011 * _2025;
    float _2029 = _1941 * _1987;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = _2013 * _2031;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2037 = -_2027;
    float _2039 = fma(_2013, _2035, _2037);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2043 = _2029 * _2041;
    float _2045 = _2009 * 6.283185482025146484375;
    float _2047 = sin(_2045);
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2051 = -_2033;
    float _2053 = fma(_2029, _2049, _2051);
    float _2055 = _2039 * _2039;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2059 = -_2043;
    float _2061 = fma(_2011, _2057, _2059);
    float _2063 = _1913 * _2005;
    float _2065 = fma(_2053, _2053, _2055);
    float _2067 = sqrt(_1999);
    float _2069 = _1937 * _2017;
    float _2071 = fma(_2061, _2061, _2065);
    float _2073 = _1913 * _2017;
    float _2075 = _2009 * 6.283185482025146484375;
    float _2077 = cos(_2075);
    float _2079 = fma(_2047, _2069, _2063);
    float _2081 = fma(_2047, _2063, _2069);
    float _2083 = _2001 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2085 = _2021 != 0.0;
    bool _2087 = isnan(_2021);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.0);
    bool _2093 = _2089 || _2091;
    float _2095 = rsqrt(_2071);
    float _2097 = _1779 * _2067;
    float _2099 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2101 = _1937 * _2005;
    bool _2103 = _2019 == 0.0;
    bool _2105 = !_2093;
    bool _2107 = _2103 && _2105;
    float _2109 = _2097 * _2083;
    float _2111 = _2097 * _2099;
    float _2113 = _1937 * _2077;
    float _2115 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2021);
    float _2117 = _2017 * _2077;
    float _2119 = _1913 * _2077;
    float _2121 = _2005 * _2077;
    float _2123 = _2115 * _2109;
    float _2125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2023);
    float _2127 = _1625 * _2097;
    float _2129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2019);
    float _2131 = -_2101;
    float _2133 = fma(_2047, _2073, _2131);
    float _2135 = -_2073;
    float _2137 = fma(_2047, _2101, _2135);
    float _2139 = _2125 * _2111;
    float _2141 = _2129 * _2127;
    float _2143 = _2113 * _2123;
    float _2145 = _2053 * _2095;
    float _2147 = _2039 * _2095;
    float _2149 = _2061 * _2095;
    float _2151 = fma(_2079, _2141, _2143);
    float _2153 = -_2123;
    float _2155 = _2047 * _2153;
    float _2157 = _2013 * _2147;
    float _2159 = _2029 * _2145;
    float _2161 = _2119 * _2123;
    float _2163 = fma(_2117, _2141, _2155);
    float _2165 = fma(_2137, _2139, _2151);
    float _2167 = -_2157;
    float _2169 = fma(_2029, _2149, _2167);
    float _2171 = -_2159;
    float _2173 = fma(_2011, _2147, _2171);
    float _2175 = fma(_2133, _2141, _2161);
    float _2177 = fma(_2121, _2139, _2163);
    float _2179 = _2169 * _2165;
    float _2181 = _2173 * _2165;
    float _2183 = fma(_2081, _2139, _2175);
    bool _2185 = _2023 == 0.0;
    bool _2187 = _2185 && _2107;
    float _2189 = in.m_91.x;
    float _2191 = in.m_91.y;
    float _2193 = in.m_91.z;
    float _2195 = fma(_2145, _2177, _2179);
    float _2197 = fma(_2149, _2177, _2181);
    float _2199 = _2011 * _2149;
    float _2201 = _2113 * _2169;
    float _2203 = fma(_2011, _2183, _2195);
    float _2205 = fma(_2013, _2183, _2197);
    float _2207 = -_2199;
    float _2209 = fma(_2013, _2145, _2207);
    float _2211 = _2137 * _2169;
    float _2213 = _1291 + _2203;
    float _2215 = _1297 + _2205;
    float _2217 = _2209 * _2165;
    float _2219 = _2137 * _2173;
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2223 = _2213 + _2221;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2227 = _2215 + _2225;
    float _2229 = _2137 * _2209;
    float _2231 = -_2047;
    float _2233 = fma(_2231, _2145, _2201);
    float _2235 = _2223 * _2223;
    float _2237 = _2227 * _2227;
    float _2239 = fma(_2147, _2177, _2217);
    float _2241 = _2113 * _2173;
    float _2243 = _2235 + _2237;
    float _2245 = fma(_2029, _2183, _2239);
    float _2247 = _2189;
    float _2249 = _2191;
    float _2251 = _2193;
    float _2253 = _2047;
    float _2255 = _2235;
    float _2257 = _2237;
    float _2259 = _2213;
    float _2261 = _2215;
    if (!_2187)
    {
        float _2263 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2189);
        _2247 = _2263;
    }
    float _2265 = _2247;
    float _2267 = _2265;
    if (!_2187)
    {
        float _2269 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2249 = _2269;
    }
    float _2271 = _2249;
    float _2273 = sqrt(_2243);
    if (!_2187)
    {
        float _2275 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2193);
        _2251 = _2275;
    }
    float _2277 = _2251;
    float _2279 = _2113 * _2209;
    float _2281 = _2079 * _2169;
    float _2283 = _2079 * _2209;
    float _2285 = _2079 * _2173;
    float _2287 = _727 + _2245;
    float _2289 = -_2047;
    float _2291 = fma(_2289, _2147, _2279);
    float _2293 = -_2047;
    float _2295 = fma(_2293, _2149, _2241);
    float _2297 = fma(_2117, _2145, _2281);
    float _2299 = fma(_2117, _2147, _2283);
    float _2301 = fma(_2117, _2149, _2285);
    float _2303 = fma(_2121, _2145, _2211);
    float _2305 = fma(_2121, _2147, _2229);
    float _2307 = fma(_2119, _2011, _2233);
    float _2309 = fma(_2121, _2149, _2219);
    bool _2311 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2313 = fma(_2119, _2029, _2291);
    float _2315 = fma(_2119, _2013, _2295);
    float _2317 = _2303;
    if (!_2311)
    {
        _2253 = _2287;
    }
    float _2319 = _2253;
    bool _2321 = !_2311;
    float _2323 = _2319;
    if (!_2321)
    {
        float _2325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2329 = _2273 + _2327;
        float _2331 = rsqrt(_2243);
        float _2333 = _2329 * _2325;
        float _2335 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2337 = _2333 * 0.15915493667125701904296875;
        float _2339 = _2337 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        float _2343 = _2337 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = fma(_2341, _2335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2349 = _2331 * _2347;
        float _2351 = fma(_2223, _2349, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2353 = _2345 + (-1.0);
        float _2355 = fma(_2227, _2349, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2359 = _2351 + _2357;
        float _2361 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2365 = _2355 + _2363;
        float _2367 = _2359 * _2359;
        float _2369 = fma(_2287, _2345, _2361);
        float _2371 = _2365 * _2365;
        _2323 = _2369;
        _2255 = _2367;
        _2257 = _2371;
        _2259 = _2351;
        _2261 = _2355;
    }
    float _2373 = _2323;
    float _2375 = _2255;
    float _2377 = _2257;
    float _2379 = _2259;
    float _2381 = _2261;
    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2385 = _2373 + _2383;
    float _2387 = fma(_2133, _2011, _2297);
    float _2389 = fma(_2133, _2029, _2299);
    float _2391 = fma(_2133, _2013, _2301);
    float _2393 = fma(_2385, _2385, _2375);
    float _2395 = _2307 * _2271;
    float _2397 = _2313 * _2271;
    float _2399 = _2315 * _2271;
    float _2401 = _2393 + _2377;
    float _2403 = fma(_2081, _2011, _2303);
    float _2405 = fma(_2081, _2029, _2305);
    float _2407 = fma(_2081, _2013, _2309);
    float _2409 = fma(_2387, _2265, _2395);
    float _2411 = fma(_2389, _2265, _2397);
    float _2413 = sqrt(_2401);
    float _2415 = fma(_2391, _2265, _2399);
    float _2417 = fma(_2403, _2277, _2409);
    float _2419 = fma(_2405, _2277, _2411);
    float _2421 = fma(_2407, _2277, _2415);
    out.m_93.x = _2417;
    out.m_93.y = _2419;
    out.m_93.z = _2421;
    bool _2423 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2425 = isnan(_2413);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2431 = _2427 || _2429;
    if (!_2431)
    {
        _2267 = 1.0;
    }
    float _2433 = _2267;
    bool _2435 = !_2431;
    float _2437 = _2433;
    if (!_2435)
    {
        bool _2439 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2441 = isnan(_2413);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2447 = _2443 || _2445;
        if (!_2447)
        {
            float _2449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2451 = _2413 + _2449;
            float _2453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2455 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2453;
            float _2457 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2461 = 1.0 / _2455;
            float _2463 = _2451 * _2461;
            float _2465 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2437 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2471 = isnan(_2413);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                float _2479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2481 = _2413 + _2479;
                float _2483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2485 = _2483 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2487 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2489 = _2487 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2491 = 1.0 / _2485;
                float _2493 = _2481 * _2491;
                float _2495 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2437 = _2495;
                _2467 = true;
            }
            else
            {
                _2437 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2467 = false;
    float _2497 = _2437;
    float _2499 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2501 = _2379 + _2499;
    float _2503 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2505 = _2381 + _2503;
    float _2507 = fma(_2501, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2509 = fma(_2505, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2513 = _2507 + _2511;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2517 = _2509 + _2515;
    float _2519 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2521 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7459 = float2(_2519, _2521);
    float _2523 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7459, float2(0.0), isnan(_7459)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7459, float2(0.0), isnan(_7459)), level(0.0)).x;
    float _2525 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2527 = _2373 + _2525;
    float _2529 = -_1291;
    float _2531 = _2529 + _2507;
    float _2533 = -_1297;
    float _2535 = _2533 + _2509;
    float _2537 = fma(_2527, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2539 = -_727;
    float _2541 = _2539 + _2537;
    float _2543 = fma(_2523, 100.0, _727);
    float _2545 = _2541 * _2541;
    float _2547 = fma(_2523, 100.0, _2537);
    float _2549 = -_1807;
    float _2551 = _2549 + _2543;
    float _2553 = fma(_2531, _2531, _2545);
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2557 = fma(_2535, _2535, _2553);
    float _2559 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2555);
    float _2561 = sqrt(_2557);
    float _2563 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2559);
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2567 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2569 = 1.0 / _2565;
    float _2571 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2567);
    float _2573 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2571);
    bool _2575 = _2561 > 0.0;
    float _2577 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2579 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2581 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan(0.5);
    bool _2587 = _2583 || _2585;
    float _2589 = _2577 + _2565;
    float _2591 = _2589 * _2569;
    float _2593 = _2591 * 0.5;
    float _2595 = _2537;
    float _2597 = _2523;
    float _2599 = _2543;
    float _2601 = _2557;
    if (!_2575)
    {
        _2317 = _2507;
    }
    float _2603 = _2317;
    float _2605 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2607 = fma(_2593, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2605);
    float _2609 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2611 = _2603;
    float _2613 = _2603;
    if (!_2575)
    {
        _2595 = _2509;
    }
    float _2615 = _2595;
    bool _2617 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(0.5);
    bool _2625 = _2621 || _2623;
    float _2627 = 1.0 / _2607;
    float _2629 = _2615;
    if (!_2575)
    {
        _2609 = _2547;
    }
    float _2631 = _2609;
    bool _2633 = !_2575;
    float _2635 = _2631;
    float _2637 = _2631;
    if (!_2633)
    {
        float _2639 = _220 * _220;
        float _2641 = fma(_222, _222, _2639);
        float _2643 = rsqrt(_2557);
        float _2645 = fma(_224, _224, _2641);
        float _2647 = sqrt(_2645);
        float _2649 = _2531 * _2643;
        float _2651 = _2541 * _2643;
        float _2653 = _2535 * _2643;
        bool _2655 = _2647 > 0.0;
        float _2657 = _2647;
        _2597 = _2645;
        if (!_2655)
        {
            _2611 = _2507;
        }
        float _2659 = _2611;
        _2613 = _2659;
        if (!_2655)
        {
            _2635 = _2547;
        }
        float _2661 = _2635;
        _2637 = _2661;
        if (!_2655)
        {
            _2657 = _2509;
        }
        float _2663 = _2657;
        bool _2665 = !_2655;
        _2629 = _2663;
        if (!_2665)
        {
            float _2667 = rsqrt(_2645);
            float _2669 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2671 = _220 * _2667;
            float _2673 = _222 * _2667;
            float _2675 = _2651 * _2671;
            float _2677 = _224 * _2667;
            float _2679 = fma(_2649, _2673, _2675);
            float _2681 = _2669 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2683 = fma(_2653, _2677, _2679);
            float _2685 = _2683 * _2681;
            float _2687 = fma(_222, _2685, _2507);
            float _2689 = fma(_220, _2685, _2547);
            float _2691 = fma(_224, _2685, _2509);
            _2613 = _2687;
            _2629 = _2691;
            _2637 = _2689;
            _2597 = _2667;
        }
    }
    float _2693 = _2613;
    float _2695 = _2629;
    float _2697 = _2637;
    float _2699 = _2597;
    float _2701 = -_1795;
    float _2703 = _2701 + _2693;
    float _2705 = -_1813;
    float _2707 = _2705 + _2695;
    float _2709 = -_1807;
    float _2711 = _2709 + _2697;
    float _2713 = _2699;
    float _2715 = _2711;
    float _2717 = _2703;
    float _2719 = _2707;
    if (_2625)
    {
        _2713 = 1.0;
    }
    float _2721 = _2713;
    float _2723 = _2721;
    if (!_2587)
    {
        float _2725 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2727 = _2551 + _2725;
        float _2729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2731 = -_1297;
        float _2733 = _2731 + _2695;
        float _2735 = _2727 * _2727;
        float _2737 = fma(_1831, _1831, _2735);
        float _2739 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2741 = fma(_1839, _1839, _2737);
        float _2743 = 1.0 / _2097;
        float _2745 = sqrt(_2741);
        float _2747 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2749 = precise::min(_2745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2751 = _2749 * _2729;
        float _2753 = -_2543;
        float _2755 = _2753 + _2697;
        float _2757 = _2751 * _2743;
        float _2759 = -_1291;
        float _2761 = _2759 + _2693;
        float _2763 = _2747 * _2757;
        float _2765 = _2733 * _2757;
        float _2767 = fma(_2755, _2763, _2551);
        float _2769 = fma(_2761, _2763, _1817);
        float _2771 = fma(_2747, _2765, _1827);
        _2599 = _2763;
        _2715 = _2767;
        _2717 = _2769;
        _2719 = _2771;
        _228 = _2757;
    }
    float _2773 = _2599;
    float _2775 = _2715;
    float _2777 = _2717;
    float _2779 = _2719;
    float _2781 = _228;
    float _2783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2785 = _2627 * _2783;
    float _2787 = _2773;
    float _2789 = _2781;
    if (!_2625)
    {
        float _2791 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2793 = _2791 * 0.15915493667125701904296875;
        float _2795 = _2793 * 6.283185482025146484375;
        float _2797 = cos(_2795);
        float _2799 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2801 = _2799 * 0.15915493667125701904296875;
        float _2803 = _2793 * 6.283185482025146484375;
        float _2805 = sin(_2803);
        float _2807 = 1.0 / _2797;
        float _2809 = _2801 * 6.283185482025146484375;
        float _2811 = cos(_2809);
        float _2813 = _2805 * _2807;
        float _2815 = _2801 * 6.283185482025146484375;
        float _2817 = sin(_2815);
        float _2819 = _2811 * _2813;
        float _2821 = 1.0 / _2819;
        float _2823 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2825 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2823;
        float _2827 = 1.0 / _2825;
        float _2829 = _2817 * _2821;
        float _2831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2833 = fma(_2785, _2829, _2831);
        float _2835 = _2833 * _2827;
        float _2837 = precise::clamp(_2835, 0.0, 1.0);
        _2787 = _2807;
        _2789 = _2801;
        _2723 = _2837;
    }
    float _2839 = _2787;
    float _2841 = _2789;
    float _2843 = _2723;
    float _2845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2847 = _2775 + _2845;
    float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2851 = _2777 + _2849;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2855 = _2779 + _2853;
    float _2857 = _2847 * _2847;
    float _2859 = fma(_2851, _2851, _2857);
    float _2861 = fma(_2855, _2855, _2859);
    float _2863 = rsqrt(_2861);
    float _2865 = _2851 * _2863;
    float _2867 = _2855 * _2863;
    float _2869 = _2847 * _2863;
    float _2871 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2873 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2875 = _2871 * _2871;
    float _2877 = _2873 * _2873;
    float _2879 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2881 = sqrt(_2861);
    float _2883 = _2875 + _2877;
    float _2885 = sqrt(_2883);
    bool _2887 = _2885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2891 = _2885 + _2889;
    float _2893 = _2839;
    float _2895 = _2841;
    float _2897 = _2891;
    float _2899 = _2883;
    if (_2887)
    {
        float _2901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2893 = _2901;
    }
    float _2903 = _2893;
    if (_2887)
    {
        float _2905 = rsqrt(_2883);
        _2895 = _2905;
    }
    float _2907 = _2895;
    float _2909 = _2907;
    if (_2887)
    {
        float _2911 = _2891 * _2903;
        _2897 = _2911;
    }
    float _2913 = _2897;
    if (_2887)
    {
        float _2915 = _2913 * 0.15915493667125701904296875;
        _1353 = _2915;
    }
    float _2917 = _1353;
    float _2919 = _2903;
    float _2921 = _2917;
    if (_2887)
    {
        float _2923 = _2917 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        _2919 = _2925;
    }
    float _2927 = _2919;
    float _2929 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2931 = precise::max(0.0, _2929);
    float _2933 = _1291;
    float _2935 = _2931;
    if (_2887)
    {
        float _2937 = _2917 * 6.283185482025146484375;
        float _2939 = cos(_2937);
        _2933 = _2939;
    }
    float _2941 = _2933;
    float _2943 = -_2869;
    float _2945 = -_2931;
    float _2947 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2945);
    if (_2887)
    {
        float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2935 = _2949;
    }
    float _2951 = _2935;
    float _2953 = _2951;
    if (!_2887)
    {
        _2921 = _2871;
    }
    float _2955 = _2921;
    float _2957 = _2927;
    float _2959 = _2955;
    if (_2887)
    {
        float _2961 = fma(_2927, _2951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2957 = _2961;
    }
    float _2963 = _2957;
    float _2965 = _2963;
    float _2967 = _2941;
    if (_2887)
    {
        float _2969 = _2941 + (-1.0);
        _2953 = _2969;
    }
    float _2971 = _2953;
    float _2973 = _2971;
    if (_2887)
    {
        float _2975 = _2907 * _2963;
        _2601 = _2975;
    }
    float _2977 = _2601;
    if (!_2887)
    {
        _2909 = _2947;
    }
    float _2979 = _2909;
    float _2981 = _2979;
    if (_2887)
    {
        float _2983 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2983;
    }
    float _2985 = _2899;
    if (_2887)
    {
        float _2987 = _2871 * _2977;
        _2959 = _2987;
    }
    float _2989 = _2959;
    if (!_2887)
    {
        _2973 = _2873;
    }
    float _2991 = _2973;
    float _2993 = _2991;
    if (_2887)
    {
        float _2995 = _2873 * _2977;
        _2993 = _2995;
    }
    float _2997 = _2993;
    if (!_2887)
    {
        _2965 = _2875;
    }
    float _2999 = _2965;
    float _3001 = _2999;
    if (_2887)
    {
        float _3003 = fma(_2947, _2941, _2985);
        _2981 = _3003;
    }
    float _3005 = _2981;
    if (_2887)
    {
        float _3007 = _2989 * _2989;
        _3001 = _3007;
    }
    float _3009 = _3001;
    if (!_2887)
    {
        _2967 = _2877;
    }
    float _3011 = _2967;
    float _3013 = _3011;
    if (_2887)
    {
        float _3015 = _2997 * _2997;
        _3013 = _3015;
    }
    float _3017 = _3013;
    float _3019 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3021 = fma(_3005, _3005, _3009);
    float _3023 = floor(_2879);
    float _3025 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3019);
    float _3027 = _3021 + _3017;
    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3031 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3029);
    float _3033 = precise::clamp(_3031, 0.0, 1.0);
    float _3035 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3037 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3025);
    float _3039 = -_3033;
    float _3041 = _3039 + 1.0;
    float _3043 = rsqrt(_3027);
    float _3045 = _3037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3047 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3049 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3051 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3053 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3047);
    float _3055 = abs(_3041);
    float _3057 = log2(_3055);
    float _3059 = -_3051;
    float _3061 = fma(_3059, _3035, 1.0);
    float _3063 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3065 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3053);
    float _3067 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3069 = -_3023;
    float _3071 = _2879 + _3069;
    float _3073 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3063);
    float _3075 = _3065 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3077 = _3043 * _2989;
    float _3079 = _3043 * _3005;
    float _3081 = _3043 * _2997;
    float _3083 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3073);
    float _3085 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3087 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3067);
    float _3089 = floor(_3049);
    float _3091 = _3083 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3093 = -_3085;
    float _3095 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3093);
    float _3097 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3099 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3101 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3103 = -_3081;
    float _3105 = fma(_3103, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3095);
    float _3107 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3097);
    float _3109 = _3099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3111 = fma(_3105, -0.5, 0.5);
    float _3113 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3107);
    float _3115 = exp2(_3101);
    float _3117 = fma(_3105, 0.5, 0.5);
    float _3119 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3121 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3123 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3125 = fma(_3117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3127 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3119);
    float _3129 = -_3089;
    float _3131 = _3049 + _3129;
    float _3133 = 1.0 / _3121;
    float _3135 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3123);
    float _3137 = fma(_3117, _3125, -0.212114393711090087890625);
    float _3139 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3127);
    float _3141 = _3079 + 1.0;
    float _3143 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3135);
    float _3145 = fma(_3117, _3137, 1.570728778839111328125);
    float _3147 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3139);
    float _3149 = log2(_3061);
    float _3151 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3143);
    float _3153 = -_3079;
    float _3155 = fma(_3115, _3141, _3153);
    float _3157 = sqrt(_3111);
    float _3159 = _3147 * _3133;
    float _3161 = _3151 * _3133;
    float2 _8479 = float2(_3071, _3131);
    float _3163 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8479, float2(0.0), isnan(_8479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8479, float2(0.0), isnan(_8479)), level(0.0)).x;
    float _3165 = fma(_3159, 0.5, 0.5);
    float _3167 = fma(_3161, -0.5, 0.5);
    float _3169 = _3149 * 0.693147182464599609375;
    float _3171 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3173 = fma(_3155, 0.5, 0.5);
    float _3175 = _3157 * 0.636619746685028076171875;
    float3 _8504 = float3(_3165, _3167, _3171);
    float _3177 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8504, float3(0.0), isnan(_8504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8504, float3(0.0), isnan(_8504)), level(0.0)).x;
    float3 _8515 = float3(_3165, _3167, _3171);
    float4 _3180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8515, float3(0.0), isnan(_8515)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8515, float3(0.0), isnan(_8515)), level(0.0)).xyzw;
    float _3182 = _3180.x;
    float _3184 = _3180.y;
    float _3186 = _3180.z;
    float _3188 = _3180.w;
    float _3190 = -_3145;
    float _3192 = fma(_3175, _3190, 1.0);
    float2 _8536 = float2(_3192, _3173);
    float3 _3196 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8536, float2(0.0), isnan(_8536)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8536, float2(0.0), isnan(_8536)), level(0.0)).xyz;
    float _3198 = _3196.x;
    float _3200 = _3196.y;
    float _3202 = _3196.z;
    float _3204 = abs(_2785);
    float _3206 = log2(_3204);
    float _3208 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _2777;
    out.m_95.y = _2775;
    out.m_95.z = _2779;
    bool _3210 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3212 = isnan(_2881);
    bool _3214 = _3210 || _3212;
    bool _3216 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3218 = _3214 || _3216;
    float _3220 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3208);
    bool _3222 = _2785 <= 8000.0;
    bool _3224 = isnan(_2785);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan(8000.0);
    bool _3230 = _3226 || _3228;
    float _3232 = float(_3230);
    float _3234 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3220);
    float _3236 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3238 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3234);
    float _3240 = _3121 * 0.5;
    float _3242 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3244 = exp2(_3236);
    float _3246 = fma(_3151, -0.5, _3240);
    float _3248 = _3238 + _3121;
    out.gl_Position.x = _3147;
    out.gl_Position.y = _3151;
    out.gl_Position.z = _3238;
    out.gl_Position.w = _3121;
    float _3250 = exp2(_3242);
    float _3252 = _3248 * 0.5;
    float _3254 = -_3244;
    float _3256 = _3254 + 1.0;
    float _3258 = _3238;
    float _3260 = _3151;
    float _3262 = _3121;
    if (!_3218)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3264 = _3258;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3218)
    {
        _3260 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3272 = _3260;
    float _3274 = fma(_3250, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3276 = precise::clamp(_3274, 0.0, 1.0);
    float _3278 = fma(_3276, -2.0, 3.0);
    float _3280 = _3276 * _3276;
    float _3282 = _3280 * _3278;
    float _3284 = -_3282;
    float _3286 = _3284 + 1.0;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3282);
    float _3290 = _3147 + _3121;
    float _3292 = in.m_69.x;
    float _3294 = -_3266;
    float _3296 = _3294 + 1.0;
    float _3298 = _3232 * _3288;
    float _3300 = _3290 * 0.5;
    float _3302 = _3296;
    float _3304 = _3272;
    float _3306 = _3272;
    if (!_3218)
    {
        _3262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3308 = _3262;
    float _3310 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.x = _3300;
    out.m_97.y = _3246;
    out.m_97.z = _3252;
    out.m_97.w = _3121;
    float _3312 = -_3163;
    float _3314 = _3312 + 1.0;
    float _3316 = _3314 * _3310;
    float _3318 = precise::clamp(_3316, 0.0, 1.0);
    float _3320 = -_3318;
    float _3322 = fma(_3320, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3324 = _3322 * _3292;
    float _3326 = _3266 * _3177;
    float _3328 = _3188 * _3296;
    float _3330 = _3182;
    float _3332 = _3308;
    float _3334 = _3308;
    if (!_3218)
    {
        _3302 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3336 = _3302;
    float _3338 = _3324 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3340 = _3188 * _3326;
    out.m_99.x = _3338;
    float _3342 = _3202 * _3326;
    float _3344 = fma(_3198, _3340, _3182);
    float _3346 = fma(_3200, _3340, _3184);
    float _3348 = _2843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3350 = fma(_3188, _3342, _3186);
    float _3352 = _3340;
    float _3354 = _3336;
    float _3356 = _3336;
    if (!_3218)
    {
        _3352 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3358 = _3352;
    float _3360 = _3358;
    float _3362 = _3358;
    if (!_3218)
    {
        _3330 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3364 = _3330;
    out.m_101.x = _3344;
    out.m_101.y = _3346;
    out.m_101.z = _3350;
    out.m_101.w = _3328;
    bool _3366 = !_3218;
    float _3368 = _3364;
    float _3370 = _3364;
    if (!_3366)
    {
        bool _3372 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3374 = isnan(_2881);
        bool _3376 = _3372 || _3374;
        bool _3378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3380 = _3376 || _3378;
        if (!_3380)
        {
            float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3384 = _2881 + _3382;
            float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3388 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3386;
            float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3394 = 1.0 / _3388;
            float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3412 = _3384 * _3394;
            float _3414 = precise::clamp(_3412, 0.0, 1.0);
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3420 = fma(_3414, _3392, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3422 = fma(_3414, _3418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3424 = fma(_3414, _3398, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3426 = fma(_3414, _3402, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3428 = fma(_3414, _3406, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3430 = fma(_3414, _3410, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3370 = _3424;
            _3306 = _3428;
            _3362 = _3420;
            _3270 = _3426;
            _3334 = _3422;
            _3356 = _3430;
            _3432 = true;
        }
        else
        {
            bool _3434 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3436 = isnan(_2881);
            bool _3438 = _3434 || _3436;
            bool _3440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3442 = _3438 || _3440;
            if (!_3442)
            {
                _3360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3444 = _3360;
            _3362 = _3444;
            if (!_3442)
            {
                _3368 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3446 = _3368;
            _3370 = _3446;
            if (!_3442)
            {
                _3332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3448 = _3332;
            _3334 = _3448;
            if (!_3442)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3450 = _3268;
            _3270 = _3450;
            if (!_3442)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3452 = _3304;
            _3306 = _3452;
            if (!_3442)
            {
                _3354 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3454 = _3354;
            bool _3456 = !_3442;
            _3356 = _3454;
            if (!_3456)
            {
                bool _3458 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3460 = isnan(_2881);
                bool _3462 = _3458 || _3460;
                bool _3464 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3466 = _3462 || _3464;
                if (!_3466)
                {
                    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3470 = _2881 + _3468;
                    float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3474 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3472;
                    float _3476 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3478 = _3476 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3480 = 1.0 / _3474;
                    float _3482 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3484 = _3482 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3486 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3488 = _3486 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3490 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3492 = _3490 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3494 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3496 = _3494 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3498 = _3470 * _3480;
                    float _3500 = precise::clamp(_3498, 0.0, 1.0);
                    float _3502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3506 = fma(_3500, _3478, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3508 = fma(_3500, _3504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3510 = fma(_3500, _3484, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3512 = fma(_3500, _3488, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3514 = fma(_3500, _3492, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3516 = fma(_3500, _3496, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3370 = _3510;
                    _3306 = _3514;
                    _3362 = _3506;
                    _3270 = _3512;
                    _3334 = _3508;
                    _3356 = _3516;
                    _3432 = true;
                }
                else
                {
                    _3370 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3356 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3432 = false;
    float _3518 = _3370;
    float _3520 = _3306;
    float _3522 = _3362;
    float _3524 = _3270;
    float _3526 = _3334;
    float _3528 = _3356;
    float _3530 = fma(_2419, -0.5, 0.5);
    float _3532 = precise::clamp(_3530, 0.0, 1.0);
    float _3534 = -_3518;
    float _3536 = _3534 + _3520;
    float _3538 = _3348 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3540 = -_3522;
    float _3542 = _3540 + _3524;
    float _3544 = fma(_3532, _3536, _3518);
    out.m_103.x = 0.0;
    float _3546 = -_3526;
    float _3548 = _3546 + _3528;
    float _3550 = fma(_3532, _3542, _3522);
    float _3552 = _3544 * 0.586610972881317138671875;
    out.m_53.x = _3538;
    bool _3554 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3556 = fma(_3532, _3548, _3526);
    float _3558 = fma(_3550, 0.298911988735198974609375, _3552);
    bool _3560 = _2843 > 0.0;
    bool _3562 = isnan(_2843);
    bool _3564 = _3560 || _3562;
    bool _3566 = isnan(0.0);
    bool _3568 = _3564 || _3566;
    float _3570 = fma(_3556, 0.114477999508380889892578125, _3558);
    out.m_105.x = 0.0;
    float _3572 = -_3570;
    float _3574 = _3550 + _3572;
    float _3576 = -_3570;
    float _3578 = _3544 + _3576;
    float _3580 = -_3570;
    float _3582 = _3556 + _3580;
    float _3584 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    float _3586 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    float _3588 = fma(_3582, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    bool _3590 = !_3554;
    if (!_3590)
    {
        float _3592 = -_2775;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3596 = -_2777;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3600 = -_2779;
        float _3602 = _3600 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3604 = _3594 * _3594;
        float _3606 = fma(_3598, _3598, _3604);
        float _3608 = fma(_3602, _3602, _3606);
        float _3610 = rsqrt(_3608);
        float _3612 = _3594 * _3610;
        float _3614 = _3598 * _3610;
        float _3616 = _3602 * _3610;
        float _3618 = sqrt(_3608);
        float _3620 = -_2869;
        float _3622 = _3620 + _3612;
        float _3624 = -_2865;
        float _3626 = _3624 + _3614;
        float _3628 = -_2867;
        float _3630 = _3628 + _3616;
        float _3632 = _3622 * _3622;
        float _3634 = fma(_3626, _3626, _3632);
        float _3636 = fma(_3630, _3630, _3634);
        float _3638 = -_3618;
        float _3640 = _3638 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3642 = rsqrt(_3636);
        float _3644 = _3640 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = abs(_3646);
        float _3650 = log2(_3648);
        float _3652 = _3622 * _3642;
        float _3654 = _3626 * _3642;
        float _3656 = _3630 * _3642;
        float _3658 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3660 = _2419 * _3652;
        float _3662 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3664 = precise::clamp(_3662, 0.0, 1.0);
        float _3666 = _2419 * _3612;
        float _3668 = fma(_2417, _3654, _3660);
        float _3670 = _3664 * _3664;
        float _3672 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3674 = fma(_2417, _3614, _3666);
        float _3676 = fma(_2421, _3656, _3668);
        float _3678 = precise::clamp(_3676, 0.0, 1.0);
        float _3680 = _3670 + (-1.0);
        float _3682 = fma(_2421, _3616, _3674);
        float _3684 = precise::clamp(_3682, 0.0, 1.0);
        float _3686 = _3678 * _3678;
        float _3688 = exp2(_3672);
        float _3690 = fma(_3686, _3680, 1.0);
        float _3692 = -_3612;
        float _3694 = -_3658;
        float _3696 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3694);
        float _3698 = _3690 * _3690;
        float _3700 = -_3616;
        float _3702 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3696);
        float _3704 = 1.0 / _3698;
        float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3708 = _3702 + _3706;
        float _3710 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3712 = precise::clamp(_3710, 0.0, 1.0);
        float _3714 = _3688 * _3712;
        float _3716 = _3684 * _3714;
        float _3718 = _3670 * _3704;
        float _3720 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3722 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3724 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3726 = _3716 * _3718;
        float _3728 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3730 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3732 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3720;
        out.m_103.y = _3722;
        out.m_103.z = _3724;
        out.m_105.x = _3728;
        out.m_105.y = _3730;
        out.m_105.z = _3732;
    }
    out.m_107.x = _3584;
    out.m_107.y = _3586;
    out.m_107.z = _3588;
    if (_3568)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3734 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3734;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3432 = false;
    bool _2467 = false;
    bool _374 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_50.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_53.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3791 = as_type<float>(_142);
        out.gl_Position.z = _3791;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_55.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_53.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3861 = as_type<float>(_180);
        out.gl_Position.z = _3861;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = in.m_63.x;
    float _204 = in.m_63.y;
    float _206 = in.m_63.z;
    float _208 = _184 * _192;
    float _210 = _184 * _198;
    float _212 = fma(_182, _190, _208);
    float _214 = _184 * _204;
    float _216 = fma(_182, _196, _210);
    float _218 = fma(_182, _202, _214);
    float _220 = fma(_186, _194, _212);
    float _222 = fma(_186, _200, _216);
    float _224 = fma(_186, _206, _218);
    bool _226 = !_188;
    float _228 = _220;
    float _246;
    if (!_226)
    {
        float _230 = in.m_65.x;
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _230 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_126);
        float _252 = 1.0 / _250;
        float _254 = _160 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _256 + _258;
    bool _262 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _264 = isnan(_256);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    bool _278 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _280 = isnan(_256);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -_272;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    float _298 = 1.0 / _276;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = _288 * _292;
    float _304 = -_288;
    float _306 = _304 + 1.0;
    float _308 = _260 * _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = fma(_296, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = _314 * _302;
    float _324 = fma(_318, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = _320 * _302;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _330 = _324 * _302;
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _334 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].x, _328);
    float _336 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _338 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].y, _336);
    float _340 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[144].z, _332);
    bool _342 = !_300;
    int _344 = as_type<int>(_308);
    float _368;
    float _370;
    float _372;
    if (!_342)
    {
        float _346 = in.m_65.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = float(_126);
        float _352 = 1.0 / _350;
        float _354 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = _160 * _352;
        float _358 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _360 = _358 * _348;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = _350;
        _372 = _356;
        _374 = true;
    }
    else
    {
        float _376 = float(_126);
        float _378 = 1.0 / _376;
        float _380 = _160 * _378;
        _368 = _380;
        _370 = _376;
        _372 = _380;
    }
    _374 = false;
    float _382 = _368;
    float _384 = _370;
    float _386 = _372;
    float _388 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _390 = int(_388);
    float _392 = in.m_67.y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _396 = _382 + _394;
    float _398 = in.m_65.w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _402 = _400 != 0;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _406 = int(_404);
    float _408 = in.m_65.y;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _416 = _414 != 0;
    float _418 = in.m_67.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _422 = _420 != 0;
    float _424 = float(_390);
    float _426 = in.m_65.x;
    float _428 = 1.0 / _384;
    float _430 = in.m_65.z;
    bool _432 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _434 = isnan(_382);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = float(uint(_406));
    float _446 = in.m_69.y;
    int _448 = ~_406;
    int _450 = _448 + 1;
    float _452 = 1.0 / _424;
    float _454 = float(_406);
    float _456 = in.m_71.y;
    bool _458 = _398 > 0.5;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _464 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _466 = isnan(_386);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = in.m_71.x;
    bool _478 = _408 > 0.5;
    float _480 = 1.0 / _444;
    bool _482 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _484 = isnan(_386);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = in.m_71.z;
    float _496 = 0.0;
    float _498 = _392;
    bool _500 = _458;
    bool _502 = _412;
    float _504 = _418;
    if (!_412)
    {
        _496 = _418;
    }
    float _506 = _496;
    float _508 = -_474;
    float _510 = _508 + 1.0;
    float _512 = in.m_63.w;
    bool _514 = !_422;
    float _516 = _514 ? _408 : _426;
    float _518 = _452 * _160;
    int _520 = ~_406;
    int _522 = _520 + 1;
    float _524 = 1.0 / _462;
    float _526 = in.m_61.w;
    int _528 = as_type<int>(_480) + (-2);
    float _530 = trunc(_518);
    int _532 = int(_530);
    out.m_73.y = _456;
    out.m_73.x = _476;
    out.m_73.z = _494;
    float _534 = float(uint(_532));
    float _536 = float(_532);
    float _538 = as_type<float>(_528) * _534;
    bool _540 = _536 >= _454;
    bool _542 = isnan(_536);
    bool _544 = _540 || _542;
    bool _546 = isnan(_454);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = trunc(_538);
    float _554 = precise::max(_552, 0.0);
    uint _557 = uint(_554);
    float _559 = trunc(_550);
    int _561 = int(_559);
    int _563 = _522 * int(_557);
    int _565 = _563 + _532;
    float _567 = float(uint(_565));
    float _569 = -_392;
    float _571 = _569 + 1.0;
    int _573 = ~_561;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    float _579 = as_type<float>(_528) * _567;
    int _581 = _458 ? as_type<int>(_571) : as_type<int>(_392);
    float _583 = _416 ? as_type<float>(_581) : _392;
    float _585 = trunc(_579);
    float _587 = precise::max(_585, 0.0);
    uint _589 = uint(_587);
    int _591 = as_type<int>(_571);
    float _593 = _506;
    if (_402)
    {
        float _595 = _478 ? _571 : _392;
        _498 = _595;
    }
    float _597 = _498;
    if (_412)
    {
        float _599 = -_418;
        float _601 = _599 + 1.0;
        _591 = as_type<int>(_601);
    }
    int _603 = _591;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _607 = _605 != 0;
    bool _609 = !_422;
    float _611 = _609 ? 1.2345600128173828125 : 1.0;
    if (_412)
    {
        bool _613 = _426 > 0.5;
        _500 = _613;
    }
    bool _615 = _500;
    float _617 = _516 * _611;
    if (_412)
    {
        float _619 = _615 ? as_type<float>(_603) : _418;
        _593 = _619;
    }
    float _621 = _593;
    float _623 = in.m_75.x;
    float _625 = in.m_75.y;
    float _627 = in.m_75.z;
    float _629 = floor(_617);
    int _631 = int(_557) + int(_589);
    if (_607)
    {
        float _633 = -_418;
        float _635 = _633 + 1.0;
        _344 = as_type<int>(_635);
    }
    int _637 = _344;
    float _639 = in.m_50.x;
    float _641 = in.m_50.y;
    float _643 = in.m_50.z;
    if (_607)
    {
        bool _645 = _430 > 0.5;
        _502 = _645;
    }
    bool _647 = _502;
    int _649 = _450 * _631;
    int _651 = _649 + _532;
    if (_607)
    {
        float _653 = _647 ? as_type<float>(_637) : _418;
        _504 = _653;
    }
    float _655 = _504;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _671 = _669 != 0;
    bool _673 = !_663;
    int _675 = _673 ? 0 : 1;
    float _677 = -_629;
    float _679 = _617 + _677;
    bool _681 = uint(_651) >= uint(_406);
    bool _683 = !_659;
    int _685 = _683 ? 0 : 1;
    float _687 = _679 * _454;
    bool _689 = !_681;
    int _691 = _689 ? 0 : (-1);
    float _693 = _334 * _623;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _705 = _703 != 0;
    float _707 = _454 * _160;
    int _709 = ~_631;
    int _711 = _709 + _691;
    int _713 = _711 + 1;
    float _715 = trunc(_687);
    int _717 = int(_715);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _721 = _719 != 0;
    float _723 = _198 * _641;
    float _725 = _204 * _641;
    float _727 = _641 + _446;
    bool _729 = !_721;
    int _731 = _729 ? 0 : 1;
    int _733 = _406 * _713;
    int _735 = _733 + _532;
    bool _737 = _406 == 0;
    float _739 = _707 * _428;
    int _741 = abs(_731);
    float _743 = _408 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _745 = !_737;
    int _747 = _745 ? _735 : (-1);
    float _749 = fma(_202, _639, _725);
    int _751 = _406 + (-1);
    float _753 = trunc(_739);
    int _755 = int(_753);
    bool _757 = !_667;
    int _759 = _757 ? 0 : 1;
    int _761 = _747 * _577;
    int _763 = abs(_685);
    int _765 = _717 * _741;
    int _767 = _765 + _532;
    int _769 = abs(_759);
    int _771 = _561 * _751;
    int _773 = _771 + _761;
    int _775 = abs(_675);
    float _777 = fma(_196, _639, _723);
    bool _779 = !_671;
    int _781 = _779 ? 0 : 1;
    float _783 = fma(_206, _643, _749);
    int _785 = _773 * _775;
    int _787 = abs(_781);
    float _789 = fma(_200, _643, _777);
    int _791 = _755 * _763;
    int _793 = _791 + _785;
    float _795 = in.m_71.w;
    int _797 = _767 * _769;
    int _799 = _797 + _793;
    int _801 = _717 * _787;
    int _803 = _801 + _799;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _815 = float(uint(_803));
    float _817 = fma(_743, -2.0, _809);
    float _819 = 1.0 / _807;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _823 = as_type<float>(_528) * _815;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _827 = ~_406;
    int _829 = _827 + 1;
    float _831 = trunc(_823);
    float _833 = precise::max(_831, 0.0);
    uint _835 = uint(_833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = 1.0 / _813;
    float _847 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _861 = _829 * int(_835);
    int _863 = _861 + _803;
    float _865 = 1.0 / _841;
    out.m_77.x = _847;
    out.m_77.y = _849;
    out.m_77.z = _851;
    out.m_77.w = _843;
    float _867 = _855 * _819;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _877 = float(uint(_863));
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _883 = 1.0 / _859;
    float _885 = _875 * _845;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_73.w = _795;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _895 = 1.0 / _871;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _899;
    float _903 = as_type<float>(_528) * _877;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _913 = 1.0 / _881;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _919 = _907 * _524;
    float _921 = _426 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _923 = fma(_867, _396, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _927 = _386 + _925;
    float _929 = trunc(_903);
    float _931 = precise::max(_929, 0.0);
    uint _933 = uint(_931);
    float _935 = -_897;
    float _937 = fma(_921, 2.0, _935);
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _941 = _939 != 0;
    bool _943 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _945 = isnan(_386);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    bool _955 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _957 = isnan(_382);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _963 = _959 || _961;
    float _965 = float(_963);
    float _967 = 1.0 / _889;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _971 = _969 != 0;
    float _973 = -_965;
    float _975 = _973 + 1.0;
    float _977 = _749;
    if (!_941)
    {
        _977 = _408;
    }
    float _979 = _977;
    float _981 = 1.0 / _893;
    int _983 = int(_835) + int(_933);
    float _985 = _426 + _408;
    float _987 = 0.0;
    float _989 = _979;
    if (!_941)
    {
        _987 = _430;
    }
    float _991 = _987;
    float _993 = _991;
    if (_941)
    {
        _989 = _426;
    }
    float _995 = _989;
    float _997 = _985 + (-1.0);
    if (_941)
    {
        _993 = _408;
    }
    float _999 = _993;
    float _1001 = _911 * _967;
    float _1003 = _901 * _865;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1005;
    float _1009 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1011 = _408 + _430;
    float _1013 = fma(_1001, _927, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1015 = _1007 * _883;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1029 = _917 * _895;
    float _1031 = 1.0 / _1019;
    float _1033 = _1027 * _913;
    float _1035 = _426 * 2.0;
    int _1037 = ~_406;
    int _1039 = _1037 + 1;
    float _1041 = _1023 * _981;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1045 = _382 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1049 = _386 + _1047;
    bool _1051 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1053 = isnan(_386);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = floor(_1035);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1065;
    float _1069 = _430 * 2.0;
    int _1071 = _1039 * _983;
    int _1073 = _1071 + _803;
    float _1075 = fma(_1003, _1045, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1077 = fma(_1041, _1049, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1081 = _386 + _1079;
    bool _1083 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1085 = isnan(_386);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = floor(_1069);
    bool _1097 = uint(_1073) >= uint(_406);
    float _1099 = _1011 + (-1.0);
    float _1101 = _1067 * _1031;
    bool _1103 = !_1097;
    int _1105 = _1103 ? 0 : (-1);
    float _1107 = fma(_1015, _1081, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1109 = -_1093;
    float _1111 = _1109 + 1.0;
    bool _1113 = _1063 >= 0.0;
    bool _1115 = isnan(_1063);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.0);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1127 = _382 + _1125;
    float _1129 = _1011;
    if (!_941)
    {
        _1129 = _430;
    }
    float _1131 = _1129;
    float _1133 = _1061 * _510;
    int _1135 = _1121 ? 0 : 1;
    float _1137 = fma(_885, _1127, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1141 = _386 + _1139;
    bool _1143 = _1095 >= 0.0;
    bool _1145 = isnan(_1095);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1155 = _386 + _1153;
    float _1157 = _1131;
    if (_941)
    {
        _1157 = _408;
    }
    float _1159 = _1157;
    float _1161 = fma(_1029, _1141, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1163 = _1151 ? 0 : 1;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1167 = _386 + _1165;
    bool _1169 = _1095 > 0.0;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1173 = _386 + _1171;
    float _1175 = fma(_919, _1155, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1177 = fma(_1101, _1167, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1179 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1181 = isnan(_382);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1187 = _1183 || _1185;
    float _1189 = float(_1187);
    float _1191 = fma(_1033, _1173, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1193 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1195 = isnan(_382);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _953 * _1111;
    bool _1207 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1209 = isnan(_386);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -_953;
    float _1221 = _1219 + 1.0;
    bool _1223 = _1063 > 0.0;
    float _1225 = -_1189;
    float _1227 = _1225 + 1.0;
    bool _1229 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1231 = isnan(_386);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = _1217 * _1221;
    float _1243 = -_1217;
    float _1245 = _1243 + 1.0;
    bool _1247 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1249 = isnan(_386);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = _1203 * _975;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1263 = _1239 * _1245;
    float _1265 = -_1239;
    float _1267 = _1265 + 1.0;
    float _1269 = -_1257;
    float _1271 = _1269 + 1.0;
    float _1273 = _1175 * _1133;
    float _1275 = _1257 * _1267;
    float _1277 = _965 * _1227;
    float _1279 = _492 * _1271;
    float _1281 = -_492;
    float _1283 = _1281 + 1.0;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1287 = -_1203;
    float _1289 = _1287 + 1.0;
    float _1291 = _789 + _526;
    float _1293 = _474 * _1283;
    float _1295 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1285);
    float _1297 = _783 + _512;
    float _1299 = _442 * _1289;
    float _1301 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1303 = -_442;
    float _1305 = _1303 + 1.0;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1309 = _923 * _1299;
    float _1311 = fma(_1301, _597, -0.5);
    float _1313 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1307);
    float _1315 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1309);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1319 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1313);
    float _1321 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _817);
    float _1323 = fma(_1137, _1259, _1315);
    float _1325 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1317);
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1329 = -_1321;
    float _1331 = fma(_1319, _1311, _1329);
    int _1333 = ~_983;
    int _1335 = _1333 + _1105;
    int _1337 = _1335 + 1;
    float _1339 = -_1061;
    float _1341 = _1339 + 1.0;
    int _1343 = ~_1135;
    int _1345 = _1343 + 1;
    int _1347 = _1345 + 1;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1351 = _1347;
    float _1353 = _1297;
    if (!_1223)
    {
        int _1355 = ~_1135;
        int _1357 = _1355 + 1;
        _1351 = _1357;
    }
    int _1359 = _1351;
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1273);
    int _1363 = _406 * _1337;
    int _1365 = _1363 + _803;
    float _1367 = float(uint(_767));
    float _1369 = _995 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1371 = fma(_1013, _1293, _1361);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1375 = !_737;
    int _1377 = _1375 ? _1365 : (-1);
    float _1379 = as_type<float>(_528) * _1367;
    float _1381 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1383 = -_1327;
    float _1385 = fma(_1369, 2.0, _1383);
    int _1387 = _1377 >> 31;
    float _1389 = fma(_1381, -2.0, _1373);
    float _1391 = trunc(_1379);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    int _1397 = _1387 & 3;
    float _1399 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1401 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1389);
    int _1403 = _1377 + _1397;
    float _1405 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1295);
    float _1407 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1409 = _1403 >> 2;
    float _1411 = fma(_1399, _621, -0.5);
    int _1413 = ~_1163;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    float _1419 = -_1401;
    float _1421 = fma(_1405, _1407, _1419);
    int _1423 = ~_406;
    int _1425 = _1423 + 1;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1429 = _1417;
    if (!_1169)
    {
        int _1431 = ~_1163;
        int _1433 = _1431 + 1;
        _1429 = _1433;
    }
    int _1435 = _1429;
    float _1437 = fma(_1075, _1277, _1323);
    int _1439 = _1377 & 3;
    bool _1441 = _1439 != 0;
    int _1443 = _1425 * int(_1395);
    int _1445 = _1443 + _767;
    int _1447 = _1409 << 4;
    int _1449 = _1447 + 512;
    float _1451 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    int _1453 = _1377 & 3;
    bool _1455 = _1453 != 0;
    float _1457 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1437);
    int _1459 = _1441 ? 0 : 1;
    uint _1461 = uint(int(uint(_1449) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[int(_1471)][_1473];
    bool _1477 = uint(_1453) > 1u;
    float _1479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1481 = log2(_1479);
    float _1483 = float(uint(_1445));
    float _1485 = fma(_1107, _1279, _1371);
    float _1487 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1451);
    float _1489 = -_160;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _937);
    int _1493 = ~_1459;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    int _1499 = _1449 + 8;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    float _1517 = as_type<float>(_528) * _1483;
    bool _1519 = !_697;
    int _1521 = _1519 ? 0 : 1;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1525 = _727 + _1523;
    float _1527 = -_160;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1385);
    float _1531 = float(_1435);
    float _1533 = fma(_1487, _1411, _1491);
    int _1535 = _1497;
    if (!_1477)
    {
        int _1537 = ~_1459;
        int _1539 = _1537 + 1;
        _1535 = _1539;
    }
    int _1541 = _1535;
    float _1543 = trunc(_1517);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    bool _1549 = uint(_1453) >= 2u;
    float _1551 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1325);
    int _1553 = abs(_1521);
    float _1555 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    int _1557 = _1549 ? 0 : 1;
    float _1559 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1561 = _1453 != 3;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = _1291 + _1563;
    float _1567 = float(_1553);
    float _1569 = fma(_1551, _1555, _1529);
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1573 = _1297 + _1571;
    float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1559);
    int _1577 = ~_406;
    int _1579 = _1577 + 1;
    float _1581 = _1567 * _1531;
    int _1583 = ~_1557;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    float _1589 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1575);
    int _1591 = int(_1395) + int(_1547);
    float _1593 = fma(_1161, _1275, _1485);
    int _1595 = _1587;
    if (_1561)
    {
        int _1597 = ~_1557;
        int _1599 = _1597 + 1;
        _1595 = _1599;
    }
    int _1601 = _1595;
    int _1603 = abs(_1541);
    float _1605 = fma(_1077, _1263, _1593);
    bool _1607 = !_1455;
    int _1609 = _1607 ? 0 : 1;
    float _1611 = _1569 + 0.5;
    bool _1613 = _1453 != 3;
    int _1615 = _1579 * _1591;
    int _1617 = _1615 + _767;
    bool _1619 = _1589 >= 0.0;
    float _1621 = fma(_1191, _1241, _1605);
    int _1623 = abs(_1609);
    float _1625 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1627 = !_1613;
    int _1629 = _1627 ? 0 : (-1);
    float _1631 = fma(_1177, _1205, _1621);
    bool _1633 = uint(_1617) >= uint(_406);
    float _1635 = _408 * 2.0;
    int _1637 = ~_1603;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    int _1643 = abs(_1601);
    int _1645 = _1641 * as_type<int>(_1475);
    int _1647 = abs(_1629);
    if (_1619)
    {
        out.m_53.x = 0.0;
    }
    int _1649 = ~_1623;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    bool _1655 = !_971;
    int _1657 = _1655 ? 0 : 1;
    int _1659 = _1653 * as_type<int>(_1467);
    int _1661 = _1659 + _1645;
    int _1663 = ~_1643;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    int _1669 = abs(_1657);
    int _1671 = _1667 * as_type<int>(_1507);
    int _1673 = _1671 + _1661;
    bool _1675 = !_1633;
    int _1677 = _1675 ? 0 : (-1);
    int _1679 = ~_1647;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = _1331 + 0.5;
    int _1687 = ~_1591;
    int _1689 = _1687 + _1677;
    int _1691 = _1689 + 1;
    int _1693 = _1683 * as_type<int>(_1515);
    int _1695 = _1693 + _1673;
    int _1697 = ~_1669;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    float _1703 = _1533 + 0.5;
    int _1705 = _406 * _1691;
    int _1707 = _1705 + _767;
    float _1709 = _1421 + 0.5;
    int _1711 = _1695 * _1701;
    float _1713 = _1525 * _1525;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    out.m_79.x = _1703;
    out.m_79.y = _1685;
    out.m_79.z = _1611;
    out.m_79.w = _1709;
    float _1717 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1719 = !_737;
    int _1721 = _1719 ? _1707 : (-1);
    bool _1723 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1725 = isnan(0.0);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1731 = _1727 || _1729;
    int _1733 = _1721 * _1669;
    int _1735 = _1733 + _1711;
    bool _1737 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1739 = isnan(1.0);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1745 = _1741 || _1743;
    float _1747 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1749 = fma(_1565, _1565, _1713);
    float _1751 = _1713;
    int _1753 = as_type<int>(_1749);
    if (_1619)
    {
        _1751 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1755 = _1751;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1761 = fma(_1573, _1573, _1749);
    float _1763 = _1481 * _160;
    if (_1619)
    {
        float _1765 = _1755 * 5.0;
        _1753 = as_type<int>(_1765);
    }
    int _1767 = _1753;
    float _1769 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1631);
    float _1771 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1773 = in.m_81.x;
    float _1775 = in.m_81.y;
    float _1777 = in.m_81.z;
    float _1779 = rsqrt(_1761);
    float _1781 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1783 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1785 = float(_1735);
    if (_1619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6287 = as_type<float>(_1767);
        out.gl_Position.z = _6287;
    }
    out.m_83.x = _1747;
    out.m_83.y = _1771;
    out.m_83.z = _1781;
    out.m_83.w = _1783;
    float _1787 = exp2(_1763);
    out.m_85.x = _1769;
    float _1789 = _1717 * _1779;
    out.m_87.y = _1785;
    bool _1791 = !_705;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1565 * _1789;
    float _1797 = floor(_1635);
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1801 = 1.0 + _1799;
    bool _1803 = !_701;
    int _1805 = _1803 ? 0 : 1;
    float _1807 = _1525 * _1789;
    if (_1619)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1809 = -_1807;
    float _1811 = _727 + _1809;
    float _1813 = _1573 * _1789;
    float _1815 = -_1795;
    float _1817 = _1291 + _1815;
    float _1819 = 1.0 / _1801;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = _1811 + _1821;
    float _1825 = -_1813;
    float _1827 = _1297 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1831 = _1817 + _1829;
    int _1833 = abs(_1805);
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1839 = _1827 + _1837;
    float _1841 = -_1787;
    float _1843 = _1841 + 1.0;
    bool _1845 = _1797 > 0.0;
    float _1847 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1835);
    float _1849 = float(_1833);
    float _1851 = _408 + (-0.5);
    float _1853 = float(_1359);
    float _1855 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    float _1857 = _1581 * (-2.0);
    float _1859 = _1731 ? _1843 : 0.0;
    float _1861 = _1849 * _1853;
    float _1863 = _426 + (-0.5);
    float _1865 = fma(_1857, _1773, _1773);
    bool _1867 = _1797 >= 0.0;
    bool _1869 = isnan(_1797);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.0);
    bool _1875 = _1871 || _1873;
    float _1877 = _1861 * (-2.0);
    bool _1879 = _1855 >= 0.0;
    float _1881 = _1877;
    if (_1745)
    {
        float _1883 = _1859 * _1819;
        _162 = _1883;
    }
    float _1885 = _162;
    float _1887 = fma(_1009, _1857, _1009);
    float _1889 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1865);
    float _1891 = fma(_1877, _1775, _1775);
    float _1893 = fma(_1123, _1877, _1123);
    float _1895 = fma(_1887, _1885, _1889);
    float _1897 = fma(_1851, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1891);
    int _1899 = _1875 ? 0 : 1;
    float _1901 = _426 + _430;
    float _1903 = _1895 * 0.15915493667125701904296875;
    float _1905 = fma(_1893, _1885, _1897);
    if (_1879)
    {
        _1881 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1907 = _1881;
    int _1909 = as_type<int>(_1907);
    if (_1879)
    {
        out.m_53.x = 0.0;
    }
    float _1911 = _1903 * 6.283185482025146484375;
    float _1913 = sin(_1911);
    int _1915 = ~_1899;
    int _1917 = _1915 + 1;
    int _1919 = _1917 + 1;
    int _1921 = _1919;
    if (_1879)
    {
        float _1923 = _1907 * 5.0;
        _1909 = as_type<int>(_1923);
    }
    int _1925 = _1909;
    if (!_1845)
    {
        int _1927 = ~_1899;
        int _1929 = _1927 + 1;
        _1921 = _1929;
    }
    int _1931 = _1921;
    int _1933 = abs(_1793);
    float _1935 = _1903 * 6.283185482025146484375;
    float _1937 = cos(_1935);
    if (_1879)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6527 = as_type<float>(_1925);
        out.gl_Position.z = _6527;
    }
    if (_1879)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1939 = -_727;
    float _1941 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1943 = _1905 * 0.15915493667125701904296875;
    float _1945 = -_1291;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = float(_1931);
    float _1951 = _1941 * _1941;
    float _1953 = -_1297;
    float _1955 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1957 = float(_1933);
    float _1959 = _1901 + (-1.0);
    float _1961 = fma(_1947, _1947, _1951);
    float _1963 = -_1807;
    float _1965 = _1525 + _1963;
    float _1967 = -_1795;
    float _1969 = _1565 + _1967;
    float _1971 = _1957 * _1949;
    float _1973 = fma(_1955, _1955, _1961);
    float _1975 = fma(_1959, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1977 = _1965 * _1965;
    float _1979 = _1971 * (-2.0);
    float _1981 = _430 + (-0.5);
    float _1983 = -_1813;
    float _1985 = _1573 + _1983;
    float _1987 = rsqrt(_1973);
    float _1989 = fma(_1975, _1979, _1975);
    float _1991 = fma(_1979, _1777, _1777);
    float _1993 = fma(_1969, _1969, _1977);
    float _1995 = _340 * _627;
    float _1997 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1991);
    float _1999 = fma(_1985, _1985, _1993);
    float _2001 = _338 * _625;
    float _2003 = _1943 * 6.283185482025146484375;
    float _2005 = sin(_2003);
    float _2007 = fma(_1989, _1885, _1997);
    float _2009 = _2007 * 0.15915493667125701904296875;
    float _2011 = _1947 * _1987;
    float _2013 = _1955 * _1987;
    float _2015 = _1943 * 6.283185482025146484375;
    float _2017 = cos(_2015);
    float _2019 = in.m_89.x;
    float _2021 = in.m_89.y;
    float _2023 = in.m_89.z;
    float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2027 = _2011 * _2025;
    float _2029 = _1941 * _1987;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2033 = _2013 * _2031;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2037 = -_2027;
    float _2039 = fma(_2013, _2035, _2037);
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2043 = _2029 * _2041;
    float _2045 = _2009 * 6.283185482025146484375;
    float _2047 = sin(_2045);
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2051 = -_2033;
    float _2053 = fma(_2029, _2049, _2051);
    float _2055 = _2039 * _2039;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2059 = -_2043;
    float _2061 = fma(_2011, _2057, _2059);
    float _2063 = _1913 * _2005;
    float _2065 = fma(_2053, _2053, _2055);
    float _2067 = sqrt(_1999);
    float _2069 = _1937 * _2017;
    float _2071 = fma(_2061, _2061, _2065);
    float _2073 = _1913 * _2017;
    float _2075 = _2009 * 6.283185482025146484375;
    float _2077 = cos(_2075);
    float _2079 = fma(_2047, _2069, _2063);
    float _2081 = fma(_2047, _2063, _2069);
    float _2083 = _2001 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2085 = _2021 != 0.0;
    bool _2087 = isnan(_2021);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.0);
    bool _2093 = _2089 || _2091;
    float _2095 = rsqrt(_2071);
    float _2097 = _1779 * _2067;
    float _2099 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2101 = _1937 * _2005;
    bool _2103 = _2019 == 0.0;
    bool _2105 = !_2093;
    bool _2107 = _2103 && _2105;
    float _2109 = _2097 * _2083;
    float _2111 = _2097 * _2099;
    float _2113 = _1937 * _2077;
    float _2115 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2021);
    float _2117 = _2017 * _2077;
    float _2119 = _1913 * _2077;
    float _2121 = _2005 * _2077;
    float _2123 = _2115 * _2109;
    float _2125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2023);
    float _2127 = _1625 * _2097;
    float _2129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2019);
    float _2131 = -_2101;
    float _2133 = fma(_2047, _2073, _2131);
    float _2135 = -_2073;
    float _2137 = fma(_2047, _2101, _2135);
    float _2139 = _2125 * _2111;
    float _2141 = _2129 * _2127;
    float _2143 = _2113 * _2123;
    float _2145 = _2053 * _2095;
    float _2147 = _2039 * _2095;
    float _2149 = _2061 * _2095;
    float _2151 = fma(_2079, _2141, _2143);
    float _2153 = -_2123;
    float _2155 = _2047 * _2153;
    float _2157 = _2013 * _2147;
    float _2159 = _2029 * _2145;
    float _2161 = _2119 * _2123;
    float _2163 = fma(_2117, _2141, _2155);
    float _2165 = fma(_2137, _2139, _2151);
    float _2167 = -_2157;
    float _2169 = fma(_2029, _2149, _2167);
    float _2171 = -_2159;
    float _2173 = fma(_2011, _2147, _2171);
    float _2175 = fma(_2133, _2141, _2161);
    float _2177 = fma(_2121, _2139, _2163);
    float _2179 = _2169 * _2165;
    float _2181 = _2173 * _2165;
    float _2183 = fma(_2081, _2139, _2175);
    bool _2185 = _2023 == 0.0;
    bool _2187 = _2185 && _2107;
    float _2189 = in.m_91.x;
    float _2191 = in.m_91.y;
    float _2193 = in.m_91.z;
    float _2195 = fma(_2145, _2177, _2179);
    float _2197 = fma(_2149, _2177, _2181);
    float _2199 = _2011 * _2149;
    float _2201 = _2113 * _2169;
    float _2203 = fma(_2011, _2183, _2195);
    float _2205 = fma(_2013, _2183, _2197);
    float _2207 = -_2199;
    float _2209 = fma(_2013, _2145, _2207);
    float _2211 = _2137 * _2169;
    float _2213 = _1291 + _2203;
    float _2215 = _1297 + _2205;
    float _2217 = _2209 * _2165;
    float _2219 = _2137 * _2173;
    float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2223 = _2213 + _2221;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2227 = _2215 + _2225;
    float _2229 = _2137 * _2209;
    float _2231 = -_2047;
    float _2233 = fma(_2231, _2145, _2201);
    float _2235 = _2223 * _2223;
    float _2237 = _2227 * _2227;
    float _2239 = fma(_2147, _2177, _2217);
    float _2241 = _2113 * _2173;
    float _2243 = _2235 + _2237;
    float _2245 = fma(_2029, _2183, _2239);
    float _2247 = _2189;
    float _2249 = _2191;
    float _2251 = _2193;
    float _2253 = _2047;
    float _2255 = _2235;
    float _2257 = _2237;
    float _2259 = _2213;
    float _2261 = _2215;
    if (!_2187)
    {
        float _2263 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2189);
        _2247 = _2263;
    }
    float _2265 = _2247;
    float _2267 = _2265;
    if (!_2187)
    {
        float _2269 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2191);
        _2249 = _2269;
    }
    float _2271 = _2249;
    float _2273 = sqrt(_2243);
    if (!_2187)
    {
        float _2275 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2193);
        _2251 = _2275;
    }
    float _2277 = _2251;
    float _2279 = _2113 * _2209;
    float _2281 = _2079 * _2169;
    float _2283 = _2079 * _2209;
    float _2285 = _2079 * _2173;
    float _2287 = _727 + _2245;
    float _2289 = -_2047;
    float _2291 = fma(_2289, _2147, _2279);
    float _2293 = -_2047;
    float _2295 = fma(_2293, _2149, _2241);
    float _2297 = fma(_2117, _2145, _2281);
    float _2299 = fma(_2117, _2147, _2283);
    float _2301 = fma(_2117, _2149, _2285);
    float _2303 = fma(_2121, _2145, _2211);
    float _2305 = fma(_2121, _2147, _2229);
    float _2307 = fma(_2119, _2011, _2233);
    float _2309 = fma(_2121, _2149, _2219);
    bool _2311 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2313 = fma(_2119, _2029, _2291);
    float _2315 = fma(_2119, _2013, _2295);
    float _2317 = _2303;
    if (!_2311)
    {
        _2253 = _2287;
    }
    float _2319 = _2253;
    bool _2321 = !_2311;
    float _2323 = _2319;
    if (!_2321)
    {
        float _2325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2329 = _2273 + _2327;
        float _2331 = rsqrt(_2243);
        float _2333 = _2329 * _2325;
        float _2335 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2337 = _2333 * 0.15915493667125701904296875;
        float _2339 = _2337 * 6.283185482025146484375;
        float _2341 = sin(_2339);
        float _2343 = _2337 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = fma(_2341, _2335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2349 = _2331 * _2347;
        float _2351 = fma(_2223, _2349, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2353 = _2345 + (-1.0);
        float _2355 = fma(_2227, _2349, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2359 = _2351 + _2357;
        float _2361 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2365 = _2355 + _2363;
        float _2367 = _2359 * _2359;
        float _2369 = fma(_2287, _2345, _2361);
        float _2371 = _2365 * _2365;
        _2323 = _2369;
        _2255 = _2367;
        _2257 = _2371;
        _2259 = _2351;
        _2261 = _2355;
    }
    float _2373 = _2323;
    float _2375 = _2255;
    float _2377 = _2257;
    float _2379 = _2259;
    float _2381 = _2261;
    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2385 = _2373 + _2383;
    float _2387 = fma(_2133, _2011, _2297);
    float _2389 = fma(_2133, _2029, _2299);
    float _2391 = fma(_2133, _2013, _2301);
    float _2393 = fma(_2385, _2385, _2375);
    float _2395 = _2307 * _2271;
    float _2397 = _2313 * _2271;
    float _2399 = _2315 * _2271;
    float _2401 = _2393 + _2377;
    float _2403 = fma(_2081, _2011, _2303);
    float _2405 = fma(_2081, _2029, _2305);
    float _2407 = fma(_2081, _2013, _2309);
    float _2409 = fma(_2387, _2265, _2395);
    float _2411 = fma(_2389, _2265, _2397);
    float _2413 = sqrt(_2401);
    float _2415 = fma(_2391, _2265, _2399);
    float _2417 = fma(_2403, _2277, _2409);
    float _2419 = fma(_2405, _2277, _2411);
    float _2421 = fma(_2407, _2277, _2415);
    out.m_93.x = _2417;
    out.m_93.y = _2419;
    out.m_93.z = _2421;
    bool _2423 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2425 = isnan(_2413);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2431 = _2427 || _2429;
    if (!_2431)
    {
        _2267 = 1.0;
    }
    float _2433 = _2267;
    bool _2435 = !_2431;
    float _2437 = _2433;
    if (!_2435)
    {
        bool _2439 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2441 = isnan(_2413);
        bool _2443 = _2439 || _2441;
        bool _2445 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2447 = _2443 || _2445;
        if (!_2447)
        {
            float _2449 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2451 = _2413 + _2449;
            float _2453 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2455 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2453;
            float _2457 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2461 = 1.0 / _2455;
            float _2463 = _2451 * _2461;
            float _2465 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2437 = _2465;
            _2467 = true;
        }
        else
        {
            bool _2469 = _2413 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2471 = isnan(_2413);
            bool _2473 = _2469 || _2471;
            bool _2475 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2477 = _2473 || _2475;
            if (!_2477)
            {
                float _2479 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2481 = _2413 + _2479;
                float _2483 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2485 = _2483 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2487 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2489 = _2487 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2491 = 1.0 / _2485;
                float _2493 = _2481 * _2491;
                float _2495 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2437 = _2495;
                _2467 = true;
            }
            else
            {
                _2437 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2467 = false;
    float _2497 = _2437;
    float _2499 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2501 = _2379 + _2499;
    float _2503 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2505 = _2381 + _2503;
    float _2507 = fma(_2501, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2509 = fma(_2505, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2513 = _2507 + _2511;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2517 = _2509 + _2515;
    float _2519 = fma(_2513, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2521 = fma(_2517, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7459 = float2(_2519, _2521);
    float _2523 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7459, float2(0.0), isnan(_7459)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7459, float2(0.0), isnan(_7459)), level(0.0)).x;
    float _2525 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2527 = _2373 + _2525;
    float _2529 = -_1291;
    float _2531 = _2529 + _2507;
    float _2533 = -_1297;
    float _2535 = _2533 + _2509;
    float _2537 = fma(_2527, _2497, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2539 = -_727;
    float _2541 = _2539 + _2537;
    float _2543 = fma(_2523, 100.0, _727);
    float _2545 = _2541 * _2541;
    float _2547 = fma(_2523, 100.0, _2537);
    float _2549 = -_1807;
    float _2551 = _2549 + _2543;
    float _2553 = fma(_2531, _2531, _2545);
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2557 = fma(_2535, _2535, _2553);
    float _2559 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2555);
    float _2561 = sqrt(_2557);
    float _2563 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2559);
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2567 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2569 = 1.0 / _2565;
    float _2571 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2567);
    float _2573 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2571);
    bool _2575 = _2561 > 0.0;
    float _2577 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2579 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2581 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan(0.5);
    bool _2587 = _2583 || _2585;
    float _2589 = _2577 + _2565;
    float _2591 = _2589 * _2569;
    float _2593 = _2591 * 0.5;
    float _2595 = _2537;
    float _2597 = _2523;
    float _2599 = _2543;
    float _2601 = _2557;
    if (!_2575)
    {
        _2317 = _2507;
    }
    float _2603 = _2317;
    float _2605 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2607 = fma(_2593, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2605);
    float _2609 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2611 = _2603;
    float _2613 = _2603;
    if (!_2575)
    {
        _2595 = _2509;
    }
    float _2615 = _2595;
    bool _2617 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(0.5);
    bool _2625 = _2621 || _2623;
    float _2627 = 1.0 / _2607;
    float _2629 = _2615;
    if (!_2575)
    {
        _2609 = _2547;
    }
    float _2631 = _2609;
    bool _2633 = !_2575;
    float _2635 = _2631;
    float _2637 = _2631;
    if (!_2633)
    {
        float _2639 = _220 * _220;
        float _2641 = fma(_222, _222, _2639);
        float _2643 = rsqrt(_2557);
        float _2645 = fma(_224, _224, _2641);
        float _2647 = sqrt(_2645);
        float _2649 = _2531 * _2643;
        float _2651 = _2541 * _2643;
        float _2653 = _2535 * _2643;
        bool _2655 = _2647 > 0.0;
        float _2657 = _2647;
        _2597 = _2645;
        if (!_2655)
        {
            _2611 = _2507;
        }
        float _2659 = _2611;
        _2613 = _2659;
        if (!_2655)
        {
            _2635 = _2547;
        }
        float _2661 = _2635;
        _2637 = _2661;
        if (!_2655)
        {
            _2657 = _2509;
        }
        float _2663 = _2657;
        bool _2665 = !_2655;
        _2629 = _2663;
        if (!_2665)
        {
            float _2667 = rsqrt(_2645);
            float _2669 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2671 = _220 * _2667;
            float _2673 = _222 * _2667;
            float _2675 = _2651 * _2671;
            float _2677 = _224 * _2667;
            float _2679 = fma(_2649, _2673, _2675);
            float _2681 = _2669 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2683 = fma(_2653, _2677, _2679);
            float _2685 = _2683 * _2681;
            float _2687 = fma(_222, _2685, _2507);
            float _2689 = fma(_220, _2685, _2547);
            float _2691 = fma(_224, _2685, _2509);
            _2613 = _2687;
            _2629 = _2691;
            _2637 = _2689;
            _2597 = _2667;
        }
    }
    float _2693 = _2613;
    float _2695 = _2629;
    float _2697 = _2637;
    float _2699 = _2597;
    float _2701 = -_1795;
    float _2703 = _2701 + _2693;
    float _2705 = -_1813;
    float _2707 = _2705 + _2695;
    float _2709 = -_1807;
    float _2711 = _2709 + _2697;
    float _2713 = _2699;
    float _2715 = _2711;
    float _2717 = _2703;
    float _2719 = _2707;
    if (_2625)
    {
        _2713 = 1.0;
    }
    float _2721 = _2713;
    float _2723 = _2721;
    if (!_2587)
    {
        float _2725 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2727 = _2551 + _2725;
        float _2729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2731 = -_1297;
        float _2733 = _2731 + _2695;
        float _2735 = _2727 * _2727;
        float _2737 = fma(_1831, _1831, _2735);
        float _2739 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2741 = fma(_1839, _1839, _2737);
        float _2743 = 1.0 / _2097;
        float _2745 = sqrt(_2741);
        float _2747 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2749 = precise::min(_2745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2751 = _2749 * _2729;
        float _2753 = -_2543;
        float _2755 = _2753 + _2697;
        float _2757 = _2751 * _2743;
        float _2759 = -_1291;
        float _2761 = _2759 + _2693;
        float _2763 = _2747 * _2757;
        float _2765 = _2733 * _2757;
        float _2767 = fma(_2755, _2763, _2551);
        float _2769 = fma(_2761, _2763, _1817);
        float _2771 = fma(_2747, _2765, _1827);
        _2599 = _2763;
        _2715 = _2767;
        _2717 = _2769;
        _2719 = _2771;
        _228 = _2757;
    }
    float _2773 = _2599;
    float _2775 = _2715;
    float _2777 = _2717;
    float _2779 = _2719;
    float _2781 = _228;
    float _2783 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2785 = _2627 * _2783;
    float _2787 = _2773;
    float _2789 = _2781;
    if (!_2625)
    {
        float _2791 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2793 = _2791 * 0.15915493667125701904296875;
        float _2795 = _2793 * 6.283185482025146484375;
        float _2797 = cos(_2795);
        float _2799 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2801 = _2799 * 0.15915493667125701904296875;
        float _2803 = _2793 * 6.283185482025146484375;
        float _2805 = sin(_2803);
        float _2807 = 1.0 / _2797;
        float _2809 = _2801 * 6.283185482025146484375;
        float _2811 = cos(_2809);
        float _2813 = _2805 * _2807;
        float _2815 = _2801 * 6.283185482025146484375;
        float _2817 = sin(_2815);
        float _2819 = _2811 * _2813;
        float _2821 = 1.0 / _2819;
        float _2823 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2825 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2823;
        float _2827 = 1.0 / _2825;
        float _2829 = _2817 * _2821;
        float _2831 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2833 = fma(_2785, _2829, _2831);
        float _2835 = _2833 * _2827;
        float _2837 = precise::clamp(_2835, 0.0, 1.0);
        _2787 = _2807;
        _2789 = _2801;
        _2723 = _2837;
    }
    float _2839 = _2787;
    float _2841 = _2789;
    float _2843 = _2723;
    float _2845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2847 = _2775 + _2845;
    float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2851 = _2777 + _2849;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2855 = _2779 + _2853;
    float _2857 = _2847 * _2847;
    float _2859 = fma(_2851, _2851, _2857);
    float _2861 = fma(_2855, _2855, _2859);
    float _2863 = rsqrt(_2861);
    float _2865 = _2851 * _2863;
    float _2867 = _2855 * _2863;
    float _2869 = _2847 * _2863;
    float _2871 = _2865 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2873 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2875 = _2871 * _2871;
    float _2877 = _2873 * _2873;
    float _2879 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2881 = sqrt(_2861);
    float _2883 = _2875 + _2877;
    float _2885 = sqrt(_2883);
    bool _2887 = _2885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2891 = _2885 + _2889;
    float _2893 = _2839;
    float _2895 = _2841;
    float _2897 = _2891;
    float _2899 = _2883;
    if (_2887)
    {
        float _2901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2893 = _2901;
    }
    float _2903 = _2893;
    if (_2887)
    {
        float _2905 = rsqrt(_2883);
        _2895 = _2905;
    }
    float _2907 = _2895;
    float _2909 = _2907;
    if (_2887)
    {
        float _2911 = _2891 * _2903;
        _2897 = _2911;
    }
    float _2913 = _2897;
    if (_2887)
    {
        float _2915 = _2913 * 0.15915493667125701904296875;
        _1353 = _2915;
    }
    float _2917 = _1353;
    float _2919 = _2903;
    float _2921 = _2917;
    if (_2887)
    {
        float _2923 = _2917 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        _2919 = _2925;
    }
    float _2927 = _2919;
    float _2929 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2931 = precise::max(0.0, _2929);
    float _2933 = _1291;
    float _2935 = _2931;
    if (_2887)
    {
        float _2937 = _2917 * 6.283185482025146484375;
        float _2939 = cos(_2937);
        _2933 = _2939;
    }
    float _2941 = _2933;
    float _2943 = -_2869;
    float _2945 = -_2931;
    float _2947 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2945);
    if (_2887)
    {
        float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2935 = _2949;
    }
    float _2951 = _2935;
    float _2953 = _2951;
    if (!_2887)
    {
        _2921 = _2871;
    }
    float _2955 = _2921;
    float _2957 = _2927;
    float _2959 = _2955;
    if (_2887)
    {
        float _2961 = fma(_2927, _2951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2957 = _2961;
    }
    float _2963 = _2957;
    float _2965 = _2963;
    float _2967 = _2941;
    if (_2887)
    {
        float _2969 = _2941 + (-1.0);
        _2953 = _2969;
    }
    float _2971 = _2953;
    float _2973 = _2971;
    if (_2887)
    {
        float _2975 = _2907 * _2963;
        _2601 = _2975;
    }
    float _2977 = _2601;
    if (!_2887)
    {
        _2909 = _2947;
    }
    float _2979 = _2909;
    float _2981 = _2979;
    if (_2887)
    {
        float _2983 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2983;
    }
    float _2985 = _2899;
    if (_2887)
    {
        float _2987 = _2871 * _2977;
        _2959 = _2987;
    }
    float _2989 = _2959;
    if (!_2887)
    {
        _2973 = _2873;
    }
    float _2991 = _2973;
    float _2993 = _2991;
    if (_2887)
    {
        float _2995 = _2873 * _2977;
        _2993 = _2995;
    }
    float _2997 = _2993;
    if (!_2887)
    {
        _2965 = _2875;
    }
    float _2999 = _2965;
    float _3001 = _2999;
    if (_2887)
    {
        float _3003 = fma(_2947, _2941, _2985);
        _2981 = _3003;
    }
    float _3005 = _2981;
    if (_2887)
    {
        float _3007 = _2989 * _2989;
        _3001 = _3007;
    }
    float _3009 = _3001;
    if (!_2887)
    {
        _2967 = _2877;
    }
    float _3011 = _2967;
    float _3013 = _3011;
    if (_2887)
    {
        float _3015 = _2997 * _2997;
        _3013 = _3015;
    }
    float _3017 = _3013;
    float _3019 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3021 = fma(_3005, _3005, _3009);
    float _3023 = floor(_2879);
    float _3025 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3019);
    float _3027 = _3021 + _3017;
    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3031 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3029);
    float _3033 = precise::clamp(_3031, 0.0, 1.0);
    float _3035 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3037 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3025);
    float _3039 = -_3033;
    float _3041 = _3039 + 1.0;
    float _3043 = rsqrt(_3027);
    float _3045 = _3037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3047 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3049 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3051 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3053 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3047);
    float _3055 = abs(_3041);
    float _3057 = log2(_3055);
    float _3059 = -_3051;
    float _3061 = fma(_3059, _3035, 1.0);
    float _3063 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3065 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3053);
    float _3067 = _2775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3069 = -_3023;
    float _3071 = _2879 + _3069;
    float _3073 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3063);
    float _3075 = _3065 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3077 = _3043 * _2989;
    float _3079 = _3043 * _3005;
    float _3081 = _3043 * _2997;
    float _3083 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3073);
    float _3085 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3087 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3067);
    float _3089 = floor(_3049);
    float _3091 = _3083 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3093 = -_3085;
    float _3095 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3093);
    float _3097 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3099 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3101 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3103 = -_3081;
    float _3105 = fma(_3103, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3095);
    float _3107 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3097);
    float _3109 = _3099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3111 = fma(_3105, -0.5, 0.5);
    float _3113 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3107);
    float _3115 = exp2(_3101);
    float _3117 = fma(_3105, 0.5, 0.5);
    float _3119 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3121 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3123 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3125 = fma(_3117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3127 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3119);
    float _3129 = -_3089;
    float _3131 = _3049 + _3129;
    float _3133 = 1.0 / _3121;
    float _3135 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3123);
    float _3137 = fma(_3117, _3125, -0.212114393711090087890625);
    float _3139 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3127);
    float _3141 = _3079 + 1.0;
    float _3143 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3135);
    float _3145 = fma(_3117, _3137, 1.570728778839111328125);
    float _3147 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3139);
    float _3149 = log2(_3061);
    float _3151 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3143);
    float _3153 = -_3079;
    float _3155 = fma(_3115, _3141, _3153);
    float _3157 = sqrt(_3111);
    float _3159 = _3147 * _3133;
    float _3161 = _3151 * _3133;
    float2 _8479 = float2(_3071, _3131);
    float _3163 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8479, float2(0.0), isnan(_8479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8479, float2(0.0), isnan(_8479)), level(0.0)).x;
    float _3165 = fma(_3159, 0.5, 0.5);
    float _3167 = fma(_3161, -0.5, 0.5);
    float _3169 = _3149 * 0.693147182464599609375;
    float _3171 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3173 = fma(_3155, 0.5, 0.5);
    float _3175 = _3157 * 0.636619746685028076171875;
    float3 _8504 = float3(_3165, _3167, _3171);
    float _3177 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8504, float3(0.0), isnan(_8504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8504, float3(0.0), isnan(_8504)), level(0.0)).x;
    float3 _8515 = float3(_3165, _3167, _3171);
    float4 _3180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8515, float3(0.0), isnan(_8515)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8515, float3(0.0), isnan(_8515)), level(0.0)).xyzw;
    float _3182 = _3180.x;
    float _3184 = _3180.y;
    float _3186 = _3180.z;
    float _3188 = _3180.w;
    float _3190 = -_3145;
    float _3192 = fma(_3175, _3190, 1.0);
    float2 _8536 = float2(_3192, _3173);
    float3 _3196 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8536, float2(0.0), isnan(_8536)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8536, float2(0.0), isnan(_8536)), level(0.0)).xyz;
    float _3198 = _3196.x;
    float _3200 = _3196.y;
    float _3202 = _3196.z;
    float _3204 = abs(_2785);
    float _3206 = log2(_3204);
    float _3208 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _2777;
    out.m_95.y = _2775;
    out.m_95.z = _2779;
    bool _3210 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3212 = isnan(_2881);
    bool _3214 = _3210 || _3212;
    bool _3216 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3218 = _3214 || _3216;
    float _3220 = fma(_3091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3208);
    bool _3222 = _2785 <= 8000.0;
    bool _3224 = isnan(_2785);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan(8000.0);
    bool _3230 = _3226 || _3228;
    float _3232 = float(_3230);
    float _3234 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3220);
    float _3236 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3238 = fma(_3109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3234);
    float _3240 = _3121 * 0.5;
    float _3242 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3244 = exp2(_3236);
    float _3246 = fma(_3151, -0.5, _3240);
    float _3248 = _3238 + _3121;
    out.gl_Position.x = _3147;
    out.gl_Position.y = _3151;
    out.gl_Position.z = _3238;
    out.gl_Position.w = _3121;
    float _3250 = exp2(_3242);
    float _3252 = _3248 * 0.5;
    float _3254 = -_3244;
    float _3256 = _3254 + 1.0;
    float _3258 = _3238;
    float _3260 = _3151;
    float _3262 = _3121;
    if (!_3218)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3264 = _3258;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3218)
    {
        _3260 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3272 = _3260;
    float _3274 = fma(_3250, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3276 = precise::clamp(_3274, 0.0, 1.0);
    float _3278 = fma(_3276, -2.0, 3.0);
    float _3280 = _3276 * _3276;
    float _3282 = _3280 * _3278;
    float _3284 = -_3282;
    float _3286 = _3284 + 1.0;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3282);
    float _3290 = _3147 + _3121;
    float _3292 = in.m_69.x;
    float _3294 = -_3266;
    float _3296 = _3294 + 1.0;
    float _3298 = _3232 * _3288;
    float _3300 = _3290 * 0.5;
    float _3302 = _3296;
    float _3304 = _3272;
    float _3306 = _3272;
    if (!_3218)
    {
        _3262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3308 = _3262;
    float _3310 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_97.x = _3300;
    out.m_97.y = _3246;
    out.m_97.z = _3252;
    out.m_97.w = _3121;
    float _3312 = -_3163;
    float _3314 = _3312 + 1.0;
    float _3316 = _3314 * _3310;
    float _3318 = precise::clamp(_3316, 0.0, 1.0);
    float _3320 = -_3318;
    float _3322 = fma(_3320, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3324 = _3322 * _3292;
    float _3326 = _3266 * _3177;
    float _3328 = _3188 * _3296;
    float _3330 = _3182;
    float _3332 = _3308;
    float _3334 = _3308;
    if (!_3218)
    {
        _3302 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3336 = _3302;
    float _3338 = _3324 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3340 = _3188 * _3326;
    out.m_99.x = _3338;
    float _3342 = _3202 * _3326;
    float _3344 = fma(_3198, _3340, _3182);
    float _3346 = fma(_3200, _3340, _3184);
    float _3348 = _2843 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3350 = fma(_3188, _3342, _3186);
    float _3352 = _3340;
    float _3354 = _3336;
    float _3356 = _3336;
    if (!_3218)
    {
        _3352 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3358 = _3352;
    float _3360 = _3358;
    float _3362 = _3358;
    if (!_3218)
    {
        _3330 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3364 = _3330;
    out.m_101.x = _3344;
    out.m_101.y = _3346;
    out.m_101.z = _3350;
    out.m_101.w = _3328;
    bool _3366 = !_3218;
    float _3368 = _3364;
    float _3370 = _3364;
    if (!_3366)
    {
        bool _3372 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3374 = isnan(_2881);
        bool _3376 = _3372 || _3374;
        bool _3378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3380 = _3376 || _3378;
        if (!_3380)
        {
            float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3384 = _2881 + _3382;
            float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3388 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3386;
            float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3394 = 1.0 / _3388;
            float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3412 = _3384 * _3394;
            float _3414 = precise::clamp(_3412, 0.0, 1.0);
            float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3420 = fma(_3414, _3392, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3422 = fma(_3414, _3418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3424 = fma(_3414, _3398, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3426 = fma(_3414, _3402, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3428 = fma(_3414, _3406, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3430 = fma(_3414, _3410, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3370 = _3424;
            _3306 = _3428;
            _3362 = _3420;
            _3270 = _3426;
            _3334 = _3422;
            _3356 = _3430;
            _3432 = true;
        }
        else
        {
            bool _3434 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3436 = isnan(_2881);
            bool _3438 = _3434 || _3436;
            bool _3440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3442 = _3438 || _3440;
            if (!_3442)
            {
                _3360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3444 = _3360;
            _3362 = _3444;
            if (!_3442)
            {
                _3368 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3446 = _3368;
            _3370 = _3446;
            if (!_3442)
            {
                _3332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3448 = _3332;
            _3334 = _3448;
            if (!_3442)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3450 = _3268;
            _3270 = _3450;
            if (!_3442)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3452 = _3304;
            _3306 = _3452;
            if (!_3442)
            {
                _3354 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3454 = _3354;
            bool _3456 = !_3442;
            _3356 = _3454;
            if (!_3456)
            {
                bool _3458 = _2881 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3460 = isnan(_2881);
                bool _3462 = _3458 || _3460;
                bool _3464 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3466 = _3462 || _3464;
                if (!_3466)
                {
                    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3470 = _2881 + _3468;
                    float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3474 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3472;
                    float _3476 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3478 = _3476 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3480 = 1.0 / _3474;
                    float _3482 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3484 = _3482 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3486 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3488 = _3486 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3490 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3492 = _3490 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3494 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3496 = _3494 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3498 = _3470 * _3480;
                    float _3500 = precise::clamp(_3498, 0.0, 1.0);
                    float _3502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3506 = fma(_3500, _3478, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3508 = fma(_3500, _3504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3510 = fma(_3500, _3484, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3512 = fma(_3500, _3488, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3514 = fma(_3500, _3492, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3516 = fma(_3500, _3496, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3370 = _3510;
                    _3306 = _3514;
                    _3362 = _3506;
                    _3270 = _3512;
                    _3334 = _3508;
                    _3356 = _3516;
                    _3432 = true;
                }
                else
                {
                    _3370 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3356 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3432 = false;
    float _3518 = _3370;
    float _3520 = _3306;
    float _3522 = _3362;
    float _3524 = _3270;
    float _3526 = _3334;
    float _3528 = _3356;
    float _3530 = fma(_2419, -0.5, 0.5);
    float _3532 = precise::clamp(_3530, 0.0, 1.0);
    float _3534 = -_3518;
    float _3536 = _3534 + _3520;
    float _3538 = _3348 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3540 = -_3522;
    float _3542 = _3540 + _3524;
    float _3544 = fma(_3532, _3536, _3518);
    out.m_103.x = 0.0;
    float _3546 = -_3526;
    float _3548 = _3546 + _3528;
    float _3550 = fma(_3532, _3542, _3522);
    float _3552 = _3544 * 0.586610972881317138671875;
    out.m_53.x = _3538;
    bool _3554 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3556 = fma(_3532, _3548, _3526);
    float _3558 = fma(_3550, 0.298911988735198974609375, _3552);
    bool _3560 = _2843 > 0.0;
    bool _3562 = isnan(_2843);
    bool _3564 = _3560 || _3562;
    bool _3566 = isnan(0.0);
    bool _3568 = _3564 || _3566;
    float _3570 = fma(_3556, 0.114477999508380889892578125, _3558);
    out.m_105.x = 0.0;
    float _3572 = -_3570;
    float _3574 = _3550 + _3572;
    float _3576 = -_3570;
    float _3578 = _3544 + _3576;
    float _3580 = -_3570;
    float _3582 = _3556 + _3580;
    float _3584 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    float _3586 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    float _3588 = fma(_3582, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3570);
    bool _3590 = !_3554;
    if (!_3590)
    {
        float _3592 = -_2775;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3596 = -_2777;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3600 = -_2779;
        float _3602 = _3600 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3604 = _3594 * _3594;
        float _3606 = fma(_3598, _3598, _3604);
        float _3608 = fma(_3602, _3602, _3606);
        float _3610 = rsqrt(_3608);
        float _3612 = _3594 * _3610;
        float _3614 = _3598 * _3610;
        float _3616 = _3602 * _3610;
        float _3618 = sqrt(_3608);
        float _3620 = -_2869;
        float _3622 = _3620 + _3612;
        float _3624 = -_2865;
        float _3626 = _3624 + _3614;
        float _3628 = -_2867;
        float _3630 = _3628 + _3616;
        float _3632 = _3622 * _3622;
        float _3634 = fma(_3626, _3626, _3632);
        float _3636 = fma(_3630, _3630, _3634);
        float _3638 = -_3618;
        float _3640 = _3638 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3642 = rsqrt(_3636);
        float _3644 = _3640 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = abs(_3646);
        float _3650 = log2(_3648);
        float _3652 = _3622 * _3642;
        float _3654 = _3626 * _3642;
        float _3656 = _3630 * _3642;
        float _3658 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3660 = _2419 * _3652;
        float _3662 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3664 = precise::clamp(_3662, 0.0, 1.0);
        float _3666 = _2419 * _3612;
        float _3668 = fma(_2417, _3654, _3660);
        float _3670 = _3664 * _3664;
        float _3672 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3674 = fma(_2417, _3614, _3666);
        float _3676 = fma(_2421, _3656, _3668);
        float _3678 = precise::clamp(_3676, 0.0, 1.0);
        float _3680 = _3670 + (-1.0);
        float _3682 = fma(_2421, _3616, _3674);
        float _3684 = precise::clamp(_3682, 0.0, 1.0);
        float _3686 = _3678 * _3678;
        float _3688 = exp2(_3672);
        float _3690 = fma(_3686, _3680, 1.0);
        float _3692 = -_3612;
        float _3694 = -_3658;
        float _3696 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3694);
        float _3698 = _3690 * _3690;
        float _3700 = -_3616;
        float _3702 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3696);
        float _3704 = 1.0 / _3698;
        float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3708 = _3702 + _3706;
        float _3710 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3712 = precise::clamp(_3710, 0.0, 1.0);
        float _3714 = _3688 * _3712;
        float _3716 = _3684 * _3714;
        float _3718 = _3670 * _3704;
        float _3720 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3722 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3724 = _3716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3726 = _3716 * _3718;
        float _3728 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3730 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3732 = _3726 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3720;
        out.m_103.y = _3722;
        out.m_103.z = _3724;
        out.m_105.x = _3728;
        out.m_105.y = _3730;
        out.m_105.z = _3732;
    }
    out.m_107.x = _3584;
    out.m_107.y = _3586;
    out.m_107.z = _3588;
    if (_3568)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3734 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3734;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

