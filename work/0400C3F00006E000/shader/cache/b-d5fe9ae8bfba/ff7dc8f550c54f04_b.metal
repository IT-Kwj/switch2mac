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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _170 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1904 = as_type<float>(_110);
        out.gl_Position.z = _1904;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_146);
        out.gl_Position.z = _1972;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _150 = !_148;
    float _168;
    if (!_150)
    {
        float _152 = in.m_51.x;
        float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _156 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _158 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _160 = _158 * _154;
        float _162 = floor(_160);
        float _164 = -_162;
        float _166 = _160 + _164;
        _168 = _166;
        _170 = true;
    }
    else
    {
        float _172 = float(_94);
        float _174 = 1.0 / _172;
        float _176 = _128 * _174;
        _168 = _176;
    }
    _170 = false;
    float _178 = _168;
    float _180 = in.m_51.w;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _184 = _178 + _182;
    float _186 = in.m_51.x;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _190 = _188 != 0;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _196 = _194 != 0;
    float _198 = in.m_51.y;
    int _200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _202 = _200 != 0;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_53.x;
    float _214 = 1.0 / _206;
    float _216 = in.m_44.x;
    float _218 = in.m_44.y;
    float _220 = in.m_44.z;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _226 = 0.0;
    if (_196)
    {
        float _228 = in.m_51.z;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _236 = _180 > 0.5;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _242 = in.m_53.y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _246 = _244 != 0;
    float _248 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _250 = 1.0 / _224;
    float _252 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _254 = -_234;
    float _256 = fma(_248, 2.0, _254);
    float _258 = fma(_252, -2.0, _232);
    float _260 = 1.0 / _240;
    float _262 = _218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _266 = _218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _268 = false;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    bool _272 = _236;
    if (_196)
    {
        bool _274 = _230 > 0.5;
        _268 = _274;
    }
    bool _276 = _268;
    float _278 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _280 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _264);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _288;
    float _292 = -_242;
    float _294 = _292 + 1.0;
    float _296 = _286 * _214;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _300 = _178 + _298;
    float _302 = _214;
    float _304 = _242;
    if (!_246)
    {
        float _306 = in.m_51.z;
        _302 = _306;
    }
    float _308 = _302;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _310;
    float _314 = _290 * _260;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _318 = _236 ? as_type<int>(_294) : as_type<int>(_242);
    float _320 = fma(_296, _300, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _322 = _312 * _250;
    bool _324 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _326 = isnan(_178);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _338 = _178 + _336;
    float _340 = _334;
    float _342 = _338;
    if (!_246)
    {
        _270 = _198;
    }
    float _344 = _270;
    float _346 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _278);
    float _348 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _350 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _352 = _344;
    if (_190)
    {
        bool _354 = _186 > 0.5;
        _272 = _354;
    }
    bool _356 = _272;
    float _358 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].z, _316);
    if (_246)
    {
        _352 = _186;
    }
    float _360 = _352;
    float _362 = fma(_314, _184, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _364 = _202 ? as_type<float>(_318) : _242;
    float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _368 = _198 > 0.5;
    float _370 = fma(_322, _338, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _372 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _374 = isnan(_178);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_334;
    float _386 = _384 + 1.0;
    float _388 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _390 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _392 = isnan(_178);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _258);
    if (_210)
    {
        float _404 = _368 ? _294 : _242;
        _304 = _404;
    }
    float _406 = _304;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _410 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _412 = isnan(_178);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _382 * _386;
    float _424 = -_382;
    float _426 = _424 + 1.0;
    float _428 = -_400;
    float _430 = _428 + 1.0;
    float _432 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _408);
    float _434 = _420 * _426;
    float _436 = _334 * _430;
    float _438 = _308;
    int _440 = as_type<int>(_406);
    if (!_246)
    {
        _340 = _308;
    }
    float _442 = _340;
    float _444 = _366 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _446 = _442;
    if (_246)
    {
        _446 = _198;
    }
    float _448 = _446;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_246)
    {
        _438 = _198;
    }
    float _452 = _438;
    float _454 = _370 * _434;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _458 = fma(_364, _444, -0.5);
    float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _462 = _192 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = _360 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _466 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].z, _450);
    float _468 = fma(_462, _406, -0.5);
    float _470 = -_456;
    float _472 = fma(_464, 2.0, _470);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    float _478 = _462;
    if (_190)
    {
        float _480 = -_212;
        float _482 = _480 + 1.0;
        _440 = as_type<int>(_482);
    }
    int _484 = _440;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_190)
    {
        _342 = _212;
    }
    float _488 = _342;
    float _490 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[83].w, _474);
    float _492 = -_420;
    float _494 = _492 + 1.0;
    float _496 = _488;
    if (_190)
    {
        float _498 = _356 ? as_type<float>(_484) : _212;
        _496 = _498;
    }
    float _500 = _496;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _504 = _448 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _506 = _460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[115].x, _454);
    if (_196)
    {
        float _510 = -_212;
        float _512 = _510 + 1.0;
        _476 = as_type<int>(_512);
    }
    int _514 = _476;
    float _516 = fma(_504, -2.0, _502);
    float _518 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _432);
    float _520 = fma(_506, _500, -0.5);
    float _522 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _358);
    float _524 = -_128;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _256);
    float _528 = fma(_320, _422, _508);
    float _530 = _346 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _388 + _532;
    if (!_196)
    {
        _478 = _212;
    }
    float _536 = _478;
    float _538 = -_402;
    float _540 = fma(_518, _468, _538);
    float _542 = _536;
    if (_196)
    {
        float _544 = _276 ? as_type<float>(_514) : _212;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = in.m_55.x;
    float _550 = in.m_55.y;
    float _552 = in.m_55.z;
    float _554 = _350 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _530 + _556;
    float _560 = _534 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _562 = fma(_362, _436, _528);
    float _564 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _566 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _466);
    float _568 = -_128;
    float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[81].x, _472);
    float _572 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _490);
    float _574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _576 = _554 + _574;
    float _578 = fma(_558, (*spvDescriptorSet0.vp_c8)._m0[28].x, _560);
    float _580 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _516);
    float _582 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[118].x, _562);
    float _584 = _534 * _534;
    float _586 = fma(_564, _546, -0.5);
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[28].z, _578);
    float _590 = -_580;
    float _592 = fma(_572, _458, _590);
    float _594 = fma(_558, _558, _584);
    float _596 = fma(_522, _520, _526);
    float _598 = fma(_566, _586, _570);
    bool _600 = _588 >= 0.0;
    float _602 = fma(_576, _576, _594);
    float _604 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = rsqrt(_602);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _614 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _618 = _582 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _620 = _566;
    int _622 = as_type<int>(_582);
    if (_600)
    {
        _620 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _624 = _620;
    float _626 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _630 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _540 + 0.5;
    float _634 = _596 + 0.5;
    float _636 = _598 + 0.5;
    float _638 = _592 + 0.5;
    float _640 = _614 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_600)
    {
        float _642 = _624 * 5.0;
        _622 = as_type<int>(_642);
    }
    int _644 = _622;
    out.m_57.w = _616;
    float _646 = _640 * _608;
    out.m_59.x = _634;
    out.m_59.y = _632;
    out.m_59.z = _636;
    out.m_59.w = _638;
    float _648 = _558 * _646;
    float _650 = _534 * _646;
    out.m_61.x = _626;
    out.m_61.y = _628;
    out.m_61.z = _630;
    out.m_61.w = _618;
    float _652 = as_type<float>(_644);
    if (_600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2867 = as_type<float>(_644);
        out.gl_Position.z = _2867;
    }
    if (_600)
    {
        out.m_47.x = 0.0;
    }
    if (_600)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _654 = -_650;
    float _656 = _388 + _654;
    float _658 = _576 * _646;
    float _660 = -_648;
    float _662 = _530 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _656 + _664;
    float _668 = -_658;
    float _670 = _554 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _662 + _672;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _680 = _670 + _678;
    float _682 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _676);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[28].z, _682);
    bool _686 = _684 >= 0.0;
    float _688 = _658;
    float _690 = _674;
    if (_686)
    {
        _652 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _692 = _652;
    int _694 = as_type<int>(_692);
    if (_686)
    {
        out.m_47.x = 0.0;
    }
    if (_686)
    {
        float _696 = _692 * 5.0;
        _694 = as_type<int>(_696);
    }
    int _698 = _694;
    if (_686)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_698);
        out.gl_Position.z = _2956;
    }
    if (_686)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _700 = -_388;
    float _702 = _700 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _704 = -_530;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = -_554;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = -_650;
    float _714 = _534 + _712;
    float _716 = _702 * _702;
    float _718 = -_648;
    float _720 = _558 + _718;
    float _722 = -_658;
    float _724 = _576 + _722;
    float _726 = _714 * _714;
    float _728 = fma(_706, _706, _716);
    float _730 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _732 = fma(_720, _720, _726);
    float _734 = fma(_710, _710, _728);
    float _736 = _656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _738 = fma(_724, _724, _732);
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _748 = _744 || _746;
    float _750 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _736);
    float _752 = rsqrt(_734);
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _762 = _758 || _760;
    float _764 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].z, _750);
    float _766 = sqrt(_738);
    float _768 = _706 * _752;
    float _770 = _710 * _752;
    float _772 = _702 * _752;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _776 = _768 * _774;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = _770 * _778;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _784 = _772 * _782;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _788 = -_776;
    float _790 = fma(_770, _786, _788);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _794 = -_780;
    float _796 = fma(_772, _792, _794);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = -_784;
    float _802 = fma(_768, _798, _800);
    float _804 = in.m_63.x;
    float _806 = in.m_63.y;
    float _808 = in.m_63.z;
    float _810 = _790 * _790;
    float _812 = _608 * _766;
    float _814 = fma(_796, _796, _810);
    float _816 = _614 * _812;
    float _818 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _820 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _822 = fma(_802, _802, _814);
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _820 * _812;
    float _828 = rsqrt(_822);
    float _830 = _824 * _812;
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _836 = _796 * _828;
    float _838 = _790 * _828;
    float _840 = _832 * _816;
    float _842 = _802 * _828;
    float _844 = _772 * _836;
    float _846 = _770 * _838;
    float _848 = _834 * _826;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _852 = -_844;
    float _854 = fma(_768, _838, _852);
    float _856 = -_846;
    float _858 = fma(_772, _842, _856);
    float _860 = _768 * _842;
    float _862 = _850 * _830;
    float _864 = _848 * _854;
    float _866 = _848 * _858;
    float _868 = -_860;
    float _870 = fma(_770, _836, _868);
    float _872 = fma(_840, _842, _864);
    float _874 = fma(_840, _836, _866);
    float _876 = fma(_862, _770, _872);
    float _878 = fma(_862, _768, _874);
    float _880 = _554 + _876;
    float _882 = _530 + _878;
    float _884 = _656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _880 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _892 = _882 + _890;
    float _894 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _884);
    float _896 = _848 * _870;
    float _898 = _888 * _888;
    float _900 = _764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _902 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].z, _894);
    float _904 = fma(_840, _838, _896);
    float _906 = fma(_892, _892, _898);
    float _908 = _902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _910 = fma(_862, _772, _904);
    float _912 = sqrt(_906);
    float _914 = _900 + _908;
    float _916 = _388 + _910;
    float _918 = 1.0 / _908;
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _910;
    float _924 = _882;
    float _926 = _916;
    float _928 = _904;
    if (!_920)
    {
        _922 = _880;
    }
    float _930 = _922;
    bool _932 = !_920;
    float _934 = _930;
    if (!_932)
    {
        float _936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _940 = _912 + _938;
        float _942 = _916 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _944 = rsqrt(_906);
        float _946 = _940 * _936;
        float _948 = _946 * 0.15915493667125701904296875;
        float _950 = _948 * 6.283185482025146484375;
        float _952 = sin(_950);
        float _954 = _948 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = fma(_952, _942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _960 = _944 * _958;
        float _962 = _956 + (-1.0);
        float _964 = fma(_892, _960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _966 = fma(_888, _960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _968 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = fma(_916, _956, _968);
        _924 = _964;
        _934 = _966;
        _926 = _970;
        _928 = _968;
    }
    float _972 = _924;
    float _974 = _934;
    float _976 = _926;
    float _978 = _928;
    float _980 = -_648;
    float _982 = _980 + _972;
    float _984 = -_658;
    float _986 = _984 + _974;
    float _988 = -_650;
    float _990 = _988 + _976;
    float _992 = _914 * _918;
    float _994 = _992 * 0.5;
    float _996 = _978;
    float _998 = _990;
    float _1000 = _986;
    float _1002 = _974;
    if (_762)
    {
        _996 = 1.0;
    }
    float _1004 = _996;
    float _1006 = _1004;
    if (_748)
    {
        _688 = _982;
    }
    float _1008 = _688;
    float _1010 = _1008;
    if (!_748)
    {
        float _1012 = _666 * _666;
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1016 = -_554;
        float _1018 = _1016 + _974;
        float _1020 = -_530;
        float _1022 = _1020 + _972;
        float _1024 = fma(_674, _674, _1012);
        float _1026 = -_388;
        float _1028 = _1026 + _976;
        float _1030 = fma(_680, _680, _1024);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1034 = sqrt(_1030);
        float _1036 = 1.0 / _812;
        float _1038 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1034, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1014;
        float _1044 = _1042 * _1036;
        float _1046 = _1038 * _1044;
        float _1048 = _1018 * _1044;
        float _1050 = fma(_1022, _1046, _662);
        float _1052 = fma(_1028, _1046, _656);
        float _1054 = fma(_1038, _1048, _670);
        _998 = _1052;
        _1010 = _1050;
        _1000 = _1054;
        _690 = _1034;
    }
    float _1056 = _998;
    float _1058 = _1010;
    float _1060 = _1000;
    float _1062 = _690;
    float _1064 = _1062;
    if (!_762)
    {
        float _1066 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1074 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1072);
        float _1076 = _1068 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = _1070 * 0.15915493667125701904296875;
        float _1082 = _1068 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = 1.0 / _1078;
        float _1088 = _1080 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1084 * _1086;
        float _1094 = _1080 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * _1092;
        float _1100 = 1.0 / _1074;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1104 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1102;
        float _1106 = 1.0 / _1098;
        float _1108 = 1.0 / _1104;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1112 = _1100 * _1110;
        float _1114 = _1096 * _1106;
        float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1118 = fma(_1114, _1112, _1116);
        float _1120 = _1118 * _1108;
        float _1122 = precise::clamp(_1120, 0.0, 1.0);
        _1002 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1006 = _1122;
    }
    float _1124 = _1002;
    float _1126 = _1006;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1130 = _1056 + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1134 = _1058 + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1138 = _1060 + _1136;
    float _1140 = _1130 * _1130;
    float _1142 = fma(_1134, _1134, _1140);
    float _1144 = fma(_1138, _1138, _1142);
    float _1146 = rsqrt(_1144);
    float _1148 = sqrt(_1144);
    float _1150 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1152 = _1134 * _1150;
    float _1154 = _1138 * _1150;
    float _1156 = _1152 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 + _1158;
    float _1162 = sqrt(_1160);
    bool _1164 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1162 + _1166;
    float _1170 = _1138;
    float _1172 = _1160;
    float _1174 = _1168;
    float _1176 = _1124;
    float _1178 = _1130;
    if (_1164)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1170 = _1180;
    }
    float _1182 = _1170;
    if (_1164)
    {
        float _1184 = rsqrt(_1160);
        _1172 = _1184;
    }
    float _1186 = _1172;
    float _1188 = _1186;
    if (_1164)
    {
        float _1190 = _1168 * _1182;
        _1174 = _1190;
    }
    float _1192 = _1174;
    if (_1164)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1176 = _1194;
    }
    float _1196 = _1176;
    float _1198 = _1182;
    float _1200 = _1196;
    if (_1164)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1198 = _1204;
    }
    float _1206 = _1198;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1140;
    float _1214 = _1210;
    if (_1164)
    {
        float _1216 = _1196 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1212 = _1218;
    }
    float _1220 = _1212;
    float _1222 = -_1150;
    float _1224 = -_1210;
    float _1226 = fma(_1130, _1222, _1224);
    if (_1164)
    {
        float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1228;
    }
    float _1230 = _1214;
    float _1232 = _1206;
    float _1234 = _1230;
    if (_1164)
    {
        float _1236 = fma(_1206, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1178 = _1236;
    }
    float _1238 = _1178;
    float _1240 = _1238;
    if (!_1164)
    {
        _1232 = _1152;
    }
    float _1242 = _1232;
    float _1244 = _1242;
    float _1246 = _1220;
    if (_1164)
    {
        float _1248 = _1220 + (-1.0);
        _1234 = _1248;
    }
    float _1250 = _1234;
    float _1252 = _1250;
    if (_1164)
    {
        float _1254 = _1186 * _1238;
        _1064 = _1254;
    }
    float _1256 = _1064;
    if (!_1164)
    {
        _1240 = _1226;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (_1164)
    {
        float _1262 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1262;
    }
    float _1264 = _1200;
    if (_1164)
    {
        float _1266 = _1152 * _1256;
        _1244 = _1266;
    }
    float _1268 = _1244;
    if (!_1164)
    {
        _1252 = _1154;
    }
    float _1270 = _1252;
    float _1272 = _1270;
    if (_1164)
    {
        float _1274 = _1154 * _1256;
        _1272 = _1274;
    }
    float _1276 = _1272;
    if (!_1164)
    {
        _1188 = _1156;
    }
    float _1278 = _1188;
    float _1280 = _1278;
    if (_1164)
    {
        float _1282 = fma(_1226, _1220, _1264);
        _1260 = _1282;
    }
    float _1284 = _1260;
    if (_1164)
    {
        float _1286 = _1268 * _1268;
        _1280 = _1286;
    }
    float _1288 = _1280;
    if (!_1164)
    {
        _1246 = _1158;
    }
    float _1290 = _1246;
    float _1292 = _1290;
    if (_1164)
    {
        float _1294 = _1276 * _1276;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = fma(_1284, _1284, _1288);
    float _1302 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1304 = _1300 + _1296;
    float _1306 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1308 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1312 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1310);
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = rsqrt(_1304);
    float _1318 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1306);
    float _1320 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1322 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1324 = -_1314;
    float _1326 = _1324 + 1.0;
    float _1328 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1320);
    float _1332 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1322);
    float _1334 = abs(_1326);
    float _1336 = log2(_1334);
    float _1338 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1340 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1330);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1346 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1302);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = _1316 * _1268;
    float _1354 = _1316 * _1284;
    float _1356 = -_1344;
    float _1358 = fma(_1356, _1338, 1.0);
    float _1360 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    float _1366 = _1316 * _1276;
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = -_1362;
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1370);
    float _1374 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1378 = log2(_1358);
    float _1380 = -_1366;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1372);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1386 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1390 = fma(_1382, -0.5, 0.5);
    float _1392 = fma(_1382, 0.5, 0.5);
    float _1394 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1396 = 1.0 / _1384;
    float _1398 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1388);
    float _1400 = fma(_1392, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1394);
    float _1404 = _1354 + 1.0;
    float _1406 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1398);
    float _1408 = fma(_1392, _1400, -0.212114393711090087890625);
    float _1410 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1412 = exp2(_1376);
    float _1414 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1416 = _1378 * 0.693147182464599609375;
    float _1418 = fma(_1392, _1408, 1.570728778839111328125);
    float _1420 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1422 = sqrt(_1390);
    float _1424 = _1410 * _1396;
    float _1426 = _1414 * _1396;
    float _1428 = fma(_1424, 0.5, 0.5);
    float _1430 = fma(_1426, -0.5, 0.5);
    float _1432 = -_1354;
    float _1434 = fma(_1412, _1404, _1432);
    float3 _4120 = float3(_1428, _1430, _1420);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4120, float3(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4120, float3(0.0), isnan(_4120)), level(0.0)).x;
    float _1438 = fma(_1434, 0.5, 0.5);
    float _1440 = _1422 * 0.636619746685028076171875;
    float _1442 = -_1418;
    float _1444 = fma(_1440, _1442, 1.0);
    float3 _4141 = float3(_1428, _1430, _1420);
    float4 _1447 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4141, float3(0.0), isnan(_4141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4141, float3(0.0), isnan(_4141)), level(0.0)).xyzw;
    float _1449 = _1447.x;
    float _1451 = _1447.y;
    float _1453 = _1447.z;
    float _1455 = _1447.w;
    float2 _4158 = float2(_1444, _1438);
    float3 _1459 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4158, float2(0.0), isnan(_4158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4158, float2(0.0), isnan(_4158)), level(0.0)).xyz;
    float _1461 = _1459.x;
    float _1463 = _1459.y;
    float _1465 = _1459.z;
    float _1467 = in.m_65.x;
    float _1469 = in.m_65.y;
    float _1471 = in.m_65.z;
    bool _1473 = _806 != 0.0;
    bool _1475 = isnan(_806);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1485 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1487 = _804 == 0.0;
    bool _1489 = !_1481;
    bool _1491 = _1487 && _1489;
    float _1493 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1485);
    float _1495 = exp2(_1483);
    bool _1497 = _808 == 0.0;
    bool _1499 = _1497 && _1491;
    float _1501 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1503 = _1469;
    float _1505 = _1467;
    float _1507 = _1471;
    if (!_1499)
    {
        float _1509 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1469);
        _1503 = _1509;
    }
    float _1511 = _1503;
    if (!_1499)
    {
        float _1513 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1467);
        _1505 = _1513;
    }
    float _1515 = _1505;
    if (!_1499)
    {
        float _1517 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1471);
        _1507 = _1517;
    }
    float _1519 = _1507;
    float _1521 = -_1495;
    float _1523 = _1521 + 1.0;
    float _1525 = _858 * _1511;
    float _1527 = _870 * _1511;
    float _1529 = _854 * _1511;
    bool _1531 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1533 = isnan(_1148);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1539 = _1535 || _1537;
    float _1541 = fma(_836, _1515, _1525);
    float _1543 = fma(_838, _1515, _1527);
    float _1545 = fma(_842, _1515, _1529);
    float _1547 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1501);
    float _1549 = fma(_768, _1519, _1541);
    float _1551 = _1384 * 0.5;
    float _1553 = _1410 + _1384;
    float _1555 = _1547 + _1384;
    float _1557 = fma(_772, _1519, _1543);
    float _1559 = fma(_1414, -0.5, _1551);
    float _1561 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1563 = _1555 * 0.5;
    float _1565 = _1553 * 0.5;
    float _1567 = fma(_770, _1519, _1545);
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1547;
    out.gl_Position.w = _1384;
    float _1569 = _1543;
    float _1571 = _1525;
    if (!_1539)
    {
        _1569 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1573 = _1569;
    float _1575 = _1573;
    float _1577 = _1573;
    if (!_1539)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1579 = _1571;
    out.m_67.x = _1565;
    out.m_67.y = _1559;
    out.m_67.z = _1563;
    out.m_67.w = _1384;
    out.m_69.x = _1549;
    out.m_69.y = _1557;
    out.m_69.z = _1567;
    float _1581 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1583 = _1561 * _1436;
    float _1585 = -_1561;
    float _1587 = _1585 + 1.0;
    float _1589 = _1455 * _1583;
    float _1591 = _1455 * _1587;
    float _1593 = _1587;
    float _1595 = _1579;
    float _1597 = _1579;
    if (!_1539)
    {
        _1593 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1599 = _1593;
    float _1601 = _1465 * _1583;
    float _1603 = fma(_1461, _1589, _1449);
    float _1605 = fma(_1463, _1589, _1451);
    float _1607 = fma(_1455, _1601, _1453);
    out.m_71.x = _1603;
    out.m_71.y = _1605;
    out.m_71.z = _1607;
    out.m_71.w = _1591;
    bool _1609 = !_1539;
    float _1611 = _1599;
    float _1613 = _1599;
    if (!_1609)
    {
        bool _1615 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1617 = isnan(_1148);
        bool _1619 = _1615 || _1617;
        bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1623 = _1619 || _1621;
        if (!_1623)
        {
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = _1148 + _1625;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1631 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1629;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1641 = 1.0 / _1631;
            float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1647 = _1627 * _1641;
            float _1649 = precise::clamp(_1647, 0.0, 1.0);
            float _1651 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1653 = fma(_1649, _1639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1655 = fma(_1649, _1645, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1597 = _1653;
            _1577 = _1651;
            _1613 = _1655;
            _1657 = true;
        }
        else
        {
            bool _1659 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_1148);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1575;
            _1577 = _1669;
            if (!_1667)
            {
                _1595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1595;
            _1597 = _1671;
            if (!_1667)
            {
                _1611 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1611;
            bool _1675 = !_1667;
            _1613 = _1673;
            if (!_1675)
            {
                bool _1677 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1679 = isnan(_1148);
                bool _1681 = _1677 || _1679;
                bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1685 = _1681 || _1683;
                if (!_1685)
                {
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1689 = _1148 + _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1691;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1703 = 1.0 / _1693;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1709 = _1689 * _1703;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = fma(_1711, _1697, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1715 = fma(_1711, _1701, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1717 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1597 = _1715;
                    _1577 = _1713;
                    _1613 = _1717;
                    _1657 = true;
                }
                else
                {
                    _1597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1613 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1657 = false;
    float _1719 = _1597;
    float _1721 = _1577;
    float _1723 = _1613;
    float _1725 = _1581 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = 0.0;
    float _1727 = _1719 * 0.586610972881317138671875;
    bool _1729 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _1725;
    float _1731 = fma(_1721, 0.298911988735198974609375, _1727);
    bool _1733 = _1126 > 0.0;
    bool _1735 = isnan(_1126);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.0);
    bool _1741 = _1737 || _1739;
    float _1743 = fma(_1723, 0.114477999508380889892578125, _1731);
    float _1745 = -_1743;
    float _1747 = _1745 + _1721;
    float _1749 = -_1743;
    float _1751 = _1749 + _1719;
    float _1753 = -_1743;
    float _1755 = _1753 + _1723;
    float _1757 = fma(_1747, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    float _1759 = fma(_1751, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    float _1761 = fma(_1755, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    bool _1763 = !_1729;
    if (!_1763)
    {
        float _1765 = -_1056;
        float _1767 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1769 = -_1058;
        float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1773 = -_1060;
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1777 = _1767 * _1767;
        float _1779 = fma(_1771, _1771, _1777);
        float _1781 = fma(_1775, _1775, _1779);
        float _1783 = sqrt(_1781);
        float _1785 = rsqrt(_1781);
        float _1787 = -_1783;
        float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1791 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = _1771 * _1785;
        float _1797 = _1767 * _1785;
        float _1799 = abs(_1793);
        float _1801 = log2(_1799);
        float _1803 = _1775 * _1785;
        float _1805 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1807 = _1557 * _1797;
        float _1809 = -_1797;
        float _1811 = -_1805;
        float _1813 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1811);
        float _1815 = fma(_1549, _1795, _1807);
        float _1817 = -_1803;
        float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1813);
        float _1821 = fma(_1567, _1803, _1815);
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1827 = _1819 + _1825;
        float _1829 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = exp2(_1829);
        float _1837 = _1835 * _1833;
        float _1839 = _1823 * _1837;
        float _1841 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1843 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1845 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_73.x = _1841;
        out.m_73.y = _1843;
        out.m_73.z = _1845;
    }
    out.m_75.x = _1757;
    out.m_75.y = _1759;
    out.m_75.z = _1761;
    if (_1741)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1847;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _170 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1904 = as_type<float>(_110);
        out.gl_Position.z = _1904;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_146);
        out.gl_Position.z = _1972;
    }
    if (_140)
    {
        return out;
    }
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _150 = !_148;
    float _168;
    if (!_150)
    {
        float _152 = in.m_51.x;
        float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _156 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _158 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _160 = _158 * _154;
        float _162 = floor(_160);
        float _164 = -_162;
        float _166 = _160 + _164;
        _168 = _166;
        _170 = true;
    }
    else
    {
        float _172 = float(_94);
        float _174 = 1.0 / _172;
        float _176 = _128 * _174;
        _168 = _176;
    }
    _170 = false;
    float _178 = _168;
    float _180 = in.m_51.w;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _184 = _178 + _182;
    float _186 = in.m_51.x;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _190 = _188 != 0;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _196 = _194 != 0;
    float _198 = in.m_51.y;
    int _200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _202 = _200 != 0;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_53.x;
    float _214 = 1.0 / _206;
    float _216 = in.m_44.x;
    float _218 = in.m_44.y;
    float _220 = in.m_44.z;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _226 = 0.0;
    if (_196)
    {
        float _228 = in.m_51.z;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _236 = _180 > 0.5;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _242 = in.m_53.y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _246 = _244 != 0;
    float _248 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _250 = 1.0 / _224;
    float _252 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _254 = -_234;
    float _256 = fma(_248, 2.0, _254);
    float _258 = fma(_252, -2.0, _232);
    float _260 = 1.0 / _240;
    float _262 = _218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _266 = _218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _268 = false;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    bool _272 = _236;
    if (_196)
    {
        bool _274 = _230 > 0.5;
        _268 = _274;
    }
    bool _276 = _268;
    float _278 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _280 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _264);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _288;
    float _292 = -_242;
    float _294 = _292 + 1.0;
    float _296 = _286 * _214;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _300 = _178 + _298;
    float _302 = _214;
    float _304 = _242;
    if (!_246)
    {
        float _306 = in.m_51.z;
        _302 = _306;
    }
    float _308 = _302;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _310;
    float _314 = _290 * _260;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _318 = _236 ? as_type<int>(_294) : as_type<int>(_242);
    float _320 = fma(_296, _300, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _322 = _312 * _250;
    bool _324 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _326 = isnan(_178);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _338 = _178 + _336;
    float _340 = _334;
    float _342 = _338;
    if (!_246)
    {
        _270 = _198;
    }
    float _344 = _270;
    float _346 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _278);
    float _348 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _350 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _352 = _344;
    if (_190)
    {
        bool _354 = _186 > 0.5;
        _272 = _354;
    }
    bool _356 = _272;
    float _358 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].z, _316);
    if (_246)
    {
        _352 = _186;
    }
    float _360 = _352;
    float _362 = fma(_314, _184, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _364 = _202 ? as_type<float>(_318) : _242;
    float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _368 = _198 > 0.5;
    float _370 = fma(_322, _338, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _372 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _374 = isnan(_178);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_334;
    float _386 = _384 + 1.0;
    float _388 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _390 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _392 = isnan(_178);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _258);
    if (_210)
    {
        float _404 = _368 ? _294 : _242;
        _304 = _404;
    }
    float _406 = _304;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _410 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _412 = isnan(_178);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _382 * _386;
    float _424 = -_382;
    float _426 = _424 + 1.0;
    float _428 = -_400;
    float _430 = _428 + 1.0;
    float _432 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _408);
    float _434 = _420 * _426;
    float _436 = _334 * _430;
    float _438 = _308;
    int _440 = as_type<int>(_406);
    if (!_246)
    {
        _340 = _308;
    }
    float _442 = _340;
    float _444 = _366 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _446 = _442;
    if (_246)
    {
        _446 = _198;
    }
    float _448 = _446;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_246)
    {
        _438 = _198;
    }
    float _452 = _438;
    float _454 = _370 * _434;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _458 = fma(_364, _444, -0.5);
    float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _462 = _192 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = _360 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _466 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].z, _450);
    float _468 = fma(_462, _406, -0.5);
    float _470 = -_456;
    float _472 = fma(_464, 2.0, _470);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    float _478 = _462;
    if (_190)
    {
        float _480 = -_212;
        float _482 = _480 + 1.0;
        _440 = as_type<int>(_482);
    }
    int _484 = _440;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_190)
    {
        _342 = _212;
    }
    float _488 = _342;
    float _490 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[83].w, _474);
    float _492 = -_420;
    float _494 = _492 + 1.0;
    float _496 = _488;
    if (_190)
    {
        float _498 = _356 ? as_type<float>(_484) : _212;
        _496 = _498;
    }
    float _500 = _496;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _504 = _448 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _506 = _460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[115].x, _454);
    if (_196)
    {
        float _510 = -_212;
        float _512 = _510 + 1.0;
        _476 = as_type<int>(_512);
    }
    int _514 = _476;
    float _516 = fma(_504, -2.0, _502);
    float _518 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _432);
    float _520 = fma(_506, _500, -0.5);
    float _522 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _358);
    float _524 = -_128;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _256);
    float _528 = fma(_320, _422, _508);
    float _530 = _346 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _388 + _532;
    if (!_196)
    {
        _478 = _212;
    }
    float _536 = _478;
    float _538 = -_402;
    float _540 = fma(_518, _468, _538);
    float _542 = _536;
    if (_196)
    {
        float _544 = _276 ? as_type<float>(_514) : _212;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = in.m_55.x;
    float _550 = in.m_55.y;
    float _552 = in.m_55.z;
    float _554 = _350 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _530 + _556;
    float _560 = _534 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _562 = fma(_362, _436, _528);
    float _564 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _566 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _466);
    float _568 = -_128;
    float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[81].x, _472);
    float _572 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _490);
    float _574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _576 = _554 + _574;
    float _578 = fma(_558, (*spvDescriptorSet0.vp_c8)._m0[28].x, _560);
    float _580 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _516);
    float _582 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[118].x, _562);
    float _584 = _534 * _534;
    float _586 = fma(_564, _546, -0.5);
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[28].z, _578);
    float _590 = -_580;
    float _592 = fma(_572, _458, _590);
    float _594 = fma(_558, _558, _584);
    float _596 = fma(_522, _520, _526);
    float _598 = fma(_566, _586, _570);
    bool _600 = _588 >= 0.0;
    float _602 = fma(_576, _576, _594);
    float _604 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = rsqrt(_602);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _614 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _618 = _582 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _620 = _566;
    int _622 = as_type<int>(_582);
    if (_600)
    {
        _620 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _624 = _620;
    float _626 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _630 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _540 + 0.5;
    float _634 = _596 + 0.5;
    float _636 = _598 + 0.5;
    float _638 = _592 + 0.5;
    float _640 = _614 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_600)
    {
        float _642 = _624 * 5.0;
        _622 = as_type<int>(_642);
    }
    int _644 = _622;
    out.m_57.w = _616;
    float _646 = _640 * _608;
    out.m_59.x = _634;
    out.m_59.y = _632;
    out.m_59.z = _636;
    out.m_59.w = _638;
    float _648 = _558 * _646;
    float _650 = _534 * _646;
    out.m_61.x = _626;
    out.m_61.y = _628;
    out.m_61.z = _630;
    out.m_61.w = _618;
    float _652 = as_type<float>(_644);
    if (_600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2867 = as_type<float>(_644);
        out.gl_Position.z = _2867;
    }
    if (_600)
    {
        out.m_47.x = 0.0;
    }
    if (_600)
    {
        return out;
    }
    float _654 = -_650;
    float _656 = _388 + _654;
    float _658 = _576 * _646;
    float _660 = -_648;
    float _662 = _530 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _656 + _664;
    float _668 = -_658;
    float _670 = _554 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _662 + _672;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _680 = _670 + _678;
    float _682 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _676);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[28].z, _682);
    bool _686 = _684 >= 0.0;
    float _688 = _658;
    float _690 = _674;
    if (_686)
    {
        _652 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _692 = _652;
    int _694 = as_type<int>(_692);
    if (_686)
    {
        out.m_47.x = 0.0;
    }
    if (_686)
    {
        float _696 = _692 * 5.0;
        _694 = as_type<int>(_696);
    }
    int _698 = _694;
    if (_686)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_698);
        out.gl_Position.z = _2956;
    }
    if (_686)
    {
        return out;
    }
    float _700 = -_388;
    float _702 = _700 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _704 = -_530;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = -_554;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = -_650;
    float _714 = _534 + _712;
    float _716 = _702 * _702;
    float _718 = -_648;
    float _720 = _558 + _718;
    float _722 = -_658;
    float _724 = _576 + _722;
    float _726 = _714 * _714;
    float _728 = fma(_706, _706, _716);
    float _730 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _732 = fma(_720, _720, _726);
    float _734 = fma(_710, _710, _728);
    float _736 = _656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _738 = fma(_724, _724, _732);
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _748 = _744 || _746;
    float _750 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _736);
    float _752 = rsqrt(_734);
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _762 = _758 || _760;
    float _764 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].z, _750);
    float _766 = sqrt(_738);
    float _768 = _706 * _752;
    float _770 = _710 * _752;
    float _772 = _702 * _752;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _776 = _768 * _774;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = _770 * _778;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _784 = _772 * _782;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _788 = -_776;
    float _790 = fma(_770, _786, _788);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _794 = -_780;
    float _796 = fma(_772, _792, _794);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = -_784;
    float _802 = fma(_768, _798, _800);
    float _804 = in.m_63.x;
    float _806 = in.m_63.y;
    float _808 = in.m_63.z;
    float _810 = _790 * _790;
    float _812 = _608 * _766;
    float _814 = fma(_796, _796, _810);
    float _816 = _614 * _812;
    float _818 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _820 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _822 = fma(_802, _802, _814);
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _820 * _812;
    float _828 = rsqrt(_822);
    float _830 = _824 * _812;
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _836 = _796 * _828;
    float _838 = _790 * _828;
    float _840 = _832 * _816;
    float _842 = _802 * _828;
    float _844 = _772 * _836;
    float _846 = _770 * _838;
    float _848 = _834 * _826;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _852 = -_844;
    float _854 = fma(_768, _838, _852);
    float _856 = -_846;
    float _858 = fma(_772, _842, _856);
    float _860 = _768 * _842;
    float _862 = _850 * _830;
    float _864 = _848 * _854;
    float _866 = _848 * _858;
    float _868 = -_860;
    float _870 = fma(_770, _836, _868);
    float _872 = fma(_840, _842, _864);
    float _874 = fma(_840, _836, _866);
    float _876 = fma(_862, _770, _872);
    float _878 = fma(_862, _768, _874);
    float _880 = _554 + _876;
    float _882 = _530 + _878;
    float _884 = _656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _880 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _892 = _882 + _890;
    float _894 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _884);
    float _896 = _848 * _870;
    float _898 = _888 * _888;
    float _900 = _764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _902 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].z, _894);
    float _904 = fma(_840, _838, _896);
    float _906 = fma(_892, _892, _898);
    float _908 = _902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _910 = fma(_862, _772, _904);
    float _912 = sqrt(_906);
    float _914 = _900 + _908;
    float _916 = _388 + _910;
    float _918 = 1.0 / _908;
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _910;
    float _924 = _882;
    float _926 = _916;
    float _928 = _904;
    if (!_920)
    {
        _922 = _880;
    }
    float _930 = _922;
    bool _932 = !_920;
    float _934 = _930;
    if (!_932)
    {
        float _936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _940 = _912 + _938;
        float _942 = _916 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _944 = rsqrt(_906);
        float _946 = _940 * _936;
        float _948 = _946 * 0.15915493667125701904296875;
        float _950 = _948 * 6.283185482025146484375;
        float _952 = sin(_950);
        float _954 = _948 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = fma(_952, _942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _960 = _944 * _958;
        float _962 = _956 + (-1.0);
        float _964 = fma(_892, _960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _966 = fma(_888, _960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _968 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = fma(_916, _956, _968);
        _924 = _964;
        _934 = _966;
        _926 = _970;
        _928 = _968;
    }
    float _972 = _924;
    float _974 = _934;
    float _976 = _926;
    float _978 = _928;
    float _980 = -_648;
    float _982 = _980 + _972;
    float _984 = -_658;
    float _986 = _984 + _974;
    float _988 = -_650;
    float _990 = _988 + _976;
    float _992 = _914 * _918;
    float _994 = _992 * 0.5;
    float _996 = _978;
    float _998 = _990;
    float _1000 = _986;
    float _1002 = _974;
    if (_762)
    {
        _996 = 1.0;
    }
    float _1004 = _996;
    float _1006 = _1004;
    if (_748)
    {
        _688 = _982;
    }
    float _1008 = _688;
    float _1010 = _1008;
    if (!_748)
    {
        float _1012 = _666 * _666;
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1016 = -_554;
        float _1018 = _1016 + _974;
        float _1020 = -_530;
        float _1022 = _1020 + _972;
        float _1024 = fma(_674, _674, _1012);
        float _1026 = -_388;
        float _1028 = _1026 + _976;
        float _1030 = fma(_680, _680, _1024);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1034 = sqrt(_1030);
        float _1036 = 1.0 / _812;
        float _1038 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1034, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1014;
        float _1044 = _1042 * _1036;
        float _1046 = _1038 * _1044;
        float _1048 = _1018 * _1044;
        float _1050 = fma(_1022, _1046, _662);
        float _1052 = fma(_1028, _1046, _656);
        float _1054 = fma(_1038, _1048, _670);
        _998 = _1052;
        _1010 = _1050;
        _1000 = _1054;
        _690 = _1034;
    }
    float _1056 = _998;
    float _1058 = _1010;
    float _1060 = _1000;
    float _1062 = _690;
    float _1064 = _1062;
    if (!_762)
    {
        float _1066 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1074 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1072);
        float _1076 = _1068 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = _1070 * 0.15915493667125701904296875;
        float _1082 = _1068 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = 1.0 / _1078;
        float _1088 = _1080 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1084 * _1086;
        float _1094 = _1080 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * _1092;
        float _1100 = 1.0 / _1074;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1104 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1102;
        float _1106 = 1.0 / _1098;
        float _1108 = 1.0 / _1104;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1112 = _1100 * _1110;
        float _1114 = _1096 * _1106;
        float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1118 = fma(_1114, _1112, _1116);
        float _1120 = _1118 * _1108;
        float _1122 = precise::clamp(_1120, 0.0, 1.0);
        _1002 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1006 = _1122;
    }
    float _1124 = _1002;
    float _1126 = _1006;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1130 = _1056 + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1134 = _1058 + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1138 = _1060 + _1136;
    float _1140 = _1130 * _1130;
    float _1142 = fma(_1134, _1134, _1140);
    float _1144 = fma(_1138, _1138, _1142);
    float _1146 = rsqrt(_1144);
    float _1148 = sqrt(_1144);
    float _1150 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1152 = _1134 * _1150;
    float _1154 = _1138 * _1150;
    float _1156 = _1152 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 + _1158;
    float _1162 = sqrt(_1160);
    bool _1164 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1162 + _1166;
    float _1170 = _1138;
    float _1172 = _1160;
    float _1174 = _1168;
    float _1176 = _1124;
    float _1178 = _1130;
    if (_1164)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1170 = _1180;
    }
    float _1182 = _1170;
    if (_1164)
    {
        float _1184 = rsqrt(_1160);
        _1172 = _1184;
    }
    float _1186 = _1172;
    float _1188 = _1186;
    if (_1164)
    {
        float _1190 = _1168 * _1182;
        _1174 = _1190;
    }
    float _1192 = _1174;
    if (_1164)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1176 = _1194;
    }
    float _1196 = _1176;
    float _1198 = _1182;
    float _1200 = _1196;
    if (_1164)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1198 = _1204;
    }
    float _1206 = _1198;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1140;
    float _1214 = _1210;
    if (_1164)
    {
        float _1216 = _1196 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1212 = _1218;
    }
    float _1220 = _1212;
    float _1222 = -_1150;
    float _1224 = -_1210;
    float _1226 = fma(_1130, _1222, _1224);
    if (_1164)
    {
        float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1228;
    }
    float _1230 = _1214;
    float _1232 = _1206;
    float _1234 = _1230;
    if (_1164)
    {
        float _1236 = fma(_1206, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1178 = _1236;
    }
    float _1238 = _1178;
    float _1240 = _1238;
    if (!_1164)
    {
        _1232 = _1152;
    }
    float _1242 = _1232;
    float _1244 = _1242;
    float _1246 = _1220;
    if (_1164)
    {
        float _1248 = _1220 + (-1.0);
        _1234 = _1248;
    }
    float _1250 = _1234;
    float _1252 = _1250;
    if (_1164)
    {
        float _1254 = _1186 * _1238;
        _1064 = _1254;
    }
    float _1256 = _1064;
    if (!_1164)
    {
        _1240 = _1226;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (_1164)
    {
        float _1262 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1262;
    }
    float _1264 = _1200;
    if (_1164)
    {
        float _1266 = _1152 * _1256;
        _1244 = _1266;
    }
    float _1268 = _1244;
    if (!_1164)
    {
        _1252 = _1154;
    }
    float _1270 = _1252;
    float _1272 = _1270;
    if (_1164)
    {
        float _1274 = _1154 * _1256;
        _1272 = _1274;
    }
    float _1276 = _1272;
    if (!_1164)
    {
        _1188 = _1156;
    }
    float _1278 = _1188;
    float _1280 = _1278;
    if (_1164)
    {
        float _1282 = fma(_1226, _1220, _1264);
        _1260 = _1282;
    }
    float _1284 = _1260;
    if (_1164)
    {
        float _1286 = _1268 * _1268;
        _1280 = _1286;
    }
    float _1288 = _1280;
    if (!_1164)
    {
        _1246 = _1158;
    }
    float _1290 = _1246;
    float _1292 = _1290;
    if (_1164)
    {
        float _1294 = _1276 * _1276;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = fma(_1284, _1284, _1288);
    float _1302 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1304 = _1300 + _1296;
    float _1306 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1308 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1312 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1310);
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = rsqrt(_1304);
    float _1318 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1306);
    float _1320 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1322 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1324 = -_1314;
    float _1326 = _1324 + 1.0;
    float _1328 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1320);
    float _1332 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1322);
    float _1334 = abs(_1326);
    float _1336 = log2(_1334);
    float _1338 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1340 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1330);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1346 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1302);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = _1316 * _1268;
    float _1354 = _1316 * _1284;
    float _1356 = -_1344;
    float _1358 = fma(_1356, _1338, 1.0);
    float _1360 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    float _1366 = _1316 * _1276;
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = -_1362;
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1370);
    float _1374 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1378 = log2(_1358);
    float _1380 = -_1366;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1372);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1386 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1390 = fma(_1382, -0.5, 0.5);
    float _1392 = fma(_1382, 0.5, 0.5);
    float _1394 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1396 = 1.0 / _1384;
    float _1398 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1388);
    float _1400 = fma(_1392, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1394);
    float _1404 = _1354 + 1.0;
    float _1406 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1398);
    float _1408 = fma(_1392, _1400, -0.212114393711090087890625);
    float _1410 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1412 = exp2(_1376);
    float _1414 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1416 = _1378 * 0.693147182464599609375;
    float _1418 = fma(_1392, _1408, 1.570728778839111328125);
    float _1420 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1422 = sqrt(_1390);
    float _1424 = _1410 * _1396;
    float _1426 = _1414 * _1396;
    float _1428 = fma(_1424, 0.5, 0.5);
    float _1430 = fma(_1426, -0.5, 0.5);
    float _1432 = -_1354;
    float _1434 = fma(_1412, _1404, _1432);
    float3 _4120 = float3(_1428, _1430, _1420);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4120, float3(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4120, float3(0.0), isnan(_4120)), level(0.0)).x;
    float _1438 = fma(_1434, 0.5, 0.5);
    float _1440 = _1422 * 0.636619746685028076171875;
    float _1442 = -_1418;
    float _1444 = fma(_1440, _1442, 1.0);
    float3 _4141 = float3(_1428, _1430, _1420);
    float4 _1447 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4141, float3(0.0), isnan(_4141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4141, float3(0.0), isnan(_4141)), level(0.0)).xyzw;
    float _1449 = _1447.x;
    float _1451 = _1447.y;
    float _1453 = _1447.z;
    float _1455 = _1447.w;
    float2 _4158 = float2(_1444, _1438);
    float3 _1459 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4158, float2(0.0), isnan(_4158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4158, float2(0.0), isnan(_4158)), level(0.0)).xyz;
    float _1461 = _1459.x;
    float _1463 = _1459.y;
    float _1465 = _1459.z;
    float _1467 = in.m_65.x;
    float _1469 = in.m_65.y;
    float _1471 = in.m_65.z;
    bool _1473 = _806 != 0.0;
    bool _1475 = isnan(_806);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1485 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1487 = _804 == 0.0;
    bool _1489 = !_1481;
    bool _1491 = _1487 && _1489;
    float _1493 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1485);
    float _1495 = exp2(_1483);
    bool _1497 = _808 == 0.0;
    bool _1499 = _1497 && _1491;
    float _1501 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1503 = _1469;
    float _1505 = _1467;
    float _1507 = _1471;
    if (!_1499)
    {
        float _1509 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1469);
        _1503 = _1509;
    }
    float _1511 = _1503;
    if (!_1499)
    {
        float _1513 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1467);
        _1505 = _1513;
    }
    float _1515 = _1505;
    if (!_1499)
    {
        float _1517 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1471);
        _1507 = _1517;
    }
    float _1519 = _1507;
    float _1521 = -_1495;
    float _1523 = _1521 + 1.0;
    float _1525 = _858 * _1511;
    float _1527 = _870 * _1511;
    float _1529 = _854 * _1511;
    bool _1531 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1533 = isnan(_1148);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1539 = _1535 || _1537;
    float _1541 = fma(_836, _1515, _1525);
    float _1543 = fma(_838, _1515, _1527);
    float _1545 = fma(_842, _1515, _1529);
    float _1547 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1501);
    float _1549 = fma(_768, _1519, _1541);
    float _1551 = _1384 * 0.5;
    float _1553 = _1410 + _1384;
    float _1555 = _1547 + _1384;
    float _1557 = fma(_772, _1519, _1543);
    float _1559 = fma(_1414, -0.5, _1551);
    float _1561 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1563 = _1555 * 0.5;
    float _1565 = _1553 * 0.5;
    float _1567 = fma(_770, _1519, _1545);
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1547;
    out.gl_Position.w = _1384;
    float _1569 = _1543;
    float _1571 = _1525;
    if (!_1539)
    {
        _1569 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1573 = _1569;
    float _1575 = _1573;
    float _1577 = _1573;
    if (!_1539)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1579 = _1571;
    out.m_67.x = _1565;
    out.m_67.y = _1559;
    out.m_67.z = _1563;
    out.m_67.w = _1384;
    out.m_69.x = _1549;
    out.m_69.y = _1557;
    out.m_69.z = _1567;
    float _1581 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1583 = _1561 * _1436;
    float _1585 = -_1561;
    float _1587 = _1585 + 1.0;
    float _1589 = _1455 * _1583;
    float _1591 = _1455 * _1587;
    float _1593 = _1587;
    float _1595 = _1579;
    float _1597 = _1579;
    if (!_1539)
    {
        _1593 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1599 = _1593;
    float _1601 = _1465 * _1583;
    float _1603 = fma(_1461, _1589, _1449);
    float _1605 = fma(_1463, _1589, _1451);
    float _1607 = fma(_1455, _1601, _1453);
    out.m_71.x = _1603;
    out.m_71.y = _1605;
    out.m_71.z = _1607;
    out.m_71.w = _1591;
    bool _1609 = !_1539;
    float _1611 = _1599;
    float _1613 = _1599;
    if (!_1609)
    {
        bool _1615 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1617 = isnan(_1148);
        bool _1619 = _1615 || _1617;
        bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1623 = _1619 || _1621;
        if (!_1623)
        {
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = _1148 + _1625;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1631 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1629;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1641 = 1.0 / _1631;
            float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1647 = _1627 * _1641;
            float _1649 = precise::clamp(_1647, 0.0, 1.0);
            float _1651 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1653 = fma(_1649, _1639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1655 = fma(_1649, _1645, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1597 = _1653;
            _1577 = _1651;
            _1613 = _1655;
            _1657 = true;
        }
        else
        {
            bool _1659 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_1148);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1575;
            _1577 = _1669;
            if (!_1667)
            {
                _1595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1595;
            _1597 = _1671;
            if (!_1667)
            {
                _1611 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1611;
            bool _1675 = !_1667;
            _1613 = _1673;
            if (!_1675)
            {
                bool _1677 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1679 = isnan(_1148);
                bool _1681 = _1677 || _1679;
                bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1685 = _1681 || _1683;
                if (!_1685)
                {
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1689 = _1148 + _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1691;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1703 = 1.0 / _1693;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1709 = _1689 * _1703;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = fma(_1711, _1697, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1715 = fma(_1711, _1701, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1717 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1597 = _1715;
                    _1577 = _1713;
                    _1613 = _1717;
                    _1657 = true;
                }
                else
                {
                    _1597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1613 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1657 = false;
    float _1719 = _1597;
    float _1721 = _1577;
    float _1723 = _1613;
    float _1725 = _1581 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = 0.0;
    float _1727 = _1719 * 0.586610972881317138671875;
    bool _1729 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _1725;
    float _1731 = fma(_1721, 0.298911988735198974609375, _1727);
    bool _1733 = _1126 > 0.0;
    bool _1735 = isnan(_1126);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.0);
    bool _1741 = _1737 || _1739;
    float _1743 = fma(_1723, 0.114477999508380889892578125, _1731);
    float _1745 = -_1743;
    float _1747 = _1745 + _1721;
    float _1749 = -_1743;
    float _1751 = _1749 + _1719;
    float _1753 = -_1743;
    float _1755 = _1753 + _1723;
    float _1757 = fma(_1747, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    float _1759 = fma(_1751, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    float _1761 = fma(_1755, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    bool _1763 = !_1729;
    if (!_1763)
    {
        float _1765 = -_1056;
        float _1767 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1769 = -_1058;
        float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1773 = -_1060;
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1777 = _1767 * _1767;
        float _1779 = fma(_1771, _1771, _1777);
        float _1781 = fma(_1775, _1775, _1779);
        float _1783 = sqrt(_1781);
        float _1785 = rsqrt(_1781);
        float _1787 = -_1783;
        float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1791 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = _1771 * _1785;
        float _1797 = _1767 * _1785;
        float _1799 = abs(_1793);
        float _1801 = log2(_1799);
        float _1803 = _1775 * _1785;
        float _1805 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1807 = _1557 * _1797;
        float _1809 = -_1797;
        float _1811 = -_1805;
        float _1813 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1811);
        float _1815 = fma(_1549, _1795, _1807);
        float _1817 = -_1803;
        float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1813);
        float _1821 = fma(_1567, _1803, _1815);
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1827 = _1819 + _1825;
        float _1829 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = exp2(_1829);
        float _1837 = _1835 * _1833;
        float _1839 = _1823 * _1837;
        float _1841 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1843 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1845 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_73.x = _1841;
        out.m_73.y = _1843;
        out.m_73.z = _1845;
    }
    out.m_75.x = _1757;
    out.m_75.y = _1759;
    out.m_75.z = _1761;
    if (_1741)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1847;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _170 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1904 = as_type<float>(_110);
        out.gl_Position.z = _1904;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_146);
        out.gl_Position.z = _1972;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _150 = !_148;
    float _168;
    if (!_150)
    {
        float _152 = in.m_51.x;
        float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _156 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _158 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _160 = _158 * _154;
        float _162 = floor(_160);
        float _164 = -_162;
        float _166 = _160 + _164;
        _168 = _166;
        _170 = true;
    }
    else
    {
        float _172 = float(_94);
        float _174 = 1.0 / _172;
        float _176 = _128 * _174;
        _168 = _176;
    }
    _170 = false;
    float _178 = _168;
    float _180 = in.m_51.w;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _184 = _178 + _182;
    float _186 = in.m_51.x;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _190 = _188 != 0;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _196 = _194 != 0;
    float _198 = in.m_51.y;
    int _200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _202 = _200 != 0;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _210 = _208 != 0;
    float _212 = in.m_53.x;
    float _214 = 1.0 / _206;
    float _216 = in.m_44.x;
    float _218 = in.m_44.y;
    float _220 = in.m_44.z;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _226 = 0.0;
    if (_196)
    {
        float _228 = in.m_51.z;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _236 = _180 > 0.5;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _242 = in.m_53.y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _246 = _244 != 0;
    float _248 = _186 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _250 = 1.0 / _224;
    float _252 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _254 = -_234;
    float _256 = fma(_248, 2.0, _254);
    float _258 = fma(_252, -2.0, _232);
    float _260 = 1.0 / _240;
    float _262 = _218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _266 = _218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _268 = false;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    bool _272 = _236;
    if (_196)
    {
        bool _274 = _230 > 0.5;
        _268 = _274;
    }
    bool _276 = _268;
    float _278 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _280 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _264);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _288;
    float _292 = -_242;
    float _294 = _292 + 1.0;
    float _296 = _286 * _214;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _300 = _178 + _298;
    float _302 = _214;
    float _304 = _242;
    if (!_246)
    {
        float _306 = in.m_51.z;
        _302 = _306;
    }
    float _308 = _302;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _310;
    float _314 = _290 * _260;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _318 = _236 ? as_type<int>(_294) : as_type<int>(_242);
    float _320 = fma(_296, _300, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _322 = _312 * _250;
    bool _324 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _326 = isnan(_178);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _338 = _178 + _336;
    float _340 = _334;
    float _342 = _338;
    if (!_246)
    {
        _270 = _198;
    }
    float _344 = _270;
    float _346 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _278);
    float _348 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _350 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _352 = _344;
    if (_190)
    {
        bool _354 = _186 > 0.5;
        _272 = _354;
    }
    bool _356 = _272;
    float _358 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[78].z, _316);
    if (_246)
    {
        _352 = _186;
    }
    float _360 = _352;
    float _362 = fma(_314, _184, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _364 = _202 ? as_type<float>(_318) : _242;
    float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _368 = _198 > 0.5;
    float _370 = fma(_322, _338, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _372 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _374 = isnan(_178);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_334;
    float _386 = _384 + 1.0;
    float _388 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _390 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _392 = isnan(_178);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _258);
    if (_210)
    {
        float _404 = _368 ? _294 : _242;
        _304 = _404;
    }
    float _406 = _304;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _410 = _178 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _412 = isnan(_178);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _382 * _386;
    float _424 = -_382;
    float _426 = _424 + 1.0;
    float _428 = -_400;
    float _430 = _428 + 1.0;
    float _432 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _408);
    float _434 = _420 * _426;
    float _436 = _334 * _430;
    float _438 = _308;
    int _440 = as_type<int>(_406);
    if (!_246)
    {
        _340 = _308;
    }
    float _442 = _340;
    float _444 = _366 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _446 = _442;
    if (_246)
    {
        _446 = _198;
    }
    float _448 = _446;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_246)
    {
        _438 = _198;
    }
    float _452 = _438;
    float _454 = _370 * _434;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _458 = fma(_364, _444, -0.5);
    float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _462 = _192 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = _360 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _466 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].z, _450);
    float _468 = fma(_462, _406, -0.5);
    float _470 = -_456;
    float _472 = fma(_464, 2.0, _470);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    float _478 = _462;
    if (_190)
    {
        float _480 = -_212;
        float _482 = _480 + 1.0;
        _440 = as_type<int>(_482);
    }
    int _484 = _440;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_190)
    {
        _342 = _212;
    }
    float _488 = _342;
    float _490 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[83].w, _474);
    float _492 = -_420;
    float _494 = _492 + 1.0;
    float _496 = _488;
    if (_190)
    {
        float _498 = _356 ? as_type<float>(_484) : _212;
        _496 = _498;
    }
    float _500 = _496;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _504 = _448 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _506 = _460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[115].x, _454);
    if (_196)
    {
        float _510 = -_212;
        float _512 = _510 + 1.0;
        _476 = as_type<int>(_512);
    }
    int _514 = _476;
    float _516 = fma(_504, -2.0, _502);
    float _518 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _432);
    float _520 = fma(_506, _500, -0.5);
    float _522 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _358);
    float _524 = -_128;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _256);
    float _528 = fma(_320, _422, _508);
    float _530 = _346 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _388 + _532;
    if (!_196)
    {
        _478 = _212;
    }
    float _536 = _478;
    float _538 = -_402;
    float _540 = fma(_518, _468, _538);
    float _542 = _536;
    if (_196)
    {
        float _544 = _276 ? as_type<float>(_514) : _212;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = in.m_55.x;
    float _550 = in.m_55.y;
    float _552 = in.m_55.z;
    float _554 = _350 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _530 + _556;
    float _560 = _534 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _562 = fma(_362, _436, _528);
    float _564 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _566 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _466);
    float _568 = -_128;
    float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[81].x, _472);
    float _572 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _490);
    float _574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _576 = _554 + _574;
    float _578 = fma(_558, (*spvDescriptorSet0.vp_c8)._m0[28].x, _560);
    float _580 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _516);
    float _582 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[118].x, _562);
    float _584 = _534 * _534;
    float _586 = fma(_564, _546, -0.5);
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[28].z, _578);
    float _590 = -_580;
    float _592 = fma(_572, _458, _590);
    float _594 = fma(_558, _558, _584);
    float _596 = fma(_522, _520, _526);
    float _598 = fma(_566, _586, _570);
    bool _600 = _588 >= 0.0;
    float _602 = fma(_576, _576, _594);
    float _604 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = rsqrt(_602);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _614 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _618 = _582 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _620 = _566;
    int _622 = as_type<int>(_582);
    if (_600)
    {
        _620 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _624 = _620;
    float _626 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _630 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = _540 + 0.5;
    float _634 = _596 + 0.5;
    float _636 = _598 + 0.5;
    float _638 = _592 + 0.5;
    float _640 = _614 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_600)
    {
        float _642 = _624 * 5.0;
        _622 = as_type<int>(_642);
    }
    int _644 = _622;
    out.m_57.w = _616;
    float _646 = _640 * _608;
    out.m_59.x = _634;
    out.m_59.y = _632;
    out.m_59.z = _636;
    out.m_59.w = _638;
    float _648 = _558 * _646;
    float _650 = _534 * _646;
    out.m_61.x = _626;
    out.m_61.y = _628;
    out.m_61.z = _630;
    out.m_61.w = _618;
    float _652 = as_type<float>(_644);
    if (_600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2867 = as_type<float>(_644);
        out.gl_Position.z = _2867;
    }
    if (_600)
    {
        out.m_47.x = 0.0;
    }
    if (_600)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _654 = -_650;
    float _656 = _388 + _654;
    float _658 = _576 * _646;
    float _660 = -_648;
    float _662 = _530 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _656 + _664;
    float _668 = -_658;
    float _670 = _554 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _662 + _672;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _680 = _670 + _678;
    float _682 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _676);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[28].z, _682);
    bool _686 = _684 >= 0.0;
    float _688 = _658;
    float _690 = _674;
    if (_686)
    {
        _652 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _692 = _652;
    int _694 = as_type<int>(_692);
    if (_686)
    {
        out.m_47.x = 0.0;
    }
    if (_686)
    {
        float _696 = _692 * 5.0;
        _694 = as_type<int>(_696);
    }
    int _698 = _694;
    if (_686)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_698);
        out.gl_Position.z = _2956;
    }
    if (_686)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _700 = -_388;
    float _702 = _700 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _704 = -_530;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = -_554;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = -_650;
    float _714 = _534 + _712;
    float _716 = _702 * _702;
    float _718 = -_648;
    float _720 = _558 + _718;
    float _722 = -_658;
    float _724 = _576 + _722;
    float _726 = _714 * _714;
    float _728 = fma(_706, _706, _716);
    float _730 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _732 = fma(_720, _720, _726);
    float _734 = fma(_710, _710, _728);
    float _736 = _656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _738 = fma(_724, _724, _732);
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _748 = _744 || _746;
    float _750 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _736);
    float _752 = rsqrt(_734);
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _762 = _758 || _760;
    float _764 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].z, _750);
    float _766 = sqrt(_738);
    float _768 = _706 * _752;
    float _770 = _710 * _752;
    float _772 = _702 * _752;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _776 = _768 * _774;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = _770 * _778;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _784 = _772 * _782;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _788 = -_776;
    float _790 = fma(_770, _786, _788);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _794 = -_780;
    float _796 = fma(_772, _792, _794);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = -_784;
    float _802 = fma(_768, _798, _800);
    float _804 = in.m_63.x;
    float _806 = in.m_63.y;
    float _808 = in.m_63.z;
    float _810 = _790 * _790;
    float _812 = _608 * _766;
    float _814 = fma(_796, _796, _810);
    float _816 = _614 * _812;
    float _818 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _820 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _822 = fma(_802, _802, _814);
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _820 * _812;
    float _828 = rsqrt(_822);
    float _830 = _824 * _812;
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _836 = _796 * _828;
    float _838 = _790 * _828;
    float _840 = _832 * _816;
    float _842 = _802 * _828;
    float _844 = _772 * _836;
    float _846 = _770 * _838;
    float _848 = _834 * _826;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _852 = -_844;
    float _854 = fma(_768, _838, _852);
    float _856 = -_846;
    float _858 = fma(_772, _842, _856);
    float _860 = _768 * _842;
    float _862 = _850 * _830;
    float _864 = _848 * _854;
    float _866 = _848 * _858;
    float _868 = -_860;
    float _870 = fma(_770, _836, _868);
    float _872 = fma(_840, _842, _864);
    float _874 = fma(_840, _836, _866);
    float _876 = fma(_862, _770, _872);
    float _878 = fma(_862, _768, _874);
    float _880 = _554 + _876;
    float _882 = _530 + _878;
    float _884 = _656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _880 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _892 = _882 + _890;
    float _894 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _884);
    float _896 = _848 * _870;
    float _898 = _888 * _888;
    float _900 = _764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _902 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].z, _894);
    float _904 = fma(_840, _838, _896);
    float _906 = fma(_892, _892, _898);
    float _908 = _902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _910 = fma(_862, _772, _904);
    float _912 = sqrt(_906);
    float _914 = _900 + _908;
    float _916 = _388 + _910;
    float _918 = 1.0 / _908;
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _910;
    float _924 = _882;
    float _926 = _916;
    float _928 = _904;
    if (!_920)
    {
        _922 = _880;
    }
    float _930 = _922;
    bool _932 = !_920;
    float _934 = _930;
    if (!_932)
    {
        float _936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _940 = _912 + _938;
        float _942 = _916 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _944 = rsqrt(_906);
        float _946 = _940 * _936;
        float _948 = _946 * 0.15915493667125701904296875;
        float _950 = _948 * 6.283185482025146484375;
        float _952 = sin(_950);
        float _954 = _948 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = fma(_952, _942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _960 = _944 * _958;
        float _962 = _956 + (-1.0);
        float _964 = fma(_892, _960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _966 = fma(_888, _960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _968 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = fma(_916, _956, _968);
        _924 = _964;
        _934 = _966;
        _926 = _970;
        _928 = _968;
    }
    float _972 = _924;
    float _974 = _934;
    float _976 = _926;
    float _978 = _928;
    float _980 = -_648;
    float _982 = _980 + _972;
    float _984 = -_658;
    float _986 = _984 + _974;
    float _988 = -_650;
    float _990 = _988 + _976;
    float _992 = _914 * _918;
    float _994 = _992 * 0.5;
    float _996 = _978;
    float _998 = _990;
    float _1000 = _986;
    float _1002 = _974;
    if (_762)
    {
        _996 = 1.0;
    }
    float _1004 = _996;
    float _1006 = _1004;
    if (_748)
    {
        _688 = _982;
    }
    float _1008 = _688;
    float _1010 = _1008;
    if (!_748)
    {
        float _1012 = _666 * _666;
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1016 = -_554;
        float _1018 = _1016 + _974;
        float _1020 = -_530;
        float _1022 = _1020 + _972;
        float _1024 = fma(_674, _674, _1012);
        float _1026 = -_388;
        float _1028 = _1026 + _976;
        float _1030 = fma(_680, _680, _1024);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1034 = sqrt(_1030);
        float _1036 = 1.0 / _812;
        float _1038 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1034, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1014;
        float _1044 = _1042 * _1036;
        float _1046 = _1038 * _1044;
        float _1048 = _1018 * _1044;
        float _1050 = fma(_1022, _1046, _662);
        float _1052 = fma(_1028, _1046, _656);
        float _1054 = fma(_1038, _1048, _670);
        _998 = _1052;
        _1010 = _1050;
        _1000 = _1054;
        _690 = _1034;
    }
    float _1056 = _998;
    float _1058 = _1010;
    float _1060 = _1000;
    float _1062 = _690;
    float _1064 = _1062;
    if (!_762)
    {
        float _1066 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1074 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1072);
        float _1076 = _1068 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = _1070 * 0.15915493667125701904296875;
        float _1082 = _1068 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = 1.0 / _1078;
        float _1088 = _1080 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1084 * _1086;
        float _1094 = _1080 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * _1092;
        float _1100 = 1.0 / _1074;
        float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1104 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1102;
        float _1106 = 1.0 / _1098;
        float _1108 = 1.0 / _1104;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1112 = _1100 * _1110;
        float _1114 = _1096 * _1106;
        float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1118 = fma(_1114, _1112, _1116);
        float _1120 = _1118 * _1108;
        float _1122 = precise::clamp(_1120, 0.0, 1.0);
        _1002 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1006 = _1122;
    }
    float _1124 = _1002;
    float _1126 = _1006;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1130 = _1056 + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1134 = _1058 + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1138 = _1060 + _1136;
    float _1140 = _1130 * _1130;
    float _1142 = fma(_1134, _1134, _1140);
    float _1144 = fma(_1138, _1138, _1142);
    float _1146 = rsqrt(_1144);
    float _1148 = sqrt(_1144);
    float _1150 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1152 = _1134 * _1150;
    float _1154 = _1138 * _1150;
    float _1156 = _1152 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 + _1158;
    float _1162 = sqrt(_1160);
    bool _1164 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1162 + _1166;
    float _1170 = _1138;
    float _1172 = _1160;
    float _1174 = _1168;
    float _1176 = _1124;
    float _1178 = _1130;
    if (_1164)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1170 = _1180;
    }
    float _1182 = _1170;
    if (_1164)
    {
        float _1184 = rsqrt(_1160);
        _1172 = _1184;
    }
    float _1186 = _1172;
    float _1188 = _1186;
    if (_1164)
    {
        float _1190 = _1168 * _1182;
        _1174 = _1190;
    }
    float _1192 = _1174;
    if (_1164)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1176 = _1194;
    }
    float _1196 = _1176;
    float _1198 = _1182;
    float _1200 = _1196;
    if (_1164)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1198 = _1204;
    }
    float _1206 = _1198;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1140;
    float _1214 = _1210;
    if (_1164)
    {
        float _1216 = _1196 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1212 = _1218;
    }
    float _1220 = _1212;
    float _1222 = -_1150;
    float _1224 = -_1210;
    float _1226 = fma(_1130, _1222, _1224);
    if (_1164)
    {
        float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1228;
    }
    float _1230 = _1214;
    float _1232 = _1206;
    float _1234 = _1230;
    if (_1164)
    {
        float _1236 = fma(_1206, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1178 = _1236;
    }
    float _1238 = _1178;
    float _1240 = _1238;
    if (!_1164)
    {
        _1232 = _1152;
    }
    float _1242 = _1232;
    float _1244 = _1242;
    float _1246 = _1220;
    if (_1164)
    {
        float _1248 = _1220 + (-1.0);
        _1234 = _1248;
    }
    float _1250 = _1234;
    float _1252 = _1250;
    if (_1164)
    {
        float _1254 = _1186 * _1238;
        _1064 = _1254;
    }
    float _1256 = _1064;
    if (!_1164)
    {
        _1240 = _1226;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (_1164)
    {
        float _1262 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1262;
    }
    float _1264 = _1200;
    if (_1164)
    {
        float _1266 = _1152 * _1256;
        _1244 = _1266;
    }
    float _1268 = _1244;
    if (!_1164)
    {
        _1252 = _1154;
    }
    float _1270 = _1252;
    float _1272 = _1270;
    if (_1164)
    {
        float _1274 = _1154 * _1256;
        _1272 = _1274;
    }
    float _1276 = _1272;
    if (!_1164)
    {
        _1188 = _1156;
    }
    float _1278 = _1188;
    float _1280 = _1278;
    if (_1164)
    {
        float _1282 = fma(_1226, _1220, _1264);
        _1260 = _1282;
    }
    float _1284 = _1260;
    if (_1164)
    {
        float _1286 = _1268 * _1268;
        _1280 = _1286;
    }
    float _1288 = _1280;
    if (!_1164)
    {
        _1246 = _1158;
    }
    float _1290 = _1246;
    float _1292 = _1290;
    if (_1164)
    {
        float _1294 = _1276 * _1276;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1300 = fma(_1284, _1284, _1288);
    float _1302 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1304 = _1300 + _1296;
    float _1306 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1298);
    float _1308 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1312 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1310);
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = rsqrt(_1304);
    float _1318 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1306);
    float _1320 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1322 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1308);
    float _1324 = -_1314;
    float _1326 = _1324 + 1.0;
    float _1328 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1320);
    float _1332 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1322);
    float _1334 = abs(_1326);
    float _1336 = log2(_1334);
    float _1338 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1340 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1330);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1346 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1302);
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1352 = _1316 * _1268;
    float _1354 = _1316 * _1284;
    float _1356 = -_1344;
    float _1358 = fma(_1356, _1338, 1.0);
    float _1360 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1350);
    float _1366 = _1316 * _1276;
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = -_1362;
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1370);
    float _1374 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1378 = log2(_1358);
    float _1380 = -_1366;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1372);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1374);
    float _1386 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1388 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1390 = fma(_1382, -0.5, 0.5);
    float _1392 = fma(_1382, 0.5, 0.5);
    float _1394 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1386);
    float _1396 = 1.0 / _1384;
    float _1398 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1388);
    float _1400 = fma(_1392, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1394);
    float _1404 = _1354 + 1.0;
    float _1406 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1398);
    float _1408 = fma(_1392, _1400, -0.212114393711090087890625);
    float _1410 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1402);
    float _1412 = exp2(_1376);
    float _1414 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1416 = _1378 * 0.693147182464599609375;
    float _1418 = fma(_1392, _1408, 1.570728778839111328125);
    float _1420 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1422 = sqrt(_1390);
    float _1424 = _1410 * _1396;
    float _1426 = _1414 * _1396;
    float _1428 = fma(_1424, 0.5, 0.5);
    float _1430 = fma(_1426, -0.5, 0.5);
    float _1432 = -_1354;
    float _1434 = fma(_1412, _1404, _1432);
    float3 _4120 = float3(_1428, _1430, _1420);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4120, float3(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4120, float3(0.0), isnan(_4120)), level(0.0)).x;
    float _1438 = fma(_1434, 0.5, 0.5);
    float _1440 = _1422 * 0.636619746685028076171875;
    float _1442 = -_1418;
    float _1444 = fma(_1440, _1442, 1.0);
    float3 _4141 = float3(_1428, _1430, _1420);
    float4 _1447 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4141, float3(0.0), isnan(_4141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4141, float3(0.0), isnan(_4141)), level(0.0)).xyzw;
    float _1449 = _1447.x;
    float _1451 = _1447.y;
    float _1453 = _1447.z;
    float _1455 = _1447.w;
    float2 _4158 = float2(_1444, _1438);
    float3 _1459 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4158, float2(0.0), isnan(_4158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4158, float2(0.0), isnan(_4158)), level(0.0)).xyz;
    float _1461 = _1459.x;
    float _1463 = _1459.y;
    float _1465 = _1459.z;
    float _1467 = in.m_65.x;
    float _1469 = in.m_65.y;
    float _1471 = in.m_65.z;
    bool _1473 = _806 != 0.0;
    bool _1475 = isnan(_806);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan(0.0);
    bool _1481 = _1477 || _1479;
    float _1483 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1485 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1487 = _804 == 0.0;
    bool _1489 = !_1481;
    bool _1491 = _1487 && _1489;
    float _1493 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1485);
    float _1495 = exp2(_1483);
    bool _1497 = _808 == 0.0;
    bool _1499 = _1497 && _1491;
    float _1501 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1503 = _1469;
    float _1505 = _1467;
    float _1507 = _1471;
    if (!_1499)
    {
        float _1509 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1469);
        _1503 = _1509;
    }
    float _1511 = _1503;
    if (!_1499)
    {
        float _1513 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1467);
        _1505 = _1513;
    }
    float _1515 = _1505;
    if (!_1499)
    {
        float _1517 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1471);
        _1507 = _1517;
    }
    float _1519 = _1507;
    float _1521 = -_1495;
    float _1523 = _1521 + 1.0;
    float _1525 = _858 * _1511;
    float _1527 = _870 * _1511;
    float _1529 = _854 * _1511;
    bool _1531 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1533 = isnan(_1148);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1539 = _1535 || _1537;
    float _1541 = fma(_836, _1515, _1525);
    float _1543 = fma(_838, _1515, _1527);
    float _1545 = fma(_842, _1515, _1529);
    float _1547 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1501);
    float _1549 = fma(_768, _1519, _1541);
    float _1551 = _1384 * 0.5;
    float _1553 = _1410 + _1384;
    float _1555 = _1547 + _1384;
    float _1557 = fma(_772, _1519, _1543);
    float _1559 = fma(_1414, -0.5, _1551);
    float _1561 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1563 = _1555 * 0.5;
    float _1565 = _1553 * 0.5;
    float _1567 = fma(_770, _1519, _1545);
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _1547;
    out.gl_Position.w = _1384;
    float _1569 = _1543;
    float _1571 = _1525;
    if (!_1539)
    {
        _1569 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1573 = _1569;
    float _1575 = _1573;
    float _1577 = _1573;
    if (!_1539)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1579 = _1571;
    out.m_67.x = _1565;
    out.m_67.y = _1559;
    out.m_67.z = _1563;
    out.m_67.w = _1384;
    out.m_69.x = _1549;
    out.m_69.y = _1557;
    out.m_69.z = _1567;
    float _1581 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1583 = _1561 * _1436;
    float _1585 = -_1561;
    float _1587 = _1585 + 1.0;
    float _1589 = _1455 * _1583;
    float _1591 = _1455 * _1587;
    float _1593 = _1587;
    float _1595 = _1579;
    float _1597 = _1579;
    if (!_1539)
    {
        _1593 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1599 = _1593;
    float _1601 = _1465 * _1583;
    float _1603 = fma(_1461, _1589, _1449);
    float _1605 = fma(_1463, _1589, _1451);
    float _1607 = fma(_1455, _1601, _1453);
    out.m_71.x = _1603;
    out.m_71.y = _1605;
    out.m_71.z = _1607;
    out.m_71.w = _1591;
    bool _1609 = !_1539;
    float _1611 = _1599;
    float _1613 = _1599;
    if (!_1609)
    {
        bool _1615 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1617 = isnan(_1148);
        bool _1619 = _1615 || _1617;
        bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1623 = _1619 || _1621;
        if (!_1623)
        {
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = _1148 + _1625;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1631 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1629;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1641 = 1.0 / _1631;
            float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1647 = _1627 * _1641;
            float _1649 = precise::clamp(_1647, 0.0, 1.0);
            float _1651 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1653 = fma(_1649, _1639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1655 = fma(_1649, _1645, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1597 = _1653;
            _1577 = _1651;
            _1613 = _1655;
            _1657 = true;
        }
        else
        {
            bool _1659 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_1148);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1575;
            _1577 = _1669;
            if (!_1667)
            {
                _1595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1595;
            _1597 = _1671;
            if (!_1667)
            {
                _1611 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1611;
            bool _1675 = !_1667;
            _1613 = _1673;
            if (!_1675)
            {
                bool _1677 = _1148 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1679 = isnan(_1148);
                bool _1681 = _1677 || _1679;
                bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1685 = _1681 || _1683;
                if (!_1685)
                {
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1689 = _1148 + _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1691;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1703 = 1.0 / _1693;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1709 = _1689 * _1703;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = fma(_1711, _1697, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1715 = fma(_1711, _1701, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1717 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1597 = _1715;
                    _1577 = _1713;
                    _1613 = _1717;
                    _1657 = true;
                }
                else
                {
                    _1597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1613 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1657 = false;
    float _1719 = _1597;
    float _1721 = _1577;
    float _1723 = _1613;
    float _1725 = _1581 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = 0.0;
    float _1727 = _1719 * 0.586610972881317138671875;
    bool _1729 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _1725;
    float _1731 = fma(_1721, 0.298911988735198974609375, _1727);
    bool _1733 = _1126 > 0.0;
    bool _1735 = isnan(_1126);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.0);
    bool _1741 = _1737 || _1739;
    float _1743 = fma(_1723, 0.114477999508380889892578125, _1731);
    float _1745 = -_1743;
    float _1747 = _1745 + _1721;
    float _1749 = -_1743;
    float _1751 = _1749 + _1719;
    float _1753 = -_1743;
    float _1755 = _1753 + _1723;
    float _1757 = fma(_1747, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    float _1759 = fma(_1751, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    float _1761 = fma(_1755, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1743);
    bool _1763 = !_1729;
    if (!_1763)
    {
        float _1765 = -_1056;
        float _1767 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1769 = -_1058;
        float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1773 = -_1060;
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1777 = _1767 * _1767;
        float _1779 = fma(_1771, _1771, _1777);
        float _1781 = fma(_1775, _1775, _1779);
        float _1783 = sqrt(_1781);
        float _1785 = rsqrt(_1781);
        float _1787 = -_1783;
        float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1791 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = _1771 * _1785;
        float _1797 = _1767 * _1785;
        float _1799 = abs(_1793);
        float _1801 = log2(_1799);
        float _1803 = _1775 * _1785;
        float _1805 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1807 = _1557 * _1797;
        float _1809 = -_1797;
        float _1811 = -_1805;
        float _1813 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1811);
        float _1815 = fma(_1549, _1795, _1807);
        float _1817 = -_1803;
        float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1813);
        float _1821 = fma(_1567, _1803, _1815);
        float _1823 = precise::clamp(_1821, 0.0, 1.0);
        float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1827 = _1819 + _1825;
        float _1829 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = exp2(_1829);
        float _1837 = _1835 * _1833;
        float _1839 = _1823 * _1837;
        float _1841 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1843 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1845 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_73.x = _1841;
        out.m_73.y = _1843;
        out.m_73.z = _1845;
    }
    out.m_75.x = _1757;
    out.m_75.y = _1759;
    out.m_75.z = _1761;
    if (_1741)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1847;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

