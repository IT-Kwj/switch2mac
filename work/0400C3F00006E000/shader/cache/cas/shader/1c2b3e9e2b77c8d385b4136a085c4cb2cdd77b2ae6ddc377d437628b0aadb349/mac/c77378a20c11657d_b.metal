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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _61;
    float _95 = _93 * _67;
    float _97 = _93 * _73;
    float _99 = _93 * _79;
    float _101 = _93 * _85;
    float _103 = 1.0 / _95;
    float _105 = _97 * _103;
    float _107 = _99 * _103;
    float _109 = _93 * _91;
    float2 _540 = float2(_105, _107);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_540, float2(0.0), isnan(_540))).x;
    float2 _551 = float2(_101, _109);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = in.m_39.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_41.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_41.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_35.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _93 * _128;
    float _168 = _93 * _134;
    float _170 = _93 * _140;
    float _172 = _166 * _166;
    float _174 = fma(_168, _168, _172);
    float _176 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _178 = _176 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _180 = fma(_170, _170, _174);
    float _182 = _93 * _146;
    float _184 = 1.0 / _178;
    float _186 = rsqrt(_180);
    float _188 = _166 * _186;
    float _190 = _93 * _152;
    float _192 = _170 * _186;
    float _194 = in.m_43.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _182 * _188;
    float _202 = _168 * _186;
    float _204 = _93 * _158;
    float _206 = in.m_45.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = fma(_190, _202, _200);
    float _214 = in.m_47.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = fma(_204, _192, _212);
    float _222 = _93 * _164;
    float _224 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _226 = abs(_220);
    float _228 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _230 = _226 + _228;
    float _232 = _222 * _103;
    float _234 = _230 * _184;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c8)._m0[30].w, _238);
    float _242 = fma(_236, -2.0, 3.0);
    float _244 = _236 * _236;
    float _246 = 1.0 / _240;
    float _248 = _242 * _244;
    float _250 = _93 * _198;
    float _252 = _93 * _218;
    float _254 = in.m_45.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_45.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_45.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _274 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[30].w, _272);
    float _276 = in.m_49.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = 1.0 / _274;
    float _284 = -_252;
    float _286 = fma(_122, _250, _284);
    float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _290 = _246 * _288;
    float _292 = _93 * _210;
    float _294 = _292 * _286;
    float _296 = 0.0 + _294;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _302 = -_290;
    float _304 = fma(_282, _300, _302);
    float _306 = _304 * _224;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _298 * _308;
    float _312 = _93 * _280;
    float _314 = _310 * _248;
    float _316 = _314 * _312;
    bool _320 = _316 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _322 = isnan(_316);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _328 = _324 || _326;
    float _330 = in.m_47.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_47.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_47.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = _316;
    if (!_328)
    {
        discard_fragment();
    }
    float _350 = _93 * _258;
    float _352 = _93 * _270;
    float _354 = _120 * _120;
    float _356 = _93 * _334;
    float _358 = _93 * _340;
    float _360 = _93 * _264;
    float _362 = _93 * _346;
    float _364 = -_350;
    float _366 = _358 + _364;
    float _368 = -_360;
    float _370 = _356 + _368;
    float _372 = -_352;
    float _374 = _362 + _372;
    float _376 = _116 * _116;
    float _378 = _118 * _118;
    float _380 = fma(_354, _374, _352);
    float _382 = fma(_376, _366, _350);
    float _384 = fma(_378, _370, _360);
    if (!_328)
    {
        out.m_52.x = _382;
        out.m_52.y = _384;
        out.m_52.z = _380;
        out.m_52.w = _294;
        return out;
    }
    float _386 = _384 * 0.715200006961822509765625;
    float _388 = in.m_54.w;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_54.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_54.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_382, 0.2125999927520751953125, _386);
    float _408 = in.m_54.z;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = fma(_380, 0.072200000286102294921875, _406);
    bool _416 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _418 = 1.0 / _414;
    float _420 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_416)
    {
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _424 = _290 + _422;
        _420 = _424;
    }
    float _426 = _420;
    float _428 = _418 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = fma(_430, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _434 = _93 * _392;
    float _436 = _93 * _404;
    float _438 = _432 * _434;
    float _440 = 0.0 + _316;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _442;
    if (_416)
    {
        float _446 = _426 * 8.0;
        float _448 = precise::clamp(_446, 0.0, 1.0);
        _348 = _448;
    }
    float _450 = _348;
    float _452 = _93 * _398;
    float _454 = _93 * _412;
    float _456 = fma(_384, _438, _436);
    if (_416)
    {
        float _458 = _442 * _450;
        _444 = _458;
    }
    float _460 = _444;
    float _462 = fma(_382, _438, _452);
    float _464 = fma(_380, _438, _454);
    float _466 = 0.0 + _460;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    out.m_52.x = _462;
    out.m_52.y = _456;
    out.m_52.z = _464;
    out.m_52.w = _468;
    return out;
}

