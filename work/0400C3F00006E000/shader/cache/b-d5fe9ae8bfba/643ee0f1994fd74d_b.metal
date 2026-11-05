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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_73 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_69 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_114);
        out.gl_Position.z = _2250;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _118 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_91);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_96);
    bool _130 = _100 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _116 = as_type<int>(_140);
    }
    int _142 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2306 = as_type<float>(_142);
        out.gl_Position.z = _2306;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _148 = in.m_53.y;
    float _150 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _152 = in.m_51.y;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _158 = _156 != 0;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _162 = in.m_51.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _170 = _168 != 0;
    float _172 = in.m_53.x;
    float _174 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    float _180 = in.m_51.z;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _184 = _182 != 0;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _188 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _190 = _160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _192 = -_150;
    float _194 = fma(_188, 2.0, _192);
    float _196 = -_148;
    float _198 = _196 + 1.0;
    float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _204 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _206 = _152 > 0.5;
    bool _208 = _162 > 0.5;
    float _210 = fma(_204, -2.0, _154);
    int _212 = _206 ? as_type<int>(_198) : as_type<int>(_148);
    float _214 = _186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _216 = _208 ? as_type<int>(_198) : as_type<int>(_148);
    float _218 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _210);
    int _220 = 0;
    bool _222 = _166;
    bool _224 = _208;
    float _226 = _218;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _230 = _144;
    float _232 = _204;
    float _234 = _214;
    float _236 = _172;
    if (_178)
    {
        float _238 = -_172;
        float _240 = _238 + 1.0;
        _220 = as_type<int>(_240);
    }
    int _242 = _220;
    int _244 = 0;
    if (_184)
    {
        float _246 = -_172;
        float _248 = _246 + 1.0;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = _158 ? as_type<float>(_216) : _148;
    float _254 = _166 ? as_type<float>(_212) : _148;
    bool _256 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _260 = _256 || _258;
    bool _262 = isnan(1.0);
    bool _264 = _260 || _262;
    float _266 = fma(_190, _252, -0.5);
    float _268 = _252;
    float _270 = as_type<float>(_250);
    if (!_170)
    {
        _268 = _144;
    }
    float _272 = _268;
    float _274 = fma(_174, _254, -0.5);
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _278 = _272;
    float _280 = _274;
    if (_184)
    {
        bool _282 = _180 > 0.5;
        _222 = _282;
    }
    bool _284 = _222;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_178)
    {
        bool _288 = _144 > 0.5;
        _224 = _288;
    }
    bool _290 = _224;
    float _292 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _276);
    float _294 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _298 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _286);
    float _300 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _302 = _292;
    float _304 = _294;
    if (!_170)
    {
        _302 = _272;
    }
    float _306 = _302;
    float _308 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _296);
    float _310 = _306;
    if (_170)
    {
        _278 = _144;
    }
    float _312 = _278;
    float _314 = -_218;
    float _316 = fma(_300, _274, _314);
    if (!_170)
    {
        _226 = _152;
    }
    float _318 = _226;
    float _320 = _318;
    if (!_264)
    {
        float _322 = _294 * _294;
        float _324 = _322 * 0.5;
        _280 = _324;
    }
    float _326 = _280;
    float _328 = _326;
    if (!_178)
    {
        _228 = _172;
    }
    float _330 = _228;
    float _332 = 0.0;
    float _334 = _330;
    if (!_170)
    {
        _332 = _318;
    }
    float _336 = _332;
    float _338 = _336;
    if (!_264)
    {
        float _340 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _340;
    }
    float _342 = _328;
    float _344 = _342;
    if (_170)
    {
        _320 = _312;
    }
    float _346 = _320;
    if (!_184)
    {
        _230 = _172;
    }
    float _348 = _230;
    float _350 = _348;
    if (!_170)
    {
        _232 = _180;
    }
    float _352 = _232;
    float _354 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _202);
    float _356 = _352;
    if (_178)
    {
        float _358 = _290 ? as_type<float>(_242) : _172;
        _334 = _358;
    }
    float _360 = _334;
    if (_184)
    {
        float _362 = _284 ? as_type<float>(_250) : _172;
        _350 = _362;
    }
    float _364 = _350;
    bool _366 = !_264;
    float _368 = _364;
    if (!_366)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _380 = _294 * _372;
        float _382 = exp2(_380);
        float _384 = _378 * 0.693147182464599609375;
        float _386 = 1.0 / _384;
        float _388 = 1.0 / _376;
        float _390 = _382 + (-1.0);
        float _392 = -_390;
        float _394 = fma(_392, _386, _294);
        float _396 = _394 * _388;
        float _398 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _382;
        _344 = _398;
    }
    float _400 = _270;
    float _402 = _344;
    bool _404 = !_264;
    float _406 = _400;
    if (!_404)
    {
        float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _410 = log2(_408);
        float _412 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _414 = _412 + 1.0;
        float _416 = 1.0 / _414;
        float _418 = _294 * _410;
        float _420 = exp2(_418);
        float _422 = -_420;
        float _424 = _422 + 1.0;
        float _426 = _424 * _416;
        _304 = _426;
    }
    float _428 = _304;
    if (!_170)
    {
        _406 = _352;
    }
    float _430 = _406;
    float _432 = fma(_214, _360, -0.5);
    float _434 = _200 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _436 = _430;
    float _438 = _434;
    if (_170)
    {
        _356 = _180;
    }
    float _440 = _356;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_170)
    {
        _338 = _312;
    }
    float _446 = _338;
    float _448 = -_100;
    float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    if (_170)
    {
        _310 = _440;
    }
    float _452 = _310;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _456 = _180 > 0.5;
    float _458 = _446 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _462 = _460 != 0;
    float _464 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[84].z, _444);
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _468 = _466 != 0;
    float _470 = fma(_434, _364, -0.5);
    int _472 = _456 ? as_type<int>(_198) : as_type<int>(_148);
    float _474 = -_454;
    float _476 = fma(_458, 2.0, _474);
    float _478 = in.m_55.w;
    float _480 = _454;
    if (_170)
    {
        _368 = _152;
    }
    float _482 = _368;
    float _484 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _464);
    float _486 = _482;
    if (!_170)
    {
        _486 = _312;
    }
    float _488 = _486;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_170)
    {
        _480 = _312;
    }
    float _492 = _480;
    float _494 = _484 * (-0.15915493667125701904296875);
    float _496 = _492;
    if (!_170)
    {
        _234 = _430;
    }
    float _498 = _234;
    float _500 = -_100;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _476);
    float _504 = _498;
    if (!_170)
    {
        _496 = _440;
    }
    float _506 = _496;
    float _508 = _316 + 0.5;
    if (_170)
    {
        _436 = _152;
    }
    float _510 = _436;
    float _512 = _462 ? as_type<float>(_472) : _148;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _516 = _468 ? as_type<float>(_472) : _148;
    float _518 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _298);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[83].w, _490);
    float _522 = fma(_518, _432, _450);
    if (_170)
    {
        _438 = _440;
    }
    float _524 = _438;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _528 = in.m_44.x;
    float _530 = in.m_44.y;
    float _532 = in.m_44.z;
    float _534 = _524;
    if (!_170)
    {
        _534 = _152;
    }
    float _536 = _534;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _540 = -_526;
    float _542 = fma(_514, 2.0, _540);
    float _544 = _442 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _546 = in.m_42.x;
    float _548 = in.m_42.y;
    float _550 = in.m_42.z;
    float _552 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[89].z, _538);
    if (_170)
    {
        _504 = _152;
    }
    float _554 = _504;
    float _556 = fma(_544, _512, -0.5);
    float _558 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _552);
    float _560 = _488 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _568 = _566 != 0;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _576 = _554 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _578 = _558 * (-0.15915493667125701904296875);
    float _580 = fma(_560, -2.0, _570);
    float _582 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _584 = fma(_576, -2.0, _574);
    float _586 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _588 = _494 * 6.283185482025146484375;
    float _590 = cos(_588);
    float _592 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _594 = fma(_428, _530, _582);
    float _596 = fma(_428, _532, _586);
    int _598 = as_type<int>(_532);
    float _600 = _528;
    if (_564)
    {
        float _602 = -_172;
        float _604 = _602 + 1.0;
        _598 = as_type<int>(_604);
    }
    int _606 = _598;
    float _608 = fma(_428, _528, _592);
    if (!_564)
    {
        _600 = _172;
    }
    float _610 = _600;
    float _612 = fma(_596, _478, _550);
    float _614 = _494 * 6.283185482025146484375;
    float _616 = sin(_614);
    int _618 = as_type<int>(_550);
    float _620 = _610;
    if (_568)
    {
        float _622 = -_172;
        float _624 = _622 + 1.0;
        _618 = as_type<int>(_624);
    }
    int _626 = _618;
    if (_564)
    {
        float _628 = _206 ? as_type<float>(_606) : _172;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = fma(_608, _478, _546);
    float _634 = fma(_594, _478, _548);
    float _636 = _572 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_568)
    {
        float _638 = _206 ? as_type<float>(_626) : _172;
        _236 = _638;
    }
    float _640 = _236;
    float _642 = -_100;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[86].x, _542);
    float _646 = _578 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = _590 * _266;
    float _652 = fma(_636, _630, -0.5);
    float _654 = _634 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _634 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _658 = _634 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _662 = _578 * 6.283185482025146484375;
    float _664 = cos(_662);
    float _666 = _616 * _266;
    float _668 = fma(_616, _470, _650);
    float _670 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[4].x, _656);
    float _672 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _674 = -_666;
    float _676 = fma(_590, _470, _674);
    float _678 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _680 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _520);
    float _682 = _648 * _556;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _686 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _688 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _584);
    float _690 = _640 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _692 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _580);
    float _694 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = -_688;
    float _698 = fma(_680, _668, _696);
    float _700 = _664 * _556;
    float _702 = -_682;
    float _704 = fma(_664, _652, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _708 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[4].z, _670);
    float _710 = fma(_648, _652, _700);
    float _712 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _714 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _706);
    float _716 = _708 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _718 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _354);
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _722 = _694 + _720;
    float _724 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _714);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _728 = _712 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _716 + _730;
    float _734 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _308);
    float _736 = fma(_718, _676, _502);
    float _738 = _728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _740 = _728 * _728;
    float _742 = fma(_734, _704, _644);
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _738);
    float _748 = in.m_57.x;
    float _750 = fma(_732, _732, _740);
    float _752 = _690 * _684;
    float _754 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _746);
    float _756 = in.m_57.w;
    float _758 = fma(_722, _722, _750);
    float _760 = -_692;
    float _762 = fma(_724, _710, _760);
    bool _764 = _754 >= 0.0;
    float _766 = _516 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _768 = _742 + 0.5;
    float _770 = rsqrt(_758);
    float _772 = _522 + 0.5;
    float _774 = _766 * _744;
    float _776 = _736 + 0.5;
    float _778 = _698 + 0.5;
    float _780 = _762 + 0.5;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _752;
    out.m_59.y = _774;
    float _784 = _750;
    if (_764)
    {
        _784 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _786 = _784;
    out.m_61.x = _772;
    out.m_61.y = _508;
    out.m_61.z = _776;
    out.m_61.w = _778;
    int _788 = as_type<int>(_786);
    if (_764)
    {
        float _790 = _786 * 5.0;
        _788 = as_type<int>(_790);
    }
    int _792 = _788;
    out.m_63.x = _768;
    out.m_63.y = _780;
    float _794 = _728 * _770;
    float _796 = _732 * _770;
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3454 = as_type<float>(_792);
        out.gl_Position.z = _3454;
    }
    out.m_65.w = _782;
    out.m_67.x = _748;
    out.m_67.w = _756;
    float _798 = _756;
    if (_764)
    {
        out.m_49.x = 0.0;
    }
    if (_764)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _800 = -_794;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _804 = _722 * _770;
    float _806 = -_796;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _716);
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _802 + _810;
    float _814 = -_804;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _808 + _818;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _826 = _816 + _824;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _822);
    float _830 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[28].z, _828);
    bool _832 = _830 >= 0.0;
    float _834 = _826;
    float _836 = _816;
    if (_832)
    {
        _834 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _838 = _834;
    int _840 = as_type<int>(_838);
    if (_832)
    {
        out.m_49.x = 0.0;
    }
    if (_832)
    {
        float _842 = _838 * 5.0;
        _840 = as_type<int>(_842);
    }
    int _844 = _840;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3557 = as_type<float>(_844);
        out.gl_Position.z = _3557;
    }
    if (_832)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _846 = in.m_57.z;
    float _848 = abs(_748);
    float _850 = log2(_848);
    float _852 = -_794;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _728);
    float _856 = -_796;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _860 = in.m_57.y;
    float _862 = _180 * 78.233001708984375;
    float _864 = _854 * _854;
    float _866 = -_804;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _722);
    float _870 = -_712;
    float _872 = _870 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _874 = -_716;
    float _876 = _874 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = fma(_858, _858, _864);
    float _880 = -_694;
    float _882 = _880 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 * _872;
    float _886 = _152 * 78.233001708984375;
    float _888 = fma(_868, _868, _878);
    float _890 = fma(_876, _876, _884);
    float _892 = _850 * 0.800000011920928955078125;
    float _894 = sqrt(_888);
    float _896 = fma(_882, _882, _890);
    float _898 = _100 + 290.0;
    float _900 = fma(_846, 12.98980045318603515625, _862);
    float _902 = exp2(_892);
    float _904 = _900 * 0.15915493667125701904296875;
    float _906 = fma(_860, 12.98980045318603515625, _886);
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 3.1415927410125732421875;
    float _910 = _906 * 0.15915493667125701904296875;
    float _912 = _904 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _918 = _860 * 78.233001708984375;
    float _920 = _770 * _894;
    float _922 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _916);
    float _924 = fma(_162, 12.98980045318603515625, _918);
    float _926 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _928 = rsqrt(_896);
    float _930 = in.m_55.x;
    float _932 = in.m_55.y;
    float _934 = in.m_55.z;
    float _936 = _924 * 0.15915493667125701904296875;
    float _938 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _922);
    float _940 = _910 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _914 * 43758.546875;
    float _946 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _926);
    float _948 = rsqrt(_938);
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _946);
    float _952 = _748 * _748;
    float _954 = fma(_898, 0.008000000379979610443115234375, _908);
    float _956 = fma(_952, -0.980000019073486328125, 1.0);
    float _958 = _954 * (-0.15915493667125701904296875);
    float _960 = _936 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = in.m_69.x;
    float _966 = in.m_69.y;
    float _968 = in.m_69.z;
    float _970 = _930 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _972 = _932 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _974 = _942 * 43758.546875;
    float _976 = _934 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _978 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _978;
    float _982 = floor(_944);
    float _984 = _948 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _986 = _980 * _980;
    float _988 = _962 * 43758.546875;
    float _990 = floor(_974);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _994 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _996 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _994;
    float _998 = rsqrt(_950);
    float _1000 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _1004 = fma(_996, _996, _986);
    float _1006 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1006;
    float _1010 = _970 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1014 = _920 * _1000;
    float _1016 = fma(_1008, _1008, _1004);
    float _1018 = _958 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _920 * _1010;
    float _1024 = -_982;
    float _1026 = _944 + _1024;
    float _1028 = -_990;
    float _1030 = _974 + _1028;
    float _1032 = fma(_902, 300.0, _100);
    float _1034 = _872 * _928;
    float _1036 = _1026 * 6.283185482025146484375;
    float _1038 = _998 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1040 = _958 * 6.283185482025146484375;
    float _1042 = cos(_1040);
    float _1044 = _1030 * 6.283185482025146484375;
    float _1046 = _876 * _928;
    float _1048 = _882 * _928;
    float _1050 = _992 * _1022;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1054 = _1046 * _1052;
    float _1056 = fma(_898, 0.0199999995529651641845703125, _1044);
    float _1058 = sqrt(_1016);
    float _1060 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1062 = _1038 * _1020;
    float _1064 = _1056 * 0.15915493667125701904296875;
    float _1066 = _920 * _1060;
    float _1068 = floor(_988);
    float _1070 = _1002 * _1066;
    float _1072 = _1012 * _1014;
    float _1074 = _998 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1078 = _1032 * 0.0050000003539025783538818359375;
    float _1080 = -_1042;
    float _1082 = _1080 + 1.0;
    float _1084 = _1076 * _1020;
    float _1086 = precise::max(_1058, 250.0);
    float _1088 = _1078 * 0.15915493667125701904296875;
    float _1090 = _1074 * _1082;
    float _1092 = _1038 * _1082;
    float _1094 = precise::min(_1086, 400.0);
    float _1096 = _1088 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = fma(_1038, _1090, _1084);
    float _1102 = -_1068;
    float _1104 = _988 + _1102;
    float _1106 = _1074 * _1020;
    float _1108 = fma(_1032, -0.02300000004470348358154296875, _1036);
    float _1110 = -_1084;
    float _1112 = fma(_1038, _1090, _1110);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = _1048 * _1114;
    float _1118 = fma(_1076, _1092, _1106);
    float _1120 = _1108 * 0.15915493667125701904296875;
    float _1122 = fma(_1032, 0.0199999995529651641845703125, _1044);
    float _1124 = _1088 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = -_1106;
    float _1130 = fma(_1076, _1092, _1128);
    float _1132 = fma(_1074, _1090, _1042);
    float _1134 = _1122 * 0.15915493667125701904296875;
    float _1136 = fma(_1094, 0.0040000001899898052215576171875, -0.6000001430511474609375);
    float _1138 = fma(_1032, 0.008000000379979610443115234375, _908);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = -_1054;
    float _1144 = fma(_1048, _1140, _1142);
    float _1146 = _1076 * _1076;
    float _1148 = _1134 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = fma(_1038, _1092, _1042);
    float _1154 = -_1062;
    float _1156 = fma(_1076, _1090, _1154);
    float _1158 = fma(_1076, _1090, _1062);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1162 = _1034 * _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1166 = -_1116;
    float _1168 = fma(_1034, _1164, _1166);
    float _1170 = fma(_1032, 0.0540000014007091522216796875, _1044);
    float _1172 = fma(_1146, _1082, _1042);
    float _1174 = _1144 * _1144;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1178 = -_1162;
    float _1180 = fma(_1046, _1176, _1178);
    float _1182 = fma(_1032, 0.14423076808452606201171875, 10.0);
    float _1184 = fma(_898, 0.0540000014007091522216796875, _1044);
    float _1186 = fma(_1168, _1168, _1174);
    float _1188 = _1170 * 0.15915493667125701904296875;
    float _1190 = _1104 * 6.283185482025146484375;
    float _1192 = _1184 * 0.15915493667125701904296875;
    float _1194 = fma(_1180, _1180, _1186);
    float _1196 = fma(_898, 0.14423076808452606201171875, 10.0);
    float _1198 = _948 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1200 = _1188 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = fma(_100, 0.1500000059604644775390625, _1190);
    float _1206 = _948 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1208 = _1198 * _1098;
    float _1210 = _1198 * _1198;
    float _1212 = _984 * _1098;
    float _1214 = _1204 * 0.15915493667125701904296875;
    float _1216 = _1206 * _1098;
    float _1218 = _1192 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = precise::max(_1182, 10.0);
    float _1224 = precise::max(_1196, 10.0);
    float _1226 = precise::min(_1222, 160.0);
    float _1228 = rsqrt(_1194);
    float _1230 = -_1126;
    float _1232 = _1230 + 1.0;
    float _1234 = _1202 * 3.0;
    float _1236 = _984 * _1232;
    float _1238 = fma(_1232, _1210, _1126);
    float _1240 = _1206 * _1232;
    float _1242 = _1120 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = fma(_984, _1236, _1126);
    float _1248 = fma(_1206, _1236, _1208);
    float _1250 = -_1208;
    float _1252 = fma(_1206, _1236, _1250);
    float _1254 = fma(_1206, _1240, _1126);
    float _1256 = fma(_1198, _1240, _1212);
    float _1258 = fma(_1150, 6.0, _1234);
    float _1260 = _1064 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = _1180 * _1228;
    float _1266 = _1168 * _1228;
    float _1268 = _1226 + _1258;
    float _1270 = _1138 * 0.15915493667125701904296875;
    float _1272 = _1046 * _1264;
    float _1274 = _1214 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    float _1278 = -_1216;
    float _1280 = fma(_1198, _1236, _1278);
    float _1282 = fma(_1198, _1236, _1216);
    float _1284 = -_1212;
    float _1286 = fma(_1198, _1240, _1284);
    float _1288 = fma(_1244, 0.1500000059604644775390625, 1.0);
    float _1290 = _1144 * _1228;
    float _1292 = _1220 * 3.0;
    float _1294 = -_1272;
    float _1296 = fma(_1048, _1266, _1294);
    float _1298 = _956 * _1288;
    float _1300 = _1048 * _1290;
    float _1302 = _1034 * _1266;
    float _1304 = fma(_1262, 6.0, _1292);
    float _1306 = _1070 * _1296;
    float _1308 = -_1300;
    float _1310 = fma(_1034, _1264, _1308);
    float _1312 = -_1302;
    float _1314 = fma(_1046, _1290, _1312);
    float _1316 = _1298 * _1136;
    float _1318 = _1070 * _1310;
    float _1320 = fma(_1050, _1290, _1306);
    float _1322 = _1070 * _1314;
    float _1324 = fma(_1050, _1266, _1318);
    float _1326 = fma(_1072, _1034, _1320);
    float _1328 = fma(_1276, 0.119999997317790985107421875, 1.0);
    float _1330 = fma(_1050, _1264, _1322);
    float _1332 = fma(_1072, _1046, _1324);
    float _1334 = _1326 * _1252;
    float _1336 = _1326 * _1254;
    float _1338 = _1326 * _1256;
    float _1340 = _1270 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = fma(_1326, _1328, _712);
    float _1346 = precise::min(_1224, 160.0);
    float _1348 = fma(_1072, _1048, _1330);
    float _1350 = fma(_1332, _1246, _1334);
    float _1352 = fma(_1332, _1248, _1336);
    float _1354 = fma(_1332, _1280, _1338);
    float _1356 = -_712;
    float _1358 = _1356 + _1344;
    float _1360 = _1270 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = fma(_1332, _1328, _716);
    float _1366 = fma(_1348, _1282, _1350);
    float _1368 = fma(_1348, _1286, _1352);
    float _1370 = fma(_1348, _1328, _694);
    float _1372 = fma(_1348, _1238, _1354);
    float _1374 = _1152 * _1358;
    float _1376 = _1112 * _1358;
    float _1378 = -_716;
    float _1380 = _1378 + _1364;
    float _1382 = _1118 * _1358;
    float _1384 = _954 * 0.15915493667125701904296875;
    float _1386 = -_694;
    float _1388 = _1386 + _1370;
    float _1390 = fma(_1100, _1380, _1374);
    float _1392 = fma(_1366, _1316, _716);
    float _1394 = fma(_1368, _1316, _712);
    float _1396 = fma(_1372, _1316, _694);
    float _1398 = fma(_1132, _1380, _1376);
    float _1400 = _1384 * 6.283185482025146484375;
    float _1402 = cos(_1400);
    float _1404 = -_1342;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1130, _1388, _1390);
    float _1410 = fma(_1156, _1380, _1382);
    float _1412 = fma(_1158, _1388, _1398);
    float _1414 = _1076 * _1362;
    float _1416 = _1074 * _1406;
    float _1418 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1394);
    float _1420 = _1384 * 6.283185482025146484375;
    float _1422 = sin(_1420);
    float _1424 = fma(_1172, _1388, _1410);
    float _1426 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1392);
    float _1428 = -_1414;
    float _1430 = fma(_1038, _1416, _1428);
    float _1432 = -_712;
    float _1434 = _1432 + _1418;
    float _1436 = _1346 + _1304;
    float _1438 = _712 + _1408;
    float _1440 = _716 + _1412;
    float _1442 = _694 + _1424;
    float _1444 = fma(_1074, _1416, _1342);
    float _1446 = -_716;
    float _1448 = _1446 + _1426;
    float _1450 = _1430 * _1434;
    float _1452 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1438);
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1440);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1442);
    float _1458 = -_1402;
    float _1460 = _1458 + 1.0;
    float _1462 = fma(_1444, _1448, _1450);
    float _1464 = _1074 * _1422;
    float _1466 = _1038 * _1422;
    float _1468 = _1076 * _1422;
    float _1470 = _1074 * _1362;
    float _1472 = _1038 * _1406;
    float _1474 = fma(_1406, _1146, _1342);
    float _1476 = _1038 * _1460;
    float _1478 = fma(_1146, _1460, _1402);
    float _1480 = _1038 * _1362;
    float _1482 = fma(_1076, _1472, _1470);
    float _1484 = _1074 * _1460;
    float _1486 = fma(_1076, _1476, _1464);
    float _1488 = -_712;
    float _1490 = _1488 + _1452;
    float _1492 = -_1480;
    float _1494 = fma(_1076, _1416, _1492);
    float _1496 = _1482 * _1434;
    float _1498 = -_1468;
    float _1500 = fma(_1038, _1484, _1498);
    float _1502 = -_1466;
    float _1504 = fma(_1076, _1484, _1502);
    float _1506 = -_716;
    float _1508 = _1506 + _1454;
    float _1510 = _1486 * _1490;
    float _1512 = fma(_1494, _1448, _1496);
    float _1514 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1396);
    float _1516 = fma(_1074, _1484, _1402);
    float _1518 = _1500 * _1490;
    float _1520 = fma(_1504, _1508, _1510);
    float _1522 = -_694;
    float _1524 = _1522 + _1456;
    float _1526 = -_694;
    float _1528 = _1526 + _1514;
    float _1530 = fma(_1516, _1508, _1518);
    float _1532 = fma(_1076, _1484, _1466);
    float _1534 = fma(_1478, _1524, _1520);
    float _1536 = fma(_1474, _1528, _1512);
    float _1538 = fma(_1076, _1416, _1480);
    float _1540 = fma(_1532, _1524, _1530);
    float _1542 = -_756;
    float _1544 = _1542 + 1.0;
    float _1546 = _694 + _1534;
    float _1548 = fma(_1538, _1528, _1462);
    float _1550 = _694 + _1536;
    float _1552 = _716 + _1540;
    float _1554 = _1546 * _1544;
    float _1556 = _716 + _1548;
    float _1558 = fma(_1038, _1476, _1402);
    float _1560 = _1552 * _1544;
    float _1562 = fma(_1550, _756, _1554);
    float _1564 = fma(_1038, _1484, _1468);
    float _1566 = fma(_1038, _1472, _1342);
    float _1568 = fma(_1556, _756, _1560);
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1572 = _1562 + _1570;
    float _1574 = _1558 * _1490;
    float _1576 = -_1464;
    float _1578 = fma(_1076, _1476, _1576);
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1582 = _1568 + _1580;
    float _1584 = _1572 * _1572;
    float _1586 = fma(_1038, _1416, _1414);
    float _1588 = _1566 * _1434;
    float _1590 = fma(_1564, _1508, _1574);
    float _1592 = fma(_1582, _1582, _1584);
    float _1594 = -_1470;
    float _1596 = fma(_1076, _1472, _1594);
    float _1598 = fma(_1586, _1448, _1588);
    float _1600 = fma(_1578, _1524, _1590);
    float _1602 = sqrt(_1592);
    float _1604 = fma(_1596, _1528, _1598);
    float _1606 = _712 + _1600;
    float _1608 = _712 + _1604;
    float _1610 = _1606 * _1544;
    float _1612 = fma(_1608, _756, _1610);
    bool _1614 = _1602 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1574;
    float _1618 = _1448;
    float _1620 = _1598;
    float _1622 = _1038;
    if (!_1614)
    {
        _1616 = _1568;
    }
    float _1624 = _1616;
    float _1626 = _1624;
    if (!_1614)
    {
        _1618 = _1562;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (!_1614)
    {
        _1620 = _1612;
    }
    float _1632 = _1620;
    bool _1634 = !_1614;
    float _1636 = _1632;
    if (!_1634)
    {
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1642 = _1602 + _1640;
        float _1644 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1646 = rsqrt(_1592);
        float _1648 = _1642 * _1638;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1650 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = _1654 + (-1.0);
        float _1662 = fma(_1658, _1644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1664 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = _1646 * _1662;
        float _1668 = fma(_1612, _1654, _1664);
        float _1670 = fma(_1582, _1666, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1672 = fma(_1572, _1666, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1636 = _1668;
        _1626 = _1670;
        _1630 = _1672;
        _798 = _1666;
    }
    float _1674 = _1636;
    float _1676 = _1626;
    float _1678 = _1630;
    float _1680 = _798;
    float _1682 = -_794;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1674);
    float _1686 = -_796;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1676);
    float _1690 = -_804;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1684 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1688 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1692 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = precise::max(0.0, _1694);
    float _1712 = fma(_1702, _1702, _1708);
    float _1714 = fma(_1706, _1706, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1702 * _1718;
    float _1722 = _1706 * _1718;
    float _1724 = -_1718;
    float _1726 = -_1710;
    float _1728 = fma(_1698, _1724, _1726);
    float _1730 = _1720 * _1720;
    float _1732 = _1722 * _1722;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1712;
    float _1746 = _1698;
    float _1748 = _1716;
    float _1750 = _1742;
    float _1752 = _1680;
    float _1754 = _1710;
    float _1756 = _1718;
    if (_1738)
    {
        float _1758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (_1738)
    {
        float _1762 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1762;
    }
    float _1764 = _1746;
    float _1766 = _1764;
    if (_1738)
    {
        float _1768 = rsqrt(_1734);
        _1748 = _1768;
    }
    float _1770 = _1748;
    float _1772 = _1760;
    if (_1738)
    {
        float _1774 = _1742 * _1760;
        _1750 = _1774;
    }
    float _1776 = _1750;
    if (_1738)
    {
        float _1778 = _1776 * 0.15915493667125701904296875;
        _1752 = _1778;
    }
    float _1780 = _1752;
    float _1782 = _1776;
    if (_1738)
    {
        float _1784 = _1780 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        _1782 = _1786;
    }
    float _1788 = _1782;
    float _1790 = _1706;
    if (_1738)
    {
        float _1792 = _1780 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        _1790 = _1794;
    }
    float _1796 = _1790;
    float _1798 = _1788;
    if (_1738)
    {
        float _1800 = fma(_1788, _1764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1772 = _1800;
    }
    float _1802 = _1772;
    float _1804 = _1802;
    if (!_1738)
    {
        _1766 = _1720;
    }
    float _1806 = _1766;
    float _1808 = _1806;
    if (!_1738)
    {
        _1798 = _1728;
    }
    float _1810 = _1798;
    float _1812 = _1810;
    if (_1738)
    {
        float _1814 = _1770 * _1802;
        _1622 = _1814;
    }
    float _1816 = _1622;
    if (!_1738)
    {
        _1804 = _1730;
    }
    float _1818 = _1804;
    float _1820 = sqrt(_1714);
    float _1822 = _1818;
    float _1824 = _1796;
    if (_1738)
    {
        float _1826 = _1796 + (-1.0);
        _1754 = _1826;
    }
    float _1828 = _1754;
    float _1830 = _1828;
    if (_1738)
    {
        float _1832 = _1720 * _1816;
        _1808 = _1832;
    }
    float _1834 = _1808;
    float _1836 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1738)
    {
        float _1838 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1838;
    }
    float _1840 = _1756;
    if (!_1738)
    {
        _1830 = _1722;
    }
    float _1842 = _1830;
    float _1844 = _1842;
    if (_1738)
    {
        float _1846 = _1722 * _1816;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1738)
    {
        float _1850 = _1834 * _1834;
        _1822 = _1850;
    }
    float _1852 = _1822;
    if (_1738)
    {
        float _1854 = fma(_1728, _1796, _1840);
        _1812 = _1854;
    }
    float _1856 = _1812;
    if (!_1738)
    {
        _1824 = _1732;
    }
    float _1858 = _1824;
    float _1860 = _1858;
    if (_1738)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1856, _1856, _1852);
    float _1868 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1836);
    float _1870 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1872 = _1866 + _1864;
    float _1874 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1878 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1876);
    float _1880 = precise::clamp(_1878, 0.0, 1.0);
    float _1882 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = rsqrt(_1872);
    float _1886 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1874);
    float _1888 = -_1880;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1882);
    float _1894 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1868);
    float _1896 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1886);
    float _1898 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1902 = abs(_1890);
    float _1904 = log2(_1902);
    float _1906 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1898);
    float _1910 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1914 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1916 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1918 = _1884 * _1834;
    float _1920 = _1884 * _1856;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = _1884 * _1848;
    float _1930 = -_1912;
    float _1932 = fma(_1930, _1870, 1.0);
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1936 = -_1926;
    float _1938 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1934);
    float _1944 = -_1928;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1948 = exp2(_1940);
    float _1950 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1952 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1954 = fma(_1946, -0.5, 0.5);
    float _1956 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1958 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1950);
    float _1960 = fma(_1946, 0.5, 0.5);
    float _1962 = _1920 + 1.0;
    float _1964 = log2(_1932);
    float _1966 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1956);
    float _1968 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1966);
    float _1974 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1968);
    float _1976 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1978 = 1.0 / _1952;
    float _1980 = -_1920;
    float _1982 = fma(_1948, _1962, _1980);
    float _1984 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1972);
    float _1986 = fma(_1960, _1976, 1.570728778839111328125);
    float _1988 = sqrt(_1954);
    float _1990 = _1964 * 0.693147182464599609375;
    float _1992 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1994 = fma(_1982, 0.5, 0.5);
    float _1996 = _1974 * _1978;
    float _1998 = _1984 * _1978;
    float _2000 = fma(_1996, 0.5, 0.5);
    float _2002 = fma(_1998, -0.5, 0.5);
    float _2004 = _1988 * 0.636619746685028076171875;
    float3 _5389 = float3(_2000, _2002, _1992);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5389, float3(0.0), isnan(_5389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5389, float3(0.0), isnan(_5389)), level(0.0)).x;
    float3 _5400 = float3(_2000, _2002, _1992);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5400, float3(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5400, float3(0.0), isnan(_5400)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float _2019 = -_1986;
    float _2021 = fma(_2004, _2019, 1.0);
    float2 _5422 = float2(_2021, _1994);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5422, float2(0.0), isnan(_5422)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5422, float2(0.0), isnan(_5422)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = _802 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2035 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.w = _782;
    float _2037 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2033);
    float _2039 = _802 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2041 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2035);
    float _2043 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2037);
    float _2045 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2039);
    bool _2047 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan(0.5);
    bool _2055 = _2051 || _2053;
    float _2057 = _1952 * 0.5;
    float _2059 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2061 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2045);
    float _2063 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2041);
    float _2065 = _1974 + _1952;
    float _2067 = 1.0 / _2059;
    float _2069 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2071 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2063);
    out.m_71.x = _1688;
    out.m_71.y = _1684;
    out.m_71.z = _1692;
    float _2073 = _2065 * 0.5;
    float _2075 = _2069 + _2059;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2079 = _2000;
    float _2081 = _2075;
    float _2083 = _1904;
    if (!_2055)
    {
        _2077 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2085 = _2077;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1984;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1952;
    float _2087 = _2085;
    if (!_2055)
    {
        _2079 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2089 = _2079;
    if (_2055)
    {
        _836 = 1.0;
    }
    float _2091 = _836;
    float _2093 = _2075 * _2067;
    float _2095 = _2093 * 0.5;
    float _2097 = _2091;
    if (!_2055)
    {
        float _2099 = -_2089;
        float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2081 = _2101;
    }
    float _2103 = _2081;
    float _2105 = _2103;
    if (!_2055)
    {
        float _2107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2109 = fma(_2095, _2085, _2107);
        _2087 = _2109;
    }
    float _2111 = _2087;
    float _2113 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2055)
    {
        float _2115 = 1.0 / _2103;
        _2105 = _2115;
    }
    float _2117 = _2105;
    float _2119 = exp2(_2113);
    float _2121 = _2111;
    if (!_2055)
    {
        float _2123 = 1.0 / _2111;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = -_2119;
    float _2129 = _2127 + 1.0;
    float _2131 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2055)
    {
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2135 = -_2089;
        float _2137 = fma(_2125, _2133, _2135);
        _2083 = _2137;
    }
    float _2139 = _2083;
    float _2141 = fma(_1984, -0.5, _2057);
    if (!_2055)
    {
        float _2143 = _2139 * _2117;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2097 = _2145;
    }
    float _2147 = _2097;
    float _2149 = _2071 + _1952;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2153 = _2147 > 0.0;
    bool _2155 = isnan(_2147);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(0.0);
    bool _2161 = _2157 || _2159;
    float _2163 = _2149 * 0.5;
    float _2165 = _2151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2073;
    out.m_73.y = _2141;
    out.m_73.z = _2163;
    out.m_73.w = _1952;
    out.m_49.x = _2165;
    float _2167 = _2131 * _2006;
    float _2169 = -_2131;
    float _2171 = _2169 + 1.0;
    float _2173 = _2017 * _2167;
    float _2175 = _2031 * _2167;
    float _2177 = fma(_2027, _2173, _2011);
    float _2179 = fma(_2029, _2173, _2013);
    float _2181 = _2017 * _2171;
    float _2183 = fma(_2017, _2175, _2015);
    out.m_75.x = _2177;
    out.m_75.y = _2179;
    out.m_75.z = _2183;
    out.m_75.w = _2181;
    if (_2161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2185 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2185;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_114);
        out.gl_Position.z = _2250;
    }
    if (!_104)
    {
        return out;
    }
    bool _118 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_91);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_96);
    bool _130 = _100 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _116 = as_type<int>(_140);
    }
    int _142 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2306 = as_type<float>(_142);
        out.gl_Position.z = _2306;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _148 = in.m_53.y;
    float _150 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _152 = in.m_51.y;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _158 = _156 != 0;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _162 = in.m_51.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _170 = _168 != 0;
    float _172 = in.m_53.x;
    float _174 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    float _180 = in.m_51.z;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _184 = _182 != 0;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _188 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _190 = _160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _192 = -_150;
    float _194 = fma(_188, 2.0, _192);
    float _196 = -_148;
    float _198 = _196 + 1.0;
    float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _204 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _206 = _152 > 0.5;
    bool _208 = _162 > 0.5;
    float _210 = fma(_204, -2.0, _154);
    int _212 = _206 ? as_type<int>(_198) : as_type<int>(_148);
    float _214 = _186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _216 = _208 ? as_type<int>(_198) : as_type<int>(_148);
    float _218 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _210);
    int _220 = 0;
    bool _222 = _166;
    bool _224 = _208;
    float _226 = _218;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _230 = _144;
    float _232 = _204;
    float _234 = _214;
    float _236 = _172;
    if (_178)
    {
        float _238 = -_172;
        float _240 = _238 + 1.0;
        _220 = as_type<int>(_240);
    }
    int _242 = _220;
    int _244 = 0;
    if (_184)
    {
        float _246 = -_172;
        float _248 = _246 + 1.0;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = _158 ? as_type<float>(_216) : _148;
    float _254 = _166 ? as_type<float>(_212) : _148;
    bool _256 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _260 = _256 || _258;
    bool _262 = isnan(1.0);
    bool _264 = _260 || _262;
    float _266 = fma(_190, _252, -0.5);
    float _268 = _252;
    float _270 = as_type<float>(_250);
    if (!_170)
    {
        _268 = _144;
    }
    float _272 = _268;
    float _274 = fma(_174, _254, -0.5);
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _278 = _272;
    float _280 = _274;
    if (_184)
    {
        bool _282 = _180 > 0.5;
        _222 = _282;
    }
    bool _284 = _222;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_178)
    {
        bool _288 = _144 > 0.5;
        _224 = _288;
    }
    bool _290 = _224;
    float _292 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _276);
    float _294 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _298 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _286);
    float _300 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _302 = _292;
    float _304 = _294;
    if (!_170)
    {
        _302 = _272;
    }
    float _306 = _302;
    float _308 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _296);
    float _310 = _306;
    if (_170)
    {
        _278 = _144;
    }
    float _312 = _278;
    float _314 = -_218;
    float _316 = fma(_300, _274, _314);
    if (!_170)
    {
        _226 = _152;
    }
    float _318 = _226;
    float _320 = _318;
    if (!_264)
    {
        float _322 = _294 * _294;
        float _324 = _322 * 0.5;
        _280 = _324;
    }
    float _326 = _280;
    float _328 = _326;
    if (!_178)
    {
        _228 = _172;
    }
    float _330 = _228;
    float _332 = 0.0;
    float _334 = _330;
    if (!_170)
    {
        _332 = _318;
    }
    float _336 = _332;
    float _338 = _336;
    if (!_264)
    {
        float _340 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _340;
    }
    float _342 = _328;
    float _344 = _342;
    if (_170)
    {
        _320 = _312;
    }
    float _346 = _320;
    if (!_184)
    {
        _230 = _172;
    }
    float _348 = _230;
    float _350 = _348;
    if (!_170)
    {
        _232 = _180;
    }
    float _352 = _232;
    float _354 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _202);
    float _356 = _352;
    if (_178)
    {
        float _358 = _290 ? as_type<float>(_242) : _172;
        _334 = _358;
    }
    float _360 = _334;
    if (_184)
    {
        float _362 = _284 ? as_type<float>(_250) : _172;
        _350 = _362;
    }
    float _364 = _350;
    bool _366 = !_264;
    float _368 = _364;
    if (!_366)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _380 = _294 * _372;
        float _382 = exp2(_380);
        float _384 = _378 * 0.693147182464599609375;
        float _386 = 1.0 / _384;
        float _388 = 1.0 / _376;
        float _390 = _382 + (-1.0);
        float _392 = -_390;
        float _394 = fma(_392, _386, _294);
        float _396 = _394 * _388;
        float _398 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _382;
        _344 = _398;
    }
    float _400 = _270;
    float _402 = _344;
    bool _404 = !_264;
    float _406 = _400;
    if (!_404)
    {
        float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _410 = log2(_408);
        float _412 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _414 = _412 + 1.0;
        float _416 = 1.0 / _414;
        float _418 = _294 * _410;
        float _420 = exp2(_418);
        float _422 = -_420;
        float _424 = _422 + 1.0;
        float _426 = _424 * _416;
        _304 = _426;
    }
    float _428 = _304;
    if (!_170)
    {
        _406 = _352;
    }
    float _430 = _406;
    float _432 = fma(_214, _360, -0.5);
    float _434 = _200 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _436 = _430;
    float _438 = _434;
    if (_170)
    {
        _356 = _180;
    }
    float _440 = _356;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_170)
    {
        _338 = _312;
    }
    float _446 = _338;
    float _448 = -_100;
    float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    if (_170)
    {
        _310 = _440;
    }
    float _452 = _310;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _456 = _180 > 0.5;
    float _458 = _446 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _462 = _460 != 0;
    float _464 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[84].z, _444);
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _468 = _466 != 0;
    float _470 = fma(_434, _364, -0.5);
    int _472 = _456 ? as_type<int>(_198) : as_type<int>(_148);
    float _474 = -_454;
    float _476 = fma(_458, 2.0, _474);
    float _478 = in.m_55.w;
    float _480 = _454;
    if (_170)
    {
        _368 = _152;
    }
    float _482 = _368;
    float _484 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _464);
    float _486 = _482;
    if (!_170)
    {
        _486 = _312;
    }
    float _488 = _486;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_170)
    {
        _480 = _312;
    }
    float _492 = _480;
    float _494 = _484 * (-0.15915493667125701904296875);
    float _496 = _492;
    if (!_170)
    {
        _234 = _430;
    }
    float _498 = _234;
    float _500 = -_100;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _476);
    float _504 = _498;
    if (!_170)
    {
        _496 = _440;
    }
    float _506 = _496;
    float _508 = _316 + 0.5;
    if (_170)
    {
        _436 = _152;
    }
    float _510 = _436;
    float _512 = _462 ? as_type<float>(_472) : _148;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _516 = _468 ? as_type<float>(_472) : _148;
    float _518 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _298);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[83].w, _490);
    float _522 = fma(_518, _432, _450);
    if (_170)
    {
        _438 = _440;
    }
    float _524 = _438;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _528 = in.m_44.x;
    float _530 = in.m_44.y;
    float _532 = in.m_44.z;
    float _534 = _524;
    if (!_170)
    {
        _534 = _152;
    }
    float _536 = _534;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _540 = -_526;
    float _542 = fma(_514, 2.0, _540);
    float _544 = _442 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _546 = in.m_42.x;
    float _548 = in.m_42.y;
    float _550 = in.m_42.z;
    float _552 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[89].z, _538);
    if (_170)
    {
        _504 = _152;
    }
    float _554 = _504;
    float _556 = fma(_544, _512, -0.5);
    float _558 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _552);
    float _560 = _488 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _568 = _566 != 0;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _576 = _554 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _578 = _558 * (-0.15915493667125701904296875);
    float _580 = fma(_560, -2.0, _570);
    float _582 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _584 = fma(_576, -2.0, _574);
    float _586 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _588 = _494 * 6.283185482025146484375;
    float _590 = cos(_588);
    float _592 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _594 = fma(_428, _530, _582);
    float _596 = fma(_428, _532, _586);
    int _598 = as_type<int>(_532);
    float _600 = _528;
    if (_564)
    {
        float _602 = -_172;
        float _604 = _602 + 1.0;
        _598 = as_type<int>(_604);
    }
    int _606 = _598;
    float _608 = fma(_428, _528, _592);
    if (!_564)
    {
        _600 = _172;
    }
    float _610 = _600;
    float _612 = fma(_596, _478, _550);
    float _614 = _494 * 6.283185482025146484375;
    float _616 = sin(_614);
    int _618 = as_type<int>(_550);
    float _620 = _610;
    if (_568)
    {
        float _622 = -_172;
        float _624 = _622 + 1.0;
        _618 = as_type<int>(_624);
    }
    int _626 = _618;
    if (_564)
    {
        float _628 = _206 ? as_type<float>(_606) : _172;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = fma(_608, _478, _546);
    float _634 = fma(_594, _478, _548);
    float _636 = _572 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_568)
    {
        float _638 = _206 ? as_type<float>(_626) : _172;
        _236 = _638;
    }
    float _640 = _236;
    float _642 = -_100;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[86].x, _542);
    float _646 = _578 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = _590 * _266;
    float _652 = fma(_636, _630, -0.5);
    float _654 = _634 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _634 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _658 = _634 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _662 = _578 * 6.283185482025146484375;
    float _664 = cos(_662);
    float _666 = _616 * _266;
    float _668 = fma(_616, _470, _650);
    float _670 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[4].x, _656);
    float _672 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _674 = -_666;
    float _676 = fma(_590, _470, _674);
    float _678 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _680 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _520);
    float _682 = _648 * _556;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _686 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _688 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _584);
    float _690 = _640 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _692 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _580);
    float _694 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = -_688;
    float _698 = fma(_680, _668, _696);
    float _700 = _664 * _556;
    float _702 = -_682;
    float _704 = fma(_664, _652, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _708 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[4].z, _670);
    float _710 = fma(_648, _652, _700);
    float _712 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _714 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _706);
    float _716 = _708 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _718 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _354);
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _722 = _694 + _720;
    float _724 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _714);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _728 = _712 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _716 + _730;
    float _734 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _308);
    float _736 = fma(_718, _676, _502);
    float _738 = _728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _740 = _728 * _728;
    float _742 = fma(_734, _704, _644);
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _738);
    float _748 = in.m_57.x;
    float _750 = fma(_732, _732, _740);
    float _752 = _690 * _684;
    float _754 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _746);
    float _756 = in.m_57.w;
    float _758 = fma(_722, _722, _750);
    float _760 = -_692;
    float _762 = fma(_724, _710, _760);
    bool _764 = _754 >= 0.0;
    float _766 = _516 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _768 = _742 + 0.5;
    float _770 = rsqrt(_758);
    float _772 = _522 + 0.5;
    float _774 = _766 * _744;
    float _776 = _736 + 0.5;
    float _778 = _698 + 0.5;
    float _780 = _762 + 0.5;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _752;
    out.m_59.y = _774;
    float _784 = _750;
    if (_764)
    {
        _784 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _786 = _784;
    out.m_61.x = _772;
    out.m_61.y = _508;
    out.m_61.z = _776;
    out.m_61.w = _778;
    int _788 = as_type<int>(_786);
    if (_764)
    {
        float _790 = _786 * 5.0;
        _788 = as_type<int>(_790);
    }
    int _792 = _788;
    out.m_63.x = _768;
    out.m_63.y = _780;
    float _794 = _728 * _770;
    float _796 = _732 * _770;
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3454 = as_type<float>(_792);
        out.gl_Position.z = _3454;
    }
    out.m_65.w = _782;
    out.m_67.x = _748;
    out.m_67.w = _756;
    float _798 = _756;
    if (_764)
    {
        out.m_49.x = 0.0;
    }
    if (_764)
    {
        return out;
    }
    float _800 = -_794;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _804 = _722 * _770;
    float _806 = -_796;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _716);
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _802 + _810;
    float _814 = -_804;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _808 + _818;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _826 = _816 + _824;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _822);
    float _830 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[28].z, _828);
    bool _832 = _830 >= 0.0;
    float _834 = _826;
    float _836 = _816;
    if (_832)
    {
        _834 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _838 = _834;
    int _840 = as_type<int>(_838);
    if (_832)
    {
        out.m_49.x = 0.0;
    }
    if (_832)
    {
        float _842 = _838 * 5.0;
        _840 = as_type<int>(_842);
    }
    int _844 = _840;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3557 = as_type<float>(_844);
        out.gl_Position.z = _3557;
    }
    if (_832)
    {
        return out;
    }
    float _846 = in.m_57.z;
    float _848 = abs(_748);
    float _850 = log2(_848);
    float _852 = -_794;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _728);
    float _856 = -_796;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _860 = in.m_57.y;
    float _862 = _180 * 78.233001708984375;
    float _864 = _854 * _854;
    float _866 = -_804;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _722);
    float _870 = -_712;
    float _872 = _870 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _874 = -_716;
    float _876 = _874 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = fma(_858, _858, _864);
    float _880 = -_694;
    float _882 = _880 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 * _872;
    float _886 = _152 * 78.233001708984375;
    float _888 = fma(_868, _868, _878);
    float _890 = fma(_876, _876, _884);
    float _892 = _850 * 0.800000011920928955078125;
    float _894 = sqrt(_888);
    float _896 = fma(_882, _882, _890);
    float _898 = _100 + 290.0;
    float _900 = fma(_846, 12.98980045318603515625, _862);
    float _902 = exp2(_892);
    float _904 = _900 * 0.15915493667125701904296875;
    float _906 = fma(_860, 12.98980045318603515625, _886);
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 3.1415927410125732421875;
    float _910 = _906 * 0.15915493667125701904296875;
    float _912 = _904 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _918 = _860 * 78.233001708984375;
    float _920 = _770 * _894;
    float _922 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _916);
    float _924 = fma(_162, 12.98980045318603515625, _918);
    float _926 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _928 = rsqrt(_896);
    float _930 = in.m_55.x;
    float _932 = in.m_55.y;
    float _934 = in.m_55.z;
    float _936 = _924 * 0.15915493667125701904296875;
    float _938 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _922);
    float _940 = _910 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _914 * 43758.546875;
    float _946 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _926);
    float _948 = rsqrt(_938);
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _946);
    float _952 = _748 * _748;
    float _954 = fma(_898, 0.008000000379979610443115234375, _908);
    float _956 = fma(_952, -0.980000019073486328125, 1.0);
    float _958 = _954 * (-0.15915493667125701904296875);
    float _960 = _936 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = in.m_69.x;
    float _966 = in.m_69.y;
    float _968 = in.m_69.z;
    float _970 = _930 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _972 = _932 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _974 = _942 * 43758.546875;
    float _976 = _934 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _978 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _978;
    float _982 = floor(_944);
    float _984 = _948 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _986 = _980 * _980;
    float _988 = _962 * 43758.546875;
    float _990 = floor(_974);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _994 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _996 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _994;
    float _998 = rsqrt(_950);
    float _1000 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _1004 = fma(_996, _996, _986);
    float _1006 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1006;
    float _1010 = _970 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1014 = _920 * _1000;
    float _1016 = fma(_1008, _1008, _1004);
    float _1018 = _958 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _920 * _1010;
    float _1024 = -_982;
    float _1026 = _944 + _1024;
    float _1028 = -_990;
    float _1030 = _974 + _1028;
    float _1032 = fma(_902, 300.0, _100);
    float _1034 = _872 * _928;
    float _1036 = _1026 * 6.283185482025146484375;
    float _1038 = _998 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1040 = _958 * 6.283185482025146484375;
    float _1042 = cos(_1040);
    float _1044 = _1030 * 6.283185482025146484375;
    float _1046 = _876 * _928;
    float _1048 = _882 * _928;
    float _1050 = _992 * _1022;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1054 = _1046 * _1052;
    float _1056 = fma(_898, 0.0199999995529651641845703125, _1044);
    float _1058 = sqrt(_1016);
    float _1060 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1062 = _1038 * _1020;
    float _1064 = _1056 * 0.15915493667125701904296875;
    float _1066 = _920 * _1060;
    float _1068 = floor(_988);
    float _1070 = _1002 * _1066;
    float _1072 = _1012 * _1014;
    float _1074 = _998 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1078 = _1032 * 0.0050000003539025783538818359375;
    float _1080 = -_1042;
    float _1082 = _1080 + 1.0;
    float _1084 = _1076 * _1020;
    float _1086 = precise::max(_1058, 250.0);
    float _1088 = _1078 * 0.15915493667125701904296875;
    float _1090 = _1074 * _1082;
    float _1092 = _1038 * _1082;
    float _1094 = precise::min(_1086, 400.0);
    float _1096 = _1088 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = fma(_1038, _1090, _1084);
    float _1102 = -_1068;
    float _1104 = _988 + _1102;
    float _1106 = _1074 * _1020;
    float _1108 = fma(_1032, -0.02300000004470348358154296875, _1036);
    float _1110 = -_1084;
    float _1112 = fma(_1038, _1090, _1110);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = _1048 * _1114;
    float _1118 = fma(_1076, _1092, _1106);
    float _1120 = _1108 * 0.15915493667125701904296875;
    float _1122 = fma(_1032, 0.0199999995529651641845703125, _1044);
    float _1124 = _1088 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = -_1106;
    float _1130 = fma(_1076, _1092, _1128);
    float _1132 = fma(_1074, _1090, _1042);
    float _1134 = _1122 * 0.15915493667125701904296875;
    float _1136 = fma(_1094, 0.0040000001899898052215576171875, -0.6000001430511474609375);
    float _1138 = fma(_1032, 0.008000000379979610443115234375, _908);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = -_1054;
    float _1144 = fma(_1048, _1140, _1142);
    float _1146 = _1076 * _1076;
    float _1148 = _1134 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = fma(_1038, _1092, _1042);
    float _1154 = -_1062;
    float _1156 = fma(_1076, _1090, _1154);
    float _1158 = fma(_1076, _1090, _1062);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1162 = _1034 * _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1166 = -_1116;
    float _1168 = fma(_1034, _1164, _1166);
    float _1170 = fma(_1032, 0.0540000014007091522216796875, _1044);
    float _1172 = fma(_1146, _1082, _1042);
    float _1174 = _1144 * _1144;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1178 = -_1162;
    float _1180 = fma(_1046, _1176, _1178);
    float _1182 = fma(_1032, 0.14423076808452606201171875, 10.0);
    float _1184 = fma(_898, 0.0540000014007091522216796875, _1044);
    float _1186 = fma(_1168, _1168, _1174);
    float _1188 = _1170 * 0.15915493667125701904296875;
    float _1190 = _1104 * 6.283185482025146484375;
    float _1192 = _1184 * 0.15915493667125701904296875;
    float _1194 = fma(_1180, _1180, _1186);
    float _1196 = fma(_898, 0.14423076808452606201171875, 10.0);
    float _1198 = _948 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1200 = _1188 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = fma(_100, 0.1500000059604644775390625, _1190);
    float _1206 = _948 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1208 = _1198 * _1098;
    float _1210 = _1198 * _1198;
    float _1212 = _984 * _1098;
    float _1214 = _1204 * 0.15915493667125701904296875;
    float _1216 = _1206 * _1098;
    float _1218 = _1192 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = precise::max(_1182, 10.0);
    float _1224 = precise::max(_1196, 10.0);
    float _1226 = precise::min(_1222, 160.0);
    float _1228 = rsqrt(_1194);
    float _1230 = -_1126;
    float _1232 = _1230 + 1.0;
    float _1234 = _1202 * 3.0;
    float _1236 = _984 * _1232;
    float _1238 = fma(_1232, _1210, _1126);
    float _1240 = _1206 * _1232;
    float _1242 = _1120 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = fma(_984, _1236, _1126);
    float _1248 = fma(_1206, _1236, _1208);
    float _1250 = -_1208;
    float _1252 = fma(_1206, _1236, _1250);
    float _1254 = fma(_1206, _1240, _1126);
    float _1256 = fma(_1198, _1240, _1212);
    float _1258 = fma(_1150, 6.0, _1234);
    float _1260 = _1064 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = _1180 * _1228;
    float _1266 = _1168 * _1228;
    float _1268 = _1226 + _1258;
    float _1270 = _1138 * 0.15915493667125701904296875;
    float _1272 = _1046 * _1264;
    float _1274 = _1214 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    float _1278 = -_1216;
    float _1280 = fma(_1198, _1236, _1278);
    float _1282 = fma(_1198, _1236, _1216);
    float _1284 = -_1212;
    float _1286 = fma(_1198, _1240, _1284);
    float _1288 = fma(_1244, 0.1500000059604644775390625, 1.0);
    float _1290 = _1144 * _1228;
    float _1292 = _1220 * 3.0;
    float _1294 = -_1272;
    float _1296 = fma(_1048, _1266, _1294);
    float _1298 = _956 * _1288;
    float _1300 = _1048 * _1290;
    float _1302 = _1034 * _1266;
    float _1304 = fma(_1262, 6.0, _1292);
    float _1306 = _1070 * _1296;
    float _1308 = -_1300;
    float _1310 = fma(_1034, _1264, _1308);
    float _1312 = -_1302;
    float _1314 = fma(_1046, _1290, _1312);
    float _1316 = _1298 * _1136;
    float _1318 = _1070 * _1310;
    float _1320 = fma(_1050, _1290, _1306);
    float _1322 = _1070 * _1314;
    float _1324 = fma(_1050, _1266, _1318);
    float _1326 = fma(_1072, _1034, _1320);
    float _1328 = fma(_1276, 0.119999997317790985107421875, 1.0);
    float _1330 = fma(_1050, _1264, _1322);
    float _1332 = fma(_1072, _1046, _1324);
    float _1334 = _1326 * _1252;
    float _1336 = _1326 * _1254;
    float _1338 = _1326 * _1256;
    float _1340 = _1270 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = fma(_1326, _1328, _712);
    float _1346 = precise::min(_1224, 160.0);
    float _1348 = fma(_1072, _1048, _1330);
    float _1350 = fma(_1332, _1246, _1334);
    float _1352 = fma(_1332, _1248, _1336);
    float _1354 = fma(_1332, _1280, _1338);
    float _1356 = -_712;
    float _1358 = _1356 + _1344;
    float _1360 = _1270 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = fma(_1332, _1328, _716);
    float _1366 = fma(_1348, _1282, _1350);
    float _1368 = fma(_1348, _1286, _1352);
    float _1370 = fma(_1348, _1328, _694);
    float _1372 = fma(_1348, _1238, _1354);
    float _1374 = _1152 * _1358;
    float _1376 = _1112 * _1358;
    float _1378 = -_716;
    float _1380 = _1378 + _1364;
    float _1382 = _1118 * _1358;
    float _1384 = _954 * 0.15915493667125701904296875;
    float _1386 = -_694;
    float _1388 = _1386 + _1370;
    float _1390 = fma(_1100, _1380, _1374);
    float _1392 = fma(_1366, _1316, _716);
    float _1394 = fma(_1368, _1316, _712);
    float _1396 = fma(_1372, _1316, _694);
    float _1398 = fma(_1132, _1380, _1376);
    float _1400 = _1384 * 6.283185482025146484375;
    float _1402 = cos(_1400);
    float _1404 = -_1342;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1130, _1388, _1390);
    float _1410 = fma(_1156, _1380, _1382);
    float _1412 = fma(_1158, _1388, _1398);
    float _1414 = _1076 * _1362;
    float _1416 = _1074 * _1406;
    float _1418 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1394);
    float _1420 = _1384 * 6.283185482025146484375;
    float _1422 = sin(_1420);
    float _1424 = fma(_1172, _1388, _1410);
    float _1426 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1392);
    float _1428 = -_1414;
    float _1430 = fma(_1038, _1416, _1428);
    float _1432 = -_712;
    float _1434 = _1432 + _1418;
    float _1436 = _1346 + _1304;
    float _1438 = _712 + _1408;
    float _1440 = _716 + _1412;
    float _1442 = _694 + _1424;
    float _1444 = fma(_1074, _1416, _1342);
    float _1446 = -_716;
    float _1448 = _1446 + _1426;
    float _1450 = _1430 * _1434;
    float _1452 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1438);
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1440);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1442);
    float _1458 = -_1402;
    float _1460 = _1458 + 1.0;
    float _1462 = fma(_1444, _1448, _1450);
    float _1464 = _1074 * _1422;
    float _1466 = _1038 * _1422;
    float _1468 = _1076 * _1422;
    float _1470 = _1074 * _1362;
    float _1472 = _1038 * _1406;
    float _1474 = fma(_1406, _1146, _1342);
    float _1476 = _1038 * _1460;
    float _1478 = fma(_1146, _1460, _1402);
    float _1480 = _1038 * _1362;
    float _1482 = fma(_1076, _1472, _1470);
    float _1484 = _1074 * _1460;
    float _1486 = fma(_1076, _1476, _1464);
    float _1488 = -_712;
    float _1490 = _1488 + _1452;
    float _1492 = -_1480;
    float _1494 = fma(_1076, _1416, _1492);
    float _1496 = _1482 * _1434;
    float _1498 = -_1468;
    float _1500 = fma(_1038, _1484, _1498);
    float _1502 = -_1466;
    float _1504 = fma(_1076, _1484, _1502);
    float _1506 = -_716;
    float _1508 = _1506 + _1454;
    float _1510 = _1486 * _1490;
    float _1512 = fma(_1494, _1448, _1496);
    float _1514 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1396);
    float _1516 = fma(_1074, _1484, _1402);
    float _1518 = _1500 * _1490;
    float _1520 = fma(_1504, _1508, _1510);
    float _1522 = -_694;
    float _1524 = _1522 + _1456;
    float _1526 = -_694;
    float _1528 = _1526 + _1514;
    float _1530 = fma(_1516, _1508, _1518);
    float _1532 = fma(_1076, _1484, _1466);
    float _1534 = fma(_1478, _1524, _1520);
    float _1536 = fma(_1474, _1528, _1512);
    float _1538 = fma(_1076, _1416, _1480);
    float _1540 = fma(_1532, _1524, _1530);
    float _1542 = -_756;
    float _1544 = _1542 + 1.0;
    float _1546 = _694 + _1534;
    float _1548 = fma(_1538, _1528, _1462);
    float _1550 = _694 + _1536;
    float _1552 = _716 + _1540;
    float _1554 = _1546 * _1544;
    float _1556 = _716 + _1548;
    float _1558 = fma(_1038, _1476, _1402);
    float _1560 = _1552 * _1544;
    float _1562 = fma(_1550, _756, _1554);
    float _1564 = fma(_1038, _1484, _1468);
    float _1566 = fma(_1038, _1472, _1342);
    float _1568 = fma(_1556, _756, _1560);
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1572 = _1562 + _1570;
    float _1574 = _1558 * _1490;
    float _1576 = -_1464;
    float _1578 = fma(_1076, _1476, _1576);
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1582 = _1568 + _1580;
    float _1584 = _1572 * _1572;
    float _1586 = fma(_1038, _1416, _1414);
    float _1588 = _1566 * _1434;
    float _1590 = fma(_1564, _1508, _1574);
    float _1592 = fma(_1582, _1582, _1584);
    float _1594 = -_1470;
    float _1596 = fma(_1076, _1472, _1594);
    float _1598 = fma(_1586, _1448, _1588);
    float _1600 = fma(_1578, _1524, _1590);
    float _1602 = sqrt(_1592);
    float _1604 = fma(_1596, _1528, _1598);
    float _1606 = _712 + _1600;
    float _1608 = _712 + _1604;
    float _1610 = _1606 * _1544;
    float _1612 = fma(_1608, _756, _1610);
    bool _1614 = _1602 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1574;
    float _1618 = _1448;
    float _1620 = _1598;
    float _1622 = _1038;
    if (!_1614)
    {
        _1616 = _1568;
    }
    float _1624 = _1616;
    float _1626 = _1624;
    if (!_1614)
    {
        _1618 = _1562;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (!_1614)
    {
        _1620 = _1612;
    }
    float _1632 = _1620;
    bool _1634 = !_1614;
    float _1636 = _1632;
    if (!_1634)
    {
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1642 = _1602 + _1640;
        float _1644 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1646 = rsqrt(_1592);
        float _1648 = _1642 * _1638;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1650 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = _1654 + (-1.0);
        float _1662 = fma(_1658, _1644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1664 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = _1646 * _1662;
        float _1668 = fma(_1612, _1654, _1664);
        float _1670 = fma(_1582, _1666, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1672 = fma(_1572, _1666, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1636 = _1668;
        _1626 = _1670;
        _1630 = _1672;
        _798 = _1666;
    }
    float _1674 = _1636;
    float _1676 = _1626;
    float _1678 = _1630;
    float _1680 = _798;
    float _1682 = -_794;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1674);
    float _1686 = -_796;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1676);
    float _1690 = -_804;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1684 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1688 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1692 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = precise::max(0.0, _1694);
    float _1712 = fma(_1702, _1702, _1708);
    float _1714 = fma(_1706, _1706, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1702 * _1718;
    float _1722 = _1706 * _1718;
    float _1724 = -_1718;
    float _1726 = -_1710;
    float _1728 = fma(_1698, _1724, _1726);
    float _1730 = _1720 * _1720;
    float _1732 = _1722 * _1722;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1712;
    float _1746 = _1698;
    float _1748 = _1716;
    float _1750 = _1742;
    float _1752 = _1680;
    float _1754 = _1710;
    float _1756 = _1718;
    if (_1738)
    {
        float _1758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (_1738)
    {
        float _1762 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1762;
    }
    float _1764 = _1746;
    float _1766 = _1764;
    if (_1738)
    {
        float _1768 = rsqrt(_1734);
        _1748 = _1768;
    }
    float _1770 = _1748;
    float _1772 = _1760;
    if (_1738)
    {
        float _1774 = _1742 * _1760;
        _1750 = _1774;
    }
    float _1776 = _1750;
    if (_1738)
    {
        float _1778 = _1776 * 0.15915493667125701904296875;
        _1752 = _1778;
    }
    float _1780 = _1752;
    float _1782 = _1776;
    if (_1738)
    {
        float _1784 = _1780 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        _1782 = _1786;
    }
    float _1788 = _1782;
    float _1790 = _1706;
    if (_1738)
    {
        float _1792 = _1780 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        _1790 = _1794;
    }
    float _1796 = _1790;
    float _1798 = _1788;
    if (_1738)
    {
        float _1800 = fma(_1788, _1764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1772 = _1800;
    }
    float _1802 = _1772;
    float _1804 = _1802;
    if (!_1738)
    {
        _1766 = _1720;
    }
    float _1806 = _1766;
    float _1808 = _1806;
    if (!_1738)
    {
        _1798 = _1728;
    }
    float _1810 = _1798;
    float _1812 = _1810;
    if (_1738)
    {
        float _1814 = _1770 * _1802;
        _1622 = _1814;
    }
    float _1816 = _1622;
    if (!_1738)
    {
        _1804 = _1730;
    }
    float _1818 = _1804;
    float _1820 = sqrt(_1714);
    float _1822 = _1818;
    float _1824 = _1796;
    if (_1738)
    {
        float _1826 = _1796 + (-1.0);
        _1754 = _1826;
    }
    float _1828 = _1754;
    float _1830 = _1828;
    if (_1738)
    {
        float _1832 = _1720 * _1816;
        _1808 = _1832;
    }
    float _1834 = _1808;
    float _1836 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1738)
    {
        float _1838 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1838;
    }
    float _1840 = _1756;
    if (!_1738)
    {
        _1830 = _1722;
    }
    float _1842 = _1830;
    float _1844 = _1842;
    if (_1738)
    {
        float _1846 = _1722 * _1816;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1738)
    {
        float _1850 = _1834 * _1834;
        _1822 = _1850;
    }
    float _1852 = _1822;
    if (_1738)
    {
        float _1854 = fma(_1728, _1796, _1840);
        _1812 = _1854;
    }
    float _1856 = _1812;
    if (!_1738)
    {
        _1824 = _1732;
    }
    float _1858 = _1824;
    float _1860 = _1858;
    if (_1738)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1856, _1856, _1852);
    float _1868 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1836);
    float _1870 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1872 = _1866 + _1864;
    float _1874 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1878 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1876);
    float _1880 = precise::clamp(_1878, 0.0, 1.0);
    float _1882 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = rsqrt(_1872);
    float _1886 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1874);
    float _1888 = -_1880;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1882);
    float _1894 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1868);
    float _1896 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1886);
    float _1898 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1902 = abs(_1890);
    float _1904 = log2(_1902);
    float _1906 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1898);
    float _1910 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1914 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1916 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1918 = _1884 * _1834;
    float _1920 = _1884 * _1856;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = _1884 * _1848;
    float _1930 = -_1912;
    float _1932 = fma(_1930, _1870, 1.0);
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1936 = -_1926;
    float _1938 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1934);
    float _1944 = -_1928;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1948 = exp2(_1940);
    float _1950 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1952 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1954 = fma(_1946, -0.5, 0.5);
    float _1956 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1958 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1950);
    float _1960 = fma(_1946, 0.5, 0.5);
    float _1962 = _1920 + 1.0;
    float _1964 = log2(_1932);
    float _1966 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1956);
    float _1968 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1966);
    float _1974 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1968);
    float _1976 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1978 = 1.0 / _1952;
    float _1980 = -_1920;
    float _1982 = fma(_1948, _1962, _1980);
    float _1984 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1972);
    float _1986 = fma(_1960, _1976, 1.570728778839111328125);
    float _1988 = sqrt(_1954);
    float _1990 = _1964 * 0.693147182464599609375;
    float _1992 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1994 = fma(_1982, 0.5, 0.5);
    float _1996 = _1974 * _1978;
    float _1998 = _1984 * _1978;
    float _2000 = fma(_1996, 0.5, 0.5);
    float _2002 = fma(_1998, -0.5, 0.5);
    float _2004 = _1988 * 0.636619746685028076171875;
    float3 _5389 = float3(_2000, _2002, _1992);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5389, float3(0.0), isnan(_5389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5389, float3(0.0), isnan(_5389)), level(0.0)).x;
    float3 _5400 = float3(_2000, _2002, _1992);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5400, float3(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5400, float3(0.0), isnan(_5400)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float _2019 = -_1986;
    float _2021 = fma(_2004, _2019, 1.0);
    float2 _5422 = float2(_2021, _1994);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5422, float2(0.0), isnan(_5422)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5422, float2(0.0), isnan(_5422)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = _802 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2035 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.w = _782;
    float _2037 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2033);
    float _2039 = _802 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2041 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2035);
    float _2043 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2037);
    float _2045 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2039);
    bool _2047 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan(0.5);
    bool _2055 = _2051 || _2053;
    float _2057 = _1952 * 0.5;
    float _2059 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2061 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2045);
    float _2063 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2041);
    float _2065 = _1974 + _1952;
    float _2067 = 1.0 / _2059;
    float _2069 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2071 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2063);
    out.m_71.x = _1688;
    out.m_71.y = _1684;
    out.m_71.z = _1692;
    float _2073 = _2065 * 0.5;
    float _2075 = _2069 + _2059;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2079 = _2000;
    float _2081 = _2075;
    float _2083 = _1904;
    if (!_2055)
    {
        _2077 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2085 = _2077;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1984;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1952;
    float _2087 = _2085;
    if (!_2055)
    {
        _2079 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2089 = _2079;
    if (_2055)
    {
        _836 = 1.0;
    }
    float _2091 = _836;
    float _2093 = _2075 * _2067;
    float _2095 = _2093 * 0.5;
    float _2097 = _2091;
    if (!_2055)
    {
        float _2099 = -_2089;
        float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2081 = _2101;
    }
    float _2103 = _2081;
    float _2105 = _2103;
    if (!_2055)
    {
        float _2107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2109 = fma(_2095, _2085, _2107);
        _2087 = _2109;
    }
    float _2111 = _2087;
    float _2113 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2055)
    {
        float _2115 = 1.0 / _2103;
        _2105 = _2115;
    }
    float _2117 = _2105;
    float _2119 = exp2(_2113);
    float _2121 = _2111;
    if (!_2055)
    {
        float _2123 = 1.0 / _2111;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = -_2119;
    float _2129 = _2127 + 1.0;
    float _2131 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2055)
    {
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2135 = -_2089;
        float _2137 = fma(_2125, _2133, _2135);
        _2083 = _2137;
    }
    float _2139 = _2083;
    float _2141 = fma(_1984, -0.5, _2057);
    if (!_2055)
    {
        float _2143 = _2139 * _2117;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2097 = _2145;
    }
    float _2147 = _2097;
    float _2149 = _2071 + _1952;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2153 = _2147 > 0.0;
    bool _2155 = isnan(_2147);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(0.0);
    bool _2161 = _2157 || _2159;
    float _2163 = _2149 * 0.5;
    float _2165 = _2151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2073;
    out.m_73.y = _2141;
    out.m_73.z = _2163;
    out.m_73.w = _1952;
    out.m_49.x = _2165;
    float _2167 = _2131 * _2006;
    float _2169 = -_2131;
    float _2171 = _2169 + 1.0;
    float _2173 = _2017 * _2167;
    float _2175 = _2031 * _2167;
    float _2177 = fma(_2027, _2173, _2011);
    float _2179 = fma(_2029, _2173, _2013);
    float _2181 = _2017 * _2171;
    float _2183 = fma(_2017, _2175, _2015);
    out.m_75.x = _2177;
    out.m_75.y = _2179;
    out.m_75.z = _2183;
    out.m_75.w = _2181;
    if (_2161)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2185 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2185;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_114);
        out.gl_Position.z = _2250;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _118 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_91);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_96);
    bool _130 = _100 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _116 = as_type<int>(_140);
    }
    int _142 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2306 = as_type<float>(_142);
        out.gl_Position.z = _2306;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _148 = in.m_53.y;
    float _150 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _152 = in.m_51.y;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _158 = _156 != 0;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _162 = in.m_51.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _170 = _168 != 0;
    float _172 = in.m_53.x;
    float _174 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    float _180 = in.m_51.z;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _184 = _182 != 0;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _188 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _190 = _160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _192 = -_150;
    float _194 = fma(_188, 2.0, _192);
    float _196 = -_148;
    float _198 = _196 + 1.0;
    float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _204 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _206 = _152 > 0.5;
    bool _208 = _162 > 0.5;
    float _210 = fma(_204, -2.0, _154);
    int _212 = _206 ? as_type<int>(_198) : as_type<int>(_148);
    float _214 = _186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _216 = _208 ? as_type<int>(_198) : as_type<int>(_148);
    float _218 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _210);
    int _220 = 0;
    bool _222 = _166;
    bool _224 = _208;
    float _226 = _218;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _230 = _144;
    float _232 = _204;
    float _234 = _214;
    float _236 = _172;
    if (_178)
    {
        float _238 = -_172;
        float _240 = _238 + 1.0;
        _220 = as_type<int>(_240);
    }
    int _242 = _220;
    int _244 = 0;
    if (_184)
    {
        float _246 = -_172;
        float _248 = _246 + 1.0;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = _158 ? as_type<float>(_216) : _148;
    float _254 = _166 ? as_type<float>(_212) : _148;
    bool _256 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _260 = _256 || _258;
    bool _262 = isnan(1.0);
    bool _264 = _260 || _262;
    float _266 = fma(_190, _252, -0.5);
    float _268 = _252;
    float _270 = as_type<float>(_250);
    if (!_170)
    {
        _268 = _144;
    }
    float _272 = _268;
    float _274 = fma(_174, _254, -0.5);
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _278 = _272;
    float _280 = _274;
    if (_184)
    {
        bool _282 = _180 > 0.5;
        _222 = _282;
    }
    bool _284 = _222;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_178)
    {
        bool _288 = _144 > 0.5;
        _224 = _288;
    }
    bool _290 = _224;
    float _292 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _276);
    float _294 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _298 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _286);
    float _300 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _302 = _292;
    float _304 = _294;
    if (!_170)
    {
        _302 = _272;
    }
    float _306 = _302;
    float _308 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _296);
    float _310 = _306;
    if (_170)
    {
        _278 = _144;
    }
    float _312 = _278;
    float _314 = -_218;
    float _316 = fma(_300, _274, _314);
    if (!_170)
    {
        _226 = _152;
    }
    float _318 = _226;
    float _320 = _318;
    if (!_264)
    {
        float _322 = _294 * _294;
        float _324 = _322 * 0.5;
        _280 = _324;
    }
    float _326 = _280;
    float _328 = _326;
    if (!_178)
    {
        _228 = _172;
    }
    float _330 = _228;
    float _332 = 0.0;
    float _334 = _330;
    if (!_170)
    {
        _332 = _318;
    }
    float _336 = _332;
    float _338 = _336;
    if (!_264)
    {
        float _340 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _340;
    }
    float _342 = _328;
    float _344 = _342;
    if (_170)
    {
        _320 = _312;
    }
    float _346 = _320;
    if (!_184)
    {
        _230 = _172;
    }
    float _348 = _230;
    float _350 = _348;
    if (!_170)
    {
        _232 = _180;
    }
    float _352 = _232;
    float _354 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _202);
    float _356 = _352;
    if (_178)
    {
        float _358 = _290 ? as_type<float>(_242) : _172;
        _334 = _358;
    }
    float _360 = _334;
    if (_184)
    {
        float _362 = _284 ? as_type<float>(_250) : _172;
        _350 = _362;
    }
    float _364 = _350;
    bool _366 = !_264;
    float _368 = _364;
    if (!_366)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _380 = _294 * _372;
        float _382 = exp2(_380);
        float _384 = _378 * 0.693147182464599609375;
        float _386 = 1.0 / _384;
        float _388 = 1.0 / _376;
        float _390 = _382 + (-1.0);
        float _392 = -_390;
        float _394 = fma(_392, _386, _294);
        float _396 = _394 * _388;
        float _398 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _382;
        _344 = _398;
    }
    float _400 = _270;
    float _402 = _344;
    bool _404 = !_264;
    float _406 = _400;
    if (!_404)
    {
        float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _410 = log2(_408);
        float _412 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _414 = _412 + 1.0;
        float _416 = 1.0 / _414;
        float _418 = _294 * _410;
        float _420 = exp2(_418);
        float _422 = -_420;
        float _424 = _422 + 1.0;
        float _426 = _424 * _416;
        _304 = _426;
    }
    float _428 = _304;
    if (!_170)
    {
        _406 = _352;
    }
    float _430 = _406;
    float _432 = fma(_214, _360, -0.5);
    float _434 = _200 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _436 = _430;
    float _438 = _434;
    if (_170)
    {
        _356 = _180;
    }
    float _440 = _356;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_170)
    {
        _338 = _312;
    }
    float _446 = _338;
    float _448 = -_100;
    float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    if (_170)
    {
        _310 = _440;
    }
    float _452 = _310;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _456 = _180 > 0.5;
    float _458 = _446 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _462 = _460 != 0;
    float _464 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[84].z, _444);
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _468 = _466 != 0;
    float _470 = fma(_434, _364, -0.5);
    int _472 = _456 ? as_type<int>(_198) : as_type<int>(_148);
    float _474 = -_454;
    float _476 = fma(_458, 2.0, _474);
    float _478 = in.m_55.w;
    float _480 = _454;
    if (_170)
    {
        _368 = _152;
    }
    float _482 = _368;
    float _484 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _464);
    float _486 = _482;
    if (!_170)
    {
        _486 = _312;
    }
    float _488 = _486;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_170)
    {
        _480 = _312;
    }
    float _492 = _480;
    float _494 = _484 * (-0.15915493667125701904296875);
    float _496 = _492;
    if (!_170)
    {
        _234 = _430;
    }
    float _498 = _234;
    float _500 = -_100;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _476);
    float _504 = _498;
    if (!_170)
    {
        _496 = _440;
    }
    float _506 = _496;
    float _508 = _316 + 0.5;
    if (_170)
    {
        _436 = _152;
    }
    float _510 = _436;
    float _512 = _462 ? as_type<float>(_472) : _148;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _516 = _468 ? as_type<float>(_472) : _148;
    float _518 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _298);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[83].w, _490);
    float _522 = fma(_518, _432, _450);
    if (_170)
    {
        _438 = _440;
    }
    float _524 = _438;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _528 = in.m_44.x;
    float _530 = in.m_44.y;
    float _532 = in.m_44.z;
    float _534 = _524;
    if (!_170)
    {
        _534 = _152;
    }
    float _536 = _534;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _540 = -_526;
    float _542 = fma(_514, 2.0, _540);
    float _544 = _442 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _546 = in.m_42.x;
    float _548 = in.m_42.y;
    float _550 = in.m_42.z;
    float _552 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[89].z, _538);
    if (_170)
    {
        _504 = _152;
    }
    float _554 = _504;
    float _556 = fma(_544, _512, -0.5);
    float _558 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _552);
    float _560 = _488 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _568 = _566 != 0;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _576 = _554 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _578 = _558 * (-0.15915493667125701904296875);
    float _580 = fma(_560, -2.0, _570);
    float _582 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _584 = fma(_576, -2.0, _574);
    float _586 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _588 = _494 * 6.283185482025146484375;
    float _590 = cos(_588);
    float _592 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _594 = fma(_428, _530, _582);
    float _596 = fma(_428, _532, _586);
    int _598 = as_type<int>(_532);
    float _600 = _528;
    if (_564)
    {
        float _602 = -_172;
        float _604 = _602 + 1.0;
        _598 = as_type<int>(_604);
    }
    int _606 = _598;
    float _608 = fma(_428, _528, _592);
    if (!_564)
    {
        _600 = _172;
    }
    float _610 = _600;
    float _612 = fma(_596, _478, _550);
    float _614 = _494 * 6.283185482025146484375;
    float _616 = sin(_614);
    int _618 = as_type<int>(_550);
    float _620 = _610;
    if (_568)
    {
        float _622 = -_172;
        float _624 = _622 + 1.0;
        _618 = as_type<int>(_624);
    }
    int _626 = _618;
    if (_564)
    {
        float _628 = _206 ? as_type<float>(_606) : _172;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = fma(_608, _478, _546);
    float _634 = fma(_594, _478, _548);
    float _636 = _572 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_568)
    {
        float _638 = _206 ? as_type<float>(_626) : _172;
        _236 = _638;
    }
    float _640 = _236;
    float _642 = -_100;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[86].x, _542);
    float _646 = _578 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = _590 * _266;
    float _652 = fma(_636, _630, -0.5);
    float _654 = _634 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _634 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _658 = _634 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _662 = _578 * 6.283185482025146484375;
    float _664 = cos(_662);
    float _666 = _616 * _266;
    float _668 = fma(_616, _470, _650);
    float _670 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[4].x, _656);
    float _672 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _674 = -_666;
    float _676 = fma(_590, _470, _674);
    float _678 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _680 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _520);
    float _682 = _648 * _556;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _686 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _688 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _584);
    float _690 = _640 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _692 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _580);
    float _694 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = -_688;
    float _698 = fma(_680, _668, _696);
    float _700 = _664 * _556;
    float _702 = -_682;
    float _704 = fma(_664, _652, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _708 = fma(_612, (*spvDescriptorSet0.vp_c10)._m0[4].z, _670);
    float _710 = fma(_648, _652, _700);
    float _712 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _714 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _706);
    float _716 = _708 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _718 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _354);
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _722 = _694 + _720;
    float _724 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _714);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _728 = _712 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _716 + _730;
    float _734 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _308);
    float _736 = fma(_718, _676, _502);
    float _738 = _728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _740 = _728 * _728;
    float _742 = fma(_734, _704, _644);
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].x, _738);
    float _748 = in.m_57.x;
    float _750 = fma(_732, _732, _740);
    float _752 = _690 * _684;
    float _754 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _746);
    float _756 = in.m_57.w;
    float _758 = fma(_722, _722, _750);
    float _760 = -_692;
    float _762 = fma(_724, _710, _760);
    bool _764 = _754 >= 0.0;
    float _766 = _516 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _768 = _742 + 0.5;
    float _770 = rsqrt(_758);
    float _772 = _522 + 0.5;
    float _774 = _766 * _744;
    float _776 = _736 + 0.5;
    float _778 = _698 + 0.5;
    float _780 = _762 + 0.5;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _752;
    out.m_59.y = _774;
    float _784 = _750;
    if (_764)
    {
        _784 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _786 = _784;
    out.m_61.x = _772;
    out.m_61.y = _508;
    out.m_61.z = _776;
    out.m_61.w = _778;
    int _788 = as_type<int>(_786);
    if (_764)
    {
        float _790 = _786 * 5.0;
        _788 = as_type<int>(_790);
    }
    int _792 = _788;
    out.m_63.x = _768;
    out.m_63.y = _780;
    float _794 = _728 * _770;
    float _796 = _732 * _770;
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3454 = as_type<float>(_792);
        out.gl_Position.z = _3454;
    }
    out.m_65.w = _782;
    out.m_67.x = _748;
    out.m_67.w = _756;
    float _798 = _756;
    if (_764)
    {
        out.m_49.x = 0.0;
    }
    if (_764)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _800 = -_794;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _804 = _722 * _770;
    float _806 = -_796;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _716);
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _802 + _810;
    float _814 = -_804;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _808 + _818;
    float _822 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _826 = _816 + _824;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _822);
    float _830 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[28].z, _828);
    bool _832 = _830 >= 0.0;
    float _834 = _826;
    float _836 = _816;
    if (_832)
    {
        _834 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _838 = _834;
    int _840 = as_type<int>(_838);
    if (_832)
    {
        out.m_49.x = 0.0;
    }
    if (_832)
    {
        float _842 = _838 * 5.0;
        _840 = as_type<int>(_842);
    }
    int _844 = _840;
    if (_832)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3557 = as_type<float>(_844);
        out.gl_Position.z = _3557;
    }
    if (_832)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _846 = in.m_57.z;
    float _848 = abs(_748);
    float _850 = log2(_848);
    float _852 = -_794;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _728);
    float _856 = -_796;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _860 = in.m_57.y;
    float _862 = _180 * 78.233001708984375;
    float _864 = _854 * _854;
    float _866 = -_804;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _722);
    float _870 = -_712;
    float _872 = _870 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _874 = -_716;
    float _876 = _874 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = fma(_858, _858, _864);
    float _880 = -_694;
    float _882 = _880 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 * _872;
    float _886 = _152 * 78.233001708984375;
    float _888 = fma(_868, _868, _878);
    float _890 = fma(_876, _876, _884);
    float _892 = _850 * 0.800000011920928955078125;
    float _894 = sqrt(_888);
    float _896 = fma(_882, _882, _890);
    float _898 = _100 + 290.0;
    float _900 = fma(_846, 12.98980045318603515625, _862);
    float _902 = exp2(_892);
    float _904 = _900 * 0.15915493667125701904296875;
    float _906 = fma(_860, 12.98980045318603515625, _886);
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 3.1415927410125732421875;
    float _910 = _906 * 0.15915493667125701904296875;
    float _912 = _904 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _918 = _860 * 78.233001708984375;
    float _920 = _770 * _894;
    float _922 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _916);
    float _924 = fma(_162, 12.98980045318603515625, _918);
    float _926 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _928 = rsqrt(_896);
    float _930 = in.m_55.x;
    float _932 = in.m_55.y;
    float _934 = in.m_55.z;
    float _936 = _924 * 0.15915493667125701904296875;
    float _938 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _922);
    float _940 = _910 * 6.283185482025146484375;
    float _942 = sin(_940);
    float _944 = _914 * 43758.546875;
    float _946 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _926);
    float _948 = rsqrt(_938);
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _946);
    float _952 = _748 * _748;
    float _954 = fma(_898, 0.008000000379979610443115234375, _908);
    float _956 = fma(_952, -0.980000019073486328125, 1.0);
    float _958 = _954 * (-0.15915493667125701904296875);
    float _960 = _936 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = in.m_69.x;
    float _966 = in.m_69.y;
    float _968 = in.m_69.z;
    float _970 = _930 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _972 = _932 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _974 = _942 * 43758.546875;
    float _976 = _934 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _978 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _978;
    float _982 = floor(_944);
    float _984 = _948 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _986 = _980 * _980;
    float _988 = _962 * 43758.546875;
    float _990 = floor(_974);
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _994 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _996 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _994;
    float _998 = rsqrt(_950);
    float _1000 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _1004 = fma(_996, _996, _986);
    float _1006 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1006;
    float _1010 = _970 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1014 = _920 * _1000;
    float _1016 = fma(_1008, _1008, _1004);
    float _1018 = _958 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _920 * _1010;
    float _1024 = -_982;
    float _1026 = _944 + _1024;
    float _1028 = -_990;
    float _1030 = _974 + _1028;
    float _1032 = fma(_902, 300.0, _100);
    float _1034 = _872 * _928;
    float _1036 = _1026 * 6.283185482025146484375;
    float _1038 = _998 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1040 = _958 * 6.283185482025146484375;
    float _1042 = cos(_1040);
    float _1044 = _1030 * 6.283185482025146484375;
    float _1046 = _876 * _928;
    float _1048 = _882 * _928;
    float _1050 = _992 * _1022;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1054 = _1046 * _1052;
    float _1056 = fma(_898, 0.0199999995529651641845703125, _1044);
    float _1058 = sqrt(_1016);
    float _1060 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1062 = _1038 * _1020;
    float _1064 = _1056 * 0.15915493667125701904296875;
    float _1066 = _920 * _1060;
    float _1068 = floor(_988);
    float _1070 = _1002 * _1066;
    float _1072 = _1012 * _1014;
    float _1074 = _998 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1078 = _1032 * 0.0050000003539025783538818359375;
    float _1080 = -_1042;
    float _1082 = _1080 + 1.0;
    float _1084 = _1076 * _1020;
    float _1086 = precise::max(_1058, 250.0);
    float _1088 = _1078 * 0.15915493667125701904296875;
    float _1090 = _1074 * _1082;
    float _1092 = _1038 * _1082;
    float _1094 = precise::min(_1086, 400.0);
    float _1096 = _1088 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = fma(_1038, _1090, _1084);
    float _1102 = -_1068;
    float _1104 = _988 + _1102;
    float _1106 = _1074 * _1020;
    float _1108 = fma(_1032, -0.02300000004470348358154296875, _1036);
    float _1110 = -_1084;
    float _1112 = fma(_1038, _1090, _1110);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = _1048 * _1114;
    float _1118 = fma(_1076, _1092, _1106);
    float _1120 = _1108 * 0.15915493667125701904296875;
    float _1122 = fma(_1032, 0.0199999995529651641845703125, _1044);
    float _1124 = _1088 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = -_1106;
    float _1130 = fma(_1076, _1092, _1128);
    float _1132 = fma(_1074, _1090, _1042);
    float _1134 = _1122 * 0.15915493667125701904296875;
    float _1136 = fma(_1094, 0.0040000001899898052215576171875, -0.6000001430511474609375);
    float _1138 = fma(_1032, 0.008000000379979610443115234375, _908);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = -_1054;
    float _1144 = fma(_1048, _1140, _1142);
    float _1146 = _1076 * _1076;
    float _1148 = _1134 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = fma(_1038, _1092, _1042);
    float _1154 = -_1062;
    float _1156 = fma(_1076, _1090, _1154);
    float _1158 = fma(_1076, _1090, _1062);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1162 = _1034 * _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1166 = -_1116;
    float _1168 = fma(_1034, _1164, _1166);
    float _1170 = fma(_1032, 0.0540000014007091522216796875, _1044);
    float _1172 = fma(_1146, _1082, _1042);
    float _1174 = _1144 * _1144;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1178 = -_1162;
    float _1180 = fma(_1046, _1176, _1178);
    float _1182 = fma(_1032, 0.14423076808452606201171875, 10.0);
    float _1184 = fma(_898, 0.0540000014007091522216796875, _1044);
    float _1186 = fma(_1168, _1168, _1174);
    float _1188 = _1170 * 0.15915493667125701904296875;
    float _1190 = _1104 * 6.283185482025146484375;
    float _1192 = _1184 * 0.15915493667125701904296875;
    float _1194 = fma(_1180, _1180, _1186);
    float _1196 = fma(_898, 0.14423076808452606201171875, 10.0);
    float _1198 = _948 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1200 = _1188 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = fma(_100, 0.1500000059604644775390625, _1190);
    float _1206 = _948 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1208 = _1198 * _1098;
    float _1210 = _1198 * _1198;
    float _1212 = _984 * _1098;
    float _1214 = _1204 * 0.15915493667125701904296875;
    float _1216 = _1206 * _1098;
    float _1218 = _1192 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = precise::max(_1182, 10.0);
    float _1224 = precise::max(_1196, 10.0);
    float _1226 = precise::min(_1222, 160.0);
    float _1228 = rsqrt(_1194);
    float _1230 = -_1126;
    float _1232 = _1230 + 1.0;
    float _1234 = _1202 * 3.0;
    float _1236 = _984 * _1232;
    float _1238 = fma(_1232, _1210, _1126);
    float _1240 = _1206 * _1232;
    float _1242 = _1120 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = fma(_984, _1236, _1126);
    float _1248 = fma(_1206, _1236, _1208);
    float _1250 = -_1208;
    float _1252 = fma(_1206, _1236, _1250);
    float _1254 = fma(_1206, _1240, _1126);
    float _1256 = fma(_1198, _1240, _1212);
    float _1258 = fma(_1150, 6.0, _1234);
    float _1260 = _1064 * 6.283185482025146484375;
    float _1262 = sin(_1260);
    float _1264 = _1180 * _1228;
    float _1266 = _1168 * _1228;
    float _1268 = _1226 + _1258;
    float _1270 = _1138 * 0.15915493667125701904296875;
    float _1272 = _1046 * _1264;
    float _1274 = _1214 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    float _1278 = -_1216;
    float _1280 = fma(_1198, _1236, _1278);
    float _1282 = fma(_1198, _1236, _1216);
    float _1284 = -_1212;
    float _1286 = fma(_1198, _1240, _1284);
    float _1288 = fma(_1244, 0.1500000059604644775390625, 1.0);
    float _1290 = _1144 * _1228;
    float _1292 = _1220 * 3.0;
    float _1294 = -_1272;
    float _1296 = fma(_1048, _1266, _1294);
    float _1298 = _956 * _1288;
    float _1300 = _1048 * _1290;
    float _1302 = _1034 * _1266;
    float _1304 = fma(_1262, 6.0, _1292);
    float _1306 = _1070 * _1296;
    float _1308 = -_1300;
    float _1310 = fma(_1034, _1264, _1308);
    float _1312 = -_1302;
    float _1314 = fma(_1046, _1290, _1312);
    float _1316 = _1298 * _1136;
    float _1318 = _1070 * _1310;
    float _1320 = fma(_1050, _1290, _1306);
    float _1322 = _1070 * _1314;
    float _1324 = fma(_1050, _1266, _1318);
    float _1326 = fma(_1072, _1034, _1320);
    float _1328 = fma(_1276, 0.119999997317790985107421875, 1.0);
    float _1330 = fma(_1050, _1264, _1322);
    float _1332 = fma(_1072, _1046, _1324);
    float _1334 = _1326 * _1252;
    float _1336 = _1326 * _1254;
    float _1338 = _1326 * _1256;
    float _1340 = _1270 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = fma(_1326, _1328, _712);
    float _1346 = precise::min(_1224, 160.0);
    float _1348 = fma(_1072, _1048, _1330);
    float _1350 = fma(_1332, _1246, _1334);
    float _1352 = fma(_1332, _1248, _1336);
    float _1354 = fma(_1332, _1280, _1338);
    float _1356 = -_712;
    float _1358 = _1356 + _1344;
    float _1360 = _1270 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = fma(_1332, _1328, _716);
    float _1366 = fma(_1348, _1282, _1350);
    float _1368 = fma(_1348, _1286, _1352);
    float _1370 = fma(_1348, _1328, _694);
    float _1372 = fma(_1348, _1238, _1354);
    float _1374 = _1152 * _1358;
    float _1376 = _1112 * _1358;
    float _1378 = -_716;
    float _1380 = _1378 + _1364;
    float _1382 = _1118 * _1358;
    float _1384 = _954 * 0.15915493667125701904296875;
    float _1386 = -_694;
    float _1388 = _1386 + _1370;
    float _1390 = fma(_1100, _1380, _1374);
    float _1392 = fma(_1366, _1316, _716);
    float _1394 = fma(_1368, _1316, _712);
    float _1396 = fma(_1372, _1316, _694);
    float _1398 = fma(_1132, _1380, _1376);
    float _1400 = _1384 * 6.283185482025146484375;
    float _1402 = cos(_1400);
    float _1404 = -_1342;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1130, _1388, _1390);
    float _1410 = fma(_1156, _1380, _1382);
    float _1412 = fma(_1158, _1388, _1398);
    float _1414 = _1076 * _1362;
    float _1416 = _1074 * _1406;
    float _1418 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1394);
    float _1420 = _1384 * 6.283185482025146484375;
    float _1422 = sin(_1420);
    float _1424 = fma(_1172, _1388, _1410);
    float _1426 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1392);
    float _1428 = -_1414;
    float _1430 = fma(_1038, _1416, _1428);
    float _1432 = -_712;
    float _1434 = _1432 + _1418;
    float _1436 = _1346 + _1304;
    float _1438 = _712 + _1408;
    float _1440 = _716 + _1412;
    float _1442 = _694 + _1424;
    float _1444 = fma(_1074, _1416, _1342);
    float _1446 = -_716;
    float _1448 = _1446 + _1426;
    float _1450 = _1430 * _1434;
    float _1452 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1438);
    float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1440);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1442);
    float _1458 = -_1402;
    float _1460 = _1458 + 1.0;
    float _1462 = fma(_1444, _1448, _1450);
    float _1464 = _1074 * _1422;
    float _1466 = _1038 * _1422;
    float _1468 = _1076 * _1422;
    float _1470 = _1074 * _1362;
    float _1472 = _1038 * _1406;
    float _1474 = fma(_1406, _1146, _1342);
    float _1476 = _1038 * _1460;
    float _1478 = fma(_1146, _1460, _1402);
    float _1480 = _1038 * _1362;
    float _1482 = fma(_1076, _1472, _1470);
    float _1484 = _1074 * _1460;
    float _1486 = fma(_1076, _1476, _1464);
    float _1488 = -_712;
    float _1490 = _1488 + _1452;
    float _1492 = -_1480;
    float _1494 = fma(_1076, _1416, _1492);
    float _1496 = _1482 * _1434;
    float _1498 = -_1468;
    float _1500 = fma(_1038, _1484, _1498);
    float _1502 = -_1466;
    float _1504 = fma(_1076, _1484, _1502);
    float _1506 = -_716;
    float _1508 = _1506 + _1454;
    float _1510 = _1486 * _1490;
    float _1512 = fma(_1494, _1448, _1496);
    float _1514 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1396);
    float _1516 = fma(_1074, _1484, _1402);
    float _1518 = _1500 * _1490;
    float _1520 = fma(_1504, _1508, _1510);
    float _1522 = -_694;
    float _1524 = _1522 + _1456;
    float _1526 = -_694;
    float _1528 = _1526 + _1514;
    float _1530 = fma(_1516, _1508, _1518);
    float _1532 = fma(_1076, _1484, _1466);
    float _1534 = fma(_1478, _1524, _1520);
    float _1536 = fma(_1474, _1528, _1512);
    float _1538 = fma(_1076, _1416, _1480);
    float _1540 = fma(_1532, _1524, _1530);
    float _1542 = -_756;
    float _1544 = _1542 + 1.0;
    float _1546 = _694 + _1534;
    float _1548 = fma(_1538, _1528, _1462);
    float _1550 = _694 + _1536;
    float _1552 = _716 + _1540;
    float _1554 = _1546 * _1544;
    float _1556 = _716 + _1548;
    float _1558 = fma(_1038, _1476, _1402);
    float _1560 = _1552 * _1544;
    float _1562 = fma(_1550, _756, _1554);
    float _1564 = fma(_1038, _1484, _1468);
    float _1566 = fma(_1038, _1472, _1342);
    float _1568 = fma(_1556, _756, _1560);
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1572 = _1562 + _1570;
    float _1574 = _1558 * _1490;
    float _1576 = -_1464;
    float _1578 = fma(_1076, _1476, _1576);
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1582 = _1568 + _1580;
    float _1584 = _1572 * _1572;
    float _1586 = fma(_1038, _1416, _1414);
    float _1588 = _1566 * _1434;
    float _1590 = fma(_1564, _1508, _1574);
    float _1592 = fma(_1582, _1582, _1584);
    float _1594 = -_1470;
    float _1596 = fma(_1076, _1472, _1594);
    float _1598 = fma(_1586, _1448, _1588);
    float _1600 = fma(_1578, _1524, _1590);
    float _1602 = sqrt(_1592);
    float _1604 = fma(_1596, _1528, _1598);
    float _1606 = _712 + _1600;
    float _1608 = _712 + _1604;
    float _1610 = _1606 * _1544;
    float _1612 = fma(_1608, _756, _1610);
    bool _1614 = _1602 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1574;
    float _1618 = _1448;
    float _1620 = _1598;
    float _1622 = _1038;
    if (!_1614)
    {
        _1616 = _1568;
    }
    float _1624 = _1616;
    float _1626 = _1624;
    if (!_1614)
    {
        _1618 = _1562;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (!_1614)
    {
        _1620 = _1612;
    }
    float _1632 = _1620;
    bool _1634 = !_1614;
    float _1636 = _1632;
    if (!_1634)
    {
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1642 = _1602 + _1640;
        float _1644 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1646 = rsqrt(_1592);
        float _1648 = _1642 * _1638;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1650 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = _1654 + (-1.0);
        float _1662 = fma(_1658, _1644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1664 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = _1646 * _1662;
        float _1668 = fma(_1612, _1654, _1664);
        float _1670 = fma(_1582, _1666, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1672 = fma(_1572, _1666, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1636 = _1668;
        _1626 = _1670;
        _1630 = _1672;
        _798 = _1666;
    }
    float _1674 = _1636;
    float _1676 = _1626;
    float _1678 = _1630;
    float _1680 = _798;
    float _1682 = -_794;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1674);
    float _1686 = -_796;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1676);
    float _1690 = -_804;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1684 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1688 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1692 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = precise::max(0.0, _1694);
    float _1712 = fma(_1702, _1702, _1708);
    float _1714 = fma(_1706, _1706, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1702 * _1718;
    float _1722 = _1706 * _1718;
    float _1724 = -_1718;
    float _1726 = -_1710;
    float _1728 = fma(_1698, _1724, _1726);
    float _1730 = _1720 * _1720;
    float _1732 = _1722 * _1722;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1712;
    float _1746 = _1698;
    float _1748 = _1716;
    float _1750 = _1742;
    float _1752 = _1680;
    float _1754 = _1710;
    float _1756 = _1718;
    if (_1738)
    {
        float _1758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (_1738)
    {
        float _1762 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1762;
    }
    float _1764 = _1746;
    float _1766 = _1764;
    if (_1738)
    {
        float _1768 = rsqrt(_1734);
        _1748 = _1768;
    }
    float _1770 = _1748;
    float _1772 = _1760;
    if (_1738)
    {
        float _1774 = _1742 * _1760;
        _1750 = _1774;
    }
    float _1776 = _1750;
    if (_1738)
    {
        float _1778 = _1776 * 0.15915493667125701904296875;
        _1752 = _1778;
    }
    float _1780 = _1752;
    float _1782 = _1776;
    if (_1738)
    {
        float _1784 = _1780 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        _1782 = _1786;
    }
    float _1788 = _1782;
    float _1790 = _1706;
    if (_1738)
    {
        float _1792 = _1780 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        _1790 = _1794;
    }
    float _1796 = _1790;
    float _1798 = _1788;
    if (_1738)
    {
        float _1800 = fma(_1788, _1764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1772 = _1800;
    }
    float _1802 = _1772;
    float _1804 = _1802;
    if (!_1738)
    {
        _1766 = _1720;
    }
    float _1806 = _1766;
    float _1808 = _1806;
    if (!_1738)
    {
        _1798 = _1728;
    }
    float _1810 = _1798;
    float _1812 = _1810;
    if (_1738)
    {
        float _1814 = _1770 * _1802;
        _1622 = _1814;
    }
    float _1816 = _1622;
    if (!_1738)
    {
        _1804 = _1730;
    }
    float _1818 = _1804;
    float _1820 = sqrt(_1714);
    float _1822 = _1818;
    float _1824 = _1796;
    if (_1738)
    {
        float _1826 = _1796 + (-1.0);
        _1754 = _1826;
    }
    float _1828 = _1754;
    float _1830 = _1828;
    if (_1738)
    {
        float _1832 = _1720 * _1816;
        _1808 = _1832;
    }
    float _1834 = _1808;
    float _1836 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1738)
    {
        float _1838 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1838;
    }
    float _1840 = _1756;
    if (!_1738)
    {
        _1830 = _1722;
    }
    float _1842 = _1830;
    float _1844 = _1842;
    if (_1738)
    {
        float _1846 = _1722 * _1816;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1738)
    {
        float _1850 = _1834 * _1834;
        _1822 = _1850;
    }
    float _1852 = _1822;
    if (_1738)
    {
        float _1854 = fma(_1728, _1796, _1840);
        _1812 = _1854;
    }
    float _1856 = _1812;
    if (!_1738)
    {
        _1824 = _1732;
    }
    float _1858 = _1824;
    float _1860 = _1858;
    if (_1738)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1856, _1856, _1852);
    float _1868 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1836);
    float _1870 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1872 = _1866 + _1864;
    float _1874 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1878 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1876);
    float _1880 = precise::clamp(_1878, 0.0, 1.0);
    float _1882 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = rsqrt(_1872);
    float _1886 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1874);
    float _1888 = -_1880;
    float _1890 = _1888 + 1.0;
    float _1892 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1882);
    float _1894 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1868);
    float _1896 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1886);
    float _1898 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1902 = abs(_1890);
    float _1904 = log2(_1902);
    float _1906 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1898);
    float _1910 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1914 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1916 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1918 = _1884 * _1834;
    float _1920 = _1884 * _1856;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = _1884 * _1848;
    float _1930 = -_1912;
    float _1932 = fma(_1930, _1870, 1.0);
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1936 = -_1926;
    float _1938 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1934);
    float _1944 = -_1928;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1948 = exp2(_1940);
    float _1950 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1952 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1954 = fma(_1946, -0.5, 0.5);
    float _1956 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1958 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1950);
    float _1960 = fma(_1946, 0.5, 0.5);
    float _1962 = _1920 + 1.0;
    float _1964 = log2(_1932);
    float _1966 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1956);
    float _1968 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1966);
    float _1974 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1968);
    float _1976 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1978 = 1.0 / _1952;
    float _1980 = -_1920;
    float _1982 = fma(_1948, _1962, _1980);
    float _1984 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1972);
    float _1986 = fma(_1960, _1976, 1.570728778839111328125);
    float _1988 = sqrt(_1954);
    float _1990 = _1964 * 0.693147182464599609375;
    float _1992 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1994 = fma(_1982, 0.5, 0.5);
    float _1996 = _1974 * _1978;
    float _1998 = _1984 * _1978;
    float _2000 = fma(_1996, 0.5, 0.5);
    float _2002 = fma(_1998, -0.5, 0.5);
    float _2004 = _1988 * 0.636619746685028076171875;
    float3 _5389 = float3(_2000, _2002, _1992);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5389, float3(0.0), isnan(_5389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5389, float3(0.0), isnan(_5389)), level(0.0)).x;
    float3 _5400 = float3(_2000, _2002, _1992);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5400, float3(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5400, float3(0.0), isnan(_5400)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float _2019 = -_1986;
    float _2021 = fma(_2004, _2019, 1.0);
    float2 _5422 = float2(_2021, _1994);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5422, float2(0.0), isnan(_5422)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5422, float2(0.0), isnan(_5422)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = _802 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2035 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.w = _782;
    float _2037 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2033);
    float _2039 = _802 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2041 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2035);
    float _2043 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2037);
    float _2045 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2039);
    bool _2047 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan(0.5);
    bool _2055 = _2051 || _2053;
    float _2057 = _1952 * 0.5;
    float _2059 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2061 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2045);
    float _2063 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2041);
    float _2065 = _1974 + _1952;
    float _2067 = 1.0 / _2059;
    float _2069 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2071 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2063);
    out.m_71.x = _1688;
    out.m_71.y = _1684;
    out.m_71.z = _1692;
    float _2073 = _2065 * 0.5;
    float _2075 = _2069 + _2059;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2079 = _2000;
    float _2081 = _2075;
    float _2083 = _1904;
    if (!_2055)
    {
        _2077 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2085 = _2077;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1984;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1952;
    float _2087 = _2085;
    if (!_2055)
    {
        _2079 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2089 = _2079;
    if (_2055)
    {
        _836 = 1.0;
    }
    float _2091 = _836;
    float _2093 = _2075 * _2067;
    float _2095 = _2093 * 0.5;
    float _2097 = _2091;
    if (!_2055)
    {
        float _2099 = -_2089;
        float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2081 = _2101;
    }
    float _2103 = _2081;
    float _2105 = _2103;
    if (!_2055)
    {
        float _2107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2109 = fma(_2095, _2085, _2107);
        _2087 = _2109;
    }
    float _2111 = _2087;
    float _2113 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2055)
    {
        float _2115 = 1.0 / _2103;
        _2105 = _2115;
    }
    float _2117 = _2105;
    float _2119 = exp2(_2113);
    float _2121 = _2111;
    if (!_2055)
    {
        float _2123 = 1.0 / _2111;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = -_2119;
    float _2129 = _2127 + 1.0;
    float _2131 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2055)
    {
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2135 = -_2089;
        float _2137 = fma(_2125, _2133, _2135);
        _2083 = _2137;
    }
    float _2139 = _2083;
    float _2141 = fma(_1984, -0.5, _2057);
    if (!_2055)
    {
        float _2143 = _2139 * _2117;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2097 = _2145;
    }
    float _2147 = _2097;
    float _2149 = _2071 + _1952;
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2153 = _2147 > 0.0;
    bool _2155 = isnan(_2147);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(0.0);
    bool _2161 = _2157 || _2159;
    float _2163 = _2149 * 0.5;
    float _2165 = _2151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _2073;
    out.m_73.y = _2141;
    out.m_73.z = _2163;
    out.m_73.w = _1952;
    out.m_49.x = _2165;
    float _2167 = _2131 * _2006;
    float _2169 = -_2131;
    float _2171 = _2169 + 1.0;
    float _2173 = _2017 * _2167;
    float _2175 = _2031 * _2167;
    float _2177 = fma(_2027, _2173, _2011);
    float _2179 = fma(_2029, _2173, _2013);
    float _2181 = _2017 * _2171;
    float _2183 = fma(_2017, _2175, _2015);
    out.m_75.x = _2177;
    out.m_75.y = _2179;
    out.m_75.z = _2183;
    out.m_75.w = _2181;
    if (_2161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2185 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2185;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

