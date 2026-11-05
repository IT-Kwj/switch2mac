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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _837 = false;
    bool _384 = false;
    bool _134 = false;
    float _44 = gl_FragCoord.y;
    float _46 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _48 = _44 / _46;
    float _50 = gl_FragCoord.x;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = (*spvDescriptorSet0.fp_c3)._m0[4].x * 0.5;
    float _58 = (*spvDescriptorSet0.fp_c4)._m0[2].z + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _60 = _48 + (-0.5);
    bool _64 = _60 >= _56;
    bool _66 = isnan(_60);
    bool _68 = _64 || _66;
    bool _70 = isnan(_56);
    bool _72 = _68 || _70;
    float _126;
    float _128;
    float _130;
    float _132;
    if (!_72)
    {
        float _74 = 1.0 / _58;
        float _76 = _58 * _58;
        float _78 = (*spvDescriptorSet0.fp_c3)._m0[8].y * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _80 = -_60;
        float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[4].w, 1.0);
        float _84 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _86 = _82 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
        float _88 = (*spvDescriptorSet0.fp_c4)._m0[2].w * 0.999000012874603271484375;
        float _90 = precise::max(_86, (*spvDescriptorSet0.fp_c4)._m0[2].z);
        float _92 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _94 = precise::min(_90, _88);
        float _96 = -_76;
        float _98 = _84 + _96;
        float _100 = -_92;
        float _102 = fma(_100, _92, 1.0);
        float _104 = precise::clamp(_102, 0.0, 1.0);
        float _106 = _58 * _94;
        float _108 = _106 * 2.0;
        float _110 = -_94;
        float _112 = fma(_110, _94, _98);
        float _114 = sqrt(_104);
        float _116 = 1.0 / _108;
        float _118 = -_114;
        float _120 = _118 + (-0.001000000047497451305389404296875);
        float _122 = _112 * _116;
        float _124 = precise::min(_122, _120);
        _126 = _124;
        _128 = _76;
        _130 = _84;
        _132 = _78;
        _134 = true;
    }
    else
    {
        float _136 = 1.0 / _58;
        float _138 = -_56;
        float _140 = _60 + _138;
        float _142 = (*spvDescriptorSet0.fp_c3)._m0[8].y * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _144 = _58 * _58;
        float _146 = _140 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _148 = (*spvDescriptorSet0.fp_c4)._m0[2].y * 0.999000012874603271484375;
        float _150 = _146 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _152 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _154 = precise::max(_150, (*spvDescriptorSet0.fp_c4)._m0[2].x);
        float _156 = _136 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _158 = precise::min(_154, _148);
        float _160 = -_144;
        float _162 = _160 + _142;
        float _164 = -_156;
        float _166 = fma(_164, _156, 1.0);
        float _168 = precise::clamp(_166, 0.0, 1.0);
        float _170 = _58 * _158;
        float _172 = _170 * 2.0;
        float _174 = -_158;
        float _176 = fma(_174, _158, _162);
        float _178 = sqrt(_168);
        float _180 = 1.0 / _172;
        float _182 = -_178;
        float _184 = _182 + (-0.001000000047497451305389404296875);
        float _186 = _176 * _180;
        float _188 = precise::max(_186, _184);
        _126 = _188;
        _128 = _144;
        _130 = _152;
        _132 = _142;
    }
    _134 = false;
    float _190 = _126;
    float _192 = _128;
    float _194 = _130;
    float _196 = _132;
    float _198 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _200 = _54 + (-0.5);
    float _202 = fma(_190, _190, -1.0);
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _206 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _204;
    float _208 = _58 * _190;
    float _210 = _202 * _192;
    float _212 = rsqrt(_192);
    float _214 = _210 + _194;
    float _216 = -_210;
    bool _218 = _194 >= _216;
    float _220 = _210 + _196;
    float _222 = _200 * _198;
    float _224 = 1.0 / _206;
    float _226 = floor(_222);
    float _228 = _214;
    if (_218)
    {
        float _230 = sqrt(_214);
        _228 = _230;
    }
    float _232 = _228;
    float _234 = _224 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _236 = -_226;
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[5].x, _200);
    float _240 = sqrt(_220);
    float _242 = _238 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _244 = fma(_242, 2.2000000476837158203125, -0.81400001049041748046875);
    float _246 = -_208;
    bool _248 = _246 >= _232;
    bool _250 = _248 && _218;
    float _252 = _232;
    if (_218)
    {
        float _254 = -_208;
        float _256 = -_232;
        float _258 = _254 + _256;
        _252 = _258;
    }
    float _260 = _252;
    float _262 = sqrt(_234);
    float _264 = _244 * 0.15915493667125701904296875;
    float _266 = _200 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _268 = -_208;
    float _270 = _268 + _240;
    float _272 = _264 * 6.283185482025146484375;
    float _274 = cos(_272);
    float _276 = 0.0;
    float _278 = _270;
    if (!_218)
    {
        _276 = _270;
    }
    float _280 = _276;
    float _282 = _280;
    if (_250)
    {
        float _284 = precise::min(_270, _260);
        _278 = _284;
    }
    float _286 = _278;
    bool _288 = _190 >= 0.0;
    float _290 = _264 * 6.283185482025146484375;
    float _292 = sin(_290);
    if (_218)
    {
        _282 = _286;
    }
    float _294 = _282;
    float _296 = _208 * _212;
    float _298 = _294 * 0.0199999995529651641845703125;
    float _300 = 1.0 / _274;
    float _302 = floor(_266);
    float _304 = sqrt(_192);
    float _306 = _292 * _300;
    float _308 = _306 * 0.18692903220653533935546875;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _312 = _58 * _308;
    float _314 = fma(_310, 2.0, -1.0);
    bool _316 = !_288;
    float _374;
    float _376;
    float _378;
    float _380;
    float _382;
    if (!_316)
    {
        float _318 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _320 = _304 + _318;
        float _322 = fma(_296, 350.80767822265625, 53.62115478515625);
        float _324 = fma(_190, 350.80767822265625, 53.62115478515625);
        float _326 = _320 * _224;
        float _328 = log2(_322);
        float _330 = sqrt(_326);
        float _332 = _328 * 0.1155245304107666015625;
        float _334 = log2(_324);
        float2 _1541 = float2(_332, _330);
        float3 _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1541, float2(0.0), isnan(_1541))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1541, float2(0.0), isnan(_1541))).xyz;
        float _340 = _338.x;
        float _342 = _338.y;
        float _344 = _338.z;
        float _346 = _334 * 0.1155245304107666015625;
        float2 _1559 = float2(_346, _262);
        float3 _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1559, float2(0.0), isnan(_1559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1559, float2(0.0), isnan(_1559))).xyz;
        float _350 = _348.x;
        float _352 = _348.y;
        float _354 = _348.z;
        float _356 = precise::max(_342, 9.9999999747524270787835121154785e-07);
        float _358 = precise::max(_340, 9.9999999747524270787835121154785e-07);
        float _360 = precise::max(_344, 9.9999999747524270787835121154785e-07);
        float _362 = 1.0 / _356;
        float _364 = 1.0 / _358;
        float _366 = 1.0 / _360;
        float _368 = _352 * _362;
        float _370 = _350 * _364;
        float _372 = _354 * _366;
        _374 = _340;
        _376 = _326;
        _378 = _372;
        _380 = _368;
        _382 = _370;
        _384 = true;
    }
    else
    {
        float _386 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _388 = _304 + _386;
        float _390 = fma(_190, -350.80767822265625, 53.62115478515625);
        float _392 = fma(_296, -350.80767822265625, 53.62115478515625);
        float _394 = _388 * _224;
        float _396 = log2(_390);
        float _398 = log2(_392);
        float _400 = _396 * 0.1155245304107666015625;
        float _402 = sqrt(_394);
        float2 _1623 = float2(_400, _262);
        float3 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1623, float2(0.0), isnan(_1623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1623, float2(0.0), isnan(_1623))).xyz;
        float _406 = _404.x;
        float _408 = _404.y;
        float _410 = _404.z;
        float _412 = _398 * 0.1155245304107666015625;
        float2 _1639 = float2(_412, _402);
        float3 _414 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1639, float2(0.0), isnan(_1639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1639, float2(0.0), isnan(_1639))).xyz;
        float _416 = _414.x;
        float _418 = _414.y;
        float _420 = _414.z;
        float _422 = precise::max(_408, 9.9999999747524270787835121154785e-07);
        float _424 = precise::max(_406, 9.9999999747524270787835121154785e-07);
        float _426 = precise::max(_410, 9.9999999747524270787835121154785e-07);
        float _428 = 1.0 / _422;
        float _430 = 1.0 / _424;
        float _432 = 1.0 / _426;
        float _434 = _418 * _428;
        float _436 = _416 * _430;
        float _438 = _420 * _432;
        _374 = _406;
        _376 = _394;
        _378 = _438;
        _380 = _434;
        _382 = _436;
    }
    _384 = false;
    float _440 = _374;
    float _442 = _376;
    float _444 = _378;
    float _446 = _380;
    float _448 = _382;
    float _450 = _312 * _212;
    float _452 = _304 * _296;
    float _454 = -_194;
    float _456 = _196 + _454;
    float _458 = -_194;
    float _460 = _458 + _192;
    float _462 = -_192;
    float _464 = fma(_452, _452, _462);
    float _466 = precise::max(_450, -0.19750000536441802978515625);
    float _468 = sqrt(_456);
    float _470 = _464 + _194;
    float _472 = -_194;
    bool _474 = _464 > _472;
    float _476 = _466 * 5.34962368011474609375;
    bool _478 = _452 < 0.0;
    bool _480 = _478 && _474;
    float _482 = sqrt(_460);
    float _484 = abs(_476);
    bool _486 = _484 > 1.0;
    float _488 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _490 = abs(_476);
    bool _492 = _490 > as_type<float>(0x7f800000u /* inf */);
    bool _494 = isnan(_490);
    bool _496 = _492 || _494;
    bool _498 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _500 = _496 || _498;
    float _502 = _464;
    float _504 = _440;
    float _506 = _482;
    if (_480)
    {
        _502 = 0.0;
    }
    float _508 = _502;
    float _510 = _508;
    if (!_486)
    {
        float _512 = abs(_476);
        float _514 = (-0.0) + _512;
        _504 = _514;
    }
    float _516 = _504;
    if (!_480)
    {
        _510 = _468;
    }
    float _518 = _510;
    float _520 = _516;
    if (_486)
    {
        float _522 = abs(_476);
        float _524 = 1.0 / _522;
        _520 = _524;
    }
    float _526 = _520;
    int _529 = as_type<int>(_476) & int(0x80000000);
    float _531 = _526 * _526;
    float _533 = _531 + 11.33538818359375;
    float _535 = fma(_531, _533, 28.84246826171875);
    float _537 = _533;
    if (_480)
    {
        _537 = 0.0;
    }
    float _539 = _537;
    float _541 = _539;
    if (!_480)
    {
        _541 = _456;
    }
    float _543 = _541;
    float _545 = fma(_531, _535, 19.6966705322265625);
    float _547 = _470 + _543;
    float _549 = fma(_531, -0.82336294651031494140625, -5.674867153167724609375);
    float _551 = 1.0 / _545;
    float _553 = fma(_531, _549, -6.565555095672607421875);
    float _555 = _482 + _518;
    if (_480)
    {
        _506 = 1.0;
    }
    float _557 = _506;
    float _559 = _531 * _553;
    float _561 = sqrt(_547);
    float _563 = _559 * _526;
    float _565 = _557;
    if (!_480)
    {
        _565 = -1.0;
    }
    float _567 = _565;
    float _569 = fma(_190, 350.80767822265625, 53.62115478515625);
    float _571 = fma(_190, -350.80767822265625, 53.62115478515625);
    float _573 = fma(_563, _551, _526);
    float _575 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _577 = 1.0 / _555;
    int _579 = as_type<int>(_573);
    if (_486)
    {
        float _581 = -_573;
        float _583 = _581 + 1.57079637050628662109375;
        _579 = as_type<int>(_583);
    }
    int _585 = _579;
    float _587 = _310 * _575;
    float _589 = fma(_452, _567, _561);
    float _591 = as_type<float>(_585);
    if (!_500)
    {
        int _593 = _529 | _585;
        _591 = as_type<float>(_593);
    }
    float _595 = _591;
    float _597 = floor(_587);
    float _599 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _601 = _599 + 1.0;
    float _603 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _605 = _603 + 1.0;
    float _607 = fma(0.454545438289642333984375, _595, 0.37000000476837158203125);
    float _609 = log2(_569);
    float _611 = 0.454545438289642333984375;
    if (_480)
    {
        float _613 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _615 = fma(_613, 0.5, 0.5);
        _611 = _615;
    }
    float _617 = _611;
    float _619 = fma(_607, _601, _488);
    float _621 = _589 * _577;
    float _623 = _617;
    if (!_480)
    {
        float _625 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _623 = _625;
    }
    float _627 = _623;
    float _629 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _631 = _629 + 0.5;
    float _633 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _635 = log2(_571);
    float _637 = _619 + _597;
    float _639 = fma(_621, _631, _627);
    float _641 = fma(_442, _605, _633);
    float _643 = _637 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _645 = _609 * 0.1155245304107666015625;
    float _647 = _637 + 1.0;
    float _649 = _647 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _651 = _635 * 0.1155245304107666015625;
    float2 _1976 = float2(_651, _262);
    float3 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1976, float2(0.0), isnan(_1976))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1976, float2(0.0), isnan(_1976))).xyz;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float3 _1991 = float3(_643, _639, _641);
    float3 _661 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1991, float3(0.0), isnan(_1991))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1991, float3(0.0), isnan(_1991))).xyz;
    float _663 = _661.x;
    float _665 = _661.y;
    float _667 = _661.z;
    float3 _2008 = float3(_649, _639, _641);
    float3 _669 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2008, float3(0.0), isnan(_2008))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2008, float3(0.0), isnan(_2008))).xyz;
    float _671 = _669.x;
    float _673 = _669.y;
    float _675 = _669.z;
    float2 _2022 = float2(_645, _262);
    float3 _677 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2022, float2(0.0), isnan(_2022))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2022, float2(0.0), isnan(_2022))).xyz;
    float _679 = _677.x;
    float _681 = _677.y;
    float _683 = _677.z;
    float _685 = _58 * _190;
    float _687 = _685 * 2.0;
    float _689 = -_597;
    float _691 = _587 + _689;
    float _693 = precise::min(_444, 1.0);
    float _695 = _605 * _224;
    float _697 = precise::max(_655, 9.9999999747524270787835121154785e-07);
    float _699 = precise::max(_659, 9.9999999747524270787835121154785e-07);
    float _701 = -_665;
    float _703 = _701 + _673;
    float _705 = precise::min(_446, 1.0);
    float _707 = -_663;
    float _709 = _707 + _671;
    float _711 = 1.0 / _697;
    float _713 = -_667;
    float _715 = _713 + _675;
    float _717 = fma(_691, _703, _665);
    float _719 = precise::min(_448, 1.0);
    float _721 = fma(_691, _709, _663);
    float _723 = precise::max(_657, 9.9999999747524270787835121154785e-07);
    float _725 = fma(_691, _715, _667);
    float _727 = _717 * _705;
    float _729 = 1.0 / _699;
    float _731 = _721 * _719;
    float _733 = _725 * _693;
    float _735 = 1.0 / _723;
    int _737 = 1;
    float _739 = _731;
    float _741 = _727;
    float _743 = _733;
    float _745 = 0.0;
    float _747 = 0.0;
    float _749 = 0.0;
    bool _751;
    float _827;
    float _829;
    float _831;
    float _833;
    float _835;
    float _1109;
    float _1111;
    float _1113;
    do
    {
        int _753 = _737;
        float _755 = _739;
        float _757 = _741;
        float _759 = _743;
        float _761 = _745;
        float _763 = _747;
        float _765 = _749;
        float _767 = float(_753);
        float _769 = _298 * _767;
        float _771 = fma(_769, _769, _192);
        float _773 = _208 + _769;
        float _775 = fma(_314, _769, _312);
        float _777 = fma(_769, _687, _771);
        float _779 = rsqrt(_777);
        float _781 = sqrt(_777);
        float _783 = _773 * _779;
        bool _785 = !_288;
        if (!_785)
        {
            float _787 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _789 = _781 + _787;
            float _791 = fma(_783, 350.80767822265625, 53.62115478515625);
            float _793 = _789 * _224;
            float _795 = log2(_791);
            float _797 = sqrt(_793);
            float _799 = _795 * 0.1155245304107666015625;
            float2 _2164 = float2(_799, _797);
            float3 _801 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2164, float2(0.0), isnan(_2164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2164, float2(0.0), isnan(_2164))).xyz;
            float _803 = _801.x;
            float _805 = _801.y;
            float _807 = _801.z;
            float _809 = precise::max(_803, 9.9999999747524270787835121154785e-07);
            float _811 = precise::max(_805, 9.9999999747524270787835121154785e-07);
            float _813 = precise::max(_807, 9.9999999747524270787835121154785e-07);
            float _815 = 1.0 / _809;
            float _817 = 1.0 / _811;
            float _819 = 1.0 / _813;
            float _821 = _681 * _817;
            float _823 = _679 * _815;
            float _825 = _683 * _819;
            _827 = _811;
            _829 = _789;
            _831 = _823;
            _833 = _821;
            _835 = _825;
            _837 = true;
        }
        else
        {
            float _839 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _841 = _781 + _839;
            float _843 = fma(_783, -350.80767822265625, 53.62115478515625);
            float _845 = _841 * _224;
            float _847 = log2(_843);
            float _849 = sqrt(_845);
            float _851 = _847 * 0.1155245304107666015625;
            float2 _2222 = float2(_851, _849);
            float3 _853 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2222, float2(0.0), isnan(_2222))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2222, float2(0.0), isnan(_2222))).xyz;
            float _855 = _853.x;
            float _857 = _853.y;
            float _859 = _853.z;
            float _861 = _855 * _711;
            float _863 = _857 * _735;
            float _865 = _859 * _729;
            _827 = _857;
            _829 = _841;
            _831 = _861;
            _833 = _863;
            _835 = _865;
        }
        _837 = false;
        float _867 = _827;
        float _869 = _829;
        float _871 = _831;
        float _873 = _833;
        float _875 = _835;
        float _877 = _775 * _779;
        float _879 = _781 * _783;
        float _881 = precise::max(_877, -0.19750000536441802978515625);
        float _883 = -_777;
        float _885 = fma(_879, _879, _883);
        float _887 = -_194;
        float _889 = _777 + _887;
        float _891 = _881 * 5.34962368011474609375;
        float _893 = -_194;
        bool _895 = _885 > _893;
        float _897 = _885 + _194;
        float _899 = sqrt(_889);
        float _901 = abs(_891);
        bool _903 = _901 > 1.0;
        bool _905 = _879 < 0.0;
        bool _907 = _905 && _895;
        float _909 = abs(_891);
        bool _911 = _909 > as_type<float>(0x7f800000u /* inf */);
        bool _913 = isnan(_909);
        bool _915 = _911 || _913;
        bool _917 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _919 = _915 || _917;
        float _921 = _867;
        if (!_903)
        {
            float _923 = abs(_891);
            float _925 = (-0.0) + _923;
            _921 = _925;
        }
        float _927 = _921;
        float _929 = _927;
        if (_903)
        {
            float _931 = abs(_891);
            float _933 = 1.0 / _931;
            _929 = _933;
        }
        float _935 = _929;
        int _937 = as_type<int>(_891) & int(0x80000000);
        float _939 = _935 * _935;
        float _941 = _939 + 11.33538818359375;
        float _943 = fma(_939, -0.82336294651031494140625, -5.674867153167724609375);
        float _945 = fma(_939, _941, 28.84246826171875);
        float _947 = fma(_939, _943, -6.565555095672607421875);
        float _949 = fma(_939, _945, 19.6966705322265625);
        float _951 = _939 * _947;
        float _953 = _939;
        if (_907)
        {
            _953 = 0.0;
        }
        float _955 = _953;
        float _957 = _955;
        if (!_907)
        {
            _957 = _456;
        }
        float _959 = _957;
        float _961 = _951 * _935;
        float _963 = 1.0 / _949;
        float _965 = _897 + _959;
        float _967 = sqrt(_965);
        float _969 = fma(_961, _963, _935);
        float _971 = _961;
        float _973 = _965;
        int _975 = as_type<int>(_969);
        if (_907)
        {
            _971 = 0.0;
        }
        float _977 = _971;
        float _979 = _977;
        if (_907)
        {
            _973 = 1.0;
        }
        float _981 = _973;
        float _983 = _981;
        if (_903)
        {
            float _985 = -_969;
            float _987 = _985 + 1.57079637050628662109375;
            _975 = as_type<int>(_987);
        }
        int _989 = _975;
        float _991 = as_type<float>(_989);
        if (!_907)
        {
            _979 = _468;
        }
        float _993 = _979;
        float _995 = _993;
        if (!_907)
        {
            _983 = -1.0;
        }
        float _997 = _983;
        if (!_919)
        {
            int _999 = _937 | _989;
            _991 = as_type<float>(_999);
        }
        float _1001 = _991;
        float _1003 = _899 + _993;
        float _1005 = fma(_879, _997, _967);
        float _1007 = 1.0 / _1003;
        float _1009 = fma(0.454545438289642333984375, _1001, 0.37000000476837158203125);
        float _1011 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _1013 = _1011 + 1.0;
        if (_907)
        {
            float _1015 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _1017 = fma(_1015, 0.5, 0.5);
            _995 = _1017;
        }
        float _1019 = _995;
        float _1021 = _1019;
        if (!_907)
        {
            float _1023 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
            _1021 = _1023;
        }
        float _1025 = _1021;
        float _1027 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _1029 = fma(_1013, _1009, _1027);
        float _1031 = _1005 * _1007;
        float _1033 = _597 + _1029;
        float _1035 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _1037 = _1035 + 0.5;
        float _1039 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _1041 = _1033 + 1.0;
        float _1043 = fma(_1037, _1031, _1025);
        float _1045 = fma(_869, _695, _1039);
        float _1047 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
        float _1049 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
        float3 _2502 = float3(_1047, _1043, _1045);
        float3 _1051 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2502, float3(0.0), isnan(_2502))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2502, float3(0.0), isnan(_2502))).xyz;
        float _1053 = _1051.x;
        float _1055 = _1051.y;
        float _1057 = _1051.z;
        float3 _2517 = float3(_1049, _1043, _1045);
        float3 _1059 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2517, float3(0.0), isnan(_2517))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2517, float3(0.0), isnan(_2517))).xyz;
        float _1061 = _1059.x;
        float _1063 = _1059.y;
        float _1065 = _1059.z;
        int _1067 = _753 + 1;
        float _1069 = precise::min(_871, 1.0);
        float _1071 = precise::min(_873, 1.0);
        bool _1073 = _1067 >= 51;
        float _1075 = precise::min(_875, 1.0);
        float _1077 = -_1053;
        float _1079 = _1077 + _1061;
        float _1081 = -_1055;
        float _1083 = _1081 + _1063;
        float _1085 = -_1057;
        float _1087 = _1085 + _1065;
        float _1089 = fma(_691, _1079, _1053);
        float _1091 = fma(_691, _1083, _1055);
        float _1093 = fma(_691, _1087, _1057);
        float _1095 = _298 * 0.5;
        float _1097 = _1089 * _1069;
        float _1099 = _1091 * _1071;
        float _1101 = _1093 * _1075;
        float _1103 = _1097 + _755;
        float _1105 = _1099 + _757;
        float _1107 = _1101 + _759;
        _1109 = fma(_1103, _1095, _761);
        _1111 = fma(_1105, _1095, _763);
        _1113 = fma(_1107, _1095, _765);
        _751 = !_1073;
        _737 = _1067;
        _739 = _1097;
        _741 = _1099;
        _743 = _1101;
        _745 = _1109;
        _747 = _1111;
        _749 = _1113;
    } while (_751);
    out.m_37.x = _1109;
    out.m_37.y = _1111;
    out.m_37.z = _1113;
    out.m_37.w = 0.0;
    return out;
}

