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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_22Smplr_w [[id(17)]];
    sampler vp_t_tcb_14Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1992 = false;
    bool _1002 = false;
    bool _990 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_53.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_56.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2226 = as_type<float>(_126);
        out.gl_Position.z = _2226;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_58.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_110);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_56.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2295 = as_type<float>(_162);
        out.gl_Position.z = _2295;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = as_type<float>(int(gl_VertexIndex));
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _168 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _170 = in.m_63.x;
    float _172 = in.m_63.y;
    float _174 = in.m_63.z;
    float _176 = in.m_63.w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _180 = in.m_65.x;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = _168 * _166;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _204 = as_type<int>(_164) & 1;
    bool _206 = _204 != 0;
    int _208 = as_type<int>(_164) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = _198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _220 = !_210;
    float _222 = _220 ? (-0.5) : 0.5;
    float _224 = in.m_53.x;
    float _226 = in.m_53.y;
    float _228 = in.m_53.z;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _236 = _234 != 0;
    float _238 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _240 = _170 > 0.5;
    float _242 = in.m_71.x;
    float _244 = in.m_71.y;
    float _246 = in.m_71.z;
    bool _248 = !_206;
    float _250 = _248 ? (-0.5) : 0.5;
    bool _252 = _172 > 0.5;
    float _254 = in.m_67.w;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _262 = _260 != 0;
    float _264 = -_250;
    int _266 = _240 ? as_type<int>(_264) : as_type<int>(_250);
    float _268 = _182 * _194;
    float _270 = -_222;
    int _272 = _252 ? as_type<int>(_270) : as_type<int>(_222);
    bool _274 = !_232;
    int _276 = _274 ? 0 : 1;
    bool _278 = _174 > 0.5;
    float _280 = _182 * _214;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _284 = _282 != 0;
    bool _286 = _172 > 0.5;
    float _288 = _194 * _226;
    bool _290 = !_258;
    float _292 = _290 ? _250 : as_type<float>(_266);
    float _294 = _214 * _226;
    bool _296 = !_262;
    float _298 = _296 ? _222 : as_type<float>(_272);
    float _300 = _182 * _244;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _312 = _310 != 0;
    float _314 = _244 * _226;
    float _316 = -_250;
    int _318 = _286 ? as_type<int>(_316) : as_type<int>(_250);
    float _320 = fma(_180, _192, _268);
    int _322 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _324 = _322 != 0;
    float _326 = fma(_192, _224, _288);
    float _328 = fma(_180, _212, _280);
    bool _330 = !_308;
    float _332 = _330 ? _250 : as_type<float>(_318);
    float _334 = fma(_180, _242, _300);
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _338 = _336 != 0;
    float _340 = in.m_73.x;
    float _342 = in.m_73.y;
    float _344 = fma(_212, _224, _294);
    float _346 = fma(_184, _216, _328);
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _350 = -_250;
    int _352 = _278 ? as_type<int>(_350) : as_type<int>(_250);
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _358 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _362 = fma(_216, _228, _344);
    bool _364 = !_284;
    float _366 = _364 ? _250 : as_type<float>(_352);
    float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_75.x = _358;
    out.m_75.y = _360;
    out.m_75.z = _188;
    out.m_75.w = _356;
    bool _370 = _176 > 0.5;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _374 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _376 = in.m_71.w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _380 = -_372;
    float _382 = fma(_374, 2.0, _380);
    float _384 = in.m_69.w;
    float _386 = _342 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = fma(_196, _228, _326);
    float _390 = _340 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = fma(_242, _224, _314);
    float _394 = fma(_238, -2.0, _378);
    float _396 = _326;
    float _398 = _196;
    float _400 = _186;
    float _402 = _172;
    if (_338)
    {
        _396 = _170;
    }
    float _404 = _396;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _408 = fma(_184, _196, _320);
    float _410 = _404;
    if (!_338)
    {
        _410 = _174;
    }
    float _412 = _410;
    float _414 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _416 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _250);
    float _420 = fma(_246, _228, _392);
    if (!_338)
    {
        _398 = _172;
    }
    float _422 = _398;
    float _424 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _222);
    float _428 = _422;
    if (_338)
    {
        _428 = _170;
    }
    float _430 = _428;
    float _432 = _412 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _436 = _416 * _418;
    float _438 = _412;
    if (!_338)
    {
        float _440 = in.m_63.z;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = _420 + _376;
    float _446 = _414 * _426;
    float _448 = _368 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_77.x = _202;
    out.m_77.y = _424;
    out.m_77.z = _218;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[83].z, _434);
    float _454 = _362 + _384;
    float _456 = _430 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _458 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _186);
    float _460 = -_450;
    float _462 = fma(_432, 2.0, _460);
    float _464 = fma(_184, _246, _334);
    float _466 = floor(_458);
    float _468 = _388 + _254;
    float _470 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    float _472 = -_144;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _382);
    float _476 = _292 + 0.5;
    float _478 = _298 + (-0.5);
    float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _482 = fma(_448, _476, _474);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _486 = _458 * 6.283185482025146484375;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _490 = _442;
    if (!_338)
    {
        _400 = _442;
    }
    float _492 = _400;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _500 = _492;
    if (_338)
    {
        _490 = _172;
    }
    float _502 = _490;
    float _504 = -_488;
    float _506 = fma(_456, 2.0, _504);
    float _508 = _346 * _346;
    float _510 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _494);
    if (_338)
    {
        _500 = _172;
    }
    float _512 = _500;
    float _514 = fma(_408, _408, _508);
    float _516 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _518 = _496 * 6.283185482025146484375;
    float _520 = cos(_518);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _524 = fma(_464, _464, _514);
    float _526 = -_516;
    float _528 = -_470;
    float _530 = fma(_526, _478, _528);
    float _532 = -_466;
    float _534 = _458 + _532;
    float _536 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[83].w, _484);
    float _538 = _498 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _540 = -_144;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[86].x, _462);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _546 = _332 + 0.5;
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _552 = fma(_538, _546, _542);
    bool _554 = _534 < 0.5;
    float _556 = float(_554);
    float _558 = fma(_520, 0.5, 0.5);
    float _560 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].w, _522);
    float _562 = _454 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _564 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _550);
    float _566 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _544);
    if (!_338)
    {
        _402 = _170;
    }
    float _568 = _402;
    float _570 = -_534;
    float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _574 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _576 = -_556;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _580 = -_558;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _584 = rsqrt(_524);
    float _586 = _468 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _588 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _590 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _592 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _594 = abs(_276);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].x, _588);
    float _598 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].y, _590);
    float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].z, _592);
    float _604 = _548 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _606 = -_222;
    int _608 = _370 ? as_type<int>(_606) : as_type<int>(_222);
    float _610 = _366 + 0.5;
    float _612 = float(_594);
    float _614 = -_144;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[81].x, _506);
    float _618 = _444 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _622 = _568 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _624 = !_304;
    float _626 = _624 ? _222 : as_type<float>(_608);
    float _628 = fma(_574, -2.0, _200);
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _632 = fma(_604, _610, _616);
    float _634 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _510);
    float _636 = abs(_572);
    float _638 = _612 * _636;
    float _640 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].x, _596);
    float _642 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].y, _598);
    float _644 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].z, _602);
    float _646 = fma(_622, -2.0, _620);
    float _648 = _408 * _584;
    float _650 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _652 = _346 * _584;
    float _654 = _600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _656 = _626 + (-0.5);
    float _658 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _660 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _564);
    float _662 = -_634;
    float _664 = _662 + 1.0;
    float _666 = _464 * _584;
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _670 = -_654;
    float _672 = -_658;
    float _674 = fma(_670, _656, _672);
    float _676 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _452);
    float _678 = fma(_298, _664, _530);
    float _680 = -_660;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _686 = _666 * _684;
    float _688 = -_676;
    float _690 = _688 + 1.0;
    float _692 = _640 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    bool _694 = !_324;
    int _696 = _694 ? 0 : 1;
    float _698 = -_682;
    float _700 = fma(_292, _698, _482);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _704 = _652 * _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _708 = -_686;
    float _710 = fma(_648, _706, _708);
    float _712 = _642 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _714 = _644 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _716 = _692 * _630;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _720 = abs(_696);
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _724 = _648 * _722;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _728 = -_704;
    float _730 = fma(_666, _726, _728);
    float _732 = _710 * _710;
    float _734 = _712 * _650;
    float _736 = _714 * _668;
    float _738 = -_690;
    float _740 = fma(_366, _738, _632);
    float _742 = -_222;
    int _744 = _278 ? as_type<int>(_742) : as_type<int>(_222);
    float _746 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _536);
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _750 = -_724;
    float _752 = fma(_652, _748, _750);
    float _754 = fma(_730, _730, _732);
    float _756 = fma(_716, 0.5, 0.5);
    float _758 = fma(_734, 0.5, 0.5);
    float _760 = fma(_736, 0.5, 0.5);
    bool _762 = !_312;
    float _764 = _762 ? _222 : as_type<float>(_744);
    float _766 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _566);
    float _768 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _560);
    float _770 = -_746;
    float _772 = _770 + 1.0;
    float _774 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _646);
    float _776 = fma(_752, _752, _754);
    float _778 = floor(_756);
    float _780 = _718 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _782 = _764 + (-0.5);
    float _784 = -_768;
    float _786 = _784 + 1.0;
    float _788 = float(_720);
    float _790 = -_766;
    float _792 = _790 + 1.0;
    float _794 = -_780;
    float _796 = -_774;
    float _798 = fma(_794, _782, _796);
    float _800 = floor(_758);
    float _802 = fma(_626, _772, _674);
    float _804 = -_792;
    float _806 = fma(_332, _804, _552);
    float _808 = fma(_764, _786, _798);
    float _810 = fma(_788, _582, _638);
    out.m_79.x = _700;
    out.m_79.y = _678;
    out.m_79.z = _740;
    out.m_79.w = _802;
    float _812 = _222 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _814 = floor(_760);
    float _816 = -_778;
    float _818 = _756 + _816;
    float _820 = _250 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_81.x = _806;
    out.m_81.y = _808;
    float _822 = _648 * _812;
    float _824 = fma(_818, 2.0, -1.0);
    float _826 = rsqrt(_776);
    float _828 = -_800;
    float _830 = _758 + _828;
    float _832 = _446 * _648;
    float _834 = fma(_830, 2.0, -1.0);
    float _836 = _446 * _666;
    float _838 = _652 * _812;
    float _840 = -_814;
    float _842 = _760 + _840;
    float _844 = fma(_842, 2.0, -1.0);
    float _846 = _446 * _652;
    float _848 = _730 * _826;
    float _850 = _710 * _826;
    float _852 = _752 * _826;
    float _854 = fma(_436, _848, _832);
    float _856 = fma(_436, _850, _846);
    float _858 = fma(_436, _852, _836);
    float _860 = _666 * _812;
    float _862 = _652 * _852;
    float _864 = _666 * _848;
    float _866 = _648 * _850;
    float _868 = fma(_852, _820, _860);
    float _870 = _834 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _872 = -_862;
    float _874 = fma(_666, _850, _872);
    float _876 = _824 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _878 = fma(_848, _820, _822);
    float _880 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _882 = fma(_850, _820, _838);
    float _884 = -_864;
    float _886 = fma(_648, _852, _884);
    float _888 = -_866;
    float _890 = fma(_652, _848, _888);
    float _892 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _894 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _896 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].x, _880);
    float _898 = _874 + _878;
    float _900 = _886 + _882;
    float _902 = _890 + _868;
    float _904 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _906 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].y, _892);
    float _908 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].z, _894);
    bool _910 = !_236;
    int _912 = _910 ? 0 : 1;
    float _914 = fma(_904, _874, _854);
    float _916 = fma(_904, _886, _856);
    out.m_83.x = _898;
    out.m_83.y = _900;
    out.m_83.z = _902;
    float _918 = fma(_904, _890, _858);
    int _920 = abs(_912);
    float _922 = _844 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _924 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _926 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _928 = _924 || _926;
    bool _930 = isnan(1.0);
    bool _932 = _928 || _930;
    float _934 = float(_920);
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].x, _896);
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].y, _906);
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].z, _908);
    float _942 = _936 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _944 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _946 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _948 = abs(_578);
    float _950 = fma(_934, _948, _810);
    float _952 = _914 + _942;
    float _954 = _916 + _944;
    float _956 = _918 + _946;
    float _958 = _838;
    float _960 = _822;
    float _962 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _964 = _914;
    float _966 = _914;
    float _968 = _822;
    float _970 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _972 = _824;
    float _974 = _834;
    float _976 = _934;
    float _978 = _844;
    float _980 = _878;
    float _982 = _826;
    float _984 = _908;
    float _994;
    float _996;
    float _998;
    float _1000;
    if (!_932)
    {
        bool _986 = _944 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _988 = !_986;
        _990 = _988;
        if (!_990)
        {
            float _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _994 = _992;
            _996 = 0.0;
            _998 = 0.0;
            _1000 = 0.0;
            _1002 = true;
        }
    }
    if ((!_1002) || _990)
    {
        bool _1038;
        if (!_990)
        {
            bool _1004 = _944 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1006 = isnan(_944);
            bool _1008 = _1004 || _1006;
            bool _1010 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1012 = _1008 || _1010;
            bool _1014 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1016 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1018 = !_1012;
            bool _1020 = _1016 && _1018;
            if (_1020)
            {
                _958 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1022 = _958;
            float _1024 = _1022;
            if (_1020)
            {
                _960 = 0.0;
            }
            float _1026 = _960;
            _968 = _1026;
            _996 = _1026;
            if (_1020)
            {
                _962 = 0.0;
            }
            float _1028 = _962;
            _970 = _1028;
            _998 = _1028;
            if (_1020)
            {
                float _1030 = _1022 * 5.0;
                _1024 = _1030;
            }
            float _1032 = _1024;
            _994 = _1032;
            if (_1020)
            {
                _964 = 0.0;
            }
            float _1034 = _964;
            bool _1036 = !_1012;
            _1038 = _1036 && _1014;
            _966 = _1034;
            _1000 = _1034;
        }
        if ((!_1038) || _990)
        {
            _990 = false;
            float _1040 = _966;
            float _1042 = _968;
            float _1044 = _970;
            bool _1046 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1048 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1050 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1052 = _1040;
            float _1054 = _1044;
            _994 = _956;
            if (_1046)
            {
                float _1056 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1052 = _1056;
            }
            float _1058 = _1052;
            if (_1046)
            {
                float _1060 = abs(_824);
                float _1062 = -_1060;
                float _1064 = _1062 + 1.0;
                _972 = _1064;
            }
            float _1066 = _972;
            if (_1048)
            {
                float _1068 = abs(_834);
                float _1070 = -_1068;
                float _1072 = _1070 + 1.0;
                _974 = _1072;
            }
            float _1074 = _974;
            if (!_1046)
            {
                _976 = 1.0;
            }
            float _1076 = _976;
            float _1078 = _1076;
            if (_1050)
            {
                float _1080 = abs(_844);
                float _1082 = -_1080;
                float _1084 = _1082 + 1.0;
                _978 = _1084;
            }
            float _1086 = _978;
            if (!_1048)
            {
                _1054 = 1.0;
            }
            float _1088 = _1054;
            float _1090 = _1042;
            float _1092 = _1088;
            if (_1048)
            {
                float _1094 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1090 = _1094;
            }
            float _1096 = _1090;
            float _1098 = _878;
            if (_1050)
            {
                float _1100 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1098 = _1100;
            }
            float _1102 = _1098;
            float _1104 = _1058;
            if (_1046)
            {
                float _1106 = _1066 * _1058;
                float _1108 = precise::clamp(_1106, 0.0, 1.0);
                _1078 = _1108;
            }
            float _1110 = _1078;
            if (!_1050)
            {
                _1104 = 1.0;
            }
            float _1112 = _1104;
            float _1114 = _1112;
            if (_1048)
            {
                float _1116 = _1074 * _1096;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1092 = _1118;
            }
            float _1120 = _1092;
            float _1122 = _1110 * _1120;
            _980 = _1102;
            _996 = _952;
            _998 = _954;
            if (_1050)
            {
                float _1124 = _1086 * _1102;
                float _1126 = precise::clamp(_1124, 0.0, 1.0);
                _1114 = _1126;
            }
            float _1128 = _1114;
            float _1130 = _1122 * _1128;
            _1000 = _1130;
        }
    }
    _1002 = false;
    float _1132 = _980;
    float _1134 = _994;
    float _1136 = _996;
    float _1138 = _998;
    float _1140 = _1000;
    float _1142 = _944 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1148 = fma(_942, 6.2500002968590706586837768554688e-05, 0.5);
    float _1150 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1144);
    float _1152 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1146);
    float _1154 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1150);
    float _1156 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1152);
    float _1158 = _1154 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1162 = trunc(_1158);
    int _1164 = int(_1162);
    float _1166 = trunc(_1160);
    int _1168 = int(_1166);
    int _1170 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1172 = _1164 + _1170;
    int _1174 = _1172 + 1;
    bool _1176 = _1174 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1178 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1180 = _1168 + _1178;
    int _1182 = _1180 + 1;
    int _1184 = _1174 | _1182;
    bool _1186 = _1184 < 0;
    bool _1188 = _1186 || _1176;
    bool _1190 = _1182 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1192 = _1190 || _1188;
    int _1194 = _1174;
    int _1196 = _1182;
    int _1198 = _1184;
    float _1200 = _1132;
    float _1202 = _1138;
    float _1204 = _1136;
    float _1206 = _1134;
    if (!_1192)
    {
        int _1208 = _1182 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1210 = _1208 + _1174;
        _1194 = _1210;
    }
    int _1212 = _1194;
    if (!_1192)
    {
        int _1214 = _1212 << 2;
        _1196 = _1214;
    }
    int _1216 = _1196;
    int _1218 = _1216;
    if (!_1192)
    {
        uint _1221 = uint(int(uint(_1212) >> uint(2)));
        _1198 = int(_1221);
    }
    int _1223 = _1198;
    if (!_1192)
    {
        int _1225 = 12 & _1216;
        _1218 = _1225;
    }
    int _1227 = _1218;
    if (!_1192)
    {
        int _1229 = _1223 << 4;
        int _1231 = _1229 + _1227;
        _1200 = as_type<float>(_1231);
    }
    float _1233 = _1200;
    float _1235 = as_type<float>(_1227);
    if (!_1192)
    {
        float _1237 = floor(_1160);
        _1235 = _1237;
    }
    float _1239 = _1235;
    float _1241 = _1233;
    if (!_1192)
    {
        int _1243 = as_type<int>(_1233) + 400;
        uint _1245 = uint(int(uint(_1243) >> uint(2)));
        uint _1247 = uint(int(uint(int(_1245)) >> uint(2)));
        int _1249 = int(_1245) & 3;
        float _1251 = (*spvDescriptorSet0.vp_c15)._m0[int(_1247)][_1249];
        _1241 = _1251;
    }
    float _1253 = _1241;
    float _1255 = as_type<float>(_1223);
    if (!_1192)
    {
        float _1257 = floor(_1158);
        _1255 = _1257;
    }
    float _1259 = _1255;
    if (!_1192)
    {
        float _1261 = -_1239;
        float _1263 = _1160 + _1261;
        _982 = _1263;
    }
    float _1265 = _982;
    float _1267 = fma(_946, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4131 = float2(_1148, _1267);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4131, float2(0.0), isnan(_4131)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4131, float2(0.0), isnan(_4131)), level(0.0)).x;
    float _1271 = _1267;
    if (!_1192)
    {
        float _1273 = -_1259;
        float _1275 = _1158 + _1273;
        _984 = _1275;
    }
    float _1277 = _984;
    float _1279 = _792;
    float _1281 = _1277;
    if (!_1192)
    {
        float _1283 = rint(_1253);
        float _1285 = precise::max(_1283, 0.0);
        uint _1287 = uint(_1285);
        uint _1289 = clamp(_1287, 0u, 65535u);
        _1279 = as_type<float>(_1289);
    }
    float _1291 = _1279;
    float _1293 = _1259;
    if (!_1192)
    {
        float3 _4179 = float3(_1277, _1265, float(as_type<int>(_1291)));
        float3 _4183 = select(_4179, float3(0.0), isnan(_4179));
        float _1295 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4183.xy, uint(rint(_4183.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4183.xy, uint(rint(_4183.z)), level(0.0)).x;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1301 = _1134 + _1299;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1305 = _1136 + _1303;
    float _1307 = _1301 * _1301;
    bool _1309 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.5);
    bool _1317 = _1313 || _1315;
    float _1319 = fma(_1305, _1305, _1307);
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1325 = !_1323;
    float _1327 = _1269;
    if (!_1325)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1333 = _1321 + _1331;
        float _1335 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = rsqrt(_1319);
        float _1339 = _1333 * _1329;
        float _1341 = _1339 * 0.15915493667125701904296875;
        float _1343 = _1341 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = _1341 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = fma(_1345, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1353 = _1337 * _1351;
        float _1355 = _1349 + (-1.0);
        float _1357 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = fma(_1305, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1361 = fma(_1301, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1363 = fma(_1349, _1138, _1357);
        _1202 = _1363;
        _1204 = _1359;
        _1206 = _1361;
        _1271 = _1335;
    }
    float _1365 = _1202;
    float _1367 = _1204;
    float _1369 = _1206;
    float _1371 = _1271;
    float _1373 = _1371;
    float _1375 = _1367;
    float _1377 = _1369;
    if (_1317)
    {
        _1373 = _1365;
    }
    float _1379 = _1373;
    float _1381 = _1379;
    if (!_1317)
    {
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1385 = _944 + _1383;
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1389 = _942 + _1387;
        float _1391 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1393 = -_944;
        float _1395 = _1393 + _1365;
        float _1397 = _1385 * _1385;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1401 = _946 + _1399;
        float _1403 = -_942;
        float _1405 = _1403 + _1367;
        float _1407 = -_946;
        float _1409 = _1407 + _1369;
        float _1411 = fma(_1389, _1389, _1397);
        float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1415 = fma(_1401, _1401, _1411);
        float _1417 = sqrt(_1415);
        float _1419 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1421 = precise::min(_1417, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1423 = _1421 * _1413;
        float _1425 = _1419 * _1423;
        float _1427 = fma(_1395, _1425, _944);
        float _1429 = fma(_1405, _1425, _942);
        float _1431 = fma(_1409, _1425, _946);
        _1381 = _1427;
        _1375 = _1429;
        _1377 = _1431;
    }
    float _1433 = _1381;
    float _1435 = _1375;
    float _1437 = _1377;
    float _1439 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1445 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1439);
    float _1449 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1451 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    float _1453 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1455 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1447);
    float _1457 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1449);
    float _1459 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1451);
    float _1461 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1453);
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1467 = _1459 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1469 = abs(_1269);
    bool _1471 = _1469 != 0.0;
    bool _1473 = isnan(_1469);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1483 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1489 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1481);
    float _1491 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1493 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1485);
    float _1495 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1487);
    float _1497 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1499 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1489);
    float _1501 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1503 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1505 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1495);
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1501);
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1503);
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1505);
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1507;
    out.gl_Position.z = _1511;
    out.gl_Position.w = _1513;
    if (_1479)
    {
        _1327 = _1513;
    }
    float _1515 = _1327;
    float _1517 = _1515;
    if (!_1479)
    {
        _1517 = 0.0;
    }
    float _1519 = _1517;
    float _1521 = _1519;
    if (!_1479)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1192)
    {
        int _1523 = _1212 << 4;
        int _1525 = _1523 + 2048;
        uint _1527 = uint(int(uint(_1525) >> uint(2)));
        uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
        int _1531 = int(_1527) & 3;
        float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
        int _1535 = int(_1527) + 1;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        int _1539 = _1535 & 3;
        float _1541 = (*spvDescriptorSet0.vp_c15)._m0[int(_1537)][_1539];
        int _1543 = _1525 + 8;
        uint _1545 = uint(int(uint(_1543) >> uint(2)));
        uint _1547 = uint(int(uint(int(_1545)) >> uint(2)));
        int _1549 = int(_1545) & 3;
        float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
        int _1553 = int(_1545) + 1;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        int _1557 = _1553 & 3;
        float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
        float _1561 = _1142 * _1541;
        float _1563 = fma(_942, _1533, _1561);
        float _1565 = fma(_946, _1551, _1563);
        float _1567 = _1565 + _1559;
        float _1569 = precise::clamp(_1567, 0.0, 1.0);
        float _1571 = -_1569;
        float _1573 = _1571 + _1297;
        float _1575 = fma(_1573, 500.0, 1.5);
        float _1577 = exp2(_1575);
        float _1579 = 0.0 + _1577;
        float _1581 = precise::clamp(_1579, 0.0, 1.0);
        bool _1583 = _1581 >= 1.0;
        bool _1585 = isnan(_1581);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan(1.0);
        bool _1591 = _1587 || _1589;
        _1281 = _1559;
        if (!_1591)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1591)
        {
            _1521 = 0.0;
        }
    }
    float _1593 = _1281;
    float _1595 = _1521;
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1599 = _1433 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1603 = _1435 + _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1607 = _1437 + _1605;
    float _1609 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1611 = _1599 * _1599;
    float _1613 = fma(_1603, _1603, _1611);
    float _1615 = fma(_1607, _1607, _1613);
    float _1617 = rsqrt(_1615);
    float _1619 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1621 = _1603 * _1619;
    float _1623 = _1607 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 * _1623;
    float _1629 = _1625 + _1627;
    float _1631 = sqrt(_1629);
    bool _1633 = _1631 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1637 = _1631 + _1635;
    float _1639 = _1607;
    float _1641 = _1629;
    float _1643 = _1637;
    float _1645 = _1593;
    float _1647 = _1599;
    float _1649 = _1621;
    if (_1633)
    {
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1639 = _1651;
    }
    float _1653 = _1639;
    if (_1633)
    {
        float _1655 = rsqrt(_1629);
        _1641 = _1655;
    }
    float _1657 = _1641;
    if (_1633)
    {
        float _1659 = _1637 * _1653;
        _1643 = _1659;
    }
    float _1661 = _1643;
    if (_1633)
    {
        float _1663 = _1661 * 0.15915493667125701904296875;
        _1645 = _1663;
    }
    float _1665 = _1645;
    float _1667 = _1617;
    float _1669 = _1665;
    if (_1633)
    {
        float _1671 = _1665 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        _1667 = _1673;
    }
    float _1675 = _1667;
    float _1677 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1679 = precise::max(0.0, _1677);
    float _1681 = _1611;
    float _1683 = _1679;
    float _1685 = _1677;
    if (_1633)
    {
        float _1687 = _1665 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        _1681 = _1689;
    }
    float _1691 = _1681;
    float _1693 = -_1619;
    float _1695 = -_1679;
    float _1697 = fma(_1599, _1693, _1695);
    if (_1633)
    {
        float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1699;
    }
    float _1701 = _1683;
    float _1703 = _1675;
    float _1705 = _1701;
    if (_1633)
    {
        float _1707 = fma(_1675, _1701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1647 = _1707;
    }
    float _1709 = _1647;
    float _1711 = _1709;
    if (!_1633)
    {
        _1703 = _1697;
    }
    float _1713 = _1703;
    float _1715 = _1713;
    if (!_1633)
    {
        _1705 = _1623;
    }
    float _1717 = _1705;
    float _1719 = _1717;
    float _1721 = _1691;
    if (_1633)
    {
        float _1723 = _1691 + (-1.0);
        _1685 = _1723;
    }
    float _1725 = _1685;
    float _1727 = _1725;
    if (_1633)
    {
        float _1729 = _1657 * _1709;
        _1669 = _1729;
    }
    float _1731 = _1669;
    if (!_1633)
    {
        _1711 = _1627;
    }
    float _1733 = _1711;
    float _1735 = _1733;
    if (_1633)
    {
        float _1737 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1737;
    }
    float _1739 = _1727;
    if (_1633)
    {
        float _1741 = _1621 * _1731;
        _1649 = _1741;
    }
    float _1743 = _1649;
    if (_1633)
    {
        float _1745 = _1623 * _1731;
        _1719 = _1745;
    }
    float _1747 = _1719;
    if (_1633)
    {
        float _1749 = fma(_1697, _1691, _1739);
        _1715 = _1749;
    }
    float _1751 = _1715;
    if (!_1633)
    {
        _1721 = _1625;
    }
    float _1753 = _1721;
    float _1755 = _1753;
    if (_1633)
    {
        float _1757 = _1743 * _1743;
        _1755 = _1757;
    }
    float _1759 = _1755;
    float _1761 = sqrt(_1615);
    if (_1633)
    {
        float _1763 = _1747 * _1747;
        _1735 = _1763;
    }
    float _1765 = _1735;
    float _1767 = fma(_1751, _1751, _1759);
    float _1769 = _1767 + _1765;
    float _1771 = 1.0 / _1595;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1777 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1775);
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = rsqrt(_1769);
    float _1783 = -_1609;
    float _1785 = fma(_1783, _1773, 1.0);
    float _1787 = -_1779;
    float _1789 = _1787 + 1.0;
    float _1791 = log2(_1785);
    float _1793 = _1509 * _1771;
    float _1795 = fma(_1793, 0.5, 0.5);
    float _1797 = abs(_1789);
    float _1799 = log2(_1797);
    float _1801 = _1781 * _1743;
    float _1803 = _1781 * _1751;
    float _1805 = _1781 * _1747;
    float _1807 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1809 = _1803 + 1.0;
    float _1811 = _1791 * 0.693147182464599609375;
    float _1813 = -_1807;
    float _1815 = fma(_1803, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1813);
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1819 = -_1805;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1815);
    float _1823 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1825 = fma(_1821, -0.5, 0.5);
    float _1827 = fma(_1821, 0.5, 0.5);
    float _1829 = exp2(_1823);
    float _1831 = fma(_1827, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1833 = fma(_1827, _1831, -0.212114393711090087890625);
    float _1835 = _1507 * _1771;
    float _1837 = sqrt(_1825);
    float _1839 = fma(_1827, _1833, 1.570728778839111328125);
    float _1841 = fma(_1835, -0.5, 0.5);
    float _1843 = -_1803;
    float _1845 = fma(_1829, _1809, _1843);
    float3 _5086 = float3(_1795, _1841, _1817);
    float _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5086, float3(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5086, float3(0.0), isnan(_5086)), level(0.0)).x;
    float _1849 = fma(_1845, 0.5, 0.5);
    float _1851 = _1837 * 0.636619746685028076171875;
    float _1853 = -_1839;
    float _1855 = fma(_1851, _1853, 1.0);
    float3 _5105 = float3(_1795, _1841, _1817);
    float4 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5105, float3(0.0), isnan(_5105)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5105, float3(0.0), isnan(_5105)), level(0.0)).xyzw;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1858.w;
    float2 _5121 = float2(_1855, _1849);
    float3 _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5121, float2(0.0), isnan(_5121)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5121, float2(0.0), isnan(_5121)), level(0.0)).xyz;
    float _1872 = _1870.x;
    float _1874 = _1870.y;
    float _1876 = _1870.z;
    float _1878 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1880 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1882 = _1511 + _1513;
    bool _1884 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1886 = isnan(_1761);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1892 = _1888 || _1890;
    float _1894 = _950 * _1880;
    float _1896 = exp2(_1878);
    float _1898 = _1882 * 0.5;
    out.m_85.z = _1898;
    out.m_85.w = _1513;
    float _1900 = -_1896;
    float _1902 = _1900 + 1.0;
    float _1904 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1906 = -_1904;
    float _1908 = _1906 + 1.0;
    float _1910 = _1904 * _1847;
    float _1912 = _1904;
    if (!_1892)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1914 = _1912;
    float _1916 = _1866 * _1910;
    float _1918 = _1876 * _1910;
    float _1920 = fma(_1872, _1916, _1860);
    float _1922 = fma(_1874, _1916, _1862);
    float _1924 = _1866 * _1908;
    float _1926 = fma(_1866, _1918, _1864);
    float _1928 = _1916;
    float _1930 = _1918;
    float _1932 = _1914;
    float _1934 = _1914;
    if (!_1892)
    {
        _1928 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1936 = _1928;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1892)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1942 = _1930;
    out.m_87.x = _1920;
    out.m_87.y = _1922;
    out.m_87.z = _1926;
    out.m_87.w = _1924;
    bool _1944 = !_1892;
    float _1946 = _1942;
    float _1948 = _1942;
    if (!_1944)
    {
        bool _1950 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1952 = isnan(_1761);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1958 = _1954 || _1956;
        if (!_1958)
        {
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1962 = _1761 + _1960;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1964;
            float _1968 = 1.0 / _1966;
            float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1972 = _1970 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1978 = _1962 * _1968;
            float _1980 = precise::clamp(_1978, 0.0, 1.0);
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1986 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1988 = fma(_1980, _1984, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1990 = fma(_1980, _1972, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1948 = _1990;
            _1940 = _1988;
            _1934 = _1986;
            _1992 = true;
        }
        else
        {
            bool _1994 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1996 = isnan(_1761);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2002 = _1998 || _2000;
            if (!_2002)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2004 = _1938;
            _1940 = _2004;
            if (!_2002)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2006 = _1946;
            _1948 = _2006;
            if (!_2002)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2008 = _1932;
            bool _2010 = !_2002;
            _1934 = _2008;
            if (!_2010)
            {
                bool _2012 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2014 = isnan(_1761);
                bool _2016 = _2012 || _2014;
                bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2020 = _2016 || _2018;
                if (!_2020)
                {
                    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2024 = _1761 + _2022;
                    float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2028 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2026;
                    float _2030 = 1.0 / _2028;
                    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2034 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2040 = _2024 * _2030;
                    float _2042 = precise::clamp(_2040, 0.0, 1.0);
                    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2048 = fma(_2042, _2038, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2050 = fma(_2042, _2046, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2052 = fma(_2042, _2034, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1948 = _2052;
                    _1940 = _2050;
                    _1934 = _2048;
                    _1992 = true;
                }
                else
                {
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1992 = false;
    float _2054 = _1948;
    float _2056 = _1940;
    float _2058 = _1934;
    float _2060 = _2054 * 0.586610972881317138671875;
    bool _2062 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2064 = _1894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2066 = fma(_2056, 0.298911988735198974609375, _2060);
    out.m_89.x = 0.0;
    float _2068 = fma(_2058, 0.114477999508380889892578125, _2066);
    out.m_56.x = _2064;
    float _2070 = -_2068;
    float _2072 = _2070 + _2056;
    float _2074 = -_2068;
    float _2076 = _2074 + _2054;
    float _2078 = -_2068;
    float _2080 = _2078 + _2058;
    float _2082 = fma(_2072, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    float _2084 = fma(_2076, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    float _2086 = fma(_2080, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    out.m_91.x = _2082;
    out.m_91.y = _2084;
    out.m_91.z = _2086;
    if (!_2062)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2088 = -_1433;
    float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2092 = -_1435;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2096 = -_1437;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2100 = _2090 * _2090;
    float _2102 = fma(_2094, _2094, _2100);
    float _2104 = fma(_2098, _2098, _2102);
    float _2106 = sqrt(_2104);
    float _2108 = rsqrt(_2104);
    float _2110 = -_2106;
    float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = _2094 * _2108;
    float _2120 = _2090 * _2108;
    float _2122 = abs(_2116);
    float _2124 = log2(_2122);
    float _2126 = _2098 * _2108;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2130 = _900 * _2120;
    float _2132 = -_2120;
    float _2134 = -_2128;
    float _2136 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2134);
    float _2138 = fma(_898, _2118, _2130);
    float _2140 = -_2126;
    float _2142 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2136);
    float _2144 = fma(_902, _2126, _2138);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2150 = _2142 + _2148;
    float _2152 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2154 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2156 = precise::clamp(_2154, 0.0, 1.0);
    float _2158 = exp2(_2152);
    float _2160 = _2158 * _2156;
    float _2162 = _2146 * _2160;
    float _2164 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2166 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2168 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2164;
    out.m_89.y = _2166;
    out.m_89.z = _2168;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1992 = false;
    bool _1002 = false;
    bool _990 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_53.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_56.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2226 = as_type<float>(_126);
        out.gl_Position.z = _2226;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_58.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_110);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_56.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2295 = as_type<float>(_162);
        out.gl_Position.z = _2295;
    }
    if (_154)
    {
        return out;
    }
    float _164 = as_type<float>(int(gl_VertexIndex));
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _168 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _170 = in.m_63.x;
    float _172 = in.m_63.y;
    float _174 = in.m_63.z;
    float _176 = in.m_63.w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _180 = in.m_65.x;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = _168 * _166;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _204 = as_type<int>(_164) & 1;
    bool _206 = _204 != 0;
    int _208 = as_type<int>(_164) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = _198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _220 = !_210;
    float _222 = _220 ? (-0.5) : 0.5;
    float _224 = in.m_53.x;
    float _226 = in.m_53.y;
    float _228 = in.m_53.z;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _236 = _234 != 0;
    float _238 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _240 = _170 > 0.5;
    float _242 = in.m_71.x;
    float _244 = in.m_71.y;
    float _246 = in.m_71.z;
    bool _248 = !_206;
    float _250 = _248 ? (-0.5) : 0.5;
    bool _252 = _172 > 0.5;
    float _254 = in.m_67.w;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _262 = _260 != 0;
    float _264 = -_250;
    int _266 = _240 ? as_type<int>(_264) : as_type<int>(_250);
    float _268 = _182 * _194;
    float _270 = -_222;
    int _272 = _252 ? as_type<int>(_270) : as_type<int>(_222);
    bool _274 = !_232;
    int _276 = _274 ? 0 : 1;
    bool _278 = _174 > 0.5;
    float _280 = _182 * _214;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _284 = _282 != 0;
    bool _286 = _172 > 0.5;
    float _288 = _194 * _226;
    bool _290 = !_258;
    float _292 = _290 ? _250 : as_type<float>(_266);
    float _294 = _214 * _226;
    bool _296 = !_262;
    float _298 = _296 ? _222 : as_type<float>(_272);
    float _300 = _182 * _244;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _312 = _310 != 0;
    float _314 = _244 * _226;
    float _316 = -_250;
    int _318 = _286 ? as_type<int>(_316) : as_type<int>(_250);
    float _320 = fma(_180, _192, _268);
    int _322 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _324 = _322 != 0;
    float _326 = fma(_192, _224, _288);
    float _328 = fma(_180, _212, _280);
    bool _330 = !_308;
    float _332 = _330 ? _250 : as_type<float>(_318);
    float _334 = fma(_180, _242, _300);
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _338 = _336 != 0;
    float _340 = in.m_73.x;
    float _342 = in.m_73.y;
    float _344 = fma(_212, _224, _294);
    float _346 = fma(_184, _216, _328);
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _350 = -_250;
    int _352 = _278 ? as_type<int>(_350) : as_type<int>(_250);
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _358 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _362 = fma(_216, _228, _344);
    bool _364 = !_284;
    float _366 = _364 ? _250 : as_type<float>(_352);
    float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_75.x = _358;
    out.m_75.y = _360;
    out.m_75.z = _188;
    out.m_75.w = _356;
    bool _370 = _176 > 0.5;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _374 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _376 = in.m_71.w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _380 = -_372;
    float _382 = fma(_374, 2.0, _380);
    float _384 = in.m_69.w;
    float _386 = _342 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = fma(_196, _228, _326);
    float _390 = _340 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = fma(_242, _224, _314);
    float _394 = fma(_238, -2.0, _378);
    float _396 = _326;
    float _398 = _196;
    float _400 = _186;
    float _402 = _172;
    if (_338)
    {
        _396 = _170;
    }
    float _404 = _396;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _408 = fma(_184, _196, _320);
    float _410 = _404;
    if (!_338)
    {
        _410 = _174;
    }
    float _412 = _410;
    float _414 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _416 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _250);
    float _420 = fma(_246, _228, _392);
    if (!_338)
    {
        _398 = _172;
    }
    float _422 = _398;
    float _424 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _222);
    float _428 = _422;
    if (_338)
    {
        _428 = _170;
    }
    float _430 = _428;
    float _432 = _412 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _436 = _416 * _418;
    float _438 = _412;
    if (!_338)
    {
        float _440 = in.m_63.z;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = _420 + _376;
    float _446 = _414 * _426;
    float _448 = _368 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_77.x = _202;
    out.m_77.y = _424;
    out.m_77.z = _218;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[83].z, _434);
    float _454 = _362 + _384;
    float _456 = _430 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _458 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _186);
    float _460 = -_450;
    float _462 = fma(_432, 2.0, _460);
    float _464 = fma(_184, _246, _334);
    float _466 = floor(_458);
    float _468 = _388 + _254;
    float _470 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    float _472 = -_144;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _382);
    float _476 = _292 + 0.5;
    float _478 = _298 + (-0.5);
    float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _482 = fma(_448, _476, _474);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _486 = _458 * 6.283185482025146484375;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _490 = _442;
    if (!_338)
    {
        _400 = _442;
    }
    float _492 = _400;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _500 = _492;
    if (_338)
    {
        _490 = _172;
    }
    float _502 = _490;
    float _504 = -_488;
    float _506 = fma(_456, 2.0, _504);
    float _508 = _346 * _346;
    float _510 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _494);
    if (_338)
    {
        _500 = _172;
    }
    float _512 = _500;
    float _514 = fma(_408, _408, _508);
    float _516 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _518 = _496 * 6.283185482025146484375;
    float _520 = cos(_518);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _524 = fma(_464, _464, _514);
    float _526 = -_516;
    float _528 = -_470;
    float _530 = fma(_526, _478, _528);
    float _532 = -_466;
    float _534 = _458 + _532;
    float _536 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[83].w, _484);
    float _538 = _498 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _540 = -_144;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[86].x, _462);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _546 = _332 + 0.5;
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _552 = fma(_538, _546, _542);
    bool _554 = _534 < 0.5;
    float _556 = float(_554);
    float _558 = fma(_520, 0.5, 0.5);
    float _560 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].w, _522);
    float _562 = _454 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _564 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _550);
    float _566 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _544);
    if (!_338)
    {
        _402 = _170;
    }
    float _568 = _402;
    float _570 = -_534;
    float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _574 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _576 = -_556;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _580 = -_558;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _584 = rsqrt(_524);
    float _586 = _468 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _588 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _590 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _592 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _594 = abs(_276);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].x, _588);
    float _598 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].y, _590);
    float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].z, _592);
    float _604 = _548 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _606 = -_222;
    int _608 = _370 ? as_type<int>(_606) : as_type<int>(_222);
    float _610 = _366 + 0.5;
    float _612 = float(_594);
    float _614 = -_144;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[81].x, _506);
    float _618 = _444 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _622 = _568 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _624 = !_304;
    float _626 = _624 ? _222 : as_type<float>(_608);
    float _628 = fma(_574, -2.0, _200);
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _632 = fma(_604, _610, _616);
    float _634 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _510);
    float _636 = abs(_572);
    float _638 = _612 * _636;
    float _640 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].x, _596);
    float _642 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].y, _598);
    float _644 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].z, _602);
    float _646 = fma(_622, -2.0, _620);
    float _648 = _408 * _584;
    float _650 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _652 = _346 * _584;
    float _654 = _600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _656 = _626 + (-0.5);
    float _658 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _660 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _564);
    float _662 = -_634;
    float _664 = _662 + 1.0;
    float _666 = _464 * _584;
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _670 = -_654;
    float _672 = -_658;
    float _674 = fma(_670, _656, _672);
    float _676 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _452);
    float _678 = fma(_298, _664, _530);
    float _680 = -_660;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _686 = _666 * _684;
    float _688 = -_676;
    float _690 = _688 + 1.0;
    float _692 = _640 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    bool _694 = !_324;
    int _696 = _694 ? 0 : 1;
    float _698 = -_682;
    float _700 = fma(_292, _698, _482);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _704 = _652 * _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _708 = -_686;
    float _710 = fma(_648, _706, _708);
    float _712 = _642 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _714 = _644 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _716 = _692 * _630;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _720 = abs(_696);
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _724 = _648 * _722;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _728 = -_704;
    float _730 = fma(_666, _726, _728);
    float _732 = _710 * _710;
    float _734 = _712 * _650;
    float _736 = _714 * _668;
    float _738 = -_690;
    float _740 = fma(_366, _738, _632);
    float _742 = -_222;
    int _744 = _278 ? as_type<int>(_742) : as_type<int>(_222);
    float _746 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _536);
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _750 = -_724;
    float _752 = fma(_652, _748, _750);
    float _754 = fma(_730, _730, _732);
    float _756 = fma(_716, 0.5, 0.5);
    float _758 = fma(_734, 0.5, 0.5);
    float _760 = fma(_736, 0.5, 0.5);
    bool _762 = !_312;
    float _764 = _762 ? _222 : as_type<float>(_744);
    float _766 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _566);
    float _768 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _560);
    float _770 = -_746;
    float _772 = _770 + 1.0;
    float _774 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _646);
    float _776 = fma(_752, _752, _754);
    float _778 = floor(_756);
    float _780 = _718 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _782 = _764 + (-0.5);
    float _784 = -_768;
    float _786 = _784 + 1.0;
    float _788 = float(_720);
    float _790 = -_766;
    float _792 = _790 + 1.0;
    float _794 = -_780;
    float _796 = -_774;
    float _798 = fma(_794, _782, _796);
    float _800 = floor(_758);
    float _802 = fma(_626, _772, _674);
    float _804 = -_792;
    float _806 = fma(_332, _804, _552);
    float _808 = fma(_764, _786, _798);
    float _810 = fma(_788, _582, _638);
    out.m_79.x = _700;
    out.m_79.y = _678;
    out.m_79.z = _740;
    out.m_79.w = _802;
    float _812 = _222 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _814 = floor(_760);
    float _816 = -_778;
    float _818 = _756 + _816;
    float _820 = _250 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_81.x = _806;
    out.m_81.y = _808;
    float _822 = _648 * _812;
    float _824 = fma(_818, 2.0, -1.0);
    float _826 = rsqrt(_776);
    float _828 = -_800;
    float _830 = _758 + _828;
    float _832 = _446 * _648;
    float _834 = fma(_830, 2.0, -1.0);
    float _836 = _446 * _666;
    float _838 = _652 * _812;
    float _840 = -_814;
    float _842 = _760 + _840;
    float _844 = fma(_842, 2.0, -1.0);
    float _846 = _446 * _652;
    float _848 = _730 * _826;
    float _850 = _710 * _826;
    float _852 = _752 * _826;
    float _854 = fma(_436, _848, _832);
    float _856 = fma(_436, _850, _846);
    float _858 = fma(_436, _852, _836);
    float _860 = _666 * _812;
    float _862 = _652 * _852;
    float _864 = _666 * _848;
    float _866 = _648 * _850;
    float _868 = fma(_852, _820, _860);
    float _870 = _834 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _872 = -_862;
    float _874 = fma(_666, _850, _872);
    float _876 = _824 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _878 = fma(_848, _820, _822);
    float _880 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _882 = fma(_850, _820, _838);
    float _884 = -_864;
    float _886 = fma(_648, _852, _884);
    float _888 = -_866;
    float _890 = fma(_652, _848, _888);
    float _892 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _894 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _896 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].x, _880);
    float _898 = _874 + _878;
    float _900 = _886 + _882;
    float _902 = _890 + _868;
    float _904 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _906 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].y, _892);
    float _908 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].z, _894);
    bool _910 = !_236;
    int _912 = _910 ? 0 : 1;
    float _914 = fma(_904, _874, _854);
    float _916 = fma(_904, _886, _856);
    out.m_83.x = _898;
    out.m_83.y = _900;
    out.m_83.z = _902;
    float _918 = fma(_904, _890, _858);
    int _920 = abs(_912);
    float _922 = _844 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _924 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _926 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _928 = _924 || _926;
    bool _930 = isnan(1.0);
    bool _932 = _928 || _930;
    float _934 = float(_920);
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].x, _896);
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].y, _906);
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].z, _908);
    float _942 = _936 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _944 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _946 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _948 = abs(_578);
    float _950 = fma(_934, _948, _810);
    float _952 = _914 + _942;
    float _954 = _916 + _944;
    float _956 = _918 + _946;
    float _958 = _838;
    float _960 = _822;
    float _962 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _964 = _914;
    float _966 = _914;
    float _968 = _822;
    float _970 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _972 = _824;
    float _974 = _834;
    float _976 = _934;
    float _978 = _844;
    float _980 = _878;
    float _982 = _826;
    float _984 = _908;
    float _994;
    float _996;
    float _998;
    float _1000;
    if (!_932)
    {
        bool _986 = _944 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _988 = !_986;
        _990 = _988;
        if (!_990)
        {
            float _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _994 = _992;
            _996 = 0.0;
            _998 = 0.0;
            _1000 = 0.0;
            _1002 = true;
        }
    }
    if ((!_1002) || _990)
    {
        bool _1038;
        if (!_990)
        {
            bool _1004 = _944 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1006 = isnan(_944);
            bool _1008 = _1004 || _1006;
            bool _1010 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1012 = _1008 || _1010;
            bool _1014 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1016 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1018 = !_1012;
            bool _1020 = _1016 && _1018;
            if (_1020)
            {
                _958 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1022 = _958;
            float _1024 = _1022;
            if (_1020)
            {
                _960 = 0.0;
            }
            float _1026 = _960;
            _968 = _1026;
            _996 = _1026;
            if (_1020)
            {
                _962 = 0.0;
            }
            float _1028 = _962;
            _970 = _1028;
            _998 = _1028;
            if (_1020)
            {
                float _1030 = _1022 * 5.0;
                _1024 = _1030;
            }
            float _1032 = _1024;
            _994 = _1032;
            if (_1020)
            {
                _964 = 0.0;
            }
            float _1034 = _964;
            bool _1036 = !_1012;
            _1038 = _1036 && _1014;
            _966 = _1034;
            _1000 = _1034;
        }
        if ((!_1038) || _990)
        {
            _990 = false;
            float _1040 = _966;
            float _1042 = _968;
            float _1044 = _970;
            bool _1046 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1048 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1050 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1052 = _1040;
            float _1054 = _1044;
            _994 = _956;
            if (_1046)
            {
                float _1056 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1052 = _1056;
            }
            float _1058 = _1052;
            if (_1046)
            {
                float _1060 = abs(_824);
                float _1062 = -_1060;
                float _1064 = _1062 + 1.0;
                _972 = _1064;
            }
            float _1066 = _972;
            if (_1048)
            {
                float _1068 = abs(_834);
                float _1070 = -_1068;
                float _1072 = _1070 + 1.0;
                _974 = _1072;
            }
            float _1074 = _974;
            if (!_1046)
            {
                _976 = 1.0;
            }
            float _1076 = _976;
            float _1078 = _1076;
            if (_1050)
            {
                float _1080 = abs(_844);
                float _1082 = -_1080;
                float _1084 = _1082 + 1.0;
                _978 = _1084;
            }
            float _1086 = _978;
            if (!_1048)
            {
                _1054 = 1.0;
            }
            float _1088 = _1054;
            float _1090 = _1042;
            float _1092 = _1088;
            if (_1048)
            {
                float _1094 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1090 = _1094;
            }
            float _1096 = _1090;
            float _1098 = _878;
            if (_1050)
            {
                float _1100 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1098 = _1100;
            }
            float _1102 = _1098;
            float _1104 = _1058;
            if (_1046)
            {
                float _1106 = _1066 * _1058;
                float _1108 = precise::clamp(_1106, 0.0, 1.0);
                _1078 = _1108;
            }
            float _1110 = _1078;
            if (!_1050)
            {
                _1104 = 1.0;
            }
            float _1112 = _1104;
            float _1114 = _1112;
            if (_1048)
            {
                float _1116 = _1074 * _1096;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1092 = _1118;
            }
            float _1120 = _1092;
            float _1122 = _1110 * _1120;
            _980 = _1102;
            _996 = _952;
            _998 = _954;
            if (_1050)
            {
                float _1124 = _1086 * _1102;
                float _1126 = precise::clamp(_1124, 0.0, 1.0);
                _1114 = _1126;
            }
            float _1128 = _1114;
            float _1130 = _1122 * _1128;
            _1000 = _1130;
        }
    }
    _1002 = false;
    float _1132 = _980;
    float _1134 = _994;
    float _1136 = _996;
    float _1138 = _998;
    float _1140 = _1000;
    float _1142 = _944 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1148 = fma(_942, 6.2500002968590706586837768554688e-05, 0.5);
    float _1150 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1144);
    float _1152 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1146);
    float _1154 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1150);
    float _1156 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1152);
    float _1158 = _1154 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1162 = trunc(_1158);
    int _1164 = int(_1162);
    float _1166 = trunc(_1160);
    int _1168 = int(_1166);
    int _1170 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1172 = _1164 + _1170;
    int _1174 = _1172 + 1;
    bool _1176 = _1174 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1178 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1180 = _1168 + _1178;
    int _1182 = _1180 + 1;
    int _1184 = _1174 | _1182;
    bool _1186 = _1184 < 0;
    bool _1188 = _1186 || _1176;
    bool _1190 = _1182 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1192 = _1190 || _1188;
    int _1194 = _1174;
    int _1196 = _1182;
    int _1198 = _1184;
    float _1200 = _1132;
    float _1202 = _1138;
    float _1204 = _1136;
    float _1206 = _1134;
    if (!_1192)
    {
        int _1208 = _1182 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1210 = _1208 + _1174;
        _1194 = _1210;
    }
    int _1212 = _1194;
    if (!_1192)
    {
        int _1214 = _1212 << 2;
        _1196 = _1214;
    }
    int _1216 = _1196;
    int _1218 = _1216;
    if (!_1192)
    {
        uint _1221 = uint(int(uint(_1212) >> uint(2)));
        _1198 = int(_1221);
    }
    int _1223 = _1198;
    if (!_1192)
    {
        int _1225 = 12 & _1216;
        _1218 = _1225;
    }
    int _1227 = _1218;
    if (!_1192)
    {
        int _1229 = _1223 << 4;
        int _1231 = _1229 + _1227;
        _1200 = as_type<float>(_1231);
    }
    float _1233 = _1200;
    float _1235 = as_type<float>(_1227);
    if (!_1192)
    {
        float _1237 = floor(_1160);
        _1235 = _1237;
    }
    float _1239 = _1235;
    float _1241 = _1233;
    if (!_1192)
    {
        int _1243 = as_type<int>(_1233) + 400;
        uint _1245 = uint(int(uint(_1243) >> uint(2)));
        uint _1247 = uint(int(uint(int(_1245)) >> uint(2)));
        int _1249 = int(_1245) & 3;
        float _1251 = (*spvDescriptorSet0.vp_c15)._m0[int(_1247)][_1249];
        _1241 = _1251;
    }
    float _1253 = _1241;
    float _1255 = as_type<float>(_1223);
    if (!_1192)
    {
        float _1257 = floor(_1158);
        _1255 = _1257;
    }
    float _1259 = _1255;
    if (!_1192)
    {
        float _1261 = -_1239;
        float _1263 = _1160 + _1261;
        _982 = _1263;
    }
    float _1265 = _982;
    float _1267 = fma(_946, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4131 = float2(_1148, _1267);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4131, float2(0.0), isnan(_4131)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4131, float2(0.0), isnan(_4131)), level(0.0)).x;
    float _1271 = _1267;
    if (!_1192)
    {
        float _1273 = -_1259;
        float _1275 = _1158 + _1273;
        _984 = _1275;
    }
    float _1277 = _984;
    float _1279 = _792;
    float _1281 = _1277;
    if (!_1192)
    {
        float _1283 = rint(_1253);
        float _1285 = precise::max(_1283, 0.0);
        uint _1287 = uint(_1285);
        uint _1289 = clamp(_1287, 0u, 65535u);
        _1279 = as_type<float>(_1289);
    }
    float _1291 = _1279;
    float _1293 = _1259;
    if (!_1192)
    {
        float3 _4179 = float3(_1277, _1265, float(as_type<int>(_1291)));
        float3 _4183 = select(_4179, float3(0.0), isnan(_4179));
        float _1295 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4183.xy, uint(rint(_4183.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4183.xy, uint(rint(_4183.z)), level(0.0)).x;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1301 = _1134 + _1299;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1305 = _1136 + _1303;
    float _1307 = _1301 * _1301;
    bool _1309 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.5);
    bool _1317 = _1313 || _1315;
    float _1319 = fma(_1305, _1305, _1307);
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1325 = !_1323;
    float _1327 = _1269;
    if (!_1325)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1333 = _1321 + _1331;
        float _1335 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = rsqrt(_1319);
        float _1339 = _1333 * _1329;
        float _1341 = _1339 * 0.15915493667125701904296875;
        float _1343 = _1341 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = _1341 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = fma(_1345, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1353 = _1337 * _1351;
        float _1355 = _1349 + (-1.0);
        float _1357 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = fma(_1305, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1361 = fma(_1301, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1363 = fma(_1349, _1138, _1357);
        _1202 = _1363;
        _1204 = _1359;
        _1206 = _1361;
        _1271 = _1335;
    }
    float _1365 = _1202;
    float _1367 = _1204;
    float _1369 = _1206;
    float _1371 = _1271;
    float _1373 = _1371;
    float _1375 = _1367;
    float _1377 = _1369;
    if (_1317)
    {
        _1373 = _1365;
    }
    float _1379 = _1373;
    float _1381 = _1379;
    if (!_1317)
    {
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1385 = _944 + _1383;
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1389 = _942 + _1387;
        float _1391 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1393 = -_944;
        float _1395 = _1393 + _1365;
        float _1397 = _1385 * _1385;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1401 = _946 + _1399;
        float _1403 = -_942;
        float _1405 = _1403 + _1367;
        float _1407 = -_946;
        float _1409 = _1407 + _1369;
        float _1411 = fma(_1389, _1389, _1397);
        float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1415 = fma(_1401, _1401, _1411);
        float _1417 = sqrt(_1415);
        float _1419 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1421 = precise::min(_1417, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1423 = _1421 * _1413;
        float _1425 = _1419 * _1423;
        float _1427 = fma(_1395, _1425, _944);
        float _1429 = fma(_1405, _1425, _942);
        float _1431 = fma(_1409, _1425, _946);
        _1381 = _1427;
        _1375 = _1429;
        _1377 = _1431;
    }
    float _1433 = _1381;
    float _1435 = _1375;
    float _1437 = _1377;
    float _1439 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1445 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1439);
    float _1449 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1451 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    float _1453 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1455 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1447);
    float _1457 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1449);
    float _1459 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1451);
    float _1461 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1453);
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1467 = _1459 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1469 = abs(_1269);
    bool _1471 = _1469 != 0.0;
    bool _1473 = isnan(_1469);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1483 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1489 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1481);
    float _1491 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1493 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1485);
    float _1495 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1487);
    float _1497 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1499 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1489);
    float _1501 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1503 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1505 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1495);
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1501);
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1503);
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1505);
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1507;
    out.gl_Position.z = _1511;
    out.gl_Position.w = _1513;
    if (_1479)
    {
        _1327 = _1513;
    }
    float _1515 = _1327;
    float _1517 = _1515;
    if (!_1479)
    {
        _1517 = 0.0;
    }
    float _1519 = _1517;
    float _1521 = _1519;
    if (!_1479)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1192)
    {
        int _1523 = _1212 << 4;
        int _1525 = _1523 + 2048;
        uint _1527 = uint(int(uint(_1525) >> uint(2)));
        uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
        int _1531 = int(_1527) & 3;
        float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
        int _1535 = int(_1527) + 1;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        int _1539 = _1535 & 3;
        float _1541 = (*spvDescriptorSet0.vp_c15)._m0[int(_1537)][_1539];
        int _1543 = _1525 + 8;
        uint _1545 = uint(int(uint(_1543) >> uint(2)));
        uint _1547 = uint(int(uint(int(_1545)) >> uint(2)));
        int _1549 = int(_1545) & 3;
        float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
        int _1553 = int(_1545) + 1;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        int _1557 = _1553 & 3;
        float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
        float _1561 = _1142 * _1541;
        float _1563 = fma(_942, _1533, _1561);
        float _1565 = fma(_946, _1551, _1563);
        float _1567 = _1565 + _1559;
        float _1569 = precise::clamp(_1567, 0.0, 1.0);
        float _1571 = -_1569;
        float _1573 = _1571 + _1297;
        float _1575 = fma(_1573, 500.0, 1.5);
        float _1577 = exp2(_1575);
        float _1579 = 0.0 + _1577;
        float _1581 = precise::clamp(_1579, 0.0, 1.0);
        bool _1583 = _1581 >= 1.0;
        bool _1585 = isnan(_1581);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan(1.0);
        bool _1591 = _1587 || _1589;
        _1281 = _1559;
        if (!_1591)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1591)
        {
            _1521 = 0.0;
        }
    }
    float _1593 = _1281;
    float _1595 = _1521;
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1599 = _1433 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1603 = _1435 + _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1607 = _1437 + _1605;
    float _1609 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1611 = _1599 * _1599;
    float _1613 = fma(_1603, _1603, _1611);
    float _1615 = fma(_1607, _1607, _1613);
    float _1617 = rsqrt(_1615);
    float _1619 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1621 = _1603 * _1619;
    float _1623 = _1607 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 * _1623;
    float _1629 = _1625 + _1627;
    float _1631 = sqrt(_1629);
    bool _1633 = _1631 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1637 = _1631 + _1635;
    float _1639 = _1607;
    float _1641 = _1629;
    float _1643 = _1637;
    float _1645 = _1593;
    float _1647 = _1599;
    float _1649 = _1621;
    if (_1633)
    {
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1639 = _1651;
    }
    float _1653 = _1639;
    if (_1633)
    {
        float _1655 = rsqrt(_1629);
        _1641 = _1655;
    }
    float _1657 = _1641;
    if (_1633)
    {
        float _1659 = _1637 * _1653;
        _1643 = _1659;
    }
    float _1661 = _1643;
    if (_1633)
    {
        float _1663 = _1661 * 0.15915493667125701904296875;
        _1645 = _1663;
    }
    float _1665 = _1645;
    float _1667 = _1617;
    float _1669 = _1665;
    if (_1633)
    {
        float _1671 = _1665 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        _1667 = _1673;
    }
    float _1675 = _1667;
    float _1677 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1679 = precise::max(0.0, _1677);
    float _1681 = _1611;
    float _1683 = _1679;
    float _1685 = _1677;
    if (_1633)
    {
        float _1687 = _1665 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        _1681 = _1689;
    }
    float _1691 = _1681;
    float _1693 = -_1619;
    float _1695 = -_1679;
    float _1697 = fma(_1599, _1693, _1695);
    if (_1633)
    {
        float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1699;
    }
    float _1701 = _1683;
    float _1703 = _1675;
    float _1705 = _1701;
    if (_1633)
    {
        float _1707 = fma(_1675, _1701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1647 = _1707;
    }
    float _1709 = _1647;
    float _1711 = _1709;
    if (!_1633)
    {
        _1703 = _1697;
    }
    float _1713 = _1703;
    float _1715 = _1713;
    if (!_1633)
    {
        _1705 = _1623;
    }
    float _1717 = _1705;
    float _1719 = _1717;
    float _1721 = _1691;
    if (_1633)
    {
        float _1723 = _1691 + (-1.0);
        _1685 = _1723;
    }
    float _1725 = _1685;
    float _1727 = _1725;
    if (_1633)
    {
        float _1729 = _1657 * _1709;
        _1669 = _1729;
    }
    float _1731 = _1669;
    if (!_1633)
    {
        _1711 = _1627;
    }
    float _1733 = _1711;
    float _1735 = _1733;
    if (_1633)
    {
        float _1737 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1737;
    }
    float _1739 = _1727;
    if (_1633)
    {
        float _1741 = _1621 * _1731;
        _1649 = _1741;
    }
    float _1743 = _1649;
    if (_1633)
    {
        float _1745 = _1623 * _1731;
        _1719 = _1745;
    }
    float _1747 = _1719;
    if (_1633)
    {
        float _1749 = fma(_1697, _1691, _1739);
        _1715 = _1749;
    }
    float _1751 = _1715;
    if (!_1633)
    {
        _1721 = _1625;
    }
    float _1753 = _1721;
    float _1755 = _1753;
    if (_1633)
    {
        float _1757 = _1743 * _1743;
        _1755 = _1757;
    }
    float _1759 = _1755;
    float _1761 = sqrt(_1615);
    if (_1633)
    {
        float _1763 = _1747 * _1747;
        _1735 = _1763;
    }
    float _1765 = _1735;
    float _1767 = fma(_1751, _1751, _1759);
    float _1769 = _1767 + _1765;
    float _1771 = 1.0 / _1595;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1777 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1775);
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = rsqrt(_1769);
    float _1783 = -_1609;
    float _1785 = fma(_1783, _1773, 1.0);
    float _1787 = -_1779;
    float _1789 = _1787 + 1.0;
    float _1791 = log2(_1785);
    float _1793 = _1509 * _1771;
    float _1795 = fma(_1793, 0.5, 0.5);
    float _1797 = abs(_1789);
    float _1799 = log2(_1797);
    float _1801 = _1781 * _1743;
    float _1803 = _1781 * _1751;
    float _1805 = _1781 * _1747;
    float _1807 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1809 = _1803 + 1.0;
    float _1811 = _1791 * 0.693147182464599609375;
    float _1813 = -_1807;
    float _1815 = fma(_1803, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1813);
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1819 = -_1805;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1815);
    float _1823 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1825 = fma(_1821, -0.5, 0.5);
    float _1827 = fma(_1821, 0.5, 0.5);
    float _1829 = exp2(_1823);
    float _1831 = fma(_1827, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1833 = fma(_1827, _1831, -0.212114393711090087890625);
    float _1835 = _1507 * _1771;
    float _1837 = sqrt(_1825);
    float _1839 = fma(_1827, _1833, 1.570728778839111328125);
    float _1841 = fma(_1835, -0.5, 0.5);
    float _1843 = -_1803;
    float _1845 = fma(_1829, _1809, _1843);
    float3 _5086 = float3(_1795, _1841, _1817);
    float _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5086, float3(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5086, float3(0.0), isnan(_5086)), level(0.0)).x;
    float _1849 = fma(_1845, 0.5, 0.5);
    float _1851 = _1837 * 0.636619746685028076171875;
    float _1853 = -_1839;
    float _1855 = fma(_1851, _1853, 1.0);
    float3 _5105 = float3(_1795, _1841, _1817);
    float4 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5105, float3(0.0), isnan(_5105)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5105, float3(0.0), isnan(_5105)), level(0.0)).xyzw;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1858.w;
    float2 _5121 = float2(_1855, _1849);
    float3 _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5121, float2(0.0), isnan(_5121)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5121, float2(0.0), isnan(_5121)), level(0.0)).xyz;
    float _1872 = _1870.x;
    float _1874 = _1870.y;
    float _1876 = _1870.z;
    float _1878 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1880 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1882 = _1511 + _1513;
    bool _1884 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1886 = isnan(_1761);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1892 = _1888 || _1890;
    float _1894 = _950 * _1880;
    float _1896 = exp2(_1878);
    float _1898 = _1882 * 0.5;
    out.m_85.z = _1898;
    out.m_85.w = _1513;
    float _1900 = -_1896;
    float _1902 = _1900 + 1.0;
    float _1904 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1906 = -_1904;
    float _1908 = _1906 + 1.0;
    float _1910 = _1904 * _1847;
    float _1912 = _1904;
    if (!_1892)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1914 = _1912;
    float _1916 = _1866 * _1910;
    float _1918 = _1876 * _1910;
    float _1920 = fma(_1872, _1916, _1860);
    float _1922 = fma(_1874, _1916, _1862);
    float _1924 = _1866 * _1908;
    float _1926 = fma(_1866, _1918, _1864);
    float _1928 = _1916;
    float _1930 = _1918;
    float _1932 = _1914;
    float _1934 = _1914;
    if (!_1892)
    {
        _1928 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1936 = _1928;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1892)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1942 = _1930;
    out.m_87.x = _1920;
    out.m_87.y = _1922;
    out.m_87.z = _1926;
    out.m_87.w = _1924;
    bool _1944 = !_1892;
    float _1946 = _1942;
    float _1948 = _1942;
    if (!_1944)
    {
        bool _1950 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1952 = isnan(_1761);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1958 = _1954 || _1956;
        if (!_1958)
        {
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1962 = _1761 + _1960;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1964;
            float _1968 = 1.0 / _1966;
            float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1972 = _1970 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1978 = _1962 * _1968;
            float _1980 = precise::clamp(_1978, 0.0, 1.0);
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1986 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1988 = fma(_1980, _1984, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1990 = fma(_1980, _1972, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1948 = _1990;
            _1940 = _1988;
            _1934 = _1986;
            _1992 = true;
        }
        else
        {
            bool _1994 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1996 = isnan(_1761);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2002 = _1998 || _2000;
            if (!_2002)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2004 = _1938;
            _1940 = _2004;
            if (!_2002)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2006 = _1946;
            _1948 = _2006;
            if (!_2002)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2008 = _1932;
            bool _2010 = !_2002;
            _1934 = _2008;
            if (!_2010)
            {
                bool _2012 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2014 = isnan(_1761);
                bool _2016 = _2012 || _2014;
                bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2020 = _2016 || _2018;
                if (!_2020)
                {
                    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2024 = _1761 + _2022;
                    float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2028 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2026;
                    float _2030 = 1.0 / _2028;
                    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2034 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2040 = _2024 * _2030;
                    float _2042 = precise::clamp(_2040, 0.0, 1.0);
                    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2048 = fma(_2042, _2038, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2050 = fma(_2042, _2046, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2052 = fma(_2042, _2034, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1948 = _2052;
                    _1940 = _2050;
                    _1934 = _2048;
                    _1992 = true;
                }
                else
                {
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1992 = false;
    float _2054 = _1948;
    float _2056 = _1940;
    float _2058 = _1934;
    float _2060 = _2054 * 0.586610972881317138671875;
    bool _2062 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2064 = _1894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2066 = fma(_2056, 0.298911988735198974609375, _2060);
    out.m_89.x = 0.0;
    float _2068 = fma(_2058, 0.114477999508380889892578125, _2066);
    out.m_56.x = _2064;
    float _2070 = -_2068;
    float _2072 = _2070 + _2056;
    float _2074 = -_2068;
    float _2076 = _2074 + _2054;
    float _2078 = -_2068;
    float _2080 = _2078 + _2058;
    float _2082 = fma(_2072, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    float _2084 = fma(_2076, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    float _2086 = fma(_2080, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    out.m_91.x = _2082;
    out.m_91.y = _2084;
    out.m_91.z = _2086;
    if (!_2062)
    {
        return out;
    }
    float _2088 = -_1433;
    float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2092 = -_1435;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2096 = -_1437;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2100 = _2090 * _2090;
    float _2102 = fma(_2094, _2094, _2100);
    float _2104 = fma(_2098, _2098, _2102);
    float _2106 = sqrt(_2104);
    float _2108 = rsqrt(_2104);
    float _2110 = -_2106;
    float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = _2094 * _2108;
    float _2120 = _2090 * _2108;
    float _2122 = abs(_2116);
    float _2124 = log2(_2122);
    float _2126 = _2098 * _2108;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2130 = _900 * _2120;
    float _2132 = -_2120;
    float _2134 = -_2128;
    float _2136 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2134);
    float _2138 = fma(_898, _2118, _2130);
    float _2140 = -_2126;
    float _2142 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2136);
    float _2144 = fma(_902, _2126, _2138);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2150 = _2142 + _2148;
    float _2152 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2154 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2156 = precise::clamp(_2154, 0.0, 1.0);
    float _2158 = exp2(_2152);
    float _2160 = _2158 * _2156;
    float _2162 = _2146 * _2160;
    float _2164 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2166 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2168 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2164;
    out.m_89.y = _2166;
    out.m_89.z = _2168;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1992 = false;
    bool _1002 = false;
    bool _990 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_53.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_56.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2226 = as_type<float>(_126);
        out.gl_Position.z = _2226;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_58.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_110);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_56.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2295 = as_type<float>(_162);
        out.gl_Position.z = _2295;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = as_type<float>(int(gl_VertexIndex));
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _168 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _170 = in.m_63.x;
    float _172 = in.m_63.y;
    float _174 = in.m_63.z;
    float _176 = in.m_63.w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _180 = in.m_65.x;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = _168 * _166;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _204 = as_type<int>(_164) & 1;
    bool _206 = _204 != 0;
    int _208 = as_type<int>(_164) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = _198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _220 = !_210;
    float _222 = _220 ? (-0.5) : 0.5;
    float _224 = in.m_53.x;
    float _226 = in.m_53.y;
    float _228 = in.m_53.z;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _236 = _234 != 0;
    float _238 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _240 = _170 > 0.5;
    float _242 = in.m_71.x;
    float _244 = in.m_71.y;
    float _246 = in.m_71.z;
    bool _248 = !_206;
    float _250 = _248 ? (-0.5) : 0.5;
    bool _252 = _172 > 0.5;
    float _254 = in.m_67.w;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _262 = _260 != 0;
    float _264 = -_250;
    int _266 = _240 ? as_type<int>(_264) : as_type<int>(_250);
    float _268 = _182 * _194;
    float _270 = -_222;
    int _272 = _252 ? as_type<int>(_270) : as_type<int>(_222);
    bool _274 = !_232;
    int _276 = _274 ? 0 : 1;
    bool _278 = _174 > 0.5;
    float _280 = _182 * _214;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _284 = _282 != 0;
    bool _286 = _172 > 0.5;
    float _288 = _194 * _226;
    bool _290 = !_258;
    float _292 = _290 ? _250 : as_type<float>(_266);
    float _294 = _214 * _226;
    bool _296 = !_262;
    float _298 = _296 ? _222 : as_type<float>(_272);
    float _300 = _182 * _244;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _312 = _310 != 0;
    float _314 = _244 * _226;
    float _316 = -_250;
    int _318 = _286 ? as_type<int>(_316) : as_type<int>(_250);
    float _320 = fma(_180, _192, _268);
    int _322 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _324 = _322 != 0;
    float _326 = fma(_192, _224, _288);
    float _328 = fma(_180, _212, _280);
    bool _330 = !_308;
    float _332 = _330 ? _250 : as_type<float>(_318);
    float _334 = fma(_180, _242, _300);
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _338 = _336 != 0;
    float _340 = in.m_73.x;
    float _342 = in.m_73.y;
    float _344 = fma(_212, _224, _294);
    float _346 = fma(_184, _216, _328);
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _350 = -_250;
    int _352 = _278 ? as_type<int>(_350) : as_type<int>(_250);
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _358 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _362 = fma(_216, _228, _344);
    bool _364 = !_284;
    float _366 = _364 ? _250 : as_type<float>(_352);
    float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_75.x = _358;
    out.m_75.y = _360;
    out.m_75.z = _188;
    out.m_75.w = _356;
    bool _370 = _176 > 0.5;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _374 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _376 = in.m_71.w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _380 = -_372;
    float _382 = fma(_374, 2.0, _380);
    float _384 = in.m_69.w;
    float _386 = _342 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = fma(_196, _228, _326);
    float _390 = _340 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _392 = fma(_242, _224, _314);
    float _394 = fma(_238, -2.0, _378);
    float _396 = _326;
    float _398 = _196;
    float _400 = _186;
    float _402 = _172;
    if (_338)
    {
        _396 = _170;
    }
    float _404 = _396;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _408 = fma(_184, _196, _320);
    float _410 = _404;
    if (!_338)
    {
        _410 = _174;
    }
    float _412 = _410;
    float _414 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _416 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _418 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _250);
    float _420 = fma(_246, _228, _392);
    if (!_338)
    {
        _398 = _172;
    }
    float _422 = _398;
    float _424 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _222);
    float _428 = _422;
    if (_338)
    {
        _428 = _170;
    }
    float _430 = _428;
    float _432 = _412 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _436 = _416 * _418;
    float _438 = _412;
    if (!_338)
    {
        float _440 = in.m_63.z;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = _420 + _376;
    float _446 = _414 * _426;
    float _448 = _368 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_77.x = _202;
    out.m_77.y = _424;
    out.m_77.z = _218;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[83].z, _434);
    float _454 = _362 + _384;
    float _456 = _430 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _458 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _186);
    float _460 = -_450;
    float _462 = fma(_432, 2.0, _460);
    float _464 = fma(_184, _246, _334);
    float _466 = floor(_458);
    float _468 = _388 + _254;
    float _470 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    float _472 = -_144;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _382);
    float _476 = _292 + 0.5;
    float _478 = _298 + (-0.5);
    float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _482 = fma(_448, _476, _474);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _486 = _458 * 6.283185482025146484375;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _490 = _442;
    if (!_338)
    {
        _400 = _442;
    }
    float _492 = _400;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _500 = _492;
    if (_338)
    {
        _490 = _172;
    }
    float _502 = _490;
    float _504 = -_488;
    float _506 = fma(_456, 2.0, _504);
    float _508 = _346 * _346;
    float _510 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _494);
    if (_338)
    {
        _500 = _172;
    }
    float _512 = _500;
    float _514 = fma(_408, _408, _508);
    float _516 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _518 = _496 * 6.283185482025146484375;
    float _520 = cos(_518);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _524 = fma(_464, _464, _514);
    float _526 = -_516;
    float _528 = -_470;
    float _530 = fma(_526, _478, _528);
    float _532 = -_466;
    float _534 = _458 + _532;
    float _536 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[83].w, _484);
    float _538 = _498 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _540 = -_144;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[86].x, _462);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _546 = _332 + 0.5;
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _552 = fma(_538, _546, _542);
    bool _554 = _534 < 0.5;
    float _556 = float(_554);
    float _558 = fma(_520, 0.5, 0.5);
    float _560 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].w, _522);
    float _562 = _454 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _564 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _550);
    float _566 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _544);
    if (!_338)
    {
        _402 = _170;
    }
    float _568 = _402;
    float _570 = -_534;
    float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _574 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _576 = -_556;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _580 = -_558;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _584 = rsqrt(_524);
    float _586 = _468 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _588 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _590 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _592 = _562 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _594 = abs(_276);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].x, _588);
    float _598 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].y, _590);
    float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c12)._m0[6].z, _592);
    float _604 = _548 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _606 = -_222;
    int _608 = _370 ? as_type<int>(_606) : as_type<int>(_222);
    float _610 = _366 + 0.5;
    float _612 = float(_594);
    float _614 = -_144;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[81].x, _506);
    float _618 = _444 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _622 = _568 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _624 = !_304;
    float _626 = _624 ? _222 : as_type<float>(_608);
    float _628 = fma(_574, -2.0, _200);
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _632 = fma(_604, _610, _616);
    float _634 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _510);
    float _636 = abs(_572);
    float _638 = _612 * _636;
    float _640 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].x, _596);
    float _642 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].y, _598);
    float _644 = fma(_618, (*spvDescriptorSet0.vp_c12)._m0[8].z, _602);
    float _646 = fma(_622, -2.0, _620);
    float _648 = _408 * _584;
    float _650 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _652 = _346 * _584;
    float _654 = _600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _656 = _626 + (-0.5);
    float _658 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _660 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _564);
    float _662 = -_634;
    float _664 = _662 + 1.0;
    float _666 = _464 * _584;
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _670 = -_654;
    float _672 = -_658;
    float _674 = fma(_670, _656, _672);
    float _676 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _452);
    float _678 = fma(_298, _664, _530);
    float _680 = -_660;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _686 = _666 * _684;
    float _688 = -_676;
    float _690 = _688 + 1.0;
    float _692 = _640 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    bool _694 = !_324;
    int _696 = _694 ? 0 : 1;
    float _698 = -_682;
    float _700 = fma(_292, _698, _482);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _704 = _652 * _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _708 = -_686;
    float _710 = fma(_648, _706, _708);
    float _712 = _642 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _714 = _644 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _716 = _692 * _630;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _720 = abs(_696);
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _724 = _648 * _722;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _728 = -_704;
    float _730 = fma(_666, _726, _728);
    float _732 = _710 * _710;
    float _734 = _712 * _650;
    float _736 = _714 * _668;
    float _738 = -_690;
    float _740 = fma(_366, _738, _632);
    float _742 = -_222;
    int _744 = _278 ? as_type<int>(_742) : as_type<int>(_222);
    float _746 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _536);
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _750 = -_724;
    float _752 = fma(_652, _748, _750);
    float _754 = fma(_730, _730, _732);
    float _756 = fma(_716, 0.5, 0.5);
    float _758 = fma(_734, 0.5, 0.5);
    float _760 = fma(_736, 0.5, 0.5);
    bool _762 = !_312;
    float _764 = _762 ? _222 : as_type<float>(_744);
    float _766 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _566);
    float _768 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _560);
    float _770 = -_746;
    float _772 = _770 + 1.0;
    float _774 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _646);
    float _776 = fma(_752, _752, _754);
    float _778 = floor(_756);
    float _780 = _718 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _782 = _764 + (-0.5);
    float _784 = -_768;
    float _786 = _784 + 1.0;
    float _788 = float(_720);
    float _790 = -_766;
    float _792 = _790 + 1.0;
    float _794 = -_780;
    float _796 = -_774;
    float _798 = fma(_794, _782, _796);
    float _800 = floor(_758);
    float _802 = fma(_626, _772, _674);
    float _804 = -_792;
    float _806 = fma(_332, _804, _552);
    float _808 = fma(_764, _786, _798);
    float _810 = fma(_788, _582, _638);
    out.m_79.x = _700;
    out.m_79.y = _678;
    out.m_79.z = _740;
    out.m_79.w = _802;
    float _812 = _222 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _814 = floor(_760);
    float _816 = -_778;
    float _818 = _756 + _816;
    float _820 = _250 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_81.x = _806;
    out.m_81.y = _808;
    float _822 = _648 * _812;
    float _824 = fma(_818, 2.0, -1.0);
    float _826 = rsqrt(_776);
    float _828 = -_800;
    float _830 = _758 + _828;
    float _832 = _446 * _648;
    float _834 = fma(_830, 2.0, -1.0);
    float _836 = _446 * _666;
    float _838 = _652 * _812;
    float _840 = -_814;
    float _842 = _760 + _840;
    float _844 = fma(_842, 2.0, -1.0);
    float _846 = _446 * _652;
    float _848 = _730 * _826;
    float _850 = _710 * _826;
    float _852 = _752 * _826;
    float _854 = fma(_436, _848, _832);
    float _856 = fma(_436, _850, _846);
    float _858 = fma(_436, _852, _836);
    float _860 = _666 * _812;
    float _862 = _652 * _852;
    float _864 = _666 * _848;
    float _866 = _648 * _850;
    float _868 = fma(_852, _820, _860);
    float _870 = _834 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _872 = -_862;
    float _874 = fma(_666, _850, _872);
    float _876 = _824 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _878 = fma(_848, _820, _822);
    float _880 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _882 = fma(_850, _820, _838);
    float _884 = -_864;
    float _886 = fma(_648, _852, _884);
    float _888 = -_866;
    float _890 = fma(_652, _848, _888);
    float _892 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _894 = _870 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _896 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].x, _880);
    float _898 = _874 + _878;
    float _900 = _886 + _882;
    float _902 = _890 + _868;
    float _904 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _906 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].y, _892);
    float _908 = fma(_876, (*spvDescriptorSet0.vp_c12)._m0[2].z, _894);
    bool _910 = !_236;
    int _912 = _910 ? 0 : 1;
    float _914 = fma(_904, _874, _854);
    float _916 = fma(_904, _886, _856);
    out.m_83.x = _898;
    out.m_83.y = _900;
    out.m_83.z = _902;
    float _918 = fma(_904, _890, _858);
    int _920 = abs(_912);
    float _922 = _844 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _924 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _926 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _928 = _924 || _926;
    bool _930 = isnan(1.0);
    bool _932 = _928 || _930;
    float _934 = float(_920);
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].x, _896);
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].y, _906);
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c12)._m0[4].z, _908);
    float _942 = _936 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _944 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _946 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _948 = abs(_578);
    float _950 = fma(_934, _948, _810);
    float _952 = _914 + _942;
    float _954 = _916 + _944;
    float _956 = _918 + _946;
    float _958 = _838;
    float _960 = _822;
    float _962 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _964 = _914;
    float _966 = _914;
    float _968 = _822;
    float _970 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _972 = _824;
    float _974 = _834;
    float _976 = _934;
    float _978 = _844;
    float _980 = _878;
    float _982 = _826;
    float _984 = _908;
    float _994;
    float _996;
    float _998;
    float _1000;
    if (!_932)
    {
        bool _986 = _944 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _988 = !_986;
        _990 = _988;
        if (!_990)
        {
            float _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _994 = _992;
            _996 = 0.0;
            _998 = 0.0;
            _1000 = 0.0;
            _1002 = true;
        }
    }
    if ((!_1002) || _990)
    {
        bool _1038;
        if (!_990)
        {
            bool _1004 = _944 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1006 = isnan(_944);
            bool _1008 = _1004 || _1006;
            bool _1010 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1012 = _1008 || _1010;
            bool _1014 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1016 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1018 = !_1012;
            bool _1020 = _1016 && _1018;
            if (_1020)
            {
                _958 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1022 = _958;
            float _1024 = _1022;
            if (_1020)
            {
                _960 = 0.0;
            }
            float _1026 = _960;
            _968 = _1026;
            _996 = _1026;
            if (_1020)
            {
                _962 = 0.0;
            }
            float _1028 = _962;
            _970 = _1028;
            _998 = _1028;
            if (_1020)
            {
                float _1030 = _1022 * 5.0;
                _1024 = _1030;
            }
            float _1032 = _1024;
            _994 = _1032;
            if (_1020)
            {
                _964 = 0.0;
            }
            float _1034 = _964;
            bool _1036 = !_1012;
            _1038 = _1036 && _1014;
            _966 = _1034;
            _1000 = _1034;
        }
        if ((!_1038) || _990)
        {
            _990 = false;
            float _1040 = _966;
            float _1042 = _968;
            float _1044 = _970;
            bool _1046 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1048 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1050 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1052 = _1040;
            float _1054 = _1044;
            _994 = _956;
            if (_1046)
            {
                float _1056 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1052 = _1056;
            }
            float _1058 = _1052;
            if (_1046)
            {
                float _1060 = abs(_824);
                float _1062 = -_1060;
                float _1064 = _1062 + 1.0;
                _972 = _1064;
            }
            float _1066 = _972;
            if (_1048)
            {
                float _1068 = abs(_834);
                float _1070 = -_1068;
                float _1072 = _1070 + 1.0;
                _974 = _1072;
            }
            float _1074 = _974;
            if (!_1046)
            {
                _976 = 1.0;
            }
            float _1076 = _976;
            float _1078 = _1076;
            if (_1050)
            {
                float _1080 = abs(_844);
                float _1082 = -_1080;
                float _1084 = _1082 + 1.0;
                _978 = _1084;
            }
            float _1086 = _978;
            if (!_1048)
            {
                _1054 = 1.0;
            }
            float _1088 = _1054;
            float _1090 = _1042;
            float _1092 = _1088;
            if (_1048)
            {
                float _1094 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1090 = _1094;
            }
            float _1096 = _1090;
            float _1098 = _878;
            if (_1050)
            {
                float _1100 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1098 = _1100;
            }
            float _1102 = _1098;
            float _1104 = _1058;
            if (_1046)
            {
                float _1106 = _1066 * _1058;
                float _1108 = precise::clamp(_1106, 0.0, 1.0);
                _1078 = _1108;
            }
            float _1110 = _1078;
            if (!_1050)
            {
                _1104 = 1.0;
            }
            float _1112 = _1104;
            float _1114 = _1112;
            if (_1048)
            {
                float _1116 = _1074 * _1096;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1092 = _1118;
            }
            float _1120 = _1092;
            float _1122 = _1110 * _1120;
            _980 = _1102;
            _996 = _952;
            _998 = _954;
            if (_1050)
            {
                float _1124 = _1086 * _1102;
                float _1126 = precise::clamp(_1124, 0.0, 1.0);
                _1114 = _1126;
            }
            float _1128 = _1114;
            float _1130 = _1122 * _1128;
            _1000 = _1130;
        }
    }
    _1002 = false;
    float _1132 = _980;
    float _1134 = _994;
    float _1136 = _996;
    float _1138 = _998;
    float _1140 = _1000;
    float _1142 = _944 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1148 = fma(_942, 6.2500002968590706586837768554688e-05, 0.5);
    float _1150 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1144);
    float _1152 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1146);
    float _1154 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1150);
    float _1156 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1152);
    float _1158 = _1154 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1162 = trunc(_1158);
    int _1164 = int(_1162);
    float _1166 = trunc(_1160);
    int _1168 = int(_1166);
    int _1170 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1172 = _1164 + _1170;
    int _1174 = _1172 + 1;
    bool _1176 = _1174 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1178 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1180 = _1168 + _1178;
    int _1182 = _1180 + 1;
    int _1184 = _1174 | _1182;
    bool _1186 = _1184 < 0;
    bool _1188 = _1186 || _1176;
    bool _1190 = _1182 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1192 = _1190 || _1188;
    int _1194 = _1174;
    int _1196 = _1182;
    int _1198 = _1184;
    float _1200 = _1132;
    float _1202 = _1138;
    float _1204 = _1136;
    float _1206 = _1134;
    if (!_1192)
    {
        int _1208 = _1182 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1210 = _1208 + _1174;
        _1194 = _1210;
    }
    int _1212 = _1194;
    if (!_1192)
    {
        int _1214 = _1212 << 2;
        _1196 = _1214;
    }
    int _1216 = _1196;
    int _1218 = _1216;
    if (!_1192)
    {
        uint _1221 = uint(int(uint(_1212) >> uint(2)));
        _1198 = int(_1221);
    }
    int _1223 = _1198;
    if (!_1192)
    {
        int _1225 = 12 & _1216;
        _1218 = _1225;
    }
    int _1227 = _1218;
    if (!_1192)
    {
        int _1229 = _1223 << 4;
        int _1231 = _1229 + _1227;
        _1200 = as_type<float>(_1231);
    }
    float _1233 = _1200;
    float _1235 = as_type<float>(_1227);
    if (!_1192)
    {
        float _1237 = floor(_1160);
        _1235 = _1237;
    }
    float _1239 = _1235;
    float _1241 = _1233;
    if (!_1192)
    {
        int _1243 = as_type<int>(_1233) + 400;
        uint _1245 = uint(int(uint(_1243) >> uint(2)));
        uint _1247 = uint(int(uint(int(_1245)) >> uint(2)));
        int _1249 = int(_1245) & 3;
        float _1251 = (*spvDescriptorSet0.vp_c15)._m0[int(_1247)][_1249];
        _1241 = _1251;
    }
    float _1253 = _1241;
    float _1255 = as_type<float>(_1223);
    if (!_1192)
    {
        float _1257 = floor(_1158);
        _1255 = _1257;
    }
    float _1259 = _1255;
    if (!_1192)
    {
        float _1261 = -_1239;
        float _1263 = _1160 + _1261;
        _982 = _1263;
    }
    float _1265 = _982;
    float _1267 = fma(_946, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4131 = float2(_1148, _1267);
    float _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4131, float2(0.0), isnan(_4131)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4131, float2(0.0), isnan(_4131)), level(0.0)).x;
    float _1271 = _1267;
    if (!_1192)
    {
        float _1273 = -_1259;
        float _1275 = _1158 + _1273;
        _984 = _1275;
    }
    float _1277 = _984;
    float _1279 = _792;
    float _1281 = _1277;
    if (!_1192)
    {
        float _1283 = rint(_1253);
        float _1285 = precise::max(_1283, 0.0);
        uint _1287 = uint(_1285);
        uint _1289 = clamp(_1287, 0u, 65535u);
        _1279 = as_type<float>(_1289);
    }
    float _1291 = _1279;
    float _1293 = _1259;
    if (!_1192)
    {
        float3 _4179 = float3(_1277, _1265, float(as_type<int>(_1291)));
        float3 _4183 = select(_4179, float3(0.0), isnan(_4179));
        float _1295 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4183.xy, uint(rint(_4183.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4183.xy, uint(rint(_4183.z)), level(0.0)).x;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1301 = _1134 + _1299;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1305 = _1136 + _1303;
    float _1307 = _1301 * _1301;
    bool _1309 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.5);
    bool _1317 = _1313 || _1315;
    float _1319 = fma(_1305, _1305, _1307);
    float _1321 = sqrt(_1319);
    bool _1323 = _1321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1325 = !_1323;
    float _1327 = _1269;
    if (!_1325)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1333 = _1321 + _1331;
        float _1335 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = rsqrt(_1319);
        float _1339 = _1333 * _1329;
        float _1341 = _1339 * 0.15915493667125701904296875;
        float _1343 = _1341 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = _1341 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = fma(_1345, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1353 = _1337 * _1351;
        float _1355 = _1349 + (-1.0);
        float _1357 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = fma(_1305, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1361 = fma(_1301, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1363 = fma(_1349, _1138, _1357);
        _1202 = _1363;
        _1204 = _1359;
        _1206 = _1361;
        _1271 = _1335;
    }
    float _1365 = _1202;
    float _1367 = _1204;
    float _1369 = _1206;
    float _1371 = _1271;
    float _1373 = _1371;
    float _1375 = _1367;
    float _1377 = _1369;
    if (_1317)
    {
        _1373 = _1365;
    }
    float _1379 = _1373;
    float _1381 = _1379;
    if (!_1317)
    {
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1385 = _944 + _1383;
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1389 = _942 + _1387;
        float _1391 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1393 = -_944;
        float _1395 = _1393 + _1365;
        float _1397 = _1385 * _1385;
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1401 = _946 + _1399;
        float _1403 = -_942;
        float _1405 = _1403 + _1367;
        float _1407 = -_946;
        float _1409 = _1407 + _1369;
        float _1411 = fma(_1389, _1389, _1397);
        float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1415 = fma(_1401, _1401, _1411);
        float _1417 = sqrt(_1415);
        float _1419 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1421 = precise::min(_1417, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1423 = _1421 * _1413;
        float _1425 = _1419 * _1423;
        float _1427 = fma(_1395, _1425, _944);
        float _1429 = fma(_1405, _1425, _942);
        float _1431 = fma(_1409, _1425, _946);
        _1381 = _1427;
        _1375 = _1429;
        _1377 = _1431;
    }
    float _1433 = _1381;
    float _1435 = _1375;
    float _1437 = _1377;
    float _1439 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1445 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1439);
    float _1449 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1451 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    float _1453 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1455 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1447);
    float _1457 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1449);
    float _1459 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1451);
    float _1461 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1453);
    float _1463 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1467 = _1459 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1469 = abs(_1269);
    bool _1471 = _1469 != 0.0;
    bool _1473 = isnan(_1469);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1483 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1489 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1481);
    float _1491 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1493 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1485);
    float _1495 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1487);
    float _1497 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1499 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1489);
    float _1501 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1503 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1505 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1495);
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1501);
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1503);
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1505);
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1507;
    out.gl_Position.z = _1511;
    out.gl_Position.w = _1513;
    if (_1479)
    {
        _1327 = _1513;
    }
    float _1515 = _1327;
    float _1517 = _1515;
    if (!_1479)
    {
        _1517 = 0.0;
    }
    float _1519 = _1517;
    float _1521 = _1519;
    if (!_1479)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1192)
    {
        int _1523 = _1212 << 4;
        int _1525 = _1523 + 2048;
        uint _1527 = uint(int(uint(_1525) >> uint(2)));
        uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
        int _1531 = int(_1527) & 3;
        float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
        int _1535 = int(_1527) + 1;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        int _1539 = _1535 & 3;
        float _1541 = (*spvDescriptorSet0.vp_c15)._m0[int(_1537)][_1539];
        int _1543 = _1525 + 8;
        uint _1545 = uint(int(uint(_1543) >> uint(2)));
        uint _1547 = uint(int(uint(int(_1545)) >> uint(2)));
        int _1549 = int(_1545) & 3;
        float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
        int _1553 = int(_1545) + 1;
        uint _1555 = uint(int(uint(_1553) >> uint(2)));
        int _1557 = _1553 & 3;
        float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
        float _1561 = _1142 * _1541;
        float _1563 = fma(_942, _1533, _1561);
        float _1565 = fma(_946, _1551, _1563);
        float _1567 = _1565 + _1559;
        float _1569 = precise::clamp(_1567, 0.0, 1.0);
        float _1571 = -_1569;
        float _1573 = _1571 + _1297;
        float _1575 = fma(_1573, 500.0, 1.5);
        float _1577 = exp2(_1575);
        float _1579 = 0.0 + _1577;
        float _1581 = precise::clamp(_1579, 0.0, 1.0);
        bool _1583 = _1581 >= 1.0;
        bool _1585 = isnan(_1581);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan(1.0);
        bool _1591 = _1587 || _1589;
        _1281 = _1559;
        if (!_1591)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1591)
        {
            _1521 = 0.0;
        }
    }
    float _1593 = _1281;
    float _1595 = _1521;
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1599 = _1433 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1603 = _1435 + _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1607 = _1437 + _1605;
    float _1609 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1611 = _1599 * _1599;
    float _1613 = fma(_1603, _1603, _1611);
    float _1615 = fma(_1607, _1607, _1613);
    float _1617 = rsqrt(_1615);
    float _1619 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1621 = _1603 * _1619;
    float _1623 = _1607 * _1619;
    float _1625 = _1621 * _1621;
    float _1627 = _1623 * _1623;
    float _1629 = _1625 + _1627;
    float _1631 = sqrt(_1629);
    bool _1633 = _1631 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1637 = _1631 + _1635;
    float _1639 = _1607;
    float _1641 = _1629;
    float _1643 = _1637;
    float _1645 = _1593;
    float _1647 = _1599;
    float _1649 = _1621;
    if (_1633)
    {
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1639 = _1651;
    }
    float _1653 = _1639;
    if (_1633)
    {
        float _1655 = rsqrt(_1629);
        _1641 = _1655;
    }
    float _1657 = _1641;
    if (_1633)
    {
        float _1659 = _1637 * _1653;
        _1643 = _1659;
    }
    float _1661 = _1643;
    if (_1633)
    {
        float _1663 = _1661 * 0.15915493667125701904296875;
        _1645 = _1663;
    }
    float _1665 = _1645;
    float _1667 = _1617;
    float _1669 = _1665;
    if (_1633)
    {
        float _1671 = _1665 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        _1667 = _1673;
    }
    float _1675 = _1667;
    float _1677 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1679 = precise::max(0.0, _1677);
    float _1681 = _1611;
    float _1683 = _1679;
    float _1685 = _1677;
    if (_1633)
    {
        float _1687 = _1665 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        _1681 = _1689;
    }
    float _1691 = _1681;
    float _1693 = -_1619;
    float _1695 = -_1679;
    float _1697 = fma(_1599, _1693, _1695);
    if (_1633)
    {
        float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1699;
    }
    float _1701 = _1683;
    float _1703 = _1675;
    float _1705 = _1701;
    if (_1633)
    {
        float _1707 = fma(_1675, _1701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1647 = _1707;
    }
    float _1709 = _1647;
    float _1711 = _1709;
    if (!_1633)
    {
        _1703 = _1697;
    }
    float _1713 = _1703;
    float _1715 = _1713;
    if (!_1633)
    {
        _1705 = _1623;
    }
    float _1717 = _1705;
    float _1719 = _1717;
    float _1721 = _1691;
    if (_1633)
    {
        float _1723 = _1691 + (-1.0);
        _1685 = _1723;
    }
    float _1725 = _1685;
    float _1727 = _1725;
    if (_1633)
    {
        float _1729 = _1657 * _1709;
        _1669 = _1729;
    }
    float _1731 = _1669;
    if (!_1633)
    {
        _1711 = _1627;
    }
    float _1733 = _1711;
    float _1735 = _1733;
    if (_1633)
    {
        float _1737 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1737;
    }
    float _1739 = _1727;
    if (_1633)
    {
        float _1741 = _1621 * _1731;
        _1649 = _1741;
    }
    float _1743 = _1649;
    if (_1633)
    {
        float _1745 = _1623 * _1731;
        _1719 = _1745;
    }
    float _1747 = _1719;
    if (_1633)
    {
        float _1749 = fma(_1697, _1691, _1739);
        _1715 = _1749;
    }
    float _1751 = _1715;
    if (!_1633)
    {
        _1721 = _1625;
    }
    float _1753 = _1721;
    float _1755 = _1753;
    if (_1633)
    {
        float _1757 = _1743 * _1743;
        _1755 = _1757;
    }
    float _1759 = _1755;
    float _1761 = sqrt(_1615);
    if (_1633)
    {
        float _1763 = _1747 * _1747;
        _1735 = _1763;
    }
    float _1765 = _1735;
    float _1767 = fma(_1751, _1751, _1759);
    float _1769 = _1767 + _1765;
    float _1771 = 1.0 / _1595;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1777 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1775);
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = rsqrt(_1769);
    float _1783 = -_1609;
    float _1785 = fma(_1783, _1773, 1.0);
    float _1787 = -_1779;
    float _1789 = _1787 + 1.0;
    float _1791 = log2(_1785);
    float _1793 = _1509 * _1771;
    float _1795 = fma(_1793, 0.5, 0.5);
    float _1797 = abs(_1789);
    float _1799 = log2(_1797);
    float _1801 = _1781 * _1743;
    float _1803 = _1781 * _1751;
    float _1805 = _1781 * _1747;
    float _1807 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1809 = _1803 + 1.0;
    float _1811 = _1791 * 0.693147182464599609375;
    float _1813 = -_1807;
    float _1815 = fma(_1803, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1813);
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1819 = -_1805;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1815);
    float _1823 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1825 = fma(_1821, -0.5, 0.5);
    float _1827 = fma(_1821, 0.5, 0.5);
    float _1829 = exp2(_1823);
    float _1831 = fma(_1827, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1833 = fma(_1827, _1831, -0.212114393711090087890625);
    float _1835 = _1507 * _1771;
    float _1837 = sqrt(_1825);
    float _1839 = fma(_1827, _1833, 1.570728778839111328125);
    float _1841 = fma(_1835, -0.5, 0.5);
    float _1843 = -_1803;
    float _1845 = fma(_1829, _1809, _1843);
    float3 _5086 = float3(_1795, _1841, _1817);
    float _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5086, float3(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5086, float3(0.0), isnan(_5086)), level(0.0)).x;
    float _1849 = fma(_1845, 0.5, 0.5);
    float _1851 = _1837 * 0.636619746685028076171875;
    float _1853 = -_1839;
    float _1855 = fma(_1851, _1853, 1.0);
    float3 _5105 = float3(_1795, _1841, _1817);
    float4 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5105, float3(0.0), isnan(_5105)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5105, float3(0.0), isnan(_5105)), level(0.0)).xyzw;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1858.w;
    float2 _5121 = float2(_1855, _1849);
    float3 _1870 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5121, float2(0.0), isnan(_5121)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5121, float2(0.0), isnan(_5121)), level(0.0)).xyz;
    float _1872 = _1870.x;
    float _1874 = _1870.y;
    float _1876 = _1870.z;
    float _1878 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1880 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1882 = _1511 + _1513;
    bool _1884 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1886 = isnan(_1761);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1892 = _1888 || _1890;
    float _1894 = _950 * _1880;
    float _1896 = exp2(_1878);
    float _1898 = _1882 * 0.5;
    out.m_85.z = _1898;
    out.m_85.w = _1513;
    float _1900 = -_1896;
    float _1902 = _1900 + 1.0;
    float _1904 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1906 = -_1904;
    float _1908 = _1906 + 1.0;
    float _1910 = _1904 * _1847;
    float _1912 = _1904;
    if (!_1892)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1914 = _1912;
    float _1916 = _1866 * _1910;
    float _1918 = _1876 * _1910;
    float _1920 = fma(_1872, _1916, _1860);
    float _1922 = fma(_1874, _1916, _1862);
    float _1924 = _1866 * _1908;
    float _1926 = fma(_1866, _1918, _1864);
    float _1928 = _1916;
    float _1930 = _1918;
    float _1932 = _1914;
    float _1934 = _1914;
    if (!_1892)
    {
        _1928 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1936 = _1928;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1892)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1942 = _1930;
    out.m_87.x = _1920;
    out.m_87.y = _1922;
    out.m_87.z = _1926;
    out.m_87.w = _1924;
    bool _1944 = !_1892;
    float _1946 = _1942;
    float _1948 = _1942;
    if (!_1944)
    {
        bool _1950 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1952 = isnan(_1761);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1958 = _1954 || _1956;
        if (!_1958)
        {
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1962 = _1761 + _1960;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1964;
            float _1968 = 1.0 / _1966;
            float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1972 = _1970 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1978 = _1962 * _1968;
            float _1980 = precise::clamp(_1978, 0.0, 1.0);
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1986 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1988 = fma(_1980, _1984, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1990 = fma(_1980, _1972, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1948 = _1990;
            _1940 = _1988;
            _1934 = _1986;
            _1992 = true;
        }
        else
        {
            bool _1994 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1996 = isnan(_1761);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2002 = _1998 || _2000;
            if (!_2002)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2004 = _1938;
            _1940 = _2004;
            if (!_2002)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2006 = _1946;
            _1948 = _2006;
            if (!_2002)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2008 = _1932;
            bool _2010 = !_2002;
            _1934 = _2008;
            if (!_2010)
            {
                bool _2012 = _1761 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2014 = isnan(_1761);
                bool _2016 = _2012 || _2014;
                bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2020 = _2016 || _2018;
                if (!_2020)
                {
                    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2024 = _1761 + _2022;
                    float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2028 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2026;
                    float _2030 = 1.0 / _2028;
                    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2034 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2040 = _2024 * _2030;
                    float _2042 = precise::clamp(_2040, 0.0, 1.0);
                    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2048 = fma(_2042, _2038, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2050 = fma(_2042, _2046, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2052 = fma(_2042, _2034, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1948 = _2052;
                    _1940 = _2050;
                    _1934 = _2048;
                    _1992 = true;
                }
                else
                {
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1992 = false;
    float _2054 = _1948;
    float _2056 = _1940;
    float _2058 = _1934;
    float _2060 = _2054 * 0.586610972881317138671875;
    bool _2062 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2064 = _1894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2066 = fma(_2056, 0.298911988735198974609375, _2060);
    out.m_89.x = 0.0;
    float _2068 = fma(_2058, 0.114477999508380889892578125, _2066);
    out.m_56.x = _2064;
    float _2070 = -_2068;
    float _2072 = _2070 + _2056;
    float _2074 = -_2068;
    float _2076 = _2074 + _2054;
    float _2078 = -_2068;
    float _2080 = _2078 + _2058;
    float _2082 = fma(_2072, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    float _2084 = fma(_2076, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    float _2086 = fma(_2080, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2068);
    out.m_91.x = _2082;
    out.m_91.y = _2084;
    out.m_91.z = _2086;
    if (!_2062)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2088 = -_1433;
    float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2092 = -_1435;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2096 = -_1437;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2100 = _2090 * _2090;
    float _2102 = fma(_2094, _2094, _2100);
    float _2104 = fma(_2098, _2098, _2102);
    float _2106 = sqrt(_2104);
    float _2108 = rsqrt(_2104);
    float _2110 = -_2106;
    float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = _2094 * _2108;
    float _2120 = _2090 * _2108;
    float _2122 = abs(_2116);
    float _2124 = log2(_2122);
    float _2126 = _2098 * _2108;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2130 = _900 * _2120;
    float _2132 = -_2120;
    float _2134 = -_2128;
    float _2136 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2134);
    float _2138 = fma(_898, _2118, _2130);
    float _2140 = -_2126;
    float _2142 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2136);
    float _2144 = fma(_902, _2126, _2138);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2150 = _2142 + _2148;
    float _2152 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2154 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2156 = precise::clamp(_2154, 0.0, 1.0);
    float _2158 = exp2(_2152);
    float _2160 = _2158 * _2156;
    float _2162 = _2146 * _2160;
    float _2164 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2166 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2168 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2164;
    out.m_89.y = _2166;
    out.m_89.z = _2168;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

