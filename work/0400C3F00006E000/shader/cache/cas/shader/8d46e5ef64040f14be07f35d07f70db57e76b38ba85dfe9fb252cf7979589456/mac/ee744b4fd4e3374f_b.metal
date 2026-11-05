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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_61 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_69 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_55 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1817 = false;
    bool _1200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
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
    float _122 = _120;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_128);
        out.gl_Position.z = _2051;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
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
        _122 = _146;
    }
    float _148 = _122;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_162);
        out.gl_Position.z = _2119;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_55.x;
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _168 = in.m_57.x;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _172 = _170 != 0;
    float _174 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _176 = in.m_57.w;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _184 = in.m_55.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _196 = _194 != 0;
    float _198 = in.m_57.y;
    float _200 = _174 * _166;
    bool _202 = !_188;
    int _204 = _202 ? 0 : 1;
    float _206 = in.m_59.x;
    float _208 = in.m_59.y;
    float _210 = in.m_59.z;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _214 = _212 != 0;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _218 = !_192;
    int _220 = _218 ? 0 : 1;
    int _222 = as_type<int>(_166);
    bool _224 = _154;
    float _226 = _200;
    float _228 = _164;
    if (_172)
    {
        float _230 = -_164;
        float _232 = _230 + 1.0;
        _222 = as_type<int>(_232);
    }
    int _234 = _222;
    float _236 = in.m_57.z;
    float _238 = 0.0;
    if (!_172)
    {
        _238 = _164;
    }
    float _240 = _238;
    float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _244 = _240;
    float _246 = _242;
    if (_172)
    {
        bool _248 = _168 > 0.5;
        _224 = _248;
    }
    bool _250 = _224;
    float _252 = in.m_61.x;
    float _254 = in.m_61.y;
    float _256 = in.m_61.z;
    float _258 = _182;
    if (_172)
    {
        float _260 = _250 ? as_type<float>(_234) : _164;
        _244 = _260;
    }
    float _262 = _244;
    float _264 = in.m_63.y;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _268 = _266 != 0;
    float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _272 = _176 > 0.5;
    float _274 = -_184;
    float _276 = _274 + 1.0;
    float _278 = in.m_48.x;
    float _280 = in.m_48.y;
    float _282 = in.m_48.z;
    bool _284 = _198 > 0.5;
    int _286 = _272 ? as_type<int>(_276) : as_type<int>(_184);
    float _288 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = _208 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = 0.0;
    if (_268)
    {
        float _294 = in.m_57.z;
        _292 = _294;
    }
    float _296 = _292;
    int _298 = _284 ? as_type<int>(_276) : as_type<int>(_184);
    float _300 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _302 = _236 > 0.5;
    float _304 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _306 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = _214 ? as_type<float>(_298) : _184;
    float _310 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _312 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _316 = _314 != 0;
    float _318 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _304);
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _322 = _320 != 0;
    float _324 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    int _326 = _302 ? as_type<int>(_276) : as_type<int>(_184);
    float _328 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _310);
    float _330 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _312);
    float _332 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _334 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _336 = _316 ? _286 : as_type<int>(_184);
    float _338 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = _322 ? as_type<float>(_326) : _184;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _346 = _344 != 0;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _352 = _350 != 0;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _358 = _356 != 0;
    float _360 = -_216;
    float _362 = fma(_332, 2.0, _360);
    float _364 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _366 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _334);
    float _368 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _376 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _378 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _358 ? as_type<float>(_326) : _184;
    float _382 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _384 = _358;
    int _386 = _336;
    if (_268)
    {
        bool _388 = _296 > 0.5;
        _384 = _388;
    }
    bool _390 = _384;
    float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _394 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _396 = fma(_364, -2.0, _370);
    float _398 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _324);
    float _400 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _402 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _366);
    float _404 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _406 = in.m_63.x;
    float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _410 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _412 = in.m_63.z;
    float _414 = _182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _416 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    float _418 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _396);
    float _420 = in.m_63.w;
    float _422 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _318);
    float _424 = fma(_414, _308, -0.5);
    float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_65.x = _372;
    out.m_65.y = _376;
    out.m_65.z = _378;
    out.m_65.w = _374;
    float _428 = _410;
    int _430 = as_type<int>(_418);
    int _432 = as_type<int>(_392);
    if (_196)
    {
        _428 = _168;
    }
    float _434 = _428;
    float _436 = _434;
    if (!_268)
    {
        _258 = _164;
    }
    float _438 = _258;
    float _440 = _408 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _444 = _392 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _446 = _242 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _448 = fma(_440, as_type<float>(_336), -0.5);
    float _450 = _438;
    if (_196)
    {
        _246 = _198;
    }
    float _452 = _246;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _456 = fma(_446, _380, -0.5);
    float _458 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _454);
    float _460 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    float _462 = fma(_444, _340, -0.5);
    float _464 = -_418;
    float _466 = fma(_460, _424, _464);
    int _468 = as_type<int>(_460);
    float _470 = _452;
    if (_268)
    {
        float _472 = -_164;
        float _474 = _472 + 1.0;
        _430 = as_type<int>(_474);
    }
    int _476 = _430;
    if (_196)
    {
        _432 = 0;
        _468 = 0;
    }
    int _478 = _432;
    int _480 = _468;
    int _482 = _478;
    int _484 = _480;
    if (!_196)
    {
        float _486 = _168 * 3.1415927410125732421875;
        float _488 = _486 * 0.15915493667125701904296875;
        float _490 = _198 * 3.1415927410125732421875;
        float _492 = _490 * 0.15915493667125701904296875;
        float _494 = _488 * 6.283185482025146484375;
        float _496 = sin(_494);
        float _498 = _492 * 6.283185482025146484375;
        float _500 = sin(_498);
        _482 = 1;
        _484 = 2;
        _436 = _496;
        _470 = _500;
    }
    int _502 = _482;
    int _504 = _484;
    float _506 = _436;
    float _508 = _470;
    if (_268)
    {
        float _510 = _390 ? as_type<float>(_476) : _164;
        _450 = _510;
    }
    float _512 = _450;
    float _514 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[20].x, _200);
    bool _516 = _502 != 1;
    out.m_67.y = _264;
    bool _518 = _504 != 2;
    float _520 = floor(_514);
    if (_346)
    {
        float _522 = -_164;
        float _524 = _522 + 1.0;
        _386 = as_type<int>(_524);
    }
    int _526 = _386;
    float _528 = in.m_69.x;
    float _530 = in.m_69.y;
    float _532 = in.m_69.z;
    int _534 = 0;
    if (_352)
    {
        float _536 = -_164;
        float _538 = _536 + 1.0;
        _534 = as_type<int>(_538);
    }
    int _540 = _534;
    if (!_346)
    {
        _226 = _164;
    }
    float _542 = _226;
    float _544 = _442 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_67.z = _412;
    float _546 = _542;
    if (_346)
    {
        float _548 = _284 ? as_type<float>(_526) : _164;
        _546 = _548;
    }
    float _550 = _546;
    float _552 = rsqrt(_422);
    if (_352)
    {
        float _554 = _284 ? as_type<float>(_540) : _164;
        _228 = _554;
    }
    float _556 = _228;
    out.m_67.x = _406;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _560 = fma(_544, _550, -0.5);
    float _562 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[93].z, _558);
    out.m_67.w = _420;
    float _564 = _506 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _566 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _568 = -_520;
    float _570 = _514 + _568;
    float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _576 = abs(_204);
    float _578 = _566 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _580 = -_574;
    float _582 = fma(_564, 2.0, _580);
    float _584 = float(_576);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _588 = -_570;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _592 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[191].y, _578);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _596 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[93].w, _586);
    float _598 = abs(_590);
    float _600 = _584 * _598;
    float _602 = _592 * 0.15915493667125701904296875;
    float _604 = _508 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _606 = _270 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _608 = _394 * _394;
    float _610 = fma(_604, -2.0, _594);
    float _612 = _426 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _614 = _602 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = fma(_398, _398, _608);
    float _620 = fma(_606, _262, -0.5);
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _624 = fma(_612, _512, -0.5);
    float _626 = _552 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _628 = fma(_400, _400, _618);
    float _630 = _572 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _632 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].z, _622);
    float _634 = _626 * (-0.15915493667125701904296875);
    float _636 = -_144;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[76].x, _362);
    float _640 = fma(_630, _556, -0.5);
    float _642 = rsqrt(_628);
    float _644 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _646 = 0.0;
    float _648 = _562;
    float _650 = _600;
    if (!_516)
    {
        _646 = _198;
    }
    float _652 = _646;
    float _654 = -_144;
    float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[91].x, _582);
    float _658 = _616 * _530;
    float _660 = fma(_644, _620, _638);
    float _662 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].w, _596);
    float _664 = _634 * 6.283185482025146484375;
    float _666 = sin(_664);
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[191].x, _528);
    float _670 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].z, _562);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _674 = _652;
    float _676 = _670;
    if (!_516)
    {
        _648 = _652;
    }
    float _678 = _648;
    float _680 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[91].y, _610);
    float _682 = fma(_670, _640, _656);
    float _684 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _672);
    float _686 = _634 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = _678;
    if (_516)
    {
        _674 = _198;
    }
    float _692 = _674;
    float _694 = _398 * _642;
    float _696 = _692;
    if (_518)
    {
        _676 = _168;
    }
    float _698 = _676;
    float _700 = _394 * _642;
    float _702 = _400 * _642;
    float _704 = _698;
    if (!_518)
    {
        _704 = _236;
    }
    float _706 = _704;
    float _708 = -_680;
    float _710 = fma(_662, _456, _708);
    float _712 = _666 * _532;
    float _714 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _716 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _720 = _688 * _532;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _724 = -_712;
    float _726 = fma(_688, _530, _724);
    float _728 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _706 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _732 = fma(_666, _530, _720);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _736 = _702 * _734;
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _740 = -_722;
    float _742 = fma(_730, 2.0, _740);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _746 = _700 * _744;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _750 = -_736;
    float _752 = fma(_694, _748, _750);
    float _754 = _728 * _738;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _758 = _694 * _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _762 = -_746;
    float _764 = fma(_702, _760, _762);
    float _766 = _752 * _752;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _770 = -_758;
    float _772 = fma(_700, _768, _770);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _776 = fma(_764, _764, _766);
    float _778 = _766;
    float _780 = _722;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (!_516)
    {
        _778 = _678;
    }
    float _784 = _778;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _788 = _784;
    if (_516)
    {
        _690 = _168;
    }
    float _790 = _690;
    float _792 = fma(_772, _772, _776);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_516)
    {
        _780 = _236;
    }
    float _796 = _780;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _800 = rsqrt(_792);
    float _802 = _796;
    if (!_516)
    {
        _782 = _236;
    }
    float _804 = _782;
    float _806 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[88].z, _794);
    float _808 = _804;
    if (_516)
    {
        _802 = _692;
    }
    float _810 = _802;
    float _812 = _716 * _774;
    if (_516)
    {
        _808 = _692;
    }
    float _814 = _808;
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _786);
    if (_516)
    {
        _788 = _168;
    }
    float _818 = _788;
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _798);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    if (!_518)
    {
        _696 = _168;
    }
    float _824 = _696;
    float _826 = _812 * _694;
    float _828 = _812 * _702;
    float _830 = _714 * _822;
    float _832 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _834 = _818 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _836 = _752 * _800;
    float _838 = _772 * _800;
    float _840 = _764 * _800;
    float _842 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _806);
    float _844 = _694 * _836;
    float _846 = _700 * _838;
    float _848 = fma(_754, _840, _826);
    float _850 = fma(_754, _838, _828);
    float _852 = -_844;
    float _854 = fma(_700, _840, _852);
    float _856 = -_846;
    float _858 = fma(_702, _836, _856);
    float _860 = -_144;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[86].x, _742);
    float _864 = fma(_830, _854, _850);
    float _866 = fma(_830, _858, _848);
    float _868 = fma(_842, _560, _862);
    float _870 = _814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = _832 + _864;
    float _874 = _718 + _866;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _878 = _726 != 0.0;
    bool _880 = isnan(_726);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _890 = _872 + _888;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _874 + _892;
    float _896 = -_876;
    float _898 = fma(_834, 2.0, _896);
    bool _900 = _668 == 0.0;
    bool _902 = !_886;
    bool _904 = _900 && _902;
    float _906 = _890 * _890;
    float _908 = _894 * _894;
    float _910 = in.m_71.x;
    float _912 = in.m_71.y;
    float _914 = in.m_71.z;
    float _916 = _824 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _918 = _908 + _906;
    bool _920 = _732 == 0.0;
    bool _922 = _920 && _904;
    float _924 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _816);
    float _926 = sqrt(_918);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _930 = -_144;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _934 = _812 * _700;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _938 = fma(_870, -2.0, _928);
    float _940 = fma(_924, _624, _932);
    float _942 = _702 * _840;
    float _944 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _684);
    float _946 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _820);
    float _948 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _938);
    float _950 = fma(_916, -2.0, _936);
    float _952 = fma(_754, _836, _934);
    float _954 = -_942;
    float _956 = fma(_694, _838, _954);
    float _958 = -_948;
    float _960 = fma(_946, _448, _958);
    float _962 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _950);
    bool _964 = _926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = _912;
    float _968 = _910;
    float _970 = _908;
    float _972 = _906;
    float _974 = _874;
    float _976 = _872;
    float _978 = _914;
    float _980 = _894;
    if (!_922)
    {
        float _982 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _912);
        _966 = _982;
    }
    float _984 = _966;
    float _986 = fma(_830, _956, _952);
    float _988 = _402 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _990 = _694 * _984;
    float _992 = _700 * _984;
    float _994 = _702 * _984;
    float _996 = _514 * 6.283185482025146484375;
    float _998 = -_962;
    float _1000 = fma(_944, _462, _998);
    if (!_922)
    {
        float _1002 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _910);
        _968 = _1002;
    }
    float _1004 = _968;
    float _1006 = _988 + _986;
    bool _1008 = !_964;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _926 + _1014;
        float _1018 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = rsqrt(_918);
        float _1022 = _1016 * _1012;
        float _1024 = _1022 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1020 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_894, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_890, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1048 = _1040 + _1046;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1052 = _1042 + _1050;
        float _1054 = fma(_1006, _1032, _1044);
        float _1056 = _1048 * _1048;
        float _1058 = _1052 * _1052;
        _1010 = _1054;
        _970 = _1056;
        _972 = _1058;
        _974 = _1040;
        _976 = _1042;
    }
    float _1060 = _1010;
    float _1062 = _970;
    float _1064 = _972;
    float _1066 = _974;
    float _1068 = _976;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1072 = _1060 + _1070;
    float _1074 = _996 * 0.15915493667125701904296875;
    float _1076 = fma(_840, _1004, _990);
    if (!_922)
    {
        float _1078 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _978 = _1078;
    }
    float _1080 = _978;
    float _1082 = fma(_1072, _1072, _1062);
    float _1084 = fma(_836, _1004, _992);
    float _1086 = fma(_838, _1004, _994);
    float _1088 = _1074 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1082 + _1064;
    float _1094 = fma(_858, _1080, _1076);
    float _1096 = fma(_956, _1080, _1084);
    float _1098 = _682 + 0.5;
    float _1100 = _660 + 0.5;
    float _1102 = _710 + 0.5;
    float _1104 = _868 + 0.5;
    float _1106 = sqrt(_1092);
    float _1108 = _1000 + 0.5;
    float _1110 = fma(_854, _1080, _1086);
    bool _1112 = !_180;
    int _1114 = _1112 ? 0 : 1;
    out.m_73.x = _1098;
    out.m_73.y = _1102;
    int _1116 = abs(_220);
    float _1118 = _466 + 0.5;
    int _1120 = abs(_1114);
    out.m_75.x = _1104;
    out.m_75.y = _1108;
    float _1122 = fma(_1090, 0.5, 0.5);
    float _1124 = _940 + 0.5;
    out.m_77.x = _1094;
    out.m_77.y = _1096;
    out.m_77.z = _1110;
    float _1126 = _960 + 0.5;
    bool _1128 = _570 < 0.5;
    float _1130 = float(_1128);
    float _1132 = -_1122;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1136 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1138 = isnan(_1106);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1120);
    out.m_79.x = _1100;
    out.m_79.y = _1118;
    out.m_79.z = _1124;
    out.m_79.w = _1126;
    float _1148 = -_1130;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1152 = fma(_1146, _1134, _600);
    float _1154 = as_type<float>(_1116);
    float _1156 = _1108;
    if (!_1144)
    {
        _650 = 1.0;
    }
    float _1158 = _650;
    float _1160 = float(_1116);
    float _1162 = abs(_1150);
    float _1164 = fma(_1160, _1162, _1152);
    bool _1166 = !_1144;
    float _1168 = _1158;
    float _1170 = _1164;
    if (!_1166)
    {
        bool _1172 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1106);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1106 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1106);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1106 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1228;
                _1200 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1168;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1234 = _1060 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1238 = _1066 + _1236;
    float _1240 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1244 = _1068 + _1242;
    float _1246 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1250 = _1240 + _1248;
    float _1252 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1246 + _1254;
    float _1258 = _1250 * _1250;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1252 + _1260;
    float _1264 = fma(_1256, _1256, _1258);
    float _1266 = fma(_1262, _1262, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = sqrt(_1266);
    float _1272 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1274 = _1256 * _1272;
    float _1276 = _1262 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 * _1276;
    float _1282 = _1278 + _1280;
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1284 + _1288;
    float _1292 = _1262;
    float _1294 = _1290;
    float _1296 = _1250;
    if (_1286)
    {
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1298;
    }
    float _1300 = _1292;
    if (_1286)
    {
        float _1302 = rsqrt(_1282);
        _1154 = _1302;
    }
    float _1304 = _1154;
    float _1306 = _1304;
    if (_1286)
    {
        float _1308 = _1290 * _1300;
        _1294 = _1308;
    }
    float _1310 = _1294;
    if (_1286)
    {
        float _1312 = _1310 * 0.15915493667125701904296875;
        _1156 = _1312;
    }
    float _1314 = _1156;
    float _1316 = _1268;
    float _1318 = _1314;
    if (_1286)
    {
        float _1320 = _1314 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        _1316 = _1322;
    }
    float _1324 = _1316;
    float _1326 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1328 = precise::max(0.0, _1326);
    float _1330 = _1264;
    float _1332 = _1328;
    float _1334 = _1326;
    if (_1286)
    {
        float _1336 = _1314 * 6.283185482025146484375;
        float _1338 = cos(_1336);
        _1330 = _1338;
    }
    float _1340 = _1330;
    float _1342 = -_1272;
    float _1344 = -_1328;
    float _1346 = fma(_1250, _1342, _1344);
    float _1348 = _1346;
    if (!_1286)
    {
        _1332 = _1276;
    }
    float _1350 = _1332;
    float _1352 = _1350;
    if (_1286)
    {
        float _1354 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1354;
    }
    float _1356 = _1334;
    float _1358 = _1324;
    float _1360 = _1356;
    if (_1286)
    {
        float _1362 = fma(_1324, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1362;
    }
    float _1364 = _1296;
    float _1366 = _1364;
    if (!_1286)
    {
        _1358 = _1274;
    }
    float _1368 = _1358;
    float _1370 = _1368;
    if (_1286)
    {
        float _1372 = _1340 + (-1.0);
        _1360 = _1372;
    }
    float _1374 = _1360;
    if (_1286)
    {
        float _1376 = _1304 * _1364;
        _980 = _1376;
    }
    float _1378 = _980;
    if (!_1286)
    {
        _1306 = _1278;
    }
    float _1380 = _1306;
    float _1382 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = _1380;
    if (_1286)
    {
        float _1386 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1386;
    }
    float _1388 = _1318;
    if (_1286)
    {
        float _1390 = _1274 * _1378;
        _1370 = _1390;
    }
    float _1392 = _1370;
    if (_1286)
    {
        float _1394 = _1276 * _1378;
        _1352 = _1394;
    }
    float _1396 = _1352;
    if (!_1286)
    {
        _1366 = _1280;
    }
    float _1398 = _1366;
    float _1400 = _1398;
    if (_1286)
    {
        float _1402 = fma(_1346, _1340, _1388);
        _1348 = _1402;
    }
    float _1404 = _1348;
    if (_1286)
    {
        float _1406 = _1392 * _1392;
        _1384 = _1406;
    }
    float _1408 = _1384;
    if (_1286)
    {
        float _1410 = _1396 * _1396;
        _1400 = _1410;
    }
    float _1412 = _1400;
    float _1414 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1416 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1418 = fma(_1404, _1404, _1408);
    float _1420 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1422 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1414);
    float _1424 = _1418 + _1412;
    float _1426 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1428 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1422);
    float _1430 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1416);
    float _1432 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1420);
    float _1434 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1426);
    float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1438 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1436);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = rsqrt(_1424);
    float _1444 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1434);
    float _1446 = -_1440;
    float _1448 = _1446 + 1.0;
    float _1450 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1452 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1454 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1430);
    float _1456 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1460 = abs(_1448);
    float _1462 = log2(_1460);
    float _1464 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1466 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1468 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1458);
    float _1472 = _1442 * _1392;
    float _1474 = _1442 * _1404;
    float _1476 = _1442 * _1396;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1480 = floor(_1466);
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1470);
    float _1484 = -_1478;
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1484);
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1482);
    float _1492 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1494 = -_1476;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1486);
    float _1498 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = floor(_1452);
    float _1502 = fma(_1496, -0.5, 0.5);
    float _1504 = -_1498;
    float _1506 = fma(_1504, _1488, 1.0);
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1512 = -_1480;
    float _1514 = _1466 + _1512;
    float _1516 = exp2(_1492);
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1510);
    float _1520 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1522 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1518);
    float _1524 = fma(_1508, _1520, -0.212114393711090087890625);
    float _1526 = sqrt(_1502);
    float _1528 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1522);
    float _1532 = fma(_1508, _1524, 1.570728778839111328125);
    float _1534 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1536 = 1.0 / _1490;
    float _1538 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1534);
    float _1540 = -_1500;
    float _1542 = _1452 + _1540;
    float _1544 = _1474 + 1.0;
    float _1546 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1538);
    float _1548 = -_1474;
    float _1550 = fma(_1516, _1544, _1548);
    float _1552 = log2(_1506);
    float _1554 = _1526 * 0.636619746685028076171875;
    float2 _4478 = float2(_1514, _1542);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4478, float2(0.0), isnan(_4478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4478, float2(0.0), isnan(_4478)), level(0.0)).x;
    float _1558 = fma(_1550, 0.5, 0.5);
    float _1560 = -_1532;
    float _1562 = fma(_1554, _1560, 1.0);
    float _1564 = _1546 * _1536;
    float _1566 = _1530 * _1536;
    float _1568 = fma(_1564, -0.5, 0.5);
    float _1570 = fma(_1566, 0.5, 0.5);
    float _1572 = _1552 * 0.693147182464599609375;
    float _1574 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4513 = float3(_1570, _1568, _1574);
    float _1576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4513, float3(0.0), isnan(_4513)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4513, float3(0.0), isnan(_4513)), level(0.0)).x;
    float3 _4524 = float3(_1570, _1568, _1574);
    float4 _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4524, float3(0.0), isnan(_4524)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4524, float3(0.0), isnan(_4524)), level(0.0)).xyzw;
    float _1581 = _1579.x;
    float _1583 = _1579.y;
    float _1585 = _1579.z;
    float _1587 = _1579.w;
    float2 _4540 = float2(_1562, _1558);
    float3 _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4540, float2(0.0), isnan(_4540)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4540, float2(0.0), isnan(_4540)), level(0.0)).xyz;
    float _1593 = _1591.x;
    float _1595 = _1591.y;
    float _1597 = _1591.z;
    float _1599 = _988 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1601 = _988 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1605 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1607 = isnan(_1270);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1613 = _1609 || _1611;
    float _1615 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1599);
    float _1617 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1619 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1621 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1603);
    float _1623 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1625 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1617);
    float _1627 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1621);
    float _1629 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1631 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1633 = exp2(_1619);
    float _1635 = _1631 + _1629;
    float _1637 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    float _1639 = _1490 * 0.5;
    float _1641 = _1637 + _1490;
    float _1643 = 1.0 / _1629;
    float _1645 = fma(_1546, -0.5, _1639);
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1637;
    out.gl_Position.w = _1490;
    float _1647 = _1641 * 0.5;
    float _1649 = -_1633;
    float _1651 = _1649 + 1.0;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1655 = _1635 * _1643;
    float _1657 = _1655 * 0.5;
    float _1659 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1661 = _1546;
    float _1663 = _1530;
    if (!_1613)
    {
        _1661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1665 = _1661;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1669 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1667);
    float _1671 = _1665;
    float _1673 = _1665;
    if (!_1613)
    {
        _1170 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1675 = _1170;
    float _1677 = 1.0 / _1669;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1681 = _1677 * _1679;
    float _1683 = abs(_1681);
    float _1685 = log2(_1683);
    bool _1687 = _1681 <= 8000.0;
    bool _1689 = isnan(_1681);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(8000.0);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1701 = exp2(_1699);
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    float _1707 = fma(_1705, -2.0, 3.0);
    float _1709 = _1705 * _1705;
    float _1711 = _1709 * _1707;
    float _1713 = in.m_81.x;
    float _1715 = -_1711;
    float _1717 = _1715 + 1.0;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1711);
    float _1721 = _1530 + _1490;
    float _1723 = _1697 * _1719;
    float _1725 = _1721 * 0.5;
    float _1727 = _1675;
    float _1729 = _1675;
    if (!_1613)
    {
        _1663 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1731 = _1663;
    float _1733 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _1725;
    out.m_83.y = _1645;
    out.m_83.z = _1647;
    out.m_83.w = _1490;
    float _1735 = -_1556;
    float _1737 = _1735 + 1.0;
    float _1739 = _1737 * _1733;
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = -_1741;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1747 = _1745 * _1713;
    float _1749 = _1747 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _1749;
    float _1751 = _1653 * _1576;
    float _1753 = -_1653;
    float _1755 = _1753 + 1.0;
    float _1757 = _1587 * _1751;
    float _1759 = _1597 * _1751;
    float _1761 = _1587 * _1755;
    float _1763 = fma(_1593, _1757, _1581);
    float _1765 = fma(_1595, _1757, _1583);
    float _1767 = fma(_1587, _1759, _1585);
    out.m_87.x = _1763;
    out.m_87.y = _1765;
    out.m_87.z = _1767;
    out.m_87.w = _1761;
    bool _1769 = !_1613;
    float _1771 = _1731;
    float _1773 = _1731;
    if (!_1769)
    {
        bool _1775 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1777 = isnan(_1270);
        bool _1779 = _1775 || _1777;
        bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1783 = _1779 || _1781;
        if (!_1783)
        {
            float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1787 = _1270 + _1785;
            float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1791 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1789;
            float _1793 = 1.0 / _1791;
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1803 = _1787 * _1793;
            float _1805 = precise::clamp(_1803, 0.0, 1.0);
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1811 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1813 = fma(_1805, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1815 = fma(_1805, _1797, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1773 = _1815;
            _1673 = _1813;
            _1729 = _1811;
            _1817 = true;
        }
        else
        {
            bool _1819 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1821 = isnan(_1270);
            bool _1823 = _1819 || _1821;
            bool _1825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1827 = _1823 || _1825;
            if (!_1827)
            {
                _1671 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1829 = _1671;
            _1673 = _1829;
            if (!_1827)
            {
                _1771 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1831 = _1771;
            _1773 = _1831;
            if (!_1827)
            {
                _1727 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1833 = _1727;
            bool _1835 = !_1827;
            _1729 = _1833;
            if (!_1835)
            {
                bool _1837 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1839 = isnan(_1270);
                bool _1841 = _1837 || _1839;
                bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1845 = _1841 || _1843;
                if (!_1845)
                {
                    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1849 = _1270 + _1847;
                    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1851;
                    float _1855 = 1.0 / _1853;
                    float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1859 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1865 = _1849 * _1855;
                    float _1867 = precise::clamp(_1865, 0.0, 1.0);
                    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1873 = fma(_1867, _1863, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1875 = fma(_1867, _1871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1877 = fma(_1867, _1859, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1773 = _1877;
                    _1673 = _1875;
                    _1729 = _1873;
                    _1817 = true;
                }
                else
                {
                    _1773 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1673 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1729 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1817 = false;
    float _1879 = _1773;
    float _1881 = _1673;
    float _1883 = _1729;
    float _1885 = _1879 * 0.586610972881317138671875;
    bool _1887 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1889 = _1659 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1891 = fma(_1881, 0.298911988735198974609375, _1885);
    out.m_89.x = 0.0;
    float _1893 = fma(_1883, 0.114477999508380889892578125, _1891);
    out.m_51.x = _1889;
    float _1895 = -_1893;
    float _1897 = _1895 + _1881;
    float _1899 = -_1893;
    float _1901 = _1899 + _1879;
    float _1903 = -_1893;
    float _1905 = _1903 + _1883;
    float _1907 = fma(_1897, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    float _1909 = fma(_1901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    float _1911 = fma(_1905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    out.m_91.x = _1907;
    out.m_91.y = _1909;
    out.m_91.z = _1911;
    if (!_1887)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1913 = -_1240;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1917 = -_1246;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1921 = -_1252;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1925 = _1915 * _1915;
    float _1927 = fma(_1919, _1919, _1925);
    float _1929 = fma(_1923, _1923, _1927);
    float _1931 = sqrt(_1929);
    float _1933 = rsqrt(_1929);
    float _1935 = -_1931;
    float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = _1919 * _1933;
    float _1945 = _1915 * _1933;
    float _1947 = abs(_1941);
    float _1949 = log2(_1947);
    float _1951 = _1923 * _1933;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1955 = _1096 * _1945;
    float _1957 = -_1945;
    float _1959 = -_1953;
    float _1961 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1959);
    float _1963 = fma(_1094, _1943, _1955);
    float _1965 = -_1951;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1961);
    float _1969 = fma(_1110, _1951, _1963);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1975 = _1967 + _1973;
    float _1977 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1979 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1981 = precise::clamp(_1979, 0.0, 1.0);
    float _1983 = exp2(_1977);
    float _1985 = _1983 * _1981;
    float _1987 = _1971 * _1985;
    float _1989 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1991 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1993 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _1989;
    out.m_89.y = _1991;
    out.m_89.z = _1993;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1817 = false;
    bool _1200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
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
    float _122 = _120;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_128);
        out.gl_Position.z = _2051;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_53.w;
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
        _122 = _146;
    }
    float _148 = _122;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_162);
        out.gl_Position.z = _2119;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_55.x;
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _168 = in.m_57.x;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _172 = _170 != 0;
    float _174 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _176 = in.m_57.w;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _184 = in.m_55.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _196 = _194 != 0;
    float _198 = in.m_57.y;
    float _200 = _174 * _166;
    bool _202 = !_188;
    int _204 = _202 ? 0 : 1;
    float _206 = in.m_59.x;
    float _208 = in.m_59.y;
    float _210 = in.m_59.z;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _214 = _212 != 0;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _218 = !_192;
    int _220 = _218 ? 0 : 1;
    int _222 = as_type<int>(_166);
    bool _224 = _154;
    float _226 = _200;
    float _228 = _164;
    if (_172)
    {
        float _230 = -_164;
        float _232 = _230 + 1.0;
        _222 = as_type<int>(_232);
    }
    int _234 = _222;
    float _236 = in.m_57.z;
    float _238 = 0.0;
    if (!_172)
    {
        _238 = _164;
    }
    float _240 = _238;
    float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _244 = _240;
    float _246 = _242;
    if (_172)
    {
        bool _248 = _168 > 0.5;
        _224 = _248;
    }
    bool _250 = _224;
    float _252 = in.m_61.x;
    float _254 = in.m_61.y;
    float _256 = in.m_61.z;
    float _258 = _182;
    if (_172)
    {
        float _260 = _250 ? as_type<float>(_234) : _164;
        _244 = _260;
    }
    float _262 = _244;
    float _264 = in.m_63.y;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _268 = _266 != 0;
    float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _272 = _176 > 0.5;
    float _274 = -_184;
    float _276 = _274 + 1.0;
    float _278 = in.m_48.x;
    float _280 = in.m_48.y;
    float _282 = in.m_48.z;
    bool _284 = _198 > 0.5;
    int _286 = _272 ? as_type<int>(_276) : as_type<int>(_184);
    float _288 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = _208 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = 0.0;
    if (_268)
    {
        float _294 = in.m_57.z;
        _292 = _294;
    }
    float _296 = _292;
    int _298 = _284 ? as_type<int>(_276) : as_type<int>(_184);
    float _300 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _302 = _236 > 0.5;
    float _304 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _306 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = _214 ? as_type<float>(_298) : _184;
    float _310 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _312 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _316 = _314 != 0;
    float _318 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _304);
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _322 = _320 != 0;
    float _324 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    int _326 = _302 ? as_type<int>(_276) : as_type<int>(_184);
    float _328 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _310);
    float _330 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _312);
    float _332 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _334 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _336 = _316 ? _286 : as_type<int>(_184);
    float _338 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = _322 ? as_type<float>(_326) : _184;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _346 = _344 != 0;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _352 = _350 != 0;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _358 = _356 != 0;
    float _360 = -_216;
    float _362 = fma(_332, 2.0, _360);
    float _364 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _366 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _334);
    float _368 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _376 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _378 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _358 ? as_type<float>(_326) : _184;
    float _382 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _384 = _358;
    int _386 = _336;
    if (_268)
    {
        bool _388 = _296 > 0.5;
        _384 = _388;
    }
    bool _390 = _384;
    float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _394 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _396 = fma(_364, -2.0, _370);
    float _398 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _324);
    float _400 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _402 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _366);
    float _404 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _406 = in.m_63.x;
    float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _410 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _412 = in.m_63.z;
    float _414 = _182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _416 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    float _418 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _396);
    float _420 = in.m_63.w;
    float _422 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _318);
    float _424 = fma(_414, _308, -0.5);
    float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_65.x = _372;
    out.m_65.y = _376;
    out.m_65.z = _378;
    out.m_65.w = _374;
    float _428 = _410;
    int _430 = as_type<int>(_418);
    int _432 = as_type<int>(_392);
    if (_196)
    {
        _428 = _168;
    }
    float _434 = _428;
    float _436 = _434;
    if (!_268)
    {
        _258 = _164;
    }
    float _438 = _258;
    float _440 = _408 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _444 = _392 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _446 = _242 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _448 = fma(_440, as_type<float>(_336), -0.5);
    float _450 = _438;
    if (_196)
    {
        _246 = _198;
    }
    float _452 = _246;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _456 = fma(_446, _380, -0.5);
    float _458 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _454);
    float _460 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    float _462 = fma(_444, _340, -0.5);
    float _464 = -_418;
    float _466 = fma(_460, _424, _464);
    int _468 = as_type<int>(_460);
    float _470 = _452;
    if (_268)
    {
        float _472 = -_164;
        float _474 = _472 + 1.0;
        _430 = as_type<int>(_474);
    }
    int _476 = _430;
    if (_196)
    {
        _432 = 0;
        _468 = 0;
    }
    int _478 = _432;
    int _480 = _468;
    int _482 = _478;
    int _484 = _480;
    if (!_196)
    {
        float _486 = _168 * 3.1415927410125732421875;
        float _488 = _486 * 0.15915493667125701904296875;
        float _490 = _198 * 3.1415927410125732421875;
        float _492 = _490 * 0.15915493667125701904296875;
        float _494 = _488 * 6.283185482025146484375;
        float _496 = sin(_494);
        float _498 = _492 * 6.283185482025146484375;
        float _500 = sin(_498);
        _482 = 1;
        _484 = 2;
        _436 = _496;
        _470 = _500;
    }
    int _502 = _482;
    int _504 = _484;
    float _506 = _436;
    float _508 = _470;
    if (_268)
    {
        float _510 = _390 ? as_type<float>(_476) : _164;
        _450 = _510;
    }
    float _512 = _450;
    float _514 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[20].x, _200);
    bool _516 = _502 != 1;
    out.m_67.y = _264;
    bool _518 = _504 != 2;
    float _520 = floor(_514);
    if (_346)
    {
        float _522 = -_164;
        float _524 = _522 + 1.0;
        _386 = as_type<int>(_524);
    }
    int _526 = _386;
    float _528 = in.m_69.x;
    float _530 = in.m_69.y;
    float _532 = in.m_69.z;
    int _534 = 0;
    if (_352)
    {
        float _536 = -_164;
        float _538 = _536 + 1.0;
        _534 = as_type<int>(_538);
    }
    int _540 = _534;
    if (!_346)
    {
        _226 = _164;
    }
    float _542 = _226;
    float _544 = _442 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_67.z = _412;
    float _546 = _542;
    if (_346)
    {
        float _548 = _284 ? as_type<float>(_526) : _164;
        _546 = _548;
    }
    float _550 = _546;
    float _552 = rsqrt(_422);
    if (_352)
    {
        float _554 = _284 ? as_type<float>(_540) : _164;
        _228 = _554;
    }
    float _556 = _228;
    out.m_67.x = _406;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _560 = fma(_544, _550, -0.5);
    float _562 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[93].z, _558);
    out.m_67.w = _420;
    float _564 = _506 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _566 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _568 = -_520;
    float _570 = _514 + _568;
    float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _576 = abs(_204);
    float _578 = _566 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _580 = -_574;
    float _582 = fma(_564, 2.0, _580);
    float _584 = float(_576);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _588 = -_570;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _592 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[191].y, _578);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _596 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[93].w, _586);
    float _598 = abs(_590);
    float _600 = _584 * _598;
    float _602 = _592 * 0.15915493667125701904296875;
    float _604 = _508 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _606 = _270 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _608 = _394 * _394;
    float _610 = fma(_604, -2.0, _594);
    float _612 = _426 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _614 = _602 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = fma(_398, _398, _608);
    float _620 = fma(_606, _262, -0.5);
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _624 = fma(_612, _512, -0.5);
    float _626 = _552 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _628 = fma(_400, _400, _618);
    float _630 = _572 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _632 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].z, _622);
    float _634 = _626 * (-0.15915493667125701904296875);
    float _636 = -_144;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[76].x, _362);
    float _640 = fma(_630, _556, -0.5);
    float _642 = rsqrt(_628);
    float _644 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _646 = 0.0;
    float _648 = _562;
    float _650 = _600;
    if (!_516)
    {
        _646 = _198;
    }
    float _652 = _646;
    float _654 = -_144;
    float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[91].x, _582);
    float _658 = _616 * _530;
    float _660 = fma(_644, _620, _638);
    float _662 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].w, _596);
    float _664 = _634 * 6.283185482025146484375;
    float _666 = sin(_664);
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[191].x, _528);
    float _670 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].z, _562);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _674 = _652;
    float _676 = _670;
    if (!_516)
    {
        _648 = _652;
    }
    float _678 = _648;
    float _680 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[91].y, _610);
    float _682 = fma(_670, _640, _656);
    float _684 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _672);
    float _686 = _634 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = _678;
    if (_516)
    {
        _674 = _198;
    }
    float _692 = _674;
    float _694 = _398 * _642;
    float _696 = _692;
    if (_518)
    {
        _676 = _168;
    }
    float _698 = _676;
    float _700 = _394 * _642;
    float _702 = _400 * _642;
    float _704 = _698;
    if (!_518)
    {
        _704 = _236;
    }
    float _706 = _704;
    float _708 = -_680;
    float _710 = fma(_662, _456, _708);
    float _712 = _666 * _532;
    float _714 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _716 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _720 = _688 * _532;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _724 = -_712;
    float _726 = fma(_688, _530, _724);
    float _728 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _706 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _732 = fma(_666, _530, _720);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _736 = _702 * _734;
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _740 = -_722;
    float _742 = fma(_730, 2.0, _740);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _746 = _700 * _744;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _750 = -_736;
    float _752 = fma(_694, _748, _750);
    float _754 = _728 * _738;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _758 = _694 * _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _762 = -_746;
    float _764 = fma(_702, _760, _762);
    float _766 = _752 * _752;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _770 = -_758;
    float _772 = fma(_700, _768, _770);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _776 = fma(_764, _764, _766);
    float _778 = _766;
    float _780 = _722;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (!_516)
    {
        _778 = _678;
    }
    float _784 = _778;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _788 = _784;
    if (_516)
    {
        _690 = _168;
    }
    float _790 = _690;
    float _792 = fma(_772, _772, _776);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_516)
    {
        _780 = _236;
    }
    float _796 = _780;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _800 = rsqrt(_792);
    float _802 = _796;
    if (!_516)
    {
        _782 = _236;
    }
    float _804 = _782;
    float _806 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[88].z, _794);
    float _808 = _804;
    if (_516)
    {
        _802 = _692;
    }
    float _810 = _802;
    float _812 = _716 * _774;
    if (_516)
    {
        _808 = _692;
    }
    float _814 = _808;
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _786);
    if (_516)
    {
        _788 = _168;
    }
    float _818 = _788;
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _798);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    if (!_518)
    {
        _696 = _168;
    }
    float _824 = _696;
    float _826 = _812 * _694;
    float _828 = _812 * _702;
    float _830 = _714 * _822;
    float _832 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _834 = _818 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _836 = _752 * _800;
    float _838 = _772 * _800;
    float _840 = _764 * _800;
    float _842 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _806);
    float _844 = _694 * _836;
    float _846 = _700 * _838;
    float _848 = fma(_754, _840, _826);
    float _850 = fma(_754, _838, _828);
    float _852 = -_844;
    float _854 = fma(_700, _840, _852);
    float _856 = -_846;
    float _858 = fma(_702, _836, _856);
    float _860 = -_144;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[86].x, _742);
    float _864 = fma(_830, _854, _850);
    float _866 = fma(_830, _858, _848);
    float _868 = fma(_842, _560, _862);
    float _870 = _814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = _832 + _864;
    float _874 = _718 + _866;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _878 = _726 != 0.0;
    bool _880 = isnan(_726);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _890 = _872 + _888;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _874 + _892;
    float _896 = -_876;
    float _898 = fma(_834, 2.0, _896);
    bool _900 = _668 == 0.0;
    bool _902 = !_886;
    bool _904 = _900 && _902;
    float _906 = _890 * _890;
    float _908 = _894 * _894;
    float _910 = in.m_71.x;
    float _912 = in.m_71.y;
    float _914 = in.m_71.z;
    float _916 = _824 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _918 = _908 + _906;
    bool _920 = _732 == 0.0;
    bool _922 = _920 && _904;
    float _924 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _816);
    float _926 = sqrt(_918);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _930 = -_144;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _934 = _812 * _700;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _938 = fma(_870, -2.0, _928);
    float _940 = fma(_924, _624, _932);
    float _942 = _702 * _840;
    float _944 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _684);
    float _946 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _820);
    float _948 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _938);
    float _950 = fma(_916, -2.0, _936);
    float _952 = fma(_754, _836, _934);
    float _954 = -_942;
    float _956 = fma(_694, _838, _954);
    float _958 = -_948;
    float _960 = fma(_946, _448, _958);
    float _962 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _950);
    bool _964 = _926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = _912;
    float _968 = _910;
    float _970 = _908;
    float _972 = _906;
    float _974 = _874;
    float _976 = _872;
    float _978 = _914;
    float _980 = _894;
    if (!_922)
    {
        float _982 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _912);
        _966 = _982;
    }
    float _984 = _966;
    float _986 = fma(_830, _956, _952);
    float _988 = _402 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _990 = _694 * _984;
    float _992 = _700 * _984;
    float _994 = _702 * _984;
    float _996 = _514 * 6.283185482025146484375;
    float _998 = -_962;
    float _1000 = fma(_944, _462, _998);
    if (!_922)
    {
        float _1002 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _910);
        _968 = _1002;
    }
    float _1004 = _968;
    float _1006 = _988 + _986;
    bool _1008 = !_964;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _926 + _1014;
        float _1018 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = rsqrt(_918);
        float _1022 = _1016 * _1012;
        float _1024 = _1022 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1020 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_894, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_890, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1048 = _1040 + _1046;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1052 = _1042 + _1050;
        float _1054 = fma(_1006, _1032, _1044);
        float _1056 = _1048 * _1048;
        float _1058 = _1052 * _1052;
        _1010 = _1054;
        _970 = _1056;
        _972 = _1058;
        _974 = _1040;
        _976 = _1042;
    }
    float _1060 = _1010;
    float _1062 = _970;
    float _1064 = _972;
    float _1066 = _974;
    float _1068 = _976;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1072 = _1060 + _1070;
    float _1074 = _996 * 0.15915493667125701904296875;
    float _1076 = fma(_840, _1004, _990);
    if (!_922)
    {
        float _1078 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _978 = _1078;
    }
    float _1080 = _978;
    float _1082 = fma(_1072, _1072, _1062);
    float _1084 = fma(_836, _1004, _992);
    float _1086 = fma(_838, _1004, _994);
    float _1088 = _1074 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1082 + _1064;
    float _1094 = fma(_858, _1080, _1076);
    float _1096 = fma(_956, _1080, _1084);
    float _1098 = _682 + 0.5;
    float _1100 = _660 + 0.5;
    float _1102 = _710 + 0.5;
    float _1104 = _868 + 0.5;
    float _1106 = sqrt(_1092);
    float _1108 = _1000 + 0.5;
    float _1110 = fma(_854, _1080, _1086);
    bool _1112 = !_180;
    int _1114 = _1112 ? 0 : 1;
    out.m_73.x = _1098;
    out.m_73.y = _1102;
    int _1116 = abs(_220);
    float _1118 = _466 + 0.5;
    int _1120 = abs(_1114);
    out.m_75.x = _1104;
    out.m_75.y = _1108;
    float _1122 = fma(_1090, 0.5, 0.5);
    float _1124 = _940 + 0.5;
    out.m_77.x = _1094;
    out.m_77.y = _1096;
    out.m_77.z = _1110;
    float _1126 = _960 + 0.5;
    bool _1128 = _570 < 0.5;
    float _1130 = float(_1128);
    float _1132 = -_1122;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1136 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1138 = isnan(_1106);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1120);
    out.m_79.x = _1100;
    out.m_79.y = _1118;
    out.m_79.z = _1124;
    out.m_79.w = _1126;
    float _1148 = -_1130;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1152 = fma(_1146, _1134, _600);
    float _1154 = as_type<float>(_1116);
    float _1156 = _1108;
    if (!_1144)
    {
        _650 = 1.0;
    }
    float _1158 = _650;
    float _1160 = float(_1116);
    float _1162 = abs(_1150);
    float _1164 = fma(_1160, _1162, _1152);
    bool _1166 = !_1144;
    float _1168 = _1158;
    float _1170 = _1164;
    if (!_1166)
    {
        bool _1172 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1106);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1106 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1106);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1106 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1228;
                _1200 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1168;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1234 = _1060 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1238 = _1066 + _1236;
    float _1240 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1244 = _1068 + _1242;
    float _1246 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1250 = _1240 + _1248;
    float _1252 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1246 + _1254;
    float _1258 = _1250 * _1250;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1252 + _1260;
    float _1264 = fma(_1256, _1256, _1258);
    float _1266 = fma(_1262, _1262, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = sqrt(_1266);
    float _1272 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1274 = _1256 * _1272;
    float _1276 = _1262 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 * _1276;
    float _1282 = _1278 + _1280;
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1284 + _1288;
    float _1292 = _1262;
    float _1294 = _1290;
    float _1296 = _1250;
    if (_1286)
    {
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1298;
    }
    float _1300 = _1292;
    if (_1286)
    {
        float _1302 = rsqrt(_1282);
        _1154 = _1302;
    }
    float _1304 = _1154;
    float _1306 = _1304;
    if (_1286)
    {
        float _1308 = _1290 * _1300;
        _1294 = _1308;
    }
    float _1310 = _1294;
    if (_1286)
    {
        float _1312 = _1310 * 0.15915493667125701904296875;
        _1156 = _1312;
    }
    float _1314 = _1156;
    float _1316 = _1268;
    float _1318 = _1314;
    if (_1286)
    {
        float _1320 = _1314 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        _1316 = _1322;
    }
    float _1324 = _1316;
    float _1326 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1328 = precise::max(0.0, _1326);
    float _1330 = _1264;
    float _1332 = _1328;
    float _1334 = _1326;
    if (_1286)
    {
        float _1336 = _1314 * 6.283185482025146484375;
        float _1338 = cos(_1336);
        _1330 = _1338;
    }
    float _1340 = _1330;
    float _1342 = -_1272;
    float _1344 = -_1328;
    float _1346 = fma(_1250, _1342, _1344);
    float _1348 = _1346;
    if (!_1286)
    {
        _1332 = _1276;
    }
    float _1350 = _1332;
    float _1352 = _1350;
    if (_1286)
    {
        float _1354 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1354;
    }
    float _1356 = _1334;
    float _1358 = _1324;
    float _1360 = _1356;
    if (_1286)
    {
        float _1362 = fma(_1324, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1362;
    }
    float _1364 = _1296;
    float _1366 = _1364;
    if (!_1286)
    {
        _1358 = _1274;
    }
    float _1368 = _1358;
    float _1370 = _1368;
    if (_1286)
    {
        float _1372 = _1340 + (-1.0);
        _1360 = _1372;
    }
    float _1374 = _1360;
    if (_1286)
    {
        float _1376 = _1304 * _1364;
        _980 = _1376;
    }
    float _1378 = _980;
    if (!_1286)
    {
        _1306 = _1278;
    }
    float _1380 = _1306;
    float _1382 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = _1380;
    if (_1286)
    {
        float _1386 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1386;
    }
    float _1388 = _1318;
    if (_1286)
    {
        float _1390 = _1274 * _1378;
        _1370 = _1390;
    }
    float _1392 = _1370;
    if (_1286)
    {
        float _1394 = _1276 * _1378;
        _1352 = _1394;
    }
    float _1396 = _1352;
    if (!_1286)
    {
        _1366 = _1280;
    }
    float _1398 = _1366;
    float _1400 = _1398;
    if (_1286)
    {
        float _1402 = fma(_1346, _1340, _1388);
        _1348 = _1402;
    }
    float _1404 = _1348;
    if (_1286)
    {
        float _1406 = _1392 * _1392;
        _1384 = _1406;
    }
    float _1408 = _1384;
    if (_1286)
    {
        float _1410 = _1396 * _1396;
        _1400 = _1410;
    }
    float _1412 = _1400;
    float _1414 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1416 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1418 = fma(_1404, _1404, _1408);
    float _1420 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1422 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1414);
    float _1424 = _1418 + _1412;
    float _1426 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1428 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1422);
    float _1430 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1416);
    float _1432 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1420);
    float _1434 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1426);
    float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1438 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1436);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = rsqrt(_1424);
    float _1444 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1434);
    float _1446 = -_1440;
    float _1448 = _1446 + 1.0;
    float _1450 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1452 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1454 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1430);
    float _1456 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1460 = abs(_1448);
    float _1462 = log2(_1460);
    float _1464 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1466 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1468 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1458);
    float _1472 = _1442 * _1392;
    float _1474 = _1442 * _1404;
    float _1476 = _1442 * _1396;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1480 = floor(_1466);
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1470);
    float _1484 = -_1478;
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1484);
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1482);
    float _1492 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1494 = -_1476;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1486);
    float _1498 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = floor(_1452);
    float _1502 = fma(_1496, -0.5, 0.5);
    float _1504 = -_1498;
    float _1506 = fma(_1504, _1488, 1.0);
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1512 = -_1480;
    float _1514 = _1466 + _1512;
    float _1516 = exp2(_1492);
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1510);
    float _1520 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1522 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1518);
    float _1524 = fma(_1508, _1520, -0.212114393711090087890625);
    float _1526 = sqrt(_1502);
    float _1528 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1522);
    float _1532 = fma(_1508, _1524, 1.570728778839111328125);
    float _1534 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1536 = 1.0 / _1490;
    float _1538 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1534);
    float _1540 = -_1500;
    float _1542 = _1452 + _1540;
    float _1544 = _1474 + 1.0;
    float _1546 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1538);
    float _1548 = -_1474;
    float _1550 = fma(_1516, _1544, _1548);
    float _1552 = log2(_1506);
    float _1554 = _1526 * 0.636619746685028076171875;
    float2 _4478 = float2(_1514, _1542);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4478, float2(0.0), isnan(_4478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4478, float2(0.0), isnan(_4478)), level(0.0)).x;
    float _1558 = fma(_1550, 0.5, 0.5);
    float _1560 = -_1532;
    float _1562 = fma(_1554, _1560, 1.0);
    float _1564 = _1546 * _1536;
    float _1566 = _1530 * _1536;
    float _1568 = fma(_1564, -0.5, 0.5);
    float _1570 = fma(_1566, 0.5, 0.5);
    float _1572 = _1552 * 0.693147182464599609375;
    float _1574 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4513 = float3(_1570, _1568, _1574);
    float _1576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4513, float3(0.0), isnan(_4513)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4513, float3(0.0), isnan(_4513)), level(0.0)).x;
    float3 _4524 = float3(_1570, _1568, _1574);
    float4 _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4524, float3(0.0), isnan(_4524)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4524, float3(0.0), isnan(_4524)), level(0.0)).xyzw;
    float _1581 = _1579.x;
    float _1583 = _1579.y;
    float _1585 = _1579.z;
    float _1587 = _1579.w;
    float2 _4540 = float2(_1562, _1558);
    float3 _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4540, float2(0.0), isnan(_4540)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4540, float2(0.0), isnan(_4540)), level(0.0)).xyz;
    float _1593 = _1591.x;
    float _1595 = _1591.y;
    float _1597 = _1591.z;
    float _1599 = _988 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1601 = _988 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1605 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1607 = isnan(_1270);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1613 = _1609 || _1611;
    float _1615 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1599);
    float _1617 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1619 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1621 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1603);
    float _1623 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1625 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1617);
    float _1627 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1621);
    float _1629 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1631 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1633 = exp2(_1619);
    float _1635 = _1631 + _1629;
    float _1637 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    float _1639 = _1490 * 0.5;
    float _1641 = _1637 + _1490;
    float _1643 = 1.0 / _1629;
    float _1645 = fma(_1546, -0.5, _1639);
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1637;
    out.gl_Position.w = _1490;
    float _1647 = _1641 * 0.5;
    float _1649 = -_1633;
    float _1651 = _1649 + 1.0;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1655 = _1635 * _1643;
    float _1657 = _1655 * 0.5;
    float _1659 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1661 = _1546;
    float _1663 = _1530;
    if (!_1613)
    {
        _1661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1665 = _1661;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1669 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1667);
    float _1671 = _1665;
    float _1673 = _1665;
    if (!_1613)
    {
        _1170 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1675 = _1170;
    float _1677 = 1.0 / _1669;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1681 = _1677 * _1679;
    float _1683 = abs(_1681);
    float _1685 = log2(_1683);
    bool _1687 = _1681 <= 8000.0;
    bool _1689 = isnan(_1681);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(8000.0);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1701 = exp2(_1699);
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    float _1707 = fma(_1705, -2.0, 3.0);
    float _1709 = _1705 * _1705;
    float _1711 = _1709 * _1707;
    float _1713 = in.m_81.x;
    float _1715 = -_1711;
    float _1717 = _1715 + 1.0;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1711);
    float _1721 = _1530 + _1490;
    float _1723 = _1697 * _1719;
    float _1725 = _1721 * 0.5;
    float _1727 = _1675;
    float _1729 = _1675;
    if (!_1613)
    {
        _1663 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1731 = _1663;
    float _1733 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _1725;
    out.m_83.y = _1645;
    out.m_83.z = _1647;
    out.m_83.w = _1490;
    float _1735 = -_1556;
    float _1737 = _1735 + 1.0;
    float _1739 = _1737 * _1733;
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = -_1741;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1747 = _1745 * _1713;
    float _1749 = _1747 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _1749;
    float _1751 = _1653 * _1576;
    float _1753 = -_1653;
    float _1755 = _1753 + 1.0;
    float _1757 = _1587 * _1751;
    float _1759 = _1597 * _1751;
    float _1761 = _1587 * _1755;
    float _1763 = fma(_1593, _1757, _1581);
    float _1765 = fma(_1595, _1757, _1583);
    float _1767 = fma(_1587, _1759, _1585);
    out.m_87.x = _1763;
    out.m_87.y = _1765;
    out.m_87.z = _1767;
    out.m_87.w = _1761;
    bool _1769 = !_1613;
    float _1771 = _1731;
    float _1773 = _1731;
    if (!_1769)
    {
        bool _1775 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1777 = isnan(_1270);
        bool _1779 = _1775 || _1777;
        bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1783 = _1779 || _1781;
        if (!_1783)
        {
            float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1787 = _1270 + _1785;
            float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1791 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1789;
            float _1793 = 1.0 / _1791;
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1803 = _1787 * _1793;
            float _1805 = precise::clamp(_1803, 0.0, 1.0);
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1811 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1813 = fma(_1805, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1815 = fma(_1805, _1797, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1773 = _1815;
            _1673 = _1813;
            _1729 = _1811;
            _1817 = true;
        }
        else
        {
            bool _1819 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1821 = isnan(_1270);
            bool _1823 = _1819 || _1821;
            bool _1825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1827 = _1823 || _1825;
            if (!_1827)
            {
                _1671 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1829 = _1671;
            _1673 = _1829;
            if (!_1827)
            {
                _1771 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1831 = _1771;
            _1773 = _1831;
            if (!_1827)
            {
                _1727 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1833 = _1727;
            bool _1835 = !_1827;
            _1729 = _1833;
            if (!_1835)
            {
                bool _1837 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1839 = isnan(_1270);
                bool _1841 = _1837 || _1839;
                bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1845 = _1841 || _1843;
                if (!_1845)
                {
                    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1849 = _1270 + _1847;
                    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1851;
                    float _1855 = 1.0 / _1853;
                    float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1859 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1865 = _1849 * _1855;
                    float _1867 = precise::clamp(_1865, 0.0, 1.0);
                    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1873 = fma(_1867, _1863, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1875 = fma(_1867, _1871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1877 = fma(_1867, _1859, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1773 = _1877;
                    _1673 = _1875;
                    _1729 = _1873;
                    _1817 = true;
                }
                else
                {
                    _1773 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1673 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1729 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1817 = false;
    float _1879 = _1773;
    float _1881 = _1673;
    float _1883 = _1729;
    float _1885 = _1879 * 0.586610972881317138671875;
    bool _1887 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1889 = _1659 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1891 = fma(_1881, 0.298911988735198974609375, _1885);
    out.m_89.x = 0.0;
    float _1893 = fma(_1883, 0.114477999508380889892578125, _1891);
    out.m_51.x = _1889;
    float _1895 = -_1893;
    float _1897 = _1895 + _1881;
    float _1899 = -_1893;
    float _1901 = _1899 + _1879;
    float _1903 = -_1893;
    float _1905 = _1903 + _1883;
    float _1907 = fma(_1897, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    float _1909 = fma(_1901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    float _1911 = fma(_1905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    out.m_91.x = _1907;
    out.m_91.y = _1909;
    out.m_91.z = _1911;
    if (!_1887)
    {
        return out;
    }
    float _1913 = -_1240;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1917 = -_1246;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1921 = -_1252;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1925 = _1915 * _1915;
    float _1927 = fma(_1919, _1919, _1925);
    float _1929 = fma(_1923, _1923, _1927);
    float _1931 = sqrt(_1929);
    float _1933 = rsqrt(_1929);
    float _1935 = -_1931;
    float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = _1919 * _1933;
    float _1945 = _1915 * _1933;
    float _1947 = abs(_1941);
    float _1949 = log2(_1947);
    float _1951 = _1923 * _1933;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1955 = _1096 * _1945;
    float _1957 = -_1945;
    float _1959 = -_1953;
    float _1961 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1959);
    float _1963 = fma(_1094, _1943, _1955);
    float _1965 = -_1951;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1961);
    float _1969 = fma(_1110, _1951, _1963);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1975 = _1967 + _1973;
    float _1977 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1979 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1981 = precise::clamp(_1979, 0.0, 1.0);
    float _1983 = exp2(_1977);
    float _1985 = _1983 * _1981;
    float _1987 = _1971 * _1985;
    float _1989 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1991 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1993 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _1989;
    out.m_89.y = _1991;
    out.m_89.z = _1993;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1817 = false;
    bool _1200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
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
    float _122 = _120;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_128);
        out.gl_Position.z = _2051;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
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
        _122 = _146;
    }
    float _148 = _122;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_162);
        out.gl_Position.z = _2119;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_55.x;
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _168 = in.m_57.x;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _172 = _170 != 0;
    float _174 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _176 = in.m_57.w;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _184 = in.m_55.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _196 = _194 != 0;
    float _198 = in.m_57.y;
    float _200 = _174 * _166;
    bool _202 = !_188;
    int _204 = _202 ? 0 : 1;
    float _206 = in.m_59.x;
    float _208 = in.m_59.y;
    float _210 = in.m_59.z;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _214 = _212 != 0;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _218 = !_192;
    int _220 = _218 ? 0 : 1;
    int _222 = as_type<int>(_166);
    bool _224 = _154;
    float _226 = _200;
    float _228 = _164;
    if (_172)
    {
        float _230 = -_164;
        float _232 = _230 + 1.0;
        _222 = as_type<int>(_232);
    }
    int _234 = _222;
    float _236 = in.m_57.z;
    float _238 = 0.0;
    if (!_172)
    {
        _238 = _164;
    }
    float _240 = _238;
    float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _244 = _240;
    float _246 = _242;
    if (_172)
    {
        bool _248 = _168 > 0.5;
        _224 = _248;
    }
    bool _250 = _224;
    float _252 = in.m_61.x;
    float _254 = in.m_61.y;
    float _256 = in.m_61.z;
    float _258 = _182;
    if (_172)
    {
        float _260 = _250 ? as_type<float>(_234) : _164;
        _244 = _260;
    }
    float _262 = _244;
    float _264 = in.m_63.y;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _268 = _266 != 0;
    float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _272 = _176 > 0.5;
    float _274 = -_184;
    float _276 = _274 + 1.0;
    float _278 = in.m_48.x;
    float _280 = in.m_48.y;
    float _282 = in.m_48.z;
    bool _284 = _198 > 0.5;
    int _286 = _272 ? as_type<int>(_276) : as_type<int>(_184);
    float _288 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = _208 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = 0.0;
    if (_268)
    {
        float _294 = in.m_57.z;
        _292 = _294;
    }
    float _296 = _292;
    int _298 = _284 ? as_type<int>(_276) : as_type<int>(_184);
    float _300 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _302 = _236 > 0.5;
    float _304 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _306 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = _214 ? as_type<float>(_298) : _184;
    float _310 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _312 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _316 = _314 != 0;
    float _318 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _304);
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _322 = _320 != 0;
    float _324 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    int _326 = _302 ? as_type<int>(_276) : as_type<int>(_184);
    float _328 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _310);
    float _330 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _312);
    float _332 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _334 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _336 = _316 ? _286 : as_type<int>(_184);
    float _338 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = _322 ? as_type<float>(_326) : _184;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _346 = _344 != 0;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _352 = _350 != 0;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _358 = _356 != 0;
    float _360 = -_216;
    float _362 = fma(_332, 2.0, _360);
    float _364 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _366 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _334);
    float _368 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _376 = _348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _378 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _358 ? as_type<float>(_326) : _184;
    float _382 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _384 = _358;
    int _386 = _336;
    if (_268)
    {
        bool _388 = _296 > 0.5;
        _384 = _388;
    }
    bool _390 = _384;
    float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _394 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _396 = fma(_364, -2.0, _370);
    float _398 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _324);
    float _400 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _402 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _366);
    float _404 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _406 = in.m_63.x;
    float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _410 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _382);
    float _412 = in.m_63.z;
    float _414 = _182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _416 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    float _418 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _396);
    float _420 = in.m_63.w;
    float _422 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _318);
    float _424 = fma(_414, _308, -0.5);
    float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_65.x = _372;
    out.m_65.y = _376;
    out.m_65.z = _378;
    out.m_65.w = _374;
    float _428 = _410;
    int _430 = as_type<int>(_418);
    int _432 = as_type<int>(_392);
    if (_196)
    {
        _428 = _168;
    }
    float _434 = _428;
    float _436 = _434;
    if (!_268)
    {
        _258 = _164;
    }
    float _438 = _258;
    float _440 = _408 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _444 = _392 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _446 = _242 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _448 = fma(_440, as_type<float>(_336), -0.5);
    float _450 = _438;
    if (_196)
    {
        _246 = _198;
    }
    float _452 = _246;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _456 = fma(_446, _380, -0.5);
    float _458 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _454);
    float _460 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    float _462 = fma(_444, _340, -0.5);
    float _464 = -_418;
    float _466 = fma(_460, _424, _464);
    int _468 = as_type<int>(_460);
    float _470 = _452;
    if (_268)
    {
        float _472 = -_164;
        float _474 = _472 + 1.0;
        _430 = as_type<int>(_474);
    }
    int _476 = _430;
    if (_196)
    {
        _432 = 0;
        _468 = 0;
    }
    int _478 = _432;
    int _480 = _468;
    int _482 = _478;
    int _484 = _480;
    if (!_196)
    {
        float _486 = _168 * 3.1415927410125732421875;
        float _488 = _486 * 0.15915493667125701904296875;
        float _490 = _198 * 3.1415927410125732421875;
        float _492 = _490 * 0.15915493667125701904296875;
        float _494 = _488 * 6.283185482025146484375;
        float _496 = sin(_494);
        float _498 = _492 * 6.283185482025146484375;
        float _500 = sin(_498);
        _482 = 1;
        _484 = 2;
        _436 = _496;
        _470 = _500;
    }
    int _502 = _482;
    int _504 = _484;
    float _506 = _436;
    float _508 = _470;
    if (_268)
    {
        float _510 = _390 ? as_type<float>(_476) : _164;
        _450 = _510;
    }
    float _512 = _450;
    float _514 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[20].x, _200);
    bool _516 = _502 != 1;
    out.m_67.y = _264;
    bool _518 = _504 != 2;
    float _520 = floor(_514);
    if (_346)
    {
        float _522 = -_164;
        float _524 = _522 + 1.0;
        _386 = as_type<int>(_524);
    }
    int _526 = _386;
    float _528 = in.m_69.x;
    float _530 = in.m_69.y;
    float _532 = in.m_69.z;
    int _534 = 0;
    if (_352)
    {
        float _536 = -_164;
        float _538 = _536 + 1.0;
        _534 = as_type<int>(_538);
    }
    int _540 = _534;
    if (!_346)
    {
        _226 = _164;
    }
    float _542 = _226;
    float _544 = _442 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_67.z = _412;
    float _546 = _542;
    if (_346)
    {
        float _548 = _284 ? as_type<float>(_526) : _164;
        _546 = _548;
    }
    float _550 = _546;
    float _552 = rsqrt(_422);
    if (_352)
    {
        float _554 = _284 ? as_type<float>(_540) : _164;
        _228 = _554;
    }
    float _556 = _228;
    out.m_67.x = _406;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _560 = fma(_544, _550, -0.5);
    float _562 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[93].z, _558);
    out.m_67.w = _420;
    float _564 = _506 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _566 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _568 = -_520;
    float _570 = _514 + _568;
    float _572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _576 = abs(_204);
    float _578 = _566 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _580 = -_574;
    float _582 = fma(_564, 2.0, _580);
    float _584 = float(_576);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _588 = -_570;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _592 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[191].y, _578);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _596 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[93].w, _586);
    float _598 = abs(_590);
    float _600 = _584 * _598;
    float _602 = _592 * 0.15915493667125701904296875;
    float _604 = _508 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _606 = _270 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _608 = _394 * _394;
    float _610 = fma(_604, -2.0, _594);
    float _612 = _426 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _614 = _602 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = fma(_398, _398, _608);
    float _620 = fma(_606, _262, -0.5);
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _624 = fma(_612, _512, -0.5);
    float _626 = _552 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _628 = fma(_400, _400, _618);
    float _630 = _572 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _632 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].z, _622);
    float _634 = _626 * (-0.15915493667125701904296875);
    float _636 = -_144;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[76].x, _362);
    float _640 = fma(_630, _556, -0.5);
    float _642 = rsqrt(_628);
    float _644 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _646 = 0.0;
    float _648 = _562;
    float _650 = _600;
    if (!_516)
    {
        _646 = _198;
    }
    float _652 = _646;
    float _654 = -_144;
    float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[91].x, _582);
    float _658 = _616 * _530;
    float _660 = fma(_644, _620, _638);
    float _662 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].w, _596);
    float _664 = _634 * 6.283185482025146484375;
    float _666 = sin(_664);
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[191].x, _528);
    float _670 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[92].z, _562);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _674 = _652;
    float _676 = _670;
    if (!_516)
    {
        _648 = _652;
    }
    float _678 = _648;
    float _680 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[91].y, _610);
    float _682 = fma(_670, _640, _656);
    float _684 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _672);
    float _686 = _634 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = _678;
    if (_516)
    {
        _674 = _198;
    }
    float _692 = _674;
    float _694 = _398 * _642;
    float _696 = _692;
    if (_518)
    {
        _676 = _168;
    }
    float _698 = _676;
    float _700 = _394 * _642;
    float _702 = _400 * _642;
    float _704 = _698;
    if (!_518)
    {
        _704 = _236;
    }
    float _706 = _704;
    float _708 = -_680;
    float _710 = fma(_662, _456, _708);
    float _712 = _666 * _532;
    float _714 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _716 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _720 = _688 * _532;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _724 = -_712;
    float _726 = fma(_688, _530, _724);
    float _728 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _706 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _732 = fma(_666, _530, _720);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _736 = _702 * _734;
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _740 = -_722;
    float _742 = fma(_730, 2.0, _740);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _746 = _700 * _744;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _750 = -_736;
    float _752 = fma(_694, _748, _750);
    float _754 = _728 * _738;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _758 = _694 * _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _762 = -_746;
    float _764 = fma(_702, _760, _762);
    float _766 = _752 * _752;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _770 = -_758;
    float _772 = fma(_700, _768, _770);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _776 = fma(_764, _764, _766);
    float _778 = _766;
    float _780 = _722;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (!_516)
    {
        _778 = _678;
    }
    float _784 = _778;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _788 = _784;
    if (_516)
    {
        _690 = _168;
    }
    float _790 = _690;
    float _792 = fma(_772, _772, _776);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_516)
    {
        _780 = _236;
    }
    float _796 = _780;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _800 = rsqrt(_792);
    float _802 = _796;
    if (!_516)
    {
        _782 = _236;
    }
    float _804 = _782;
    float _806 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[88].z, _794);
    float _808 = _804;
    if (_516)
    {
        _802 = _692;
    }
    float _810 = _802;
    float _812 = _716 * _774;
    if (_516)
    {
        _808 = _692;
    }
    float _814 = _808;
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _786);
    if (_516)
    {
        _788 = _168;
    }
    float _818 = _788;
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _798);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    if (!_518)
    {
        _696 = _168;
    }
    float _824 = _696;
    float _826 = _812 * _694;
    float _828 = _812 * _702;
    float _830 = _714 * _822;
    float _832 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _834 = _818 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _836 = _752 * _800;
    float _838 = _772 * _800;
    float _840 = _764 * _800;
    float _842 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _806);
    float _844 = _694 * _836;
    float _846 = _700 * _838;
    float _848 = fma(_754, _840, _826);
    float _850 = fma(_754, _838, _828);
    float _852 = -_844;
    float _854 = fma(_700, _840, _852);
    float _856 = -_846;
    float _858 = fma(_702, _836, _856);
    float _860 = -_144;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[86].x, _742);
    float _864 = fma(_830, _854, _850);
    float _866 = fma(_830, _858, _848);
    float _868 = fma(_842, _560, _862);
    float _870 = _814 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = _832 + _864;
    float _874 = _718 + _866;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _878 = _726 != 0.0;
    bool _880 = isnan(_726);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _890 = _872 + _888;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _874 + _892;
    float _896 = -_876;
    float _898 = fma(_834, 2.0, _896);
    bool _900 = _668 == 0.0;
    bool _902 = !_886;
    bool _904 = _900 && _902;
    float _906 = _890 * _890;
    float _908 = _894 * _894;
    float _910 = in.m_71.x;
    float _912 = in.m_71.y;
    float _914 = in.m_71.z;
    float _916 = _824 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _918 = _908 + _906;
    bool _920 = _732 == 0.0;
    bool _922 = _920 && _904;
    float _924 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _816);
    float _926 = sqrt(_918);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _930 = -_144;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _934 = _812 * _700;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _938 = fma(_870, -2.0, _928);
    float _940 = fma(_924, _624, _932);
    float _942 = _702 * _840;
    float _944 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _684);
    float _946 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _820);
    float _948 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _938);
    float _950 = fma(_916, -2.0, _936);
    float _952 = fma(_754, _836, _934);
    float _954 = -_942;
    float _956 = fma(_694, _838, _954);
    float _958 = -_948;
    float _960 = fma(_946, _448, _958);
    float _962 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _950);
    bool _964 = _926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = _912;
    float _968 = _910;
    float _970 = _908;
    float _972 = _906;
    float _974 = _874;
    float _976 = _872;
    float _978 = _914;
    float _980 = _894;
    if (!_922)
    {
        float _982 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _912);
        _966 = _982;
    }
    float _984 = _966;
    float _986 = fma(_830, _956, _952);
    float _988 = _402 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _990 = _694 * _984;
    float _992 = _700 * _984;
    float _994 = _702 * _984;
    float _996 = _514 * 6.283185482025146484375;
    float _998 = -_962;
    float _1000 = fma(_944, _462, _998);
    if (!_922)
    {
        float _1002 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _910);
        _968 = _1002;
    }
    float _1004 = _968;
    float _1006 = _988 + _986;
    bool _1008 = !_964;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _926 + _1014;
        float _1018 = _1006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = rsqrt(_918);
        float _1022 = _1016 * _1012;
        float _1024 = _1022 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1020 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_894, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_890, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1048 = _1040 + _1046;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1052 = _1042 + _1050;
        float _1054 = fma(_1006, _1032, _1044);
        float _1056 = _1048 * _1048;
        float _1058 = _1052 * _1052;
        _1010 = _1054;
        _970 = _1056;
        _972 = _1058;
        _974 = _1040;
        _976 = _1042;
    }
    float _1060 = _1010;
    float _1062 = _970;
    float _1064 = _972;
    float _1066 = _974;
    float _1068 = _976;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1072 = _1060 + _1070;
    float _1074 = _996 * 0.15915493667125701904296875;
    float _1076 = fma(_840, _1004, _990);
    if (!_922)
    {
        float _1078 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _978 = _1078;
    }
    float _1080 = _978;
    float _1082 = fma(_1072, _1072, _1062);
    float _1084 = fma(_836, _1004, _992);
    float _1086 = fma(_838, _1004, _994);
    float _1088 = _1074 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1082 + _1064;
    float _1094 = fma(_858, _1080, _1076);
    float _1096 = fma(_956, _1080, _1084);
    float _1098 = _682 + 0.5;
    float _1100 = _660 + 0.5;
    float _1102 = _710 + 0.5;
    float _1104 = _868 + 0.5;
    float _1106 = sqrt(_1092);
    float _1108 = _1000 + 0.5;
    float _1110 = fma(_854, _1080, _1086);
    bool _1112 = !_180;
    int _1114 = _1112 ? 0 : 1;
    out.m_73.x = _1098;
    out.m_73.y = _1102;
    int _1116 = abs(_220);
    float _1118 = _466 + 0.5;
    int _1120 = abs(_1114);
    out.m_75.x = _1104;
    out.m_75.y = _1108;
    float _1122 = fma(_1090, 0.5, 0.5);
    float _1124 = _940 + 0.5;
    out.m_77.x = _1094;
    out.m_77.y = _1096;
    out.m_77.z = _1110;
    float _1126 = _960 + 0.5;
    bool _1128 = _570 < 0.5;
    float _1130 = float(_1128);
    float _1132 = -_1122;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1136 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1138 = isnan(_1106);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1120);
    out.m_79.x = _1100;
    out.m_79.y = _1118;
    out.m_79.z = _1124;
    out.m_79.w = _1126;
    float _1148 = -_1130;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1152 = fma(_1146, _1134, _600);
    float _1154 = as_type<float>(_1116);
    float _1156 = _1108;
    if (!_1144)
    {
        _650 = 1.0;
    }
    float _1158 = _650;
    float _1160 = float(_1116);
    float _1162 = abs(_1150);
    float _1164 = fma(_1160, _1162, _1152);
    bool _1166 = !_1144;
    float _1168 = _1158;
    float _1170 = _1164;
    if (!_1166)
    {
        bool _1172 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1106);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1106 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1168 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1106);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1106 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1168 = _1228;
                _1200 = true;
            }
            else
            {
                _1168 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1168;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1234 = _1060 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1238 = _1066 + _1236;
    float _1240 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1244 = _1068 + _1242;
    float _1246 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1250 = _1240 + _1248;
    float _1252 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1246 + _1254;
    float _1258 = _1250 * _1250;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1252 + _1260;
    float _1264 = fma(_1256, _1256, _1258);
    float _1266 = fma(_1262, _1262, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = sqrt(_1266);
    float _1272 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1274 = _1256 * _1272;
    float _1276 = _1262 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 * _1276;
    float _1282 = _1278 + _1280;
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1284 + _1288;
    float _1292 = _1262;
    float _1294 = _1290;
    float _1296 = _1250;
    if (_1286)
    {
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1298;
    }
    float _1300 = _1292;
    if (_1286)
    {
        float _1302 = rsqrt(_1282);
        _1154 = _1302;
    }
    float _1304 = _1154;
    float _1306 = _1304;
    if (_1286)
    {
        float _1308 = _1290 * _1300;
        _1294 = _1308;
    }
    float _1310 = _1294;
    if (_1286)
    {
        float _1312 = _1310 * 0.15915493667125701904296875;
        _1156 = _1312;
    }
    float _1314 = _1156;
    float _1316 = _1268;
    float _1318 = _1314;
    if (_1286)
    {
        float _1320 = _1314 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        _1316 = _1322;
    }
    float _1324 = _1316;
    float _1326 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1328 = precise::max(0.0, _1326);
    float _1330 = _1264;
    float _1332 = _1328;
    float _1334 = _1326;
    if (_1286)
    {
        float _1336 = _1314 * 6.283185482025146484375;
        float _1338 = cos(_1336);
        _1330 = _1338;
    }
    float _1340 = _1330;
    float _1342 = -_1272;
    float _1344 = -_1328;
    float _1346 = fma(_1250, _1342, _1344);
    float _1348 = _1346;
    if (!_1286)
    {
        _1332 = _1276;
    }
    float _1350 = _1332;
    float _1352 = _1350;
    if (_1286)
    {
        float _1354 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1354;
    }
    float _1356 = _1334;
    float _1358 = _1324;
    float _1360 = _1356;
    if (_1286)
    {
        float _1362 = fma(_1324, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1362;
    }
    float _1364 = _1296;
    float _1366 = _1364;
    if (!_1286)
    {
        _1358 = _1274;
    }
    float _1368 = _1358;
    float _1370 = _1368;
    if (_1286)
    {
        float _1372 = _1340 + (-1.0);
        _1360 = _1372;
    }
    float _1374 = _1360;
    if (_1286)
    {
        float _1376 = _1304 * _1364;
        _980 = _1376;
    }
    float _1378 = _980;
    if (!_1286)
    {
        _1306 = _1278;
    }
    float _1380 = _1306;
    float _1382 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = _1380;
    if (_1286)
    {
        float _1386 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1386;
    }
    float _1388 = _1318;
    if (_1286)
    {
        float _1390 = _1274 * _1378;
        _1370 = _1390;
    }
    float _1392 = _1370;
    if (_1286)
    {
        float _1394 = _1276 * _1378;
        _1352 = _1394;
    }
    float _1396 = _1352;
    if (!_1286)
    {
        _1366 = _1280;
    }
    float _1398 = _1366;
    float _1400 = _1398;
    if (_1286)
    {
        float _1402 = fma(_1346, _1340, _1388);
        _1348 = _1402;
    }
    float _1404 = _1348;
    if (_1286)
    {
        float _1406 = _1392 * _1392;
        _1384 = _1406;
    }
    float _1408 = _1384;
    if (_1286)
    {
        float _1410 = _1396 * _1396;
        _1400 = _1410;
    }
    float _1412 = _1400;
    float _1414 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1416 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1418 = fma(_1404, _1404, _1408);
    float _1420 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1422 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1414);
    float _1424 = _1418 + _1412;
    float _1426 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1428 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1422);
    float _1430 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1416);
    float _1432 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1420);
    float _1434 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1426);
    float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1438 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1436);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = rsqrt(_1424);
    float _1444 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1434);
    float _1446 = -_1440;
    float _1448 = _1446 + 1.0;
    float _1450 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1452 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1454 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1430);
    float _1456 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1460 = abs(_1448);
    float _1462 = log2(_1460);
    float _1464 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1466 = fma(_718, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1468 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1458);
    float _1472 = _1442 * _1392;
    float _1474 = _1442 * _1404;
    float _1476 = _1442 * _1396;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1480 = floor(_1466);
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1470);
    float _1484 = -_1478;
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1484);
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1482);
    float _1492 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1494 = -_1476;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1486);
    float _1498 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = floor(_1452);
    float _1502 = fma(_1496, -0.5, 0.5);
    float _1504 = -_1498;
    float _1506 = fma(_1504, _1488, 1.0);
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1512 = -_1480;
    float _1514 = _1466 + _1512;
    float _1516 = exp2(_1492);
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1510);
    float _1520 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1522 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1518);
    float _1524 = fma(_1508, _1520, -0.212114393711090087890625);
    float _1526 = sqrt(_1502);
    float _1528 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1522);
    float _1532 = fma(_1508, _1524, 1.570728778839111328125);
    float _1534 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1536 = 1.0 / _1490;
    float _1538 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1534);
    float _1540 = -_1500;
    float _1542 = _1452 + _1540;
    float _1544 = _1474 + 1.0;
    float _1546 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1538);
    float _1548 = -_1474;
    float _1550 = fma(_1516, _1544, _1548);
    float _1552 = log2(_1506);
    float _1554 = _1526 * 0.636619746685028076171875;
    float2 _4478 = float2(_1514, _1542);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4478, float2(0.0), isnan(_4478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4478, float2(0.0), isnan(_4478)), level(0.0)).x;
    float _1558 = fma(_1550, 0.5, 0.5);
    float _1560 = -_1532;
    float _1562 = fma(_1554, _1560, 1.0);
    float _1564 = _1546 * _1536;
    float _1566 = _1530 * _1536;
    float _1568 = fma(_1564, -0.5, 0.5);
    float _1570 = fma(_1566, 0.5, 0.5);
    float _1572 = _1552 * 0.693147182464599609375;
    float _1574 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4513 = float3(_1570, _1568, _1574);
    float _1576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4513, float3(0.0), isnan(_4513)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4513, float3(0.0), isnan(_4513)), level(0.0)).x;
    float3 _4524 = float3(_1570, _1568, _1574);
    float4 _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4524, float3(0.0), isnan(_4524)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4524, float3(0.0), isnan(_4524)), level(0.0)).xyzw;
    float _1581 = _1579.x;
    float _1583 = _1579.y;
    float _1585 = _1579.z;
    float _1587 = _1579.w;
    float2 _4540 = float2(_1562, _1558);
    float3 _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4540, float2(0.0), isnan(_4540)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4540, float2(0.0), isnan(_4540)), level(0.0)).xyz;
    float _1593 = _1591.x;
    float _1595 = _1591.y;
    float _1597 = _1591.z;
    float _1599 = _988 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1601 = _988 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1605 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1607 = isnan(_1270);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1613 = _1609 || _1611;
    float _1615 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1599);
    float _1617 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1619 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1621 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1603);
    float _1623 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1625 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1617);
    float _1627 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1621);
    float _1629 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1631 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1633 = exp2(_1619);
    float _1635 = _1631 + _1629;
    float _1637 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    float _1639 = _1490 * 0.5;
    float _1641 = _1637 + _1490;
    float _1643 = 1.0 / _1629;
    float _1645 = fma(_1546, -0.5, _1639);
    out.gl_Position.x = _1530;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1637;
    out.gl_Position.w = _1490;
    float _1647 = _1641 * 0.5;
    float _1649 = -_1633;
    float _1651 = _1649 + 1.0;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1655 = _1635 * _1643;
    float _1657 = _1655 * 0.5;
    float _1659 = _1164 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1661 = _1546;
    float _1663 = _1530;
    if (!_1613)
    {
        _1661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1665 = _1661;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1669 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1667);
    float _1671 = _1665;
    float _1673 = _1665;
    if (!_1613)
    {
        _1170 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1675 = _1170;
    float _1677 = 1.0 / _1669;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1681 = _1677 * _1679;
    float _1683 = abs(_1681);
    float _1685 = log2(_1683);
    bool _1687 = _1681 <= 8000.0;
    bool _1689 = isnan(_1681);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(8000.0);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1701 = exp2(_1699);
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    float _1707 = fma(_1705, -2.0, 3.0);
    float _1709 = _1705 * _1705;
    float _1711 = _1709 * _1707;
    float _1713 = in.m_81.x;
    float _1715 = -_1711;
    float _1717 = _1715 + 1.0;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1711);
    float _1721 = _1530 + _1490;
    float _1723 = _1697 * _1719;
    float _1725 = _1721 * 0.5;
    float _1727 = _1675;
    float _1729 = _1675;
    if (!_1613)
    {
        _1663 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1731 = _1663;
    float _1733 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _1725;
    out.m_83.y = _1645;
    out.m_83.z = _1647;
    out.m_83.w = _1490;
    float _1735 = -_1556;
    float _1737 = _1735 + 1.0;
    float _1739 = _1737 * _1733;
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = -_1741;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1747 = _1745 * _1713;
    float _1749 = _1747 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _1749;
    float _1751 = _1653 * _1576;
    float _1753 = -_1653;
    float _1755 = _1753 + 1.0;
    float _1757 = _1587 * _1751;
    float _1759 = _1597 * _1751;
    float _1761 = _1587 * _1755;
    float _1763 = fma(_1593, _1757, _1581);
    float _1765 = fma(_1595, _1757, _1583);
    float _1767 = fma(_1587, _1759, _1585);
    out.m_87.x = _1763;
    out.m_87.y = _1765;
    out.m_87.z = _1767;
    out.m_87.w = _1761;
    bool _1769 = !_1613;
    float _1771 = _1731;
    float _1773 = _1731;
    if (!_1769)
    {
        bool _1775 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1777 = isnan(_1270);
        bool _1779 = _1775 || _1777;
        bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1783 = _1779 || _1781;
        if (!_1783)
        {
            float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1787 = _1270 + _1785;
            float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1791 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1789;
            float _1793 = 1.0 / _1791;
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1803 = _1787 * _1793;
            float _1805 = precise::clamp(_1803, 0.0, 1.0);
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1811 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1813 = fma(_1805, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1815 = fma(_1805, _1797, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1773 = _1815;
            _1673 = _1813;
            _1729 = _1811;
            _1817 = true;
        }
        else
        {
            bool _1819 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1821 = isnan(_1270);
            bool _1823 = _1819 || _1821;
            bool _1825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1827 = _1823 || _1825;
            if (!_1827)
            {
                _1671 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1829 = _1671;
            _1673 = _1829;
            if (!_1827)
            {
                _1771 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1831 = _1771;
            _1773 = _1831;
            if (!_1827)
            {
                _1727 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1833 = _1727;
            bool _1835 = !_1827;
            _1729 = _1833;
            if (!_1835)
            {
                bool _1837 = _1270 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1839 = isnan(_1270);
                bool _1841 = _1837 || _1839;
                bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1845 = _1841 || _1843;
                if (!_1845)
                {
                    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1849 = _1270 + _1847;
                    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1851;
                    float _1855 = 1.0 / _1853;
                    float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1859 = _1857 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1865 = _1849 * _1855;
                    float _1867 = precise::clamp(_1865, 0.0, 1.0);
                    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1873 = fma(_1867, _1863, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1875 = fma(_1867, _1871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1877 = fma(_1867, _1859, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1773 = _1877;
                    _1673 = _1875;
                    _1729 = _1873;
                    _1817 = true;
                }
                else
                {
                    _1773 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1673 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1729 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1817 = false;
    float _1879 = _1773;
    float _1881 = _1673;
    float _1883 = _1729;
    float _1885 = _1879 * 0.586610972881317138671875;
    bool _1887 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1889 = _1659 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1891 = fma(_1881, 0.298911988735198974609375, _1885);
    out.m_89.x = 0.0;
    float _1893 = fma(_1883, 0.114477999508380889892578125, _1891);
    out.m_51.x = _1889;
    float _1895 = -_1893;
    float _1897 = _1895 + _1881;
    float _1899 = -_1893;
    float _1901 = _1899 + _1879;
    float _1903 = -_1893;
    float _1905 = _1903 + _1883;
    float _1907 = fma(_1897, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    float _1909 = fma(_1901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    float _1911 = fma(_1905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1893);
    out.m_91.x = _1907;
    out.m_91.y = _1909;
    out.m_91.z = _1911;
    if (!_1887)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1913 = -_1240;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1917 = -_1246;
    float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1921 = -_1252;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1925 = _1915 * _1915;
    float _1927 = fma(_1919, _1919, _1925);
    float _1929 = fma(_1923, _1923, _1927);
    float _1931 = sqrt(_1929);
    float _1933 = rsqrt(_1929);
    float _1935 = -_1931;
    float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = _1919 * _1933;
    float _1945 = _1915 * _1933;
    float _1947 = abs(_1941);
    float _1949 = log2(_1947);
    float _1951 = _1923 * _1933;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1955 = _1096 * _1945;
    float _1957 = -_1945;
    float _1959 = -_1953;
    float _1961 = fma(_1957, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1959);
    float _1963 = fma(_1094, _1943, _1955);
    float _1965 = -_1951;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1961);
    float _1969 = fma(_1110, _1951, _1963);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1975 = _1967 + _1973;
    float _1977 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1979 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1981 = precise::clamp(_1979, 0.0, 1.0);
    float _1983 = exp2(_1977);
    float _1985 = _1983 * _1981;
    float _1987 = _1971 * _1985;
    float _1989 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1991 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1993 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _1989;
    out.m_89.y = _1991;
    out.m_89.z = _1993;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

