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

struct _35
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    const device _35* vp_s0 [[id(8)]];
    texture2d<float> vp_t_tcb_2A [[id(9)]];
    sampler vp_t_tcb_2ASmplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_2ASmplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2138 = false;
    bool _919 = false;
    bool _907 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_130);
        out.gl_Position.z = _2503;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_58.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2571 = as_type<float>(_166);
        out.gl_Position.z = _2571;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = in.m_64.x;
    float _176 = in.m_64.y;
    float _178 = in.m_64.z;
    float _180 = in.m_66.x;
    float _182 = in.m_66.y;
    float _184 = in.m_66.z;
    float _186 = in.m_68.x;
    float _188 = _168 * _168;
    float _190 = _170 * _170;
    float _192 = _172 * _172;
    float _194 = fma(_174, _174, _188);
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _218 = _200;
    float _220 = _216;
    float _222 = _206;
    float _224 = _202;
    float _226 = _204;
    if (_212)
    {
        float _228 = rsqrt(_200);
        _218 = _228;
    }
    float _230 = _218;
    float _232 = _216 * _186;
    bool _234 = _210 > 0.0;
    float _236 = _210;
    if (!_212)
    {
        _236 = 0.0;
        _220 = 0.0;
    }
    float _238 = _236;
    float _240 = _220;
    float _242 = _240;
    float _244 = _238;
    if (!_212)
    {
        _222 = 0.0;
    }
    float _246 = _222;
    float _248 = 0.0;
    float _250 = _246;
    if (!_214)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (_214)
    {
        float _258 = rsqrt(_202);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_234)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_234)
    {
        float _276 = rsqrt(_204);
        _270 = _276;
    }
    float _278 = _270;
    if (_212)
    {
        float _280 = _230 * _174;
        _242 = _280;
    }
    float _282 = _242;
    if (_212)
    {
        float _284 = _230 * _168;
        _244 = _284;
    }
    float _286 = _244;
    if (_212)
    {
        float _288 = _230 * _180;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = _290;
    if (!_214)
    {
        _224 = 0.0;
    }
    float _296 = _224;
    float _298 = trunc(_232);
    int _300 = int(_298);
    float _302 = _296;
    if (!_214)
    {
        _226 = 0.0;
    }
    float _304 = _226;
    float _306 = _304;
    if (_214)
    {
        float _308 = _260 * _176;
        _302 = _308;
    }
    float _310 = _302;
    float _312 = 0.0;
    if (!_234)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (_214)
    {
        float _318 = _260 * _170;
        _306 = _318;
    }
    float _320 = _306;
    if (_214)
    {
        float _322 = _260 * _182;
        _256 = _322;
    }
    float _324 = _256;
    float _326 = _324;
    if (_234)
    {
        float _328 = _278 * _178;
        _316 = _328;
    }
    float _330 = _316;
    if (_234)
    {
        float _332 = _278 * _172;
        _272 = _332;
    }
    float _334 = _272;
    float _336 = _334;
    if (_234)
    {
        float _338 = _278 * _184;
        _274 = _338;
    }
    float _340 = _274;
    int _342 = _300 << 4;
    int _344 = _342 + 1712;
    bool _346 = !_292;
    float _362;
    if (!_346)
    {
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _186 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_114);
        float _368 = 1.0 / _366;
        float _370 = _148 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_55.x;
    float _376 = in.m_55.y;
    float _378 = in.m_55.z;
    float _380 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _382 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _384 = as_type<float>(int(gl_VertexIndex));
    bool _386 = _186 > 0.5;
    float _388 = in.m_68.y;
    float _390 = _380 * _186;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _400 = in.m_62.w;
    float _402 = 1.0 / _394;
    float _404 = 1.0 / _398;
    float _406 = _176 * _376;
    float _408 = _170 * _376;
    float _410 = _182 * _376;
    float _412 = fma(_174, _374, _406);
    int _414 = as_type<int>(_384) & 1;
    bool _416 = _414 != 0;
    int _418 = as_type<int>(_384) & 2;
    bool _420 = _418 != 0;
    float _422 = fma(_168, _374, _408);
    float _424 = in.m_73.x;
    float _426 = in.m_73.y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _434 = _432 != 0;
    float _436 = fma(_180, _374, _410);
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _440 = _438 != 0;
    float _442 = in.m_64.w;
    float _444 = 1.0 / _430;
    bool _446 = _388 > 0.5;
    float _448 = fma(_178, _378, _412);
    float _450 = in.m_66.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _454 = _372 + _452;
    float _456 = fma(_172, _378, _422);
    float _458 = trunc(_390);
    int _460 = int(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _470;
    float _474 = fma(_184, _378, _436);
    float _476 = _464 * _402;
    float _478 = _468 * _404;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _372 + _480;
    float _484 = _472 * _444;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _372 + _486;
    float _490 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _492 = fma(_476, _482, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _494 = fma(_484, _454, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _496 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _498 = isnan(_372);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_478, _488, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _510 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_372);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _456 + _400;
    bool _524 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_372);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _448 + _442;
    bool _538 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_372);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _474 + _450;
    float _552 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = -_520;
    float _556 = _554 + 1.0;
    float _558 = -_548;
    float _560 = _558 + 1.0;
    bool _562 = !_420;
    float _564 = _562 ? (-0.5) : 0.5;
    float _566 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _568 = !_416;
    float _570 = _568 ? (-0.5) : 0.5;
    float _572 = -_506;
    float _574 = _572 + 1.0;
    float _576 = _534 * _560;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    int _580 = _460 << 4;
    int _582 = _580 + 1968;
    float _584 = _548 * _556;
    float _586 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _570);
    float _590 = _566 * _578;
    float _592 = _520 * _574;
    float _594 = _492 * _576;
    float _596 = -_570;
    int _598 = _386 ? as_type<int>(_596) : as_type<int>(_570);
    uint _601 = uint(int(uint(_582) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[int(_611)][_613];
    float _617 = _564 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _619 = _586 * _588;
    float _621 = -_564;
    int _623 = _446 ? as_type<int>(_621) : as_type<int>(_564);
    float _625 = _522 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _627 = !_434;
    float _629 = _627 ? _570 : as_type<float>(_598);
    float _631 = _570 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _633 = _617 * _310;
    int _635 = _582 + 8;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[int(_639)][_641];
    float _645 = _617 * _320;
    float _647 = _617 * _324;
    bool _649 = !_440;
    float _651 = _649 ? _564 : as_type<float>(_623);
    float _653 = _536 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _655 = fma(_631, _286, _645);
    float _657 = fma(_631, _290, _647);
    float _659 = _550 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _661 = fma(_631, _282, _633);
    float _663 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    int _665 = _344 + 8;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _677 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _679 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].x, _663);
    float _681 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _683 = -_534;
    float _685 = _683 + 1.0;
    float _687 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].y, _677);
    float _689 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].x, _679);
    uint _691 = uint(int(uint(_344) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[int(_701)][_703];
    float _707 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].z, _681);
    float _709 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].y, _687);
    float _711 = _689 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _713 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _715 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].z, _707);
    float _717 = _709 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _719 = _711 * _382;
    float _721 = _590 * _310;
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _725 = _717 * _675;
    float _727 = _715 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _729 = fma(_619, _282, _721);
    float _731 = fma(_508, _584, _713);
    float _733 = fma(_725, 0.5, 0.5);
    float _735 = fma(_719, 0.5, 0.5);
    float _737 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _739 = fma(_494, _592, _731);
    float _741 = floor(_733);
    float _743 = _590 * _320;
    float _745 = fma(_737, _330, _729);
    float _747 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[118].x, _739);
    float _749 = _607 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _751 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _753 = _590 * _324;
    float _755 = _727 * _723;
    float _757 = floor(_735);
    float _759 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = fma(_755, 0.5, 0.5);
    float _765 = _643 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _767 = fma(_619, _286, _743);
    float _769 = fma(_619, _290, _753);
    float _771 = _629 + 0.5;
    float _773 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _777 = -_741;
    float _779 = _733 + _777;
    float _781 = -_651;
    float _783 = _781 + 0.5;
    float _785 = fma(_737, _334, _767);
    out.m_75.x = _759;
    out.m_75.y = _761;
    out.m_75.z = _773;
    float _787 = fma(_737, _340, _769);
    float _789 = _771 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _791 = -_757;
    float _793 = _735 + _791;
    float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _799 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _801 = _655 + _334;
    float _803 = floor(_763);
    float _805 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _807 = _697 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _809 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _811 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _789 * _775;
    float _815 = fma(_779, 2.0, -1.0);
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = _797 * _795;
    float _823 = _815 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _825 = fma(_793, 2.0, -1.0);
    out.m_77.x = _817;
    out.m_77.y = _819;
    out.m_77.z = _811;
    out.m_77.w = _799;
    float _827 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _829 = -_803;
    float _831 = _763 + _829;
    float _833 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _835 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _837 = fma(_831, 2.0, -1.0);
    float _839 = _825 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    out.m_79.x = _813;
    out.m_79.y = _821;
    bool _841 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _843 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _845 = _841 || _843;
    bool _847 = isnan(1.0);
    bool _849 = _845 || _847;
    float _851 = _837 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].x, _827);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].y, _833);
    float _857 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].z, _835);
    float _859 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].x, _853);
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].y, _855);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].z, _857);
    float _865 = _661 + _330;
    float _867 = _859 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _869 = _861 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _871 = _863 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _873 = _657 + _340;
    float _875 = _745 + _867;
    float _877 = _785 + _869;
    float _879 = _787 + _871;
    float _881 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _883 = _745;
    float _885 = _713;
    float _887 = _785;
    float _889 = _785;
    float _891 = _825;
    float _893 = _815;
    float _895 = _819;
    float _897 = _837;
    float _899 = _817;
    float _901 = _723;
    float _911;
    float _913;
    float _915;
    float _917;
    if (!_849)
    {
        bool _903 = _869 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _905 = !_903;
        _907 = _905;
        if (!_907)
        {
            float _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _911 = _909;
            _913 = 0.0;
            _915 = 0.0;
            _917 = 0.0;
            _919 = true;
        }
    }
    if ((!_919) || _907)
    {
        bool _955;
        if (!_907)
        {
            bool _921 = _869 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _923 = isnan(_869);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _929 = _925 || _927;
            bool _931 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _933 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _935 = !_929;
            bool _937 = _933 && _935;
            if (_937)
            {
                _881 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _939 = _881;
            float _941 = _939;
            if (_937)
            {
                _883 = 0.0;
            }
            float _943 = _883;
            _913 = _943;
            if (_937)
            {
                _885 = 0.0;
            }
            float _945 = _885;
            _915 = _945;
            if (_937)
            {
                float _947 = _939 * 5.0;
                _941 = _947;
            }
            float _949 = _941;
            _911 = _949;
            if (_937)
            {
                _887 = 0.0;
            }
            float _951 = _887;
            bool _953 = !_929;
            _955 = _953 && _931;
            _889 = _951;
            _917 = _951;
        }
        if ((!_955) || _907)
        {
            _907 = false;
            float _957 = _889;
            bool _959 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _961 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _963 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _965 = _799;
            float _967 = _957;
            _911 = _879;
            _913 = _875;
            _915 = _877;
            if (_959)
            {
                float _969 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _965 = _969;
            }
            float _971 = _965;
            if (_959)
            {
                float _973 = abs(_825);
                float _975 = -_973;
                float _977 = _975 + 1.0;
                _891 = _977;
            }
            float _979 = _891;
            if (_961)
            {
                float _981 = abs(_815);
                float _983 = -_981;
                float _985 = _983 + 1.0;
                _893 = _985;
            }
            float _987 = _893;
            if (!_959)
            {
                _895 = 1.0;
            }
            float _989 = _895;
            float _991 = _989;
            if (_963)
            {
                float _993 = abs(_837);
                float _995 = -_993;
                float _997 = _995 + 1.0;
                _897 = _997;
            }
            float _999 = _897;
            if (!_961)
            {
                _899 = 1.0;
            }
            float _1001 = _899;
            float _1003 = _1001;
            if (!_963)
            {
                _967 = 1.0;
            }
            float _1005 = _967;
            float _1007 = _811;
            float _1009 = _1005;
            if (_961)
            {
                float _1011 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1007 = _1011;
            }
            float _1013 = _1007;
            float _1015 = _657;
            if (_963)
            {
                float _1017 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1015 = _1017;
            }
            float _1019 = _1015;
            if (_959)
            {
                float _1021 = _979 * _971;
                float _1023 = precise::clamp(_1021, 0.0, 1.0);
                _991 = _1023;
            }
            float _1025 = _991;
            if (_961)
            {
                float _1027 = _987 * _1013;
                float _1029 = precise::clamp(_1027, 0.0, 1.0);
                _1003 = _1029;
            }
            float _1031 = _1003;
            float _1033 = _1025 * _1031;
            if (_963)
            {
                float _1035 = _999 * _1019;
                float _1037 = precise::clamp(_1035, 0.0, 1.0);
                _1009 = _1037;
            }
            float _1039 = _1009;
            float _1041 = _1033 * _1039;
            _917 = _1041;
        }
    }
    _919 = false;
    float _1043 = _911;
    float _1045 = _913;
    float _1047 = _915;
    float _1049 = _917;
    float _1051 = fma(_867, 6.2500002968590706586837768554688e-05, 0.5);
    float _1053 = fma(_871, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3962 = float2(_1051, _1053);
    float _1055 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3962, float2(0.0), isnan(_3962)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3962, float2(0.0), isnan(_3962)), level(0.0)).x;
    float _1057 = in.m_81.w;
    float _1059 = trunc(_1057);
    int _1061 = int(_1059);
    int _1063 = _1061 << 5;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1065)];
    float _1067 = as_type<float>(_dmw0.x);
    int _1069 = _1063 + 4;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    float _1073 = as_type<float>(_dmw0.y);
    int _1075 = _1063 + 8;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    float _1079 = as_type<float>(_dmw0.z);
    int _1081 = _1063 + 12;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    float _1085 = as_type<float>(_dmw0.w);
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1089 = _1043 + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1093 = _1045 + _1091;
    float _1095 = _1089 * _1089;
    float _1097 = fma(_1093, _1093, _1095);
    float _1099 = sqrt(_1097);
    bool _1101 = _1099 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1103 = _1095;
    float _1105 = _1047;
    float _1107 = _1045;
    float _1109 = _1049;
    if (!_1101)
    {
        _1103 = _1043;
    }
    float _1111 = _1103;
    float _1113 = _1085 * 2.0;
    bool _1115 = !_1101;
    float _1117 = _1111;
    if (!_1115)
    {
        float _1119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1123 = _1099 + _1121;
        float _1125 = rsqrt(_1097);
        float _1127 = _1123 * _1119;
        float _1129 = _1047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = _1127 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = _1135 + (-1.0);
        float _1143 = fma(_1139, _1129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1145 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = _1125 * _1143;
        float _1149 = fma(_1135, _1047, _1145);
        float _1151 = fma(_1093, _1147, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1153 = fma(_1089, _1147, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1105 = _1149;
        _1107 = _1151;
        _1117 = _1153;
    }
    float _1155 = _1105;
    float _1157 = _1107;
    float _1159 = _1117;
    float _1161 = _1067 * 2.0;
    float _1163 = _1079 * _1113;
    float _1165 = _1067 * _1067;
    float _1167 = _1067 * _1113;
    float _1169 = _1073 * _1073;
    float _1171 = _1073 * _1113;
    float _1173 = -_1163;
    float _1175 = fma(_1073, _1161, _1173);
    float _1177 = _1073 * 2.0;
    float _1179 = fma(_1073, _1161, _1163);
    float _1181 = fma(_1165, -2.0, 1.0);
    float _1183 = _1079 * _1079;
    float _1185 = fma(_1169, -2.0, 1.0);
    float _1187 = fma(_1079, _1161, _1171);
    float _1189 = -_1171;
    float _1191 = fma(_1079, _1161, _1189);
    float _1193 = -_1167;
    float _1195 = fma(_1079, _1177, _1193);
    float _1197 = fma(_1079, _1177, _1167);
    float _1199 = fma(_1183, -2.0, _1185);
    float _1201 = fma(_1169, -2.0, _1181);
    float _1203 = _869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1205 = _869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = _1055 * 2000.0;
    float _1209 = fma(_1183, -2.0, _1181);
    float _1211 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1203);
    float _1213 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    bool _1215 = _869 >= _1207;
    bool _1217 = isnan(_869);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(_1207);
    bool _1223 = _1219 || _1221;
    float _1225 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1211);
    float _1227 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1229 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1231 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1233 = _1231 + _1229;
    float _1235 = 1.0 / _1229;
    float _1237 = _1207;
    float _1239 = _1157;
    float _1241 = _1159;
    float _1243 = _1225;
    if (_1223)
    {
        _1237 = _1155;
    }
    float _1245 = _1237;
    float _1247 = _1245;
    if (!_1223)
    {
        _1247 = 0.0;
    }
    float _1249 = _1247;
    float _1251 = _1249;
    if (!_1223)
    {
        _1239 = 0.0;
    }
    float _1253 = _1239;
    float _1255 = -_869;
    float _1257 = _1255 + _1249;
    if (!_1223)
    {
        _1251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1259 = _1251;
    float _1261 = -_867;
    float _1263 = _1261 + _1253;
    bool _1265 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan(0.5);
    bool _1273 = _1269 || _1271;
    float _1275 = _1257 * _320;
    if (!_1223)
    {
        float _1277 = _1259 * 5.0;
        _1241 = _1277;
    }
    float _1279 = _1241;
    float _1281 = _1233 * _1235;
    float _1283 = _1281 * 0.5;
    float _1285 = fma(_1263, _310, _1275);
    float _1287 = _1257 * _286;
    float _1289 = -_871;
    float _1291 = _1289 + _1279;
    bool _1293 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    float _1303 = _1257 * _334;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1307 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1305);
    float _1309 = fma(_1263, _282, _1287);
    float _1311 = fma(_1291, _324, _1285);
    float _1313 = fma(_1263, _330, _1303);
    float _1315 = fma(_1291, _290, _1309);
    float _1317 = _1311 * _1175;
    float _1319 = _1311 * _1209;
    float _1321 = _1311 * _1197;
    float _1323 = 1.0 / _1307;
    float _1325 = fma(_1315, _1199, _1317);
    float _1327 = fma(_1291, _340, _1313);
    float _1329 = fma(_1315, _1179, _1319);
    float _1331 = fma(_1315, _1191, _1321);
    if (_1301)
    {
        _1243 = 1.0;
    }
    float _1333 = _1243;
    float _1335 = fma(_1327, _1187, _1325);
    float _1337 = fma(_1327, _1195, _1329);
    float _1339 = fma(_1327, _1201, _1331);
    float _1341 = _867 + _1335;
    float _1343 = _869 + _1337;
    float _1345 = _871 + _1339;
    float _1347 = _1343;
    float _1349 = _1341;
    float _1351 = _1345;
    float _1353 = _1339;
    float _1355 = _1333;
    if (!_1273)
    {
        float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1359 = _869 + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1363 = _867 + _1361;
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1367 = _1359 * _1359;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1371 = _871 + _1369;
        float _1373 = fma(_1363, _1363, _1367);
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1377 = fma(_1371, _1371, _1373);
        float _1379 = sqrt(_1377);
        float _1381 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = precise::min(_1379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1385 = _1383 * _1375;
        float _1387 = _1381 * _1385;
        float _1389 = fma(_1337, _1387, _869);
        float _1391 = fma(_1335, _1387, _867);
        float _1393 = fma(_1339, _1387, _871);
        _294 = _1375;
        _1347 = _1389;
        _1349 = _1391;
        _1351 = _1393;
    }
    float _1395 = _294;
    float _1397 = _1347;
    float _1399 = _1349;
    float _1401 = _1351;
    float _1403 = _1395;
    if (_1301)
    {
        _901 = 1.0;
    }
    float _1405 = _901;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1409 = _1323 * _1407;
    float _1411 = _1405;
    if (!_1301)
    {
        float _1413 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1415 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1423 = _1421 * 0.15915493667125701904296875;
        float _1425 = _1415 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = 1.0 / _1419;
        float _1431 = _1423 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1427 * _1429;
        float _1437 = _1423 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = 1.0 / _1441;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1447 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1445;
        float _1449 = 1.0 / _1447;
        float _1451 = _1439 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1455 = fma(_1409, _1451, _1453);
        float _1457 = _1455 * _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        _1353 = _1423;
        _1403 = _1443;
        _336 = _1415;
        _326 = _1449;
        _1355 = _1459;
    }
    float _1461 = _1353;
    float _1463 = _1403;
    float _1465 = _336;
    float _1467 = _326;
    float _1469 = _1355;
    float _1471 = _1463;
    float _1473 = _1467;
    float _1475 = _1461;
    float _1477 = _1465;
    if (!_1301)
    {
        float _1479 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1481 = _1479 * 0.15915493667125701904296875;
        float _1483 = _1481 * 6.283185482025146484375;
        float _1485 = cos(_1483);
        float _1487 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1489 = _1487 * 0.15915493667125701904296875;
        float _1491 = _1481 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = 1.0 / _1485;
        float _1497 = _1489 * 6.283185482025146484375;
        float _1499 = cos(_1497);
        float _1501 = _1493 * _1495;
        float _1503 = _1489 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = 1.0 / _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1513 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1511;
        float _1515 = 1.0 / _1513;
        float _1517 = _1505 * _1509;
        float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1521 = fma(_1409, _1517, _1519);
        float _1523 = _1521 * _1515;
        float _1525 = precise::clamp(_1523, 0.0, 1.0);
        float _1527 = -_1525;
        float _1529 = _1527 + 1.0;
        _1471 = _1489;
        _1473 = _1509;
        _1475 = _1495;
        _1411 = _1529;
    }
    float _1531 = _1471;
    float _1533 = _1473;
    float _1535 = _1475;
    float _1537 = _1411;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1541 = _1397 + _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1545 = _1399 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1549 = _1401 + _1547;
    float _1551 = _1541 * _1541;
    float _1553 = fma(_1545, _1545, _1551);
    float _1555 = fma(_1549, _1549, _1553);
    float _1557 = rsqrt(_1555);
    float _1559 = sqrt(_1555);
    float _1561 = _1545 * _1557;
    float _1563 = _1549 * _1557;
    float _1565 = _1541 * _1557;
    float _1567 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1569 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1571 = _1567 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 + _1573;
    float _1577 = sqrt(_1575);
    bool _1579 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = _1577 + _1581;
    float _1585 = _1531;
    float _1587 = _1535;
    float _1589 = _1583;
    float _1591 = _1567;
    if (_1579)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1593;
    }
    float _1595 = _1585;
    if (_1579)
    {
        float _1597 = rsqrt(_1575);
        _1587 = _1597;
    }
    float _1599 = _1587;
    float _1601 = _1599;
    if (_1579)
    {
        float _1603 = _1583 * _1595;
        _1589 = _1603;
    }
    float _1605 = _1589;
    if (_1579)
    {
        float _1607 = _1605 * 0.15915493667125701904296875;
        _1477 = _1607;
    }
    float _1609 = _1477;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1613 = _1595;
    if (_1579)
    {
        float _1615 = _1609 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        _1613 = _1617;
    }
    float _1619 = _1613;
    float _1621 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1623 = precise::max(0.0, _1621);
    float _1625 = _1533;
    float _1627 = _1621;
    float _1629 = _1623;
    if (_1579)
    {
        float _1631 = _1609 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        _1625 = _1633;
    }
    float _1635 = _1625;
    float _1637 = -_1565;
    float _1639 = -_1623;
    float _1641 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1639);
    if (_1579)
    {
        float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    float _1647 = _1619;
    float _1649 = _1645;
    if (_1579)
    {
        float _1651 = fma(_1619, _1645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1647 = _1651;
    }
    float _1653 = _1647;
    float _1655 = _1653;
    if (!_1579)
    {
        _1649 = _1641;
    }
    float _1657 = _1649;
    float _1659 = _1657;
    float _1661 = _1635;
    if (_1579)
    {
        float _1663 = _1635 + (-1.0);
        _1629 = _1663;
    }
    float _1665 = _1629;
    float _1667 = 0.0;
    float _1669 = _1665;
    if (_1579)
    {
        float _1671 = _1599 * _1653;
        _1667 = _1671;
    }
    float _1673 = _1667;
    if (!_1579)
    {
        _1655 = _1571;
    }
    float _1675 = _1655;
    float _1677 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1679 = _1675;
    if (_1579)
    {
        float _1681 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1601 = _1681;
    }
    float _1683 = _1601;
    if (_1579)
    {
        float _1685 = _1567 * _1673;
        _1591 = _1685;
    }
    float _1687 = _1591;
    if (!_1579)
    {
        _1669 = _1569;
    }
    float _1689 = _1669;
    float _1691 = _1689;
    if (_1579)
    {
        float _1693 = _1569 * _1673;
        _1691 = _1693;
    }
    float _1695 = _1691;
    if (_1579)
    {
        float _1697 = fma(_1641, _1635, _1683);
        _1659 = _1697;
    }
    float _1699 = _1659;
    if (_1579)
    {
        float _1701 = _1687 * _1687;
        _1679 = _1701;
    }
    float _1703 = _1679;
    if (!_1579)
    {
        _1661 = _1573;
    }
    float _1705 = _1661;
    float _1707 = _1705;
    if (_1579)
    {
        float _1709 = _1695 * _1695;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1715 = fma(_1699, _1699, _1703);
    float _1717 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1677);
    float _1719 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1713);
    float _1721 = _1715 + _1711;
    float _1723 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1727 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1725);
    float _1729 = precise::clamp(_1727, 0.0, 1.0);
    float _1731 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = rsqrt(_1721);
    float _1735 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1737 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1723);
    float _1739 = -_1729;
    float _1741 = _1739 + 1.0;
    float _1743 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1745 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1735);
    float _1747 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1737);
    float _1749 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1751 = abs(_1741);
    float _1753 = log2(_1751);
    float _1755 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1745);
    float _1757 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1759 = -_1749;
    float _1761 = fma(_1759, _1611, 1.0);
    float _1763 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1717);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1769 = _1733 * _1687;
    float _1771 = _1733 * _1699;
    float _1773 = _1733 * _1695;
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1767);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1779 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = log2(_1761);
    float _1783 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    float _1785 = -_1777;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1785);
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1791 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1783);
    float _1795 = -_1773;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1787);
    float _1799 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = exp2(_1789);
    float _1803 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1791);
    float _1805 = fma(_1797, -0.5, 0.5);
    float _1807 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1809 = fma(_1797, 0.5, 0.5);
    float _1811 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1803);
    float _1813 = _1771 + 1.0;
    float _1815 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1817 = 1.0 / _1793;
    float _1819 = fma(_1809, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1821 = _1781 * 0.693147182464599609375;
    float _1823 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1815);
    float _1825 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1811);
    float _1827 = fma(_1809, _1819, -0.212114393711090087890625);
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1831 = sqrt(_1805);
    float _1833 = -_1771;
    float _1835 = fma(_1801, _1813, _1833);
    float _1837 = fma(_1809, _1827, 1.570728778839111328125);
    float _1839 = _1823 * _1817;
    float _1841 = _1825 * _1817;
    float _1843 = fma(_1839, 0.5, 0.5);
    float _1845 = fma(_1841, -0.5, 0.5);
    float _1847 = _1831 * 0.636619746685028076171875;
    float _1849 = -_1837;
    float _1851 = fma(_1847, _1849, 1.0);
    float _1853 = fma(_1835, 0.5, 0.5);
    float3 _5197 = float3(_1843, _1845, _1829);
    float _1855 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5197, float3(0.0), isnan(_5197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5197, float3(0.0), isnan(_5197)), level(0.0)).x;
    float3 _5208 = float3(_1843, _1845, _1829);
    float4 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5208, float3(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5208, float3(0.0), isnan(_5208)), level(0.0)).xyzw;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1858.w;
    float2 _5224 = float2(_1851, _1853);
    float3 _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5224, float2(0.0), isnan(_5224)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5224, float2(0.0), isnan(_5224)), level(0.0)).xyz;
    float _1872 = _1870.x;
    float _1874 = _1870.y;
    float _1876 = _1870.z;
    float _1878 = _801 * _1209;
    out.m_83.x = _1399;
    out.m_83.y = _1397;
    out.m_83.z = _1401;
    bool _1880 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1888 = _1884 || _1886;
    float _1890 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1892 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1894 = _1793;
    float _1896 = _1825;
    float _1898 = _1823;
    if (!_1223)
    {
        _1109 = 0.0;
    }
    float _1900 = _1109;
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1904 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1902);
    float _1906 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1908);
    bool _1912 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1914 = isnan(_1559);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1920 = _1916 || _1918;
    float _1922 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1904);
    float _1924 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    float _1926 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1910);
    float _1928 = _801 * _1175;
    float _1930 = _867 + _1922;
    if (_1888)
    {
        float _1932 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1892 = _1932;
    }
    float _1934 = _1892;
    float _1936 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1938 = _871 + _1926;
    float _1940 = -_1930;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1944 = _801 * _1197;
    float _1946 = _1934;
    if (_1888)
    {
        float _1948 = precise::min(_1934, 20.0);
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = -_1938;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1956 = exp2(_1936);
    float _1958 = precise::min(_1930, _1942);
    float _1960 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1924);
    float _1962 = fma(_865, _1179, _1878);
    float _1964 = precise::min(_1938, _1954);
    float _1966 = fma(_865, _1191, _1944);
    float _1968 = _1954;
    if (!_1888)
    {
        _1968 = 1.0;
    }
    float _1970 = _1968;
    float _1972 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1960);
    float _1974 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1976 = _1970;
    float _1978 = _1972;
    if (_1888)
    {
        float _1980 = 1.0 / _1950;
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = precise::min(_1958, _1964);
    out.gl_Position.x = _1823;
    out.gl_Position.y = _1825;
    out.gl_Position.z = _1972;
    out.gl_Position.w = _1793;
    float _1986 = -_1956;
    float _1988 = _1986 + 1.0;
    float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1888)
    {
        float _1992 = _1984 * _1982;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1976 = _1994;
    }
    float _1996 = _1976;
    float _1998 = fma(_865, _1199, _1928);
    float _2000 = fma(_873, _1195, _1962);
    float _2002 = _1972 + _1793;
    float _2004 = _1900 * _1996;
    float _2006 = fma(_873, _1187, _1998);
    float _2008 = _2002 * 0.5;
    float _2010 = fma(_873, _1201, _1966);
    float _2012 = _1469 * _1537;
    if (!_1920)
    {
        _1894 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2014 = _1894;
    out.m_85.z = _2008;
    out.m_85.w = _1793;
    float _2016 = _2004 * _2012;
    float _2018 = _2016;
    float _2020 = _2014;
    float _2022 = _2014;
    if (!_1920)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2024 = _1978;
    out.m_87.x = _2006;
    out.m_87.y = _2000;
    out.m_87.z = _2010;
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2028 = _2024;
    float _2030 = _2024;
    if (!_1920)
    {
        _1896 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2032 = _1896;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_1920)
    {
        _1898 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2038 = _1898;
    float _2040 = _2038;
    float _2042 = _2038;
    if (!_1920)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2044 = _2018;
    float _2046 = _1990 * _1855;
    float _2048 = -_1990;
    float _2050 = _2048 + 1.0;
    float _2052 = _1866 * _2046;
    float _2054 = _1876 * _2046;
    float _2056 = _1866 * _2050;
    float _2058 = fma(_1872, _2052, _1860);
    float _2060 = fma(_1874, _2052, _1862);
    float _2062 = fma(_1866, _2054, _1864);
    float _2064 = _1860;
    float _2066 = _2044;
    float _2068 = _2044;
    if (!_1920)
    {
        _2064 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2070 = _2064;
    out.m_89.x = _2058;
    out.m_89.y = _2060;
    out.m_89.z = _2062;
    out.m_89.w = _2056;
    bool _2072 = !_1920;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2080 = isnan(_1559);
        bool _2082 = _2078 || _2080;
        bool _2084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2086 = _2082 || _2084;
        if (!_2086)
        {
            float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2090 = _1559 + _2088;
            float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2092;
            float _2096 = 1.0 / _2094;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2118 = _2090 * _2096;
            float _2120 = precise::clamp(_2118, 0.0, 1.0);
            float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2126 = fma(_2120, _2100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2128 = fma(_2120, _2124, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2130 = fma(_2120, _2104, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2132 = fma(_2120, _2108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2134 = fma(_2120, _2112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2136 = fma(_2120, _2116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2022 = _2128;
            _2042 = _2134;
            _2076 = _2126;
            _2036 = _2132;
            _2030 = _2130;
            _2068 = _2136;
            _2138 = true;
        }
        else
        {
            bool _2140 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2142 = isnan(_1559);
            bool _2144 = _2140 || _2142;
            bool _2146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2148 = _2144 || _2146;
            if (!_2148)
            {
                _2074 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2150 = _2074;
            _2076 = _2150;
            if (!_2148)
            {
                _2020 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2152 = _2020;
            _2022 = _2152;
            if (!_2148)
            {
                _2028 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2154 = _2028;
            _2030 = _2154;
            if (!_2148)
            {
                _2034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2156 = _2034;
            _2036 = _2156;
            if (!_2148)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2158 = _2040;
            _2042 = _2158;
            if (!_2148)
            {
                _2066 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2160 = _2066;
            bool _2162 = !_2148;
            _2068 = _2160;
            if (!_2162)
            {
                bool _2164 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2166 = isnan(_1559);
                bool _2168 = _2164 || _2166;
                bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2172 = _2168 || _2170;
                if (!_2172)
                {
                    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2176 = _1559 + _2174;
                    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2178;
                    float _2182 = 1.0 / _2180;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2204 = _2176 * _2182;
                    float _2206 = precise::clamp(_2204, 0.0, 1.0);
                    float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2212 = fma(_2206, _2186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2214 = fma(_2206, _2210, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2216 = fma(_2206, _2190, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2218 = fma(_2206, _2194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2220 = fma(_2206, _2198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2222 = fma(_2206, _2202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2022 = _2214;
                    _2042 = _2220;
                    _2076 = _2212;
                    _2036 = _2218;
                    _2030 = _2216;
                    _2068 = _2222;
                    _2138 = true;
                }
                else
                {
                    _2022 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2076 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2030 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2068 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2138 = false;
    float _2224 = _2022;
    float _2226 = _2042;
    float _2228 = _2076;
    float _2230 = _2036;
    float _2232 = _2030;
    float _2234 = _2068;
    float _2236 = fma(_2000, -0.5, 0.5);
    float _2238 = precise::clamp(_2236, 0.0, 1.0);
    float _2240 = -_2224;
    float _2242 = _2240 + _2226;
    float _2244 = _2026 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2246 = -_2228;
    float _2248 = _2246 + _2230;
    float _2250 = fma(_2238, _2242, _2224);
    out.m_91.x = 0.0;
    float _2252 = -_2232;
    float _2254 = _2252 + _2234;
    float _2256 = fma(_2238, _2248, _2228);
    float _2258 = _2250 * 0.586610972881317138671875;
    out.m_58.x = _2244;
    bool _2260 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2262 = fma(_2238, _2254, _2232);
    float _2264 = fma(_2256, 0.298911988735198974609375, _2258);
    bool _2266 = _1469 > 0.0;
    bool _2268 = isnan(_1469);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan(0.0);
    bool _2274 = _2270 || _2272;
    float _2276 = fma(_2262, 0.114477999508380889892578125, _2264);
    out.m_93.x = 0.0;
    bool _2278 = _1537 <= 0.0;
    bool _2280 = !_2274;
    bool _2282 = _2278 || _2280;
    float _2284 = -_2276;
    float _2286 = _2256 + _2284;
    float _2288 = -_2276;
    float _2290 = _2250 + _2288;
    float _2292 = -_2276;
    float _2294 = _2262 + _2292;
    float _2296 = fma(_2286, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    float _2298 = fma(_2290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    float _2300 = fma(_2294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    bool _2302 = !_2260;
    if (!_2302)
    {
        float _2304 = -_1397;
        float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2308 = -_1399;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2312 = -_1401;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2316 = _2306 * _2306;
        float _2318 = fma(_2310, _2310, _2316);
        float _2320 = fma(_2314, _2314, _2318);
        float _2322 = rsqrt(_2320);
        float _2324 = _2306 * _2322;
        float _2326 = _2310 * _2322;
        float _2328 = _2314 * _2322;
        float _2330 = sqrt(_2320);
        float _2332 = -_1565;
        float _2334 = _2332 + _2324;
        float _2336 = -_1561;
        float _2338 = _2336 + _2326;
        float _2340 = -_1563;
        float _2342 = _2340 + _2328;
        float _2344 = _2334 * _2334;
        float _2346 = fma(_2338, _2338, _2344);
        float _2348 = fma(_2342, _2342, _2346);
        float _2350 = -_2330;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2354 = rsqrt(_2348);
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = abs(_2358);
        float _2362 = log2(_2360);
        float _2364 = _2334 * _2354;
        float _2366 = _2338 * _2354;
        float _2368 = _2342 * _2354;
        float _2370 = _2000 * _2364;
        float _2372 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2374 = precise::clamp(_2372, 0.0, 1.0);
        float _2376 = _2000 * _2324;
        float _2378 = fma(_2006, _2366, _2370);
        float _2380 = _2374 * _2374;
        float _2382 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2384 = fma(_2006, _2326, _2376);
        float _2386 = fma(_2010, _2368, _2378);
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = _2380 + (-1.0);
        float _2392 = fma(_2010, _2328, _2384);
        float _2394 = precise::clamp(_2392, 0.0, 1.0);
        float _2396 = _2388 * _2388;
        float _2398 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2400 = exp2(_2382);
        float _2402 = fma(_2396, _2390, 1.0);
        float _2404 = -_2324;
        float _2406 = -_2398;
        float _2408 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2406);
        float _2410 = _2402 * _2402;
        float _2412 = -_2328;
        float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2408);
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2418 = _2414 + _2416;
        float _2420 = 1.0 / _2410;
        float _2422 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = _2400 * _2424;
        float _2428 = _2394 * _2426;
        float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2432 = _2380 * _2420;
        float _2434 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2436 = _2428 * _2432;
        float _2438 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2440 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2442 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2444 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2430;
        out.m_91.y = _2434;
        out.m_91.z = _2438;
        out.m_93.x = _2440;
        out.m_93.y = _2442;
        out.m_93.z = _2444;
    }
    out.m_95.x = _2296;
    out.m_95.y = _2298;
    out.m_95.z = _2300;
    if (!_2282)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_58.x = 0.0;
    float _2446 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2446;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2138 = false;
    bool _919 = false;
    bool _907 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_130);
        out.gl_Position.z = _2503;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_58.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2571 = as_type<float>(_166);
        out.gl_Position.z = _2571;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = in.m_64.x;
    float _176 = in.m_64.y;
    float _178 = in.m_64.z;
    float _180 = in.m_66.x;
    float _182 = in.m_66.y;
    float _184 = in.m_66.z;
    float _186 = in.m_68.x;
    float _188 = _168 * _168;
    float _190 = _170 * _170;
    float _192 = _172 * _172;
    float _194 = fma(_174, _174, _188);
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _218 = _200;
    float _220 = _216;
    float _222 = _206;
    float _224 = _202;
    float _226 = _204;
    if (_212)
    {
        float _228 = rsqrt(_200);
        _218 = _228;
    }
    float _230 = _218;
    float _232 = _216 * _186;
    bool _234 = _210 > 0.0;
    float _236 = _210;
    if (!_212)
    {
        _236 = 0.0;
        _220 = 0.0;
    }
    float _238 = _236;
    float _240 = _220;
    float _242 = _240;
    float _244 = _238;
    if (!_212)
    {
        _222 = 0.0;
    }
    float _246 = _222;
    float _248 = 0.0;
    float _250 = _246;
    if (!_214)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (_214)
    {
        float _258 = rsqrt(_202);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_234)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_234)
    {
        float _276 = rsqrt(_204);
        _270 = _276;
    }
    float _278 = _270;
    if (_212)
    {
        float _280 = _230 * _174;
        _242 = _280;
    }
    float _282 = _242;
    if (_212)
    {
        float _284 = _230 * _168;
        _244 = _284;
    }
    float _286 = _244;
    if (_212)
    {
        float _288 = _230 * _180;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = _290;
    if (!_214)
    {
        _224 = 0.0;
    }
    float _296 = _224;
    float _298 = trunc(_232);
    int _300 = int(_298);
    float _302 = _296;
    if (!_214)
    {
        _226 = 0.0;
    }
    float _304 = _226;
    float _306 = _304;
    if (_214)
    {
        float _308 = _260 * _176;
        _302 = _308;
    }
    float _310 = _302;
    float _312 = 0.0;
    if (!_234)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (_214)
    {
        float _318 = _260 * _170;
        _306 = _318;
    }
    float _320 = _306;
    if (_214)
    {
        float _322 = _260 * _182;
        _256 = _322;
    }
    float _324 = _256;
    float _326 = _324;
    if (_234)
    {
        float _328 = _278 * _178;
        _316 = _328;
    }
    float _330 = _316;
    if (_234)
    {
        float _332 = _278 * _172;
        _272 = _332;
    }
    float _334 = _272;
    float _336 = _334;
    if (_234)
    {
        float _338 = _278 * _184;
        _274 = _338;
    }
    float _340 = _274;
    int _342 = _300 << 4;
    int _344 = _342 + 1712;
    bool _346 = !_292;
    float _362;
    if (!_346)
    {
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _186 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_114);
        float _368 = 1.0 / _366;
        float _370 = _148 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_55.x;
    float _376 = in.m_55.y;
    float _378 = in.m_55.z;
    float _380 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _382 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _384 = as_type<float>(int(gl_VertexIndex));
    bool _386 = _186 > 0.5;
    float _388 = in.m_68.y;
    float _390 = _380 * _186;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _400 = in.m_62.w;
    float _402 = 1.0 / _394;
    float _404 = 1.0 / _398;
    float _406 = _176 * _376;
    float _408 = _170 * _376;
    float _410 = _182 * _376;
    float _412 = fma(_174, _374, _406);
    int _414 = as_type<int>(_384) & 1;
    bool _416 = _414 != 0;
    int _418 = as_type<int>(_384) & 2;
    bool _420 = _418 != 0;
    float _422 = fma(_168, _374, _408);
    float _424 = in.m_73.x;
    float _426 = in.m_73.y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _434 = _432 != 0;
    float _436 = fma(_180, _374, _410);
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _440 = _438 != 0;
    float _442 = in.m_64.w;
    float _444 = 1.0 / _430;
    bool _446 = _388 > 0.5;
    float _448 = fma(_178, _378, _412);
    float _450 = in.m_66.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _454 = _372 + _452;
    float _456 = fma(_172, _378, _422);
    float _458 = trunc(_390);
    int _460 = int(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _470;
    float _474 = fma(_184, _378, _436);
    float _476 = _464 * _402;
    float _478 = _468 * _404;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _372 + _480;
    float _484 = _472 * _444;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _372 + _486;
    float _490 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _492 = fma(_476, _482, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _494 = fma(_484, _454, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _496 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _498 = isnan(_372);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_478, _488, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _510 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_372);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _456 + _400;
    bool _524 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_372);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _448 + _442;
    bool _538 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_372);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _474 + _450;
    float _552 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = -_520;
    float _556 = _554 + 1.0;
    float _558 = -_548;
    float _560 = _558 + 1.0;
    bool _562 = !_420;
    float _564 = _562 ? (-0.5) : 0.5;
    float _566 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _568 = !_416;
    float _570 = _568 ? (-0.5) : 0.5;
    float _572 = -_506;
    float _574 = _572 + 1.0;
    float _576 = _534 * _560;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    int _580 = _460 << 4;
    int _582 = _580 + 1968;
    float _584 = _548 * _556;
    float _586 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _570);
    float _590 = _566 * _578;
    float _592 = _520 * _574;
    float _594 = _492 * _576;
    float _596 = -_570;
    int _598 = _386 ? as_type<int>(_596) : as_type<int>(_570);
    uint _601 = uint(int(uint(_582) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[int(_611)][_613];
    float _617 = _564 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _619 = _586 * _588;
    float _621 = -_564;
    int _623 = _446 ? as_type<int>(_621) : as_type<int>(_564);
    float _625 = _522 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _627 = !_434;
    float _629 = _627 ? _570 : as_type<float>(_598);
    float _631 = _570 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _633 = _617 * _310;
    int _635 = _582 + 8;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[int(_639)][_641];
    float _645 = _617 * _320;
    float _647 = _617 * _324;
    bool _649 = !_440;
    float _651 = _649 ? _564 : as_type<float>(_623);
    float _653 = _536 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _655 = fma(_631, _286, _645);
    float _657 = fma(_631, _290, _647);
    float _659 = _550 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _661 = fma(_631, _282, _633);
    float _663 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    int _665 = _344 + 8;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _677 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _679 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].x, _663);
    float _681 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _683 = -_534;
    float _685 = _683 + 1.0;
    float _687 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].y, _677);
    float _689 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].x, _679);
    uint _691 = uint(int(uint(_344) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[int(_701)][_703];
    float _707 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].z, _681);
    float _709 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].y, _687);
    float _711 = _689 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _713 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _715 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].z, _707);
    float _717 = _709 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _719 = _711 * _382;
    float _721 = _590 * _310;
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _725 = _717 * _675;
    float _727 = _715 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _729 = fma(_619, _282, _721);
    float _731 = fma(_508, _584, _713);
    float _733 = fma(_725, 0.5, 0.5);
    float _735 = fma(_719, 0.5, 0.5);
    float _737 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _739 = fma(_494, _592, _731);
    float _741 = floor(_733);
    float _743 = _590 * _320;
    float _745 = fma(_737, _330, _729);
    float _747 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[118].x, _739);
    float _749 = _607 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _751 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _753 = _590 * _324;
    float _755 = _727 * _723;
    float _757 = floor(_735);
    float _759 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = fma(_755, 0.5, 0.5);
    float _765 = _643 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _767 = fma(_619, _286, _743);
    float _769 = fma(_619, _290, _753);
    float _771 = _629 + 0.5;
    float _773 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _777 = -_741;
    float _779 = _733 + _777;
    float _781 = -_651;
    float _783 = _781 + 0.5;
    float _785 = fma(_737, _334, _767);
    out.m_75.x = _759;
    out.m_75.y = _761;
    out.m_75.z = _773;
    float _787 = fma(_737, _340, _769);
    float _789 = _771 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _791 = -_757;
    float _793 = _735 + _791;
    float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _799 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _801 = _655 + _334;
    float _803 = floor(_763);
    float _805 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _807 = _697 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _809 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _811 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _789 * _775;
    float _815 = fma(_779, 2.0, -1.0);
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = _797 * _795;
    float _823 = _815 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _825 = fma(_793, 2.0, -1.0);
    out.m_77.x = _817;
    out.m_77.y = _819;
    out.m_77.z = _811;
    out.m_77.w = _799;
    float _827 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _829 = -_803;
    float _831 = _763 + _829;
    float _833 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _835 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _837 = fma(_831, 2.0, -1.0);
    float _839 = _825 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    out.m_79.x = _813;
    out.m_79.y = _821;
    bool _841 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _843 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _845 = _841 || _843;
    bool _847 = isnan(1.0);
    bool _849 = _845 || _847;
    float _851 = _837 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].x, _827);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].y, _833);
    float _857 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].z, _835);
    float _859 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].x, _853);
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].y, _855);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].z, _857);
    float _865 = _661 + _330;
    float _867 = _859 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _869 = _861 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _871 = _863 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _873 = _657 + _340;
    float _875 = _745 + _867;
    float _877 = _785 + _869;
    float _879 = _787 + _871;
    float _881 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _883 = _745;
    float _885 = _713;
    float _887 = _785;
    float _889 = _785;
    float _891 = _825;
    float _893 = _815;
    float _895 = _819;
    float _897 = _837;
    float _899 = _817;
    float _901 = _723;
    float _911;
    float _913;
    float _915;
    float _917;
    if (!_849)
    {
        bool _903 = _869 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _905 = !_903;
        _907 = _905;
        if (!_907)
        {
            float _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _911 = _909;
            _913 = 0.0;
            _915 = 0.0;
            _917 = 0.0;
            _919 = true;
        }
    }
    if ((!_919) || _907)
    {
        bool _955;
        if (!_907)
        {
            bool _921 = _869 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _923 = isnan(_869);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _929 = _925 || _927;
            bool _931 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _933 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _935 = !_929;
            bool _937 = _933 && _935;
            if (_937)
            {
                _881 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _939 = _881;
            float _941 = _939;
            if (_937)
            {
                _883 = 0.0;
            }
            float _943 = _883;
            _913 = _943;
            if (_937)
            {
                _885 = 0.0;
            }
            float _945 = _885;
            _915 = _945;
            if (_937)
            {
                float _947 = _939 * 5.0;
                _941 = _947;
            }
            float _949 = _941;
            _911 = _949;
            if (_937)
            {
                _887 = 0.0;
            }
            float _951 = _887;
            bool _953 = !_929;
            _955 = _953 && _931;
            _889 = _951;
            _917 = _951;
        }
        if ((!_955) || _907)
        {
            _907 = false;
            float _957 = _889;
            bool _959 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _961 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _963 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _965 = _799;
            float _967 = _957;
            _911 = _879;
            _913 = _875;
            _915 = _877;
            if (_959)
            {
                float _969 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _965 = _969;
            }
            float _971 = _965;
            if (_959)
            {
                float _973 = abs(_825);
                float _975 = -_973;
                float _977 = _975 + 1.0;
                _891 = _977;
            }
            float _979 = _891;
            if (_961)
            {
                float _981 = abs(_815);
                float _983 = -_981;
                float _985 = _983 + 1.0;
                _893 = _985;
            }
            float _987 = _893;
            if (!_959)
            {
                _895 = 1.0;
            }
            float _989 = _895;
            float _991 = _989;
            if (_963)
            {
                float _993 = abs(_837);
                float _995 = -_993;
                float _997 = _995 + 1.0;
                _897 = _997;
            }
            float _999 = _897;
            if (!_961)
            {
                _899 = 1.0;
            }
            float _1001 = _899;
            float _1003 = _1001;
            if (!_963)
            {
                _967 = 1.0;
            }
            float _1005 = _967;
            float _1007 = _811;
            float _1009 = _1005;
            if (_961)
            {
                float _1011 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1007 = _1011;
            }
            float _1013 = _1007;
            float _1015 = _657;
            if (_963)
            {
                float _1017 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1015 = _1017;
            }
            float _1019 = _1015;
            if (_959)
            {
                float _1021 = _979 * _971;
                float _1023 = precise::clamp(_1021, 0.0, 1.0);
                _991 = _1023;
            }
            float _1025 = _991;
            if (_961)
            {
                float _1027 = _987 * _1013;
                float _1029 = precise::clamp(_1027, 0.0, 1.0);
                _1003 = _1029;
            }
            float _1031 = _1003;
            float _1033 = _1025 * _1031;
            if (_963)
            {
                float _1035 = _999 * _1019;
                float _1037 = precise::clamp(_1035, 0.0, 1.0);
                _1009 = _1037;
            }
            float _1039 = _1009;
            float _1041 = _1033 * _1039;
            _917 = _1041;
        }
    }
    _919 = false;
    float _1043 = _911;
    float _1045 = _913;
    float _1047 = _915;
    float _1049 = _917;
    float _1051 = fma(_867, 6.2500002968590706586837768554688e-05, 0.5);
    float _1053 = fma(_871, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3962 = float2(_1051, _1053);
    float _1055 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3962, float2(0.0), isnan(_3962)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3962, float2(0.0), isnan(_3962)), level(0.0)).x;
    float _1057 = in.m_81.w;
    float _1059 = trunc(_1057);
    int _1061 = int(_1059);
    int _1063 = _1061 << 5;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1065)];
    float _1067 = as_type<float>(_dmw0.x);
    int _1069 = _1063 + 4;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    float _1073 = as_type<float>(_dmw0.y);
    int _1075 = _1063 + 8;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    float _1079 = as_type<float>(_dmw0.z);
    int _1081 = _1063 + 12;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    float _1085 = as_type<float>(_dmw0.w);
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1089 = _1043 + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1093 = _1045 + _1091;
    float _1095 = _1089 * _1089;
    float _1097 = fma(_1093, _1093, _1095);
    float _1099 = sqrt(_1097);
    bool _1101 = _1099 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1103 = _1095;
    float _1105 = _1047;
    float _1107 = _1045;
    float _1109 = _1049;
    if (!_1101)
    {
        _1103 = _1043;
    }
    float _1111 = _1103;
    float _1113 = _1085 * 2.0;
    bool _1115 = !_1101;
    float _1117 = _1111;
    if (!_1115)
    {
        float _1119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1123 = _1099 + _1121;
        float _1125 = rsqrt(_1097);
        float _1127 = _1123 * _1119;
        float _1129 = _1047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = _1127 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = _1135 + (-1.0);
        float _1143 = fma(_1139, _1129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1145 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = _1125 * _1143;
        float _1149 = fma(_1135, _1047, _1145);
        float _1151 = fma(_1093, _1147, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1153 = fma(_1089, _1147, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1105 = _1149;
        _1107 = _1151;
        _1117 = _1153;
    }
    float _1155 = _1105;
    float _1157 = _1107;
    float _1159 = _1117;
    float _1161 = _1067 * 2.0;
    float _1163 = _1079 * _1113;
    float _1165 = _1067 * _1067;
    float _1167 = _1067 * _1113;
    float _1169 = _1073 * _1073;
    float _1171 = _1073 * _1113;
    float _1173 = -_1163;
    float _1175 = fma(_1073, _1161, _1173);
    float _1177 = _1073 * 2.0;
    float _1179 = fma(_1073, _1161, _1163);
    float _1181 = fma(_1165, -2.0, 1.0);
    float _1183 = _1079 * _1079;
    float _1185 = fma(_1169, -2.0, 1.0);
    float _1187 = fma(_1079, _1161, _1171);
    float _1189 = -_1171;
    float _1191 = fma(_1079, _1161, _1189);
    float _1193 = -_1167;
    float _1195 = fma(_1079, _1177, _1193);
    float _1197 = fma(_1079, _1177, _1167);
    float _1199 = fma(_1183, -2.0, _1185);
    float _1201 = fma(_1169, -2.0, _1181);
    float _1203 = _869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1205 = _869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = _1055 * 2000.0;
    float _1209 = fma(_1183, -2.0, _1181);
    float _1211 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1203);
    float _1213 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    bool _1215 = _869 >= _1207;
    bool _1217 = isnan(_869);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(_1207);
    bool _1223 = _1219 || _1221;
    float _1225 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1211);
    float _1227 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1229 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1231 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1233 = _1231 + _1229;
    float _1235 = 1.0 / _1229;
    float _1237 = _1207;
    float _1239 = _1157;
    float _1241 = _1159;
    float _1243 = _1225;
    if (_1223)
    {
        _1237 = _1155;
    }
    float _1245 = _1237;
    float _1247 = _1245;
    if (!_1223)
    {
        _1247 = 0.0;
    }
    float _1249 = _1247;
    float _1251 = _1249;
    if (!_1223)
    {
        _1239 = 0.0;
    }
    float _1253 = _1239;
    float _1255 = -_869;
    float _1257 = _1255 + _1249;
    if (!_1223)
    {
        _1251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1259 = _1251;
    float _1261 = -_867;
    float _1263 = _1261 + _1253;
    bool _1265 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan(0.5);
    bool _1273 = _1269 || _1271;
    float _1275 = _1257 * _320;
    if (!_1223)
    {
        float _1277 = _1259 * 5.0;
        _1241 = _1277;
    }
    float _1279 = _1241;
    float _1281 = _1233 * _1235;
    float _1283 = _1281 * 0.5;
    float _1285 = fma(_1263, _310, _1275);
    float _1287 = _1257 * _286;
    float _1289 = -_871;
    float _1291 = _1289 + _1279;
    bool _1293 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    float _1303 = _1257 * _334;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1307 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1305);
    float _1309 = fma(_1263, _282, _1287);
    float _1311 = fma(_1291, _324, _1285);
    float _1313 = fma(_1263, _330, _1303);
    float _1315 = fma(_1291, _290, _1309);
    float _1317 = _1311 * _1175;
    float _1319 = _1311 * _1209;
    float _1321 = _1311 * _1197;
    float _1323 = 1.0 / _1307;
    float _1325 = fma(_1315, _1199, _1317);
    float _1327 = fma(_1291, _340, _1313);
    float _1329 = fma(_1315, _1179, _1319);
    float _1331 = fma(_1315, _1191, _1321);
    if (_1301)
    {
        _1243 = 1.0;
    }
    float _1333 = _1243;
    float _1335 = fma(_1327, _1187, _1325);
    float _1337 = fma(_1327, _1195, _1329);
    float _1339 = fma(_1327, _1201, _1331);
    float _1341 = _867 + _1335;
    float _1343 = _869 + _1337;
    float _1345 = _871 + _1339;
    float _1347 = _1343;
    float _1349 = _1341;
    float _1351 = _1345;
    float _1353 = _1339;
    float _1355 = _1333;
    if (!_1273)
    {
        float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1359 = _869 + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1363 = _867 + _1361;
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1367 = _1359 * _1359;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1371 = _871 + _1369;
        float _1373 = fma(_1363, _1363, _1367);
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1377 = fma(_1371, _1371, _1373);
        float _1379 = sqrt(_1377);
        float _1381 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = precise::min(_1379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1385 = _1383 * _1375;
        float _1387 = _1381 * _1385;
        float _1389 = fma(_1337, _1387, _869);
        float _1391 = fma(_1335, _1387, _867);
        float _1393 = fma(_1339, _1387, _871);
        _294 = _1375;
        _1347 = _1389;
        _1349 = _1391;
        _1351 = _1393;
    }
    float _1395 = _294;
    float _1397 = _1347;
    float _1399 = _1349;
    float _1401 = _1351;
    float _1403 = _1395;
    if (_1301)
    {
        _901 = 1.0;
    }
    float _1405 = _901;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1409 = _1323 * _1407;
    float _1411 = _1405;
    if (!_1301)
    {
        float _1413 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1415 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1423 = _1421 * 0.15915493667125701904296875;
        float _1425 = _1415 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = 1.0 / _1419;
        float _1431 = _1423 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1427 * _1429;
        float _1437 = _1423 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = 1.0 / _1441;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1447 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1445;
        float _1449 = 1.0 / _1447;
        float _1451 = _1439 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1455 = fma(_1409, _1451, _1453);
        float _1457 = _1455 * _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        _1353 = _1423;
        _1403 = _1443;
        _336 = _1415;
        _326 = _1449;
        _1355 = _1459;
    }
    float _1461 = _1353;
    float _1463 = _1403;
    float _1465 = _336;
    float _1467 = _326;
    float _1469 = _1355;
    float _1471 = _1463;
    float _1473 = _1467;
    float _1475 = _1461;
    float _1477 = _1465;
    if (!_1301)
    {
        float _1479 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1481 = _1479 * 0.15915493667125701904296875;
        float _1483 = _1481 * 6.283185482025146484375;
        float _1485 = cos(_1483);
        float _1487 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1489 = _1487 * 0.15915493667125701904296875;
        float _1491 = _1481 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = 1.0 / _1485;
        float _1497 = _1489 * 6.283185482025146484375;
        float _1499 = cos(_1497);
        float _1501 = _1493 * _1495;
        float _1503 = _1489 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = 1.0 / _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1513 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1511;
        float _1515 = 1.0 / _1513;
        float _1517 = _1505 * _1509;
        float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1521 = fma(_1409, _1517, _1519);
        float _1523 = _1521 * _1515;
        float _1525 = precise::clamp(_1523, 0.0, 1.0);
        float _1527 = -_1525;
        float _1529 = _1527 + 1.0;
        _1471 = _1489;
        _1473 = _1509;
        _1475 = _1495;
        _1411 = _1529;
    }
    float _1531 = _1471;
    float _1533 = _1473;
    float _1535 = _1475;
    float _1537 = _1411;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1541 = _1397 + _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1545 = _1399 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1549 = _1401 + _1547;
    float _1551 = _1541 * _1541;
    float _1553 = fma(_1545, _1545, _1551);
    float _1555 = fma(_1549, _1549, _1553);
    float _1557 = rsqrt(_1555);
    float _1559 = sqrt(_1555);
    float _1561 = _1545 * _1557;
    float _1563 = _1549 * _1557;
    float _1565 = _1541 * _1557;
    float _1567 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1569 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1571 = _1567 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 + _1573;
    float _1577 = sqrt(_1575);
    bool _1579 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = _1577 + _1581;
    float _1585 = _1531;
    float _1587 = _1535;
    float _1589 = _1583;
    float _1591 = _1567;
    if (_1579)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1593;
    }
    float _1595 = _1585;
    if (_1579)
    {
        float _1597 = rsqrt(_1575);
        _1587 = _1597;
    }
    float _1599 = _1587;
    float _1601 = _1599;
    if (_1579)
    {
        float _1603 = _1583 * _1595;
        _1589 = _1603;
    }
    float _1605 = _1589;
    if (_1579)
    {
        float _1607 = _1605 * 0.15915493667125701904296875;
        _1477 = _1607;
    }
    float _1609 = _1477;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1613 = _1595;
    if (_1579)
    {
        float _1615 = _1609 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        _1613 = _1617;
    }
    float _1619 = _1613;
    float _1621 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1623 = precise::max(0.0, _1621);
    float _1625 = _1533;
    float _1627 = _1621;
    float _1629 = _1623;
    if (_1579)
    {
        float _1631 = _1609 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        _1625 = _1633;
    }
    float _1635 = _1625;
    float _1637 = -_1565;
    float _1639 = -_1623;
    float _1641 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1639);
    if (_1579)
    {
        float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    float _1647 = _1619;
    float _1649 = _1645;
    if (_1579)
    {
        float _1651 = fma(_1619, _1645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1647 = _1651;
    }
    float _1653 = _1647;
    float _1655 = _1653;
    if (!_1579)
    {
        _1649 = _1641;
    }
    float _1657 = _1649;
    float _1659 = _1657;
    float _1661 = _1635;
    if (_1579)
    {
        float _1663 = _1635 + (-1.0);
        _1629 = _1663;
    }
    float _1665 = _1629;
    float _1667 = 0.0;
    float _1669 = _1665;
    if (_1579)
    {
        float _1671 = _1599 * _1653;
        _1667 = _1671;
    }
    float _1673 = _1667;
    if (!_1579)
    {
        _1655 = _1571;
    }
    float _1675 = _1655;
    float _1677 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1679 = _1675;
    if (_1579)
    {
        float _1681 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1601 = _1681;
    }
    float _1683 = _1601;
    if (_1579)
    {
        float _1685 = _1567 * _1673;
        _1591 = _1685;
    }
    float _1687 = _1591;
    if (!_1579)
    {
        _1669 = _1569;
    }
    float _1689 = _1669;
    float _1691 = _1689;
    if (_1579)
    {
        float _1693 = _1569 * _1673;
        _1691 = _1693;
    }
    float _1695 = _1691;
    if (_1579)
    {
        float _1697 = fma(_1641, _1635, _1683);
        _1659 = _1697;
    }
    float _1699 = _1659;
    if (_1579)
    {
        float _1701 = _1687 * _1687;
        _1679 = _1701;
    }
    float _1703 = _1679;
    if (!_1579)
    {
        _1661 = _1573;
    }
    float _1705 = _1661;
    float _1707 = _1705;
    if (_1579)
    {
        float _1709 = _1695 * _1695;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1715 = fma(_1699, _1699, _1703);
    float _1717 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1677);
    float _1719 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1713);
    float _1721 = _1715 + _1711;
    float _1723 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1727 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1725);
    float _1729 = precise::clamp(_1727, 0.0, 1.0);
    float _1731 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = rsqrt(_1721);
    float _1735 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1737 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1723);
    float _1739 = -_1729;
    float _1741 = _1739 + 1.0;
    float _1743 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1745 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1735);
    float _1747 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1737);
    float _1749 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1751 = abs(_1741);
    float _1753 = log2(_1751);
    float _1755 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1745);
    float _1757 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1759 = -_1749;
    float _1761 = fma(_1759, _1611, 1.0);
    float _1763 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1717);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1769 = _1733 * _1687;
    float _1771 = _1733 * _1699;
    float _1773 = _1733 * _1695;
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1767);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1779 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = log2(_1761);
    float _1783 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    float _1785 = -_1777;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1785);
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1791 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1783);
    float _1795 = -_1773;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1787);
    float _1799 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = exp2(_1789);
    float _1803 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1791);
    float _1805 = fma(_1797, -0.5, 0.5);
    float _1807 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1809 = fma(_1797, 0.5, 0.5);
    float _1811 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1803);
    float _1813 = _1771 + 1.0;
    float _1815 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1817 = 1.0 / _1793;
    float _1819 = fma(_1809, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1821 = _1781 * 0.693147182464599609375;
    float _1823 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1815);
    float _1825 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1811);
    float _1827 = fma(_1809, _1819, -0.212114393711090087890625);
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1831 = sqrt(_1805);
    float _1833 = -_1771;
    float _1835 = fma(_1801, _1813, _1833);
    float _1837 = fma(_1809, _1827, 1.570728778839111328125);
    float _1839 = _1823 * _1817;
    float _1841 = _1825 * _1817;
    float _1843 = fma(_1839, 0.5, 0.5);
    float _1845 = fma(_1841, -0.5, 0.5);
    float _1847 = _1831 * 0.636619746685028076171875;
    float _1849 = -_1837;
    float _1851 = fma(_1847, _1849, 1.0);
    float _1853 = fma(_1835, 0.5, 0.5);
    float3 _5197 = float3(_1843, _1845, _1829);
    float _1855 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5197, float3(0.0), isnan(_5197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5197, float3(0.0), isnan(_5197)), level(0.0)).x;
    float3 _5208 = float3(_1843, _1845, _1829);
    float4 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5208, float3(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5208, float3(0.0), isnan(_5208)), level(0.0)).xyzw;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1858.w;
    float2 _5224 = float2(_1851, _1853);
    float3 _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5224, float2(0.0), isnan(_5224)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5224, float2(0.0), isnan(_5224)), level(0.0)).xyz;
    float _1872 = _1870.x;
    float _1874 = _1870.y;
    float _1876 = _1870.z;
    float _1878 = _801 * _1209;
    out.m_83.x = _1399;
    out.m_83.y = _1397;
    out.m_83.z = _1401;
    bool _1880 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1888 = _1884 || _1886;
    float _1890 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1892 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1894 = _1793;
    float _1896 = _1825;
    float _1898 = _1823;
    if (!_1223)
    {
        _1109 = 0.0;
    }
    float _1900 = _1109;
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1904 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1902);
    float _1906 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1908);
    bool _1912 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1914 = isnan(_1559);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1920 = _1916 || _1918;
    float _1922 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1904);
    float _1924 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    float _1926 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1910);
    float _1928 = _801 * _1175;
    float _1930 = _867 + _1922;
    if (_1888)
    {
        float _1932 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1892 = _1932;
    }
    float _1934 = _1892;
    float _1936 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1938 = _871 + _1926;
    float _1940 = -_1930;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1944 = _801 * _1197;
    float _1946 = _1934;
    if (_1888)
    {
        float _1948 = precise::min(_1934, 20.0);
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = -_1938;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1956 = exp2(_1936);
    float _1958 = precise::min(_1930, _1942);
    float _1960 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1924);
    float _1962 = fma(_865, _1179, _1878);
    float _1964 = precise::min(_1938, _1954);
    float _1966 = fma(_865, _1191, _1944);
    float _1968 = _1954;
    if (!_1888)
    {
        _1968 = 1.0;
    }
    float _1970 = _1968;
    float _1972 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1960);
    float _1974 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1976 = _1970;
    float _1978 = _1972;
    if (_1888)
    {
        float _1980 = 1.0 / _1950;
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = precise::min(_1958, _1964);
    out.gl_Position.x = _1823;
    out.gl_Position.y = _1825;
    out.gl_Position.z = _1972;
    out.gl_Position.w = _1793;
    float _1986 = -_1956;
    float _1988 = _1986 + 1.0;
    float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1888)
    {
        float _1992 = _1984 * _1982;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1976 = _1994;
    }
    float _1996 = _1976;
    float _1998 = fma(_865, _1199, _1928);
    float _2000 = fma(_873, _1195, _1962);
    float _2002 = _1972 + _1793;
    float _2004 = _1900 * _1996;
    float _2006 = fma(_873, _1187, _1998);
    float _2008 = _2002 * 0.5;
    float _2010 = fma(_873, _1201, _1966);
    float _2012 = _1469 * _1537;
    if (!_1920)
    {
        _1894 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2014 = _1894;
    out.m_85.z = _2008;
    out.m_85.w = _1793;
    float _2016 = _2004 * _2012;
    float _2018 = _2016;
    float _2020 = _2014;
    float _2022 = _2014;
    if (!_1920)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2024 = _1978;
    out.m_87.x = _2006;
    out.m_87.y = _2000;
    out.m_87.z = _2010;
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2028 = _2024;
    float _2030 = _2024;
    if (!_1920)
    {
        _1896 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2032 = _1896;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_1920)
    {
        _1898 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2038 = _1898;
    float _2040 = _2038;
    float _2042 = _2038;
    if (!_1920)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2044 = _2018;
    float _2046 = _1990 * _1855;
    float _2048 = -_1990;
    float _2050 = _2048 + 1.0;
    float _2052 = _1866 * _2046;
    float _2054 = _1876 * _2046;
    float _2056 = _1866 * _2050;
    float _2058 = fma(_1872, _2052, _1860);
    float _2060 = fma(_1874, _2052, _1862);
    float _2062 = fma(_1866, _2054, _1864);
    float _2064 = _1860;
    float _2066 = _2044;
    float _2068 = _2044;
    if (!_1920)
    {
        _2064 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2070 = _2064;
    out.m_89.x = _2058;
    out.m_89.y = _2060;
    out.m_89.z = _2062;
    out.m_89.w = _2056;
    bool _2072 = !_1920;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2080 = isnan(_1559);
        bool _2082 = _2078 || _2080;
        bool _2084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2086 = _2082 || _2084;
        if (!_2086)
        {
            float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2090 = _1559 + _2088;
            float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2092;
            float _2096 = 1.0 / _2094;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2118 = _2090 * _2096;
            float _2120 = precise::clamp(_2118, 0.0, 1.0);
            float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2126 = fma(_2120, _2100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2128 = fma(_2120, _2124, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2130 = fma(_2120, _2104, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2132 = fma(_2120, _2108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2134 = fma(_2120, _2112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2136 = fma(_2120, _2116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2022 = _2128;
            _2042 = _2134;
            _2076 = _2126;
            _2036 = _2132;
            _2030 = _2130;
            _2068 = _2136;
            _2138 = true;
        }
        else
        {
            bool _2140 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2142 = isnan(_1559);
            bool _2144 = _2140 || _2142;
            bool _2146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2148 = _2144 || _2146;
            if (!_2148)
            {
                _2074 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2150 = _2074;
            _2076 = _2150;
            if (!_2148)
            {
                _2020 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2152 = _2020;
            _2022 = _2152;
            if (!_2148)
            {
                _2028 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2154 = _2028;
            _2030 = _2154;
            if (!_2148)
            {
                _2034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2156 = _2034;
            _2036 = _2156;
            if (!_2148)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2158 = _2040;
            _2042 = _2158;
            if (!_2148)
            {
                _2066 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2160 = _2066;
            bool _2162 = !_2148;
            _2068 = _2160;
            if (!_2162)
            {
                bool _2164 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2166 = isnan(_1559);
                bool _2168 = _2164 || _2166;
                bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2172 = _2168 || _2170;
                if (!_2172)
                {
                    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2176 = _1559 + _2174;
                    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2178;
                    float _2182 = 1.0 / _2180;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2204 = _2176 * _2182;
                    float _2206 = precise::clamp(_2204, 0.0, 1.0);
                    float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2212 = fma(_2206, _2186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2214 = fma(_2206, _2210, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2216 = fma(_2206, _2190, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2218 = fma(_2206, _2194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2220 = fma(_2206, _2198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2222 = fma(_2206, _2202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2022 = _2214;
                    _2042 = _2220;
                    _2076 = _2212;
                    _2036 = _2218;
                    _2030 = _2216;
                    _2068 = _2222;
                    _2138 = true;
                }
                else
                {
                    _2022 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2076 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2030 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2068 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2138 = false;
    float _2224 = _2022;
    float _2226 = _2042;
    float _2228 = _2076;
    float _2230 = _2036;
    float _2232 = _2030;
    float _2234 = _2068;
    float _2236 = fma(_2000, -0.5, 0.5);
    float _2238 = precise::clamp(_2236, 0.0, 1.0);
    float _2240 = -_2224;
    float _2242 = _2240 + _2226;
    float _2244 = _2026 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2246 = -_2228;
    float _2248 = _2246 + _2230;
    float _2250 = fma(_2238, _2242, _2224);
    out.m_91.x = 0.0;
    float _2252 = -_2232;
    float _2254 = _2252 + _2234;
    float _2256 = fma(_2238, _2248, _2228);
    float _2258 = _2250 * 0.586610972881317138671875;
    out.m_58.x = _2244;
    bool _2260 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2262 = fma(_2238, _2254, _2232);
    float _2264 = fma(_2256, 0.298911988735198974609375, _2258);
    bool _2266 = _1469 > 0.0;
    bool _2268 = isnan(_1469);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan(0.0);
    bool _2274 = _2270 || _2272;
    float _2276 = fma(_2262, 0.114477999508380889892578125, _2264);
    out.m_93.x = 0.0;
    bool _2278 = _1537 <= 0.0;
    bool _2280 = !_2274;
    bool _2282 = _2278 || _2280;
    float _2284 = -_2276;
    float _2286 = _2256 + _2284;
    float _2288 = -_2276;
    float _2290 = _2250 + _2288;
    float _2292 = -_2276;
    float _2294 = _2262 + _2292;
    float _2296 = fma(_2286, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    float _2298 = fma(_2290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    float _2300 = fma(_2294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    bool _2302 = !_2260;
    if (!_2302)
    {
        float _2304 = -_1397;
        float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2308 = -_1399;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2312 = -_1401;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2316 = _2306 * _2306;
        float _2318 = fma(_2310, _2310, _2316);
        float _2320 = fma(_2314, _2314, _2318);
        float _2322 = rsqrt(_2320);
        float _2324 = _2306 * _2322;
        float _2326 = _2310 * _2322;
        float _2328 = _2314 * _2322;
        float _2330 = sqrt(_2320);
        float _2332 = -_1565;
        float _2334 = _2332 + _2324;
        float _2336 = -_1561;
        float _2338 = _2336 + _2326;
        float _2340 = -_1563;
        float _2342 = _2340 + _2328;
        float _2344 = _2334 * _2334;
        float _2346 = fma(_2338, _2338, _2344);
        float _2348 = fma(_2342, _2342, _2346);
        float _2350 = -_2330;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2354 = rsqrt(_2348);
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = abs(_2358);
        float _2362 = log2(_2360);
        float _2364 = _2334 * _2354;
        float _2366 = _2338 * _2354;
        float _2368 = _2342 * _2354;
        float _2370 = _2000 * _2364;
        float _2372 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2374 = precise::clamp(_2372, 0.0, 1.0);
        float _2376 = _2000 * _2324;
        float _2378 = fma(_2006, _2366, _2370);
        float _2380 = _2374 * _2374;
        float _2382 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2384 = fma(_2006, _2326, _2376);
        float _2386 = fma(_2010, _2368, _2378);
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = _2380 + (-1.0);
        float _2392 = fma(_2010, _2328, _2384);
        float _2394 = precise::clamp(_2392, 0.0, 1.0);
        float _2396 = _2388 * _2388;
        float _2398 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2400 = exp2(_2382);
        float _2402 = fma(_2396, _2390, 1.0);
        float _2404 = -_2324;
        float _2406 = -_2398;
        float _2408 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2406);
        float _2410 = _2402 * _2402;
        float _2412 = -_2328;
        float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2408);
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2418 = _2414 + _2416;
        float _2420 = 1.0 / _2410;
        float _2422 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = _2400 * _2424;
        float _2428 = _2394 * _2426;
        float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2432 = _2380 * _2420;
        float _2434 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2436 = _2428 * _2432;
        float _2438 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2440 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2442 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2444 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2430;
        out.m_91.y = _2434;
        out.m_91.z = _2438;
        out.m_93.x = _2440;
        out.m_93.y = _2442;
        out.m_93.z = _2444;
    }
    out.m_95.x = _2296;
    out.m_95.y = _2298;
    out.m_95.z = _2300;
    if (!_2282)
    {
        return out;
    }
    out.m_58.x = 0.0;
    float _2446 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2446;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2138 = false;
    bool _919 = false;
    bool _907 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_130);
        out.gl_Position.z = _2503;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_58.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2571 = as_type<float>(_166);
        out.gl_Position.z = _2571;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = in.m_64.x;
    float _176 = in.m_64.y;
    float _178 = in.m_64.z;
    float _180 = in.m_66.x;
    float _182 = in.m_66.y;
    float _184 = in.m_66.z;
    float _186 = in.m_68.x;
    float _188 = _168 * _168;
    float _190 = _170 * _170;
    float _192 = _172 * _172;
    float _194 = fma(_174, _174, _188);
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _218 = _200;
    float _220 = _216;
    float _222 = _206;
    float _224 = _202;
    float _226 = _204;
    if (_212)
    {
        float _228 = rsqrt(_200);
        _218 = _228;
    }
    float _230 = _218;
    float _232 = _216 * _186;
    bool _234 = _210 > 0.0;
    float _236 = _210;
    if (!_212)
    {
        _236 = 0.0;
        _220 = 0.0;
    }
    float _238 = _236;
    float _240 = _220;
    float _242 = _240;
    float _244 = _238;
    if (!_212)
    {
        _222 = 0.0;
    }
    float _246 = _222;
    float _248 = 0.0;
    float _250 = _246;
    if (!_214)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (_214)
    {
        float _258 = rsqrt(_202);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_234)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_234)
    {
        float _276 = rsqrt(_204);
        _270 = _276;
    }
    float _278 = _270;
    if (_212)
    {
        float _280 = _230 * _174;
        _242 = _280;
    }
    float _282 = _242;
    if (_212)
    {
        float _284 = _230 * _168;
        _244 = _284;
    }
    float _286 = _244;
    if (_212)
    {
        float _288 = _230 * _180;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = _290;
    if (!_214)
    {
        _224 = 0.0;
    }
    float _296 = _224;
    float _298 = trunc(_232);
    int _300 = int(_298);
    float _302 = _296;
    if (!_214)
    {
        _226 = 0.0;
    }
    float _304 = _226;
    float _306 = _304;
    if (_214)
    {
        float _308 = _260 * _176;
        _302 = _308;
    }
    float _310 = _302;
    float _312 = 0.0;
    if (!_234)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (_214)
    {
        float _318 = _260 * _170;
        _306 = _318;
    }
    float _320 = _306;
    if (_214)
    {
        float _322 = _260 * _182;
        _256 = _322;
    }
    float _324 = _256;
    float _326 = _324;
    if (_234)
    {
        float _328 = _278 * _178;
        _316 = _328;
    }
    float _330 = _316;
    if (_234)
    {
        float _332 = _278 * _172;
        _272 = _332;
    }
    float _334 = _272;
    float _336 = _334;
    if (_234)
    {
        float _338 = _278 * _184;
        _274 = _338;
    }
    float _340 = _274;
    int _342 = _300 << 4;
    int _344 = _342 + 1712;
    bool _346 = !_292;
    float _362;
    if (!_346)
    {
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _186 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_114);
        float _368 = 1.0 / _366;
        float _370 = _148 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_55.x;
    float _376 = in.m_55.y;
    float _378 = in.m_55.z;
    float _380 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _382 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _384 = as_type<float>(int(gl_VertexIndex));
    bool _386 = _186 > 0.5;
    float _388 = in.m_68.y;
    float _390 = _380 * _186;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _400 = in.m_62.w;
    float _402 = 1.0 / _394;
    float _404 = 1.0 / _398;
    float _406 = _176 * _376;
    float _408 = _170 * _376;
    float _410 = _182 * _376;
    float _412 = fma(_174, _374, _406);
    int _414 = as_type<int>(_384) & 1;
    bool _416 = _414 != 0;
    int _418 = as_type<int>(_384) & 2;
    bool _420 = _418 != 0;
    float _422 = fma(_168, _374, _408);
    float _424 = in.m_73.x;
    float _426 = in.m_73.y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _434 = _432 != 0;
    float _436 = fma(_180, _374, _410);
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _440 = _438 != 0;
    float _442 = in.m_64.w;
    float _444 = 1.0 / _430;
    bool _446 = _388 > 0.5;
    float _448 = fma(_178, _378, _412);
    float _450 = in.m_66.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _454 = _372 + _452;
    float _456 = fma(_172, _378, _422);
    float _458 = trunc(_390);
    int _460 = int(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _470;
    float _474 = fma(_184, _378, _436);
    float _476 = _464 * _402;
    float _478 = _468 * _404;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _482 = _372 + _480;
    float _484 = _472 * _444;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _372 + _486;
    float _490 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _492 = fma(_476, _482, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _494 = fma(_484, _454, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _496 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _498 = isnan(_372);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_478, _488, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _510 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_372);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _456 + _400;
    bool _524 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_372);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _448 + _442;
    bool _538 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_372);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _474 + _450;
    float _552 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = -_520;
    float _556 = _554 + 1.0;
    float _558 = -_548;
    float _560 = _558 + 1.0;
    bool _562 = !_420;
    float _564 = _562 ? (-0.5) : 0.5;
    float _566 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _568 = !_416;
    float _570 = _568 ? (-0.5) : 0.5;
    float _572 = -_506;
    float _574 = _572 + 1.0;
    float _576 = _534 * _560;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    int _580 = _460 << 4;
    int _582 = _580 + 1968;
    float _584 = _548 * _556;
    float _586 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _588 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _570);
    float _590 = _566 * _578;
    float _592 = _520 * _574;
    float _594 = _492 * _576;
    float _596 = -_570;
    int _598 = _386 ? as_type<int>(_596) : as_type<int>(_570);
    uint _601 = uint(int(uint(_582) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[int(_611)][_613];
    float _617 = _564 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _619 = _586 * _588;
    float _621 = -_564;
    int _623 = _446 ? as_type<int>(_621) : as_type<int>(_564);
    float _625 = _522 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _627 = !_434;
    float _629 = _627 ? _570 : as_type<float>(_598);
    float _631 = _570 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _633 = _617 * _310;
    int _635 = _582 + 8;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[int(_639)][_641];
    float _645 = _617 * _320;
    float _647 = _617 * _324;
    bool _649 = !_440;
    float _651 = _649 ? _564 : as_type<float>(_623);
    float _653 = _536 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _655 = fma(_631, _286, _645);
    float _657 = fma(_631, _290, _647);
    float _659 = _550 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _661 = fma(_631, _282, _633);
    float _663 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    int _665 = _344 + 8;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _677 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _679 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].x, _663);
    float _681 = _625 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _683 = -_534;
    float _685 = _683 + 1.0;
    float _687 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].y, _677);
    float _689 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].x, _679);
    uint _691 = uint(int(uint(_344) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[int(_701)][_703];
    float _707 = fma(_653, (*spvDescriptorSet0.vp_c12)._m0[6].z, _681);
    float _709 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].y, _687);
    float _711 = _689 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _713 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _715 = fma(_659, (*spvDescriptorSet0.vp_c12)._m0[8].z, _707);
    float _717 = _709 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _719 = _711 * _382;
    float _721 = _590 * _310;
    float _723 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _725 = _717 * _675;
    float _727 = _715 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _729 = fma(_619, _282, _721);
    float _731 = fma(_508, _584, _713);
    float _733 = fma(_725, 0.5, 0.5);
    float _735 = fma(_719, 0.5, 0.5);
    float _737 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _739 = fma(_494, _592, _731);
    float _741 = floor(_733);
    float _743 = _590 * _320;
    float _745 = fma(_737, _330, _729);
    float _747 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[118].x, _739);
    float _749 = _607 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _751 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _753 = _590 * _324;
    float _755 = _727 * _723;
    float _757 = floor(_735);
    float _759 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = fma(_755, 0.5, 0.5);
    float _765 = _643 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _767 = fma(_619, _286, _743);
    float _769 = fma(_619, _290, _753);
    float _771 = _629 + 0.5;
    float _773 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _777 = -_741;
    float _779 = _733 + _777;
    float _781 = -_651;
    float _783 = _781 + 0.5;
    float _785 = fma(_737, _334, _767);
    out.m_75.x = _759;
    out.m_75.y = _761;
    out.m_75.z = _773;
    float _787 = fma(_737, _340, _769);
    float _789 = _771 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _791 = -_757;
    float _793 = _735 + _791;
    float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _797 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _799 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _801 = _655 + _334;
    float _803 = floor(_763);
    float _805 = _673 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _807 = _697 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _809 = _705 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _811 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _789 * _775;
    float _815 = fma(_779, 2.0, -1.0);
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = _797 * _795;
    float _823 = _815 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _825 = fma(_793, 2.0, -1.0);
    out.m_77.x = _817;
    out.m_77.y = _819;
    out.m_77.z = _811;
    out.m_77.w = _799;
    float _827 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _829 = -_803;
    float _831 = _763 + _829;
    float _833 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _835 = _823 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _837 = fma(_831, 2.0, -1.0);
    float _839 = _825 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    out.m_79.x = _813;
    out.m_79.y = _821;
    bool _841 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _843 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _845 = _841 || _843;
    bool _847 = isnan(1.0);
    bool _849 = _845 || _847;
    float _851 = _837 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].x, _827);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].y, _833);
    float _857 = fma(_839, (*spvDescriptorSet0.vp_c12)._m0[2].z, _835);
    float _859 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].x, _853);
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].y, _855);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c12)._m0[4].z, _857);
    float _865 = _661 + _330;
    float _867 = _859 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _869 = _861 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _871 = _863 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _873 = _657 + _340;
    float _875 = _745 + _867;
    float _877 = _785 + _869;
    float _879 = _787 + _871;
    float _881 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _883 = _745;
    float _885 = _713;
    float _887 = _785;
    float _889 = _785;
    float _891 = _825;
    float _893 = _815;
    float _895 = _819;
    float _897 = _837;
    float _899 = _817;
    float _901 = _723;
    float _911;
    float _913;
    float _915;
    float _917;
    if (!_849)
    {
        bool _903 = _869 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _905 = !_903;
        _907 = _905;
        if (!_907)
        {
            float _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _911 = _909;
            _913 = 0.0;
            _915 = 0.0;
            _917 = 0.0;
            _919 = true;
        }
    }
    if ((!_919) || _907)
    {
        bool _955;
        if (!_907)
        {
            bool _921 = _869 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _923 = isnan(_869);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _929 = _925 || _927;
            bool _931 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _933 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _935 = !_929;
            bool _937 = _933 && _935;
            if (_937)
            {
                _881 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _939 = _881;
            float _941 = _939;
            if (_937)
            {
                _883 = 0.0;
            }
            float _943 = _883;
            _913 = _943;
            if (_937)
            {
                _885 = 0.0;
            }
            float _945 = _885;
            _915 = _945;
            if (_937)
            {
                float _947 = _939 * 5.0;
                _941 = _947;
            }
            float _949 = _941;
            _911 = _949;
            if (_937)
            {
                _887 = 0.0;
            }
            float _951 = _887;
            bool _953 = !_929;
            _955 = _953 && _931;
            _889 = _951;
            _917 = _951;
        }
        if ((!_955) || _907)
        {
            _907 = false;
            float _957 = _889;
            bool _959 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _961 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _963 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _965 = _799;
            float _967 = _957;
            _911 = _879;
            _913 = _875;
            _915 = _877;
            if (_959)
            {
                float _969 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _965 = _969;
            }
            float _971 = _965;
            if (_959)
            {
                float _973 = abs(_825);
                float _975 = -_973;
                float _977 = _975 + 1.0;
                _891 = _977;
            }
            float _979 = _891;
            if (_961)
            {
                float _981 = abs(_815);
                float _983 = -_981;
                float _985 = _983 + 1.0;
                _893 = _985;
            }
            float _987 = _893;
            if (!_959)
            {
                _895 = 1.0;
            }
            float _989 = _895;
            float _991 = _989;
            if (_963)
            {
                float _993 = abs(_837);
                float _995 = -_993;
                float _997 = _995 + 1.0;
                _897 = _997;
            }
            float _999 = _897;
            if (!_961)
            {
                _899 = 1.0;
            }
            float _1001 = _899;
            float _1003 = _1001;
            if (!_963)
            {
                _967 = 1.0;
            }
            float _1005 = _967;
            float _1007 = _811;
            float _1009 = _1005;
            if (_961)
            {
                float _1011 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1007 = _1011;
            }
            float _1013 = _1007;
            float _1015 = _657;
            if (_963)
            {
                float _1017 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1015 = _1017;
            }
            float _1019 = _1015;
            if (_959)
            {
                float _1021 = _979 * _971;
                float _1023 = precise::clamp(_1021, 0.0, 1.0);
                _991 = _1023;
            }
            float _1025 = _991;
            if (_961)
            {
                float _1027 = _987 * _1013;
                float _1029 = precise::clamp(_1027, 0.0, 1.0);
                _1003 = _1029;
            }
            float _1031 = _1003;
            float _1033 = _1025 * _1031;
            if (_963)
            {
                float _1035 = _999 * _1019;
                float _1037 = precise::clamp(_1035, 0.0, 1.0);
                _1009 = _1037;
            }
            float _1039 = _1009;
            float _1041 = _1033 * _1039;
            _917 = _1041;
        }
    }
    _919 = false;
    float _1043 = _911;
    float _1045 = _913;
    float _1047 = _915;
    float _1049 = _917;
    float _1051 = fma(_867, 6.2500002968590706586837768554688e-05, 0.5);
    float _1053 = fma(_871, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3962 = float2(_1051, _1053);
    float _1055 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3962, float2(0.0), isnan(_3962)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3962, float2(0.0), isnan(_3962)), level(0.0)).x;
    float _1057 = in.m_81.w;
    float _1059 = trunc(_1057);
    int _1061 = int(_1059);
    int _1063 = _1061 << 5;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1065)];
    float _1067 = as_type<float>(_dmw0.x);
    int _1069 = _1063 + 4;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    float _1073 = as_type<float>(_dmw0.y);
    int _1075 = _1063 + 8;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    float _1079 = as_type<float>(_dmw0.z);
    int _1081 = _1063 + 12;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    float _1085 = as_type<float>(_dmw0.w);
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1089 = _1043 + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1093 = _1045 + _1091;
    float _1095 = _1089 * _1089;
    float _1097 = fma(_1093, _1093, _1095);
    float _1099 = sqrt(_1097);
    bool _1101 = _1099 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1103 = _1095;
    float _1105 = _1047;
    float _1107 = _1045;
    float _1109 = _1049;
    if (!_1101)
    {
        _1103 = _1043;
    }
    float _1111 = _1103;
    float _1113 = _1085 * 2.0;
    bool _1115 = !_1101;
    float _1117 = _1111;
    if (!_1115)
    {
        float _1119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1123 = _1099 + _1121;
        float _1125 = rsqrt(_1097);
        float _1127 = _1123 * _1119;
        float _1129 = _1047 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = _1127 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = _1135 + (-1.0);
        float _1143 = fma(_1139, _1129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1145 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = _1125 * _1143;
        float _1149 = fma(_1135, _1047, _1145);
        float _1151 = fma(_1093, _1147, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1153 = fma(_1089, _1147, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1105 = _1149;
        _1107 = _1151;
        _1117 = _1153;
    }
    float _1155 = _1105;
    float _1157 = _1107;
    float _1159 = _1117;
    float _1161 = _1067 * 2.0;
    float _1163 = _1079 * _1113;
    float _1165 = _1067 * _1067;
    float _1167 = _1067 * _1113;
    float _1169 = _1073 * _1073;
    float _1171 = _1073 * _1113;
    float _1173 = -_1163;
    float _1175 = fma(_1073, _1161, _1173);
    float _1177 = _1073 * 2.0;
    float _1179 = fma(_1073, _1161, _1163);
    float _1181 = fma(_1165, -2.0, 1.0);
    float _1183 = _1079 * _1079;
    float _1185 = fma(_1169, -2.0, 1.0);
    float _1187 = fma(_1079, _1161, _1171);
    float _1189 = -_1171;
    float _1191 = fma(_1079, _1161, _1189);
    float _1193 = -_1167;
    float _1195 = fma(_1079, _1177, _1193);
    float _1197 = fma(_1079, _1177, _1167);
    float _1199 = fma(_1183, -2.0, _1185);
    float _1201 = fma(_1169, -2.0, _1181);
    float _1203 = _869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1205 = _869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = _1055 * 2000.0;
    float _1209 = fma(_1183, -2.0, _1181);
    float _1211 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1203);
    float _1213 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    bool _1215 = _869 >= _1207;
    bool _1217 = isnan(_869);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan(_1207);
    bool _1223 = _1219 || _1221;
    float _1225 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1211);
    float _1227 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1229 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1231 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1233 = _1231 + _1229;
    float _1235 = 1.0 / _1229;
    float _1237 = _1207;
    float _1239 = _1157;
    float _1241 = _1159;
    float _1243 = _1225;
    if (_1223)
    {
        _1237 = _1155;
    }
    float _1245 = _1237;
    float _1247 = _1245;
    if (!_1223)
    {
        _1247 = 0.0;
    }
    float _1249 = _1247;
    float _1251 = _1249;
    if (!_1223)
    {
        _1239 = 0.0;
    }
    float _1253 = _1239;
    float _1255 = -_869;
    float _1257 = _1255 + _1249;
    if (!_1223)
    {
        _1251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1259 = _1251;
    float _1261 = -_867;
    float _1263 = _1261 + _1253;
    bool _1265 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan(0.5);
    bool _1273 = _1269 || _1271;
    float _1275 = _1257 * _320;
    if (!_1223)
    {
        float _1277 = _1259 * 5.0;
        _1241 = _1277;
    }
    float _1279 = _1241;
    float _1281 = _1233 * _1235;
    float _1283 = _1281 * 0.5;
    float _1285 = fma(_1263, _310, _1275);
    float _1287 = _1257 * _286;
    float _1289 = -_871;
    float _1291 = _1289 + _1279;
    bool _1293 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    float _1303 = _1257 * _334;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1307 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1305);
    float _1309 = fma(_1263, _282, _1287);
    float _1311 = fma(_1291, _324, _1285);
    float _1313 = fma(_1263, _330, _1303);
    float _1315 = fma(_1291, _290, _1309);
    float _1317 = _1311 * _1175;
    float _1319 = _1311 * _1209;
    float _1321 = _1311 * _1197;
    float _1323 = 1.0 / _1307;
    float _1325 = fma(_1315, _1199, _1317);
    float _1327 = fma(_1291, _340, _1313);
    float _1329 = fma(_1315, _1179, _1319);
    float _1331 = fma(_1315, _1191, _1321);
    if (_1301)
    {
        _1243 = 1.0;
    }
    float _1333 = _1243;
    float _1335 = fma(_1327, _1187, _1325);
    float _1337 = fma(_1327, _1195, _1329);
    float _1339 = fma(_1327, _1201, _1331);
    float _1341 = _867 + _1335;
    float _1343 = _869 + _1337;
    float _1345 = _871 + _1339;
    float _1347 = _1343;
    float _1349 = _1341;
    float _1351 = _1345;
    float _1353 = _1339;
    float _1355 = _1333;
    if (!_1273)
    {
        float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1359 = _869 + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1363 = _867 + _1361;
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1367 = _1359 * _1359;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1371 = _871 + _1369;
        float _1373 = fma(_1363, _1363, _1367);
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1377 = fma(_1371, _1371, _1373);
        float _1379 = sqrt(_1377);
        float _1381 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = precise::min(_1379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1385 = _1383 * _1375;
        float _1387 = _1381 * _1385;
        float _1389 = fma(_1337, _1387, _869);
        float _1391 = fma(_1335, _1387, _867);
        float _1393 = fma(_1339, _1387, _871);
        _294 = _1375;
        _1347 = _1389;
        _1349 = _1391;
        _1351 = _1393;
    }
    float _1395 = _294;
    float _1397 = _1347;
    float _1399 = _1349;
    float _1401 = _1351;
    float _1403 = _1395;
    if (_1301)
    {
        _901 = 1.0;
    }
    float _1405 = _901;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1409 = _1323 * _1407;
    float _1411 = _1405;
    if (!_1301)
    {
        float _1413 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1415 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1423 = _1421 * 0.15915493667125701904296875;
        float _1425 = _1415 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = 1.0 / _1419;
        float _1431 = _1423 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1427 * _1429;
        float _1437 = _1423 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = 1.0 / _1441;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1447 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1445;
        float _1449 = 1.0 / _1447;
        float _1451 = _1439 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1455 = fma(_1409, _1451, _1453);
        float _1457 = _1455 * _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        _1353 = _1423;
        _1403 = _1443;
        _336 = _1415;
        _326 = _1449;
        _1355 = _1459;
    }
    float _1461 = _1353;
    float _1463 = _1403;
    float _1465 = _336;
    float _1467 = _326;
    float _1469 = _1355;
    float _1471 = _1463;
    float _1473 = _1467;
    float _1475 = _1461;
    float _1477 = _1465;
    if (!_1301)
    {
        float _1479 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1481 = _1479 * 0.15915493667125701904296875;
        float _1483 = _1481 * 6.283185482025146484375;
        float _1485 = cos(_1483);
        float _1487 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1489 = _1487 * 0.15915493667125701904296875;
        float _1491 = _1481 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = 1.0 / _1485;
        float _1497 = _1489 * 6.283185482025146484375;
        float _1499 = cos(_1497);
        float _1501 = _1493 * _1495;
        float _1503 = _1489 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1499 * _1501;
        float _1509 = 1.0 / _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1513 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1511;
        float _1515 = 1.0 / _1513;
        float _1517 = _1505 * _1509;
        float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1521 = fma(_1409, _1517, _1519);
        float _1523 = _1521 * _1515;
        float _1525 = precise::clamp(_1523, 0.0, 1.0);
        float _1527 = -_1525;
        float _1529 = _1527 + 1.0;
        _1471 = _1489;
        _1473 = _1509;
        _1475 = _1495;
        _1411 = _1529;
    }
    float _1531 = _1471;
    float _1533 = _1473;
    float _1535 = _1475;
    float _1537 = _1411;
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1541 = _1397 + _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1545 = _1399 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1549 = _1401 + _1547;
    float _1551 = _1541 * _1541;
    float _1553 = fma(_1545, _1545, _1551);
    float _1555 = fma(_1549, _1549, _1553);
    float _1557 = rsqrt(_1555);
    float _1559 = sqrt(_1555);
    float _1561 = _1545 * _1557;
    float _1563 = _1549 * _1557;
    float _1565 = _1541 * _1557;
    float _1567 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1569 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1571 = _1567 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 + _1573;
    float _1577 = sqrt(_1575);
    bool _1579 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = _1577 + _1581;
    float _1585 = _1531;
    float _1587 = _1535;
    float _1589 = _1583;
    float _1591 = _1567;
    if (_1579)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1593;
    }
    float _1595 = _1585;
    if (_1579)
    {
        float _1597 = rsqrt(_1575);
        _1587 = _1597;
    }
    float _1599 = _1587;
    float _1601 = _1599;
    if (_1579)
    {
        float _1603 = _1583 * _1595;
        _1589 = _1603;
    }
    float _1605 = _1589;
    if (_1579)
    {
        float _1607 = _1605 * 0.15915493667125701904296875;
        _1477 = _1607;
    }
    float _1609 = _1477;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1613 = _1595;
    if (_1579)
    {
        float _1615 = _1609 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        _1613 = _1617;
    }
    float _1619 = _1613;
    float _1621 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1623 = precise::max(0.0, _1621);
    float _1625 = _1533;
    float _1627 = _1621;
    float _1629 = _1623;
    if (_1579)
    {
        float _1631 = _1609 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        _1625 = _1633;
    }
    float _1635 = _1625;
    float _1637 = -_1565;
    float _1639 = -_1623;
    float _1641 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1639);
    if (_1579)
    {
        float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    float _1647 = _1619;
    float _1649 = _1645;
    if (_1579)
    {
        float _1651 = fma(_1619, _1645, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1647 = _1651;
    }
    float _1653 = _1647;
    float _1655 = _1653;
    if (!_1579)
    {
        _1649 = _1641;
    }
    float _1657 = _1649;
    float _1659 = _1657;
    float _1661 = _1635;
    if (_1579)
    {
        float _1663 = _1635 + (-1.0);
        _1629 = _1663;
    }
    float _1665 = _1629;
    float _1667 = 0.0;
    float _1669 = _1665;
    if (_1579)
    {
        float _1671 = _1599 * _1653;
        _1667 = _1671;
    }
    float _1673 = _1667;
    if (!_1579)
    {
        _1655 = _1571;
    }
    float _1675 = _1655;
    float _1677 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1679 = _1675;
    if (_1579)
    {
        float _1681 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1601 = _1681;
    }
    float _1683 = _1601;
    if (_1579)
    {
        float _1685 = _1567 * _1673;
        _1591 = _1685;
    }
    float _1687 = _1591;
    if (!_1579)
    {
        _1669 = _1569;
    }
    float _1689 = _1669;
    float _1691 = _1689;
    if (_1579)
    {
        float _1693 = _1569 * _1673;
        _1691 = _1693;
    }
    float _1695 = _1691;
    if (_1579)
    {
        float _1697 = fma(_1641, _1635, _1683);
        _1659 = _1697;
    }
    float _1699 = _1659;
    if (_1579)
    {
        float _1701 = _1687 * _1687;
        _1679 = _1701;
    }
    float _1703 = _1679;
    if (!_1579)
    {
        _1661 = _1573;
    }
    float _1705 = _1661;
    float _1707 = _1705;
    if (_1579)
    {
        float _1709 = _1695 * _1695;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1715 = fma(_1699, _1699, _1703);
    float _1717 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1677);
    float _1719 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1713);
    float _1721 = _1715 + _1711;
    float _1723 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1727 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1725);
    float _1729 = precise::clamp(_1727, 0.0, 1.0);
    float _1731 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = rsqrt(_1721);
    float _1735 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1737 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1723);
    float _1739 = -_1729;
    float _1741 = _1739 + 1.0;
    float _1743 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1745 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1735);
    float _1747 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1737);
    float _1749 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1751 = abs(_1741);
    float _1753 = log2(_1751);
    float _1755 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1745);
    float _1757 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1759 = -_1749;
    float _1761 = fma(_1759, _1611, 1.0);
    float _1763 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1717);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1769 = _1733 * _1687;
    float _1771 = _1733 * _1699;
    float _1773 = _1733 * _1695;
    float _1775 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1767);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1779 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = log2(_1761);
    float _1783 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    float _1785 = -_1777;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1785);
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1791 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1783);
    float _1795 = -_1773;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1787);
    float _1799 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1801 = exp2(_1789);
    float _1803 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1791);
    float _1805 = fma(_1797, -0.5, 0.5);
    float _1807 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1799);
    float _1809 = fma(_1797, 0.5, 0.5);
    float _1811 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1803);
    float _1813 = _1771 + 1.0;
    float _1815 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1817 = 1.0 / _1793;
    float _1819 = fma(_1809, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1821 = _1781 * 0.693147182464599609375;
    float _1823 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1815);
    float _1825 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1811);
    float _1827 = fma(_1809, _1819, -0.212114393711090087890625);
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1831 = sqrt(_1805);
    float _1833 = -_1771;
    float _1835 = fma(_1801, _1813, _1833);
    float _1837 = fma(_1809, _1827, 1.570728778839111328125);
    float _1839 = _1823 * _1817;
    float _1841 = _1825 * _1817;
    float _1843 = fma(_1839, 0.5, 0.5);
    float _1845 = fma(_1841, -0.5, 0.5);
    float _1847 = _1831 * 0.636619746685028076171875;
    float _1849 = -_1837;
    float _1851 = fma(_1847, _1849, 1.0);
    float _1853 = fma(_1835, 0.5, 0.5);
    float3 _5197 = float3(_1843, _1845, _1829);
    float _1855 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5197, float3(0.0), isnan(_5197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5197, float3(0.0), isnan(_5197)), level(0.0)).x;
    float3 _5208 = float3(_1843, _1845, _1829);
    float4 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5208, float3(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5208, float3(0.0), isnan(_5208)), level(0.0)).xyzw;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1858.w;
    float2 _5224 = float2(_1851, _1853);
    float3 _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5224, float2(0.0), isnan(_5224)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5224, float2(0.0), isnan(_5224)), level(0.0)).xyz;
    float _1872 = _1870.x;
    float _1874 = _1870.y;
    float _1876 = _1870.z;
    float _1878 = _801 * _1209;
    out.m_83.x = _1399;
    out.m_83.y = _1397;
    out.m_83.z = _1401;
    bool _1880 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1888 = _1884 || _1886;
    float _1890 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1892 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1894 = _1793;
    float _1896 = _1825;
    float _1898 = _1823;
    if (!_1223)
    {
        _1109 = 0.0;
    }
    float _1900 = _1109;
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1904 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1902);
    float _1906 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1908);
    bool _1912 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1914 = isnan(_1559);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1920 = _1916 || _1918;
    float _1922 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1904);
    float _1924 = fma(_1765, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    float _1926 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1910);
    float _1928 = _801 * _1175;
    float _1930 = _867 + _1922;
    if (_1888)
    {
        float _1932 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1892 = _1932;
    }
    float _1934 = _1892;
    float _1936 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1938 = _871 + _1926;
    float _1940 = -_1930;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1944 = _801 * _1197;
    float _1946 = _1934;
    if (_1888)
    {
        float _1948 = precise::min(_1934, 20.0);
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = -_1938;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1956 = exp2(_1936);
    float _1958 = precise::min(_1930, _1942);
    float _1960 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1924);
    float _1962 = fma(_865, _1179, _1878);
    float _1964 = precise::min(_1938, _1954);
    float _1966 = fma(_865, _1191, _1944);
    float _1968 = _1954;
    if (!_1888)
    {
        _1968 = 1.0;
    }
    float _1970 = _1968;
    float _1972 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1960);
    float _1974 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1976 = _1970;
    float _1978 = _1972;
    if (_1888)
    {
        float _1980 = 1.0 / _1950;
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = precise::min(_1958, _1964);
    out.gl_Position.x = _1823;
    out.gl_Position.y = _1825;
    out.gl_Position.z = _1972;
    out.gl_Position.w = _1793;
    float _1986 = -_1956;
    float _1988 = _1986 + 1.0;
    float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1888)
    {
        float _1992 = _1984 * _1982;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1976 = _1994;
    }
    float _1996 = _1976;
    float _1998 = fma(_865, _1199, _1928);
    float _2000 = fma(_873, _1195, _1962);
    float _2002 = _1972 + _1793;
    float _2004 = _1900 * _1996;
    float _2006 = fma(_873, _1187, _1998);
    float _2008 = _2002 * 0.5;
    float _2010 = fma(_873, _1201, _1966);
    float _2012 = _1469 * _1537;
    if (!_1920)
    {
        _1894 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2014 = _1894;
    out.m_85.z = _2008;
    out.m_85.w = _1793;
    float _2016 = _2004 * _2012;
    float _2018 = _2016;
    float _2020 = _2014;
    float _2022 = _2014;
    if (!_1920)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2024 = _1978;
    out.m_87.x = _2006;
    out.m_87.y = _2000;
    out.m_87.z = _2010;
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2028 = _2024;
    float _2030 = _2024;
    if (!_1920)
    {
        _1896 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2032 = _1896;
    float _2034 = _2032;
    float _2036 = _2032;
    if (!_1920)
    {
        _1898 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2038 = _1898;
    float _2040 = _2038;
    float _2042 = _2038;
    if (!_1920)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2044 = _2018;
    float _2046 = _1990 * _1855;
    float _2048 = -_1990;
    float _2050 = _2048 + 1.0;
    float _2052 = _1866 * _2046;
    float _2054 = _1876 * _2046;
    float _2056 = _1866 * _2050;
    float _2058 = fma(_1872, _2052, _1860);
    float _2060 = fma(_1874, _2052, _1862);
    float _2062 = fma(_1866, _2054, _1864);
    float _2064 = _1860;
    float _2066 = _2044;
    float _2068 = _2044;
    if (!_1920)
    {
        _2064 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2070 = _2064;
    out.m_89.x = _2058;
    out.m_89.y = _2060;
    out.m_89.z = _2062;
    out.m_89.w = _2056;
    bool _2072 = !_1920;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2080 = isnan(_1559);
        bool _2082 = _2078 || _2080;
        bool _2084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2086 = _2082 || _2084;
        if (!_2086)
        {
            float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2090 = _1559 + _2088;
            float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2092;
            float _2096 = 1.0 / _2094;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2118 = _2090 * _2096;
            float _2120 = precise::clamp(_2118, 0.0, 1.0);
            float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2126 = fma(_2120, _2100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2128 = fma(_2120, _2124, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2130 = fma(_2120, _2104, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2132 = fma(_2120, _2108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2134 = fma(_2120, _2112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2136 = fma(_2120, _2116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2022 = _2128;
            _2042 = _2134;
            _2076 = _2126;
            _2036 = _2132;
            _2030 = _2130;
            _2068 = _2136;
            _2138 = true;
        }
        else
        {
            bool _2140 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2142 = isnan(_1559);
            bool _2144 = _2140 || _2142;
            bool _2146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2148 = _2144 || _2146;
            if (!_2148)
            {
                _2074 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2150 = _2074;
            _2076 = _2150;
            if (!_2148)
            {
                _2020 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2152 = _2020;
            _2022 = _2152;
            if (!_2148)
            {
                _2028 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2154 = _2028;
            _2030 = _2154;
            if (!_2148)
            {
                _2034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2156 = _2034;
            _2036 = _2156;
            if (!_2148)
            {
                _2040 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2158 = _2040;
            _2042 = _2158;
            if (!_2148)
            {
                _2066 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2160 = _2066;
            bool _2162 = !_2148;
            _2068 = _2160;
            if (!_2162)
            {
                bool _2164 = _1559 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2166 = isnan(_1559);
                bool _2168 = _2164 || _2166;
                bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2172 = _2168 || _2170;
                if (!_2172)
                {
                    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2176 = _1559 + _2174;
                    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2178;
                    float _2182 = 1.0 / _2180;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2204 = _2176 * _2182;
                    float _2206 = precise::clamp(_2204, 0.0, 1.0);
                    float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2212 = fma(_2206, _2186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2214 = fma(_2206, _2210, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2216 = fma(_2206, _2190, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2218 = fma(_2206, _2194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2220 = fma(_2206, _2198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2222 = fma(_2206, _2202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2022 = _2214;
                    _2042 = _2220;
                    _2076 = _2212;
                    _2036 = _2218;
                    _2030 = _2216;
                    _2068 = _2222;
                    _2138 = true;
                }
                else
                {
                    _2022 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2042 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2076 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2030 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2068 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2138 = false;
    float _2224 = _2022;
    float _2226 = _2042;
    float _2228 = _2076;
    float _2230 = _2036;
    float _2232 = _2030;
    float _2234 = _2068;
    float _2236 = fma(_2000, -0.5, 0.5);
    float _2238 = precise::clamp(_2236, 0.0, 1.0);
    float _2240 = -_2224;
    float _2242 = _2240 + _2226;
    float _2244 = _2026 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2246 = -_2228;
    float _2248 = _2246 + _2230;
    float _2250 = fma(_2238, _2242, _2224);
    out.m_91.x = 0.0;
    float _2252 = -_2232;
    float _2254 = _2252 + _2234;
    float _2256 = fma(_2238, _2248, _2228);
    float _2258 = _2250 * 0.586610972881317138671875;
    out.m_58.x = _2244;
    bool _2260 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2262 = fma(_2238, _2254, _2232);
    float _2264 = fma(_2256, 0.298911988735198974609375, _2258);
    bool _2266 = _1469 > 0.0;
    bool _2268 = isnan(_1469);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan(0.0);
    bool _2274 = _2270 || _2272;
    float _2276 = fma(_2262, 0.114477999508380889892578125, _2264);
    out.m_93.x = 0.0;
    bool _2278 = _1537 <= 0.0;
    bool _2280 = !_2274;
    bool _2282 = _2278 || _2280;
    float _2284 = -_2276;
    float _2286 = _2256 + _2284;
    float _2288 = -_2276;
    float _2290 = _2250 + _2288;
    float _2292 = -_2276;
    float _2294 = _2262 + _2292;
    float _2296 = fma(_2286, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    float _2298 = fma(_2290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    float _2300 = fma(_2294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2276);
    bool _2302 = !_2260;
    if (!_2302)
    {
        float _2304 = -_1397;
        float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2308 = -_1399;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2312 = -_1401;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2316 = _2306 * _2306;
        float _2318 = fma(_2310, _2310, _2316);
        float _2320 = fma(_2314, _2314, _2318);
        float _2322 = rsqrt(_2320);
        float _2324 = _2306 * _2322;
        float _2326 = _2310 * _2322;
        float _2328 = _2314 * _2322;
        float _2330 = sqrt(_2320);
        float _2332 = -_1565;
        float _2334 = _2332 + _2324;
        float _2336 = -_1561;
        float _2338 = _2336 + _2326;
        float _2340 = -_1563;
        float _2342 = _2340 + _2328;
        float _2344 = _2334 * _2334;
        float _2346 = fma(_2338, _2338, _2344);
        float _2348 = fma(_2342, _2342, _2346);
        float _2350 = -_2330;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2354 = rsqrt(_2348);
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = abs(_2358);
        float _2362 = log2(_2360);
        float _2364 = _2334 * _2354;
        float _2366 = _2338 * _2354;
        float _2368 = _2342 * _2354;
        float _2370 = _2000 * _2364;
        float _2372 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2374 = precise::clamp(_2372, 0.0, 1.0);
        float _2376 = _2000 * _2324;
        float _2378 = fma(_2006, _2366, _2370);
        float _2380 = _2374 * _2374;
        float _2382 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2384 = fma(_2006, _2326, _2376);
        float _2386 = fma(_2010, _2368, _2378);
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = _2380 + (-1.0);
        float _2392 = fma(_2010, _2328, _2384);
        float _2394 = precise::clamp(_2392, 0.0, 1.0);
        float _2396 = _2388 * _2388;
        float _2398 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2400 = exp2(_2382);
        float _2402 = fma(_2396, _2390, 1.0);
        float _2404 = -_2324;
        float _2406 = -_2398;
        float _2408 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2406);
        float _2410 = _2402 * _2402;
        float _2412 = -_2328;
        float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2408);
        float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2418 = _2414 + _2416;
        float _2420 = 1.0 / _2410;
        float _2422 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = _2400 * _2424;
        float _2428 = _2394 * _2426;
        float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2432 = _2380 * _2420;
        float _2434 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2436 = _2428 * _2432;
        float _2438 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2440 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2442 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2444 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2430;
        out.m_91.y = _2434;
        out.m_91.z = _2438;
        out.m_93.x = _2440;
        out.m_93.y = _2442;
        out.m_93.z = _2444;
    }
    out.m_95.x = _2296;
    out.m_95.y = _2298;
    out.m_95.z = _2300;
    if (!_2282)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_58.x = 0.0;
    float _2446 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2446;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

