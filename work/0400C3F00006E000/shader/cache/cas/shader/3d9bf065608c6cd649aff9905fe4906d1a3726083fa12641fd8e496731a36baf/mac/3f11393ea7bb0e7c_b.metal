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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_45 [[user(locn6), flat]];
    float4 m_56 [[user(locn7)]];
    float4 m_60 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_43.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_43.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_43.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_45.x;
    float _91 = in.m_47.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_47.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _69;
    float _105 = rint(_89);
    float _107 = precise::max(_105, 0.0);
    uint _110 = uint(_107);
    uint _112 = clamp(_110, 0u, 65535u);
    float _114 = _103 * _75;
    float _116 = _103 * _81;
    float _118 = _103 * _87;
    float _120 = _103 * _95;
    float _122 = 1.0 / _114;
    float _124 = _103 * _101;
    float _126 = _116 * _122;
    float _128 = _118 * _122;
    float2 _522 = float2(_126, _128);
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_522, float2(0.0), isnan(_522))).x;
    float3 _535 = float3(_124, _120, float(int(_112)));
    float3 _539 = select(_535, float3(0.0), isnan(_535));
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _539.xy, uint(rint(_539.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _539.xy, uint(rint(_539.z))).w;
    float _134 = in.m_43.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_49.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_51.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _103 * _138;
    float _154 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _156 = _103 * _144;
    float _158 = _103 * _150;
    float _160 = _152 * _122;
    float _162 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _164 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _162);
    float _166 = 1.0 / _164;
    float _168 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _170 = _166 * _168;
    float _172 = in.m_49.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _180 = fma(_130, (*spvDescriptorSet0.fp_c8)._m0[30].w, _178);
    float _182 = _132 * _156;
    float _184 = 1.0 / _180;
    float _186 = 0.0 + _182;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _192 = -_170;
    float _194 = fma(_184, _190, _192);
    float _196 = _194 * _154;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _188 * _198;
    float _202 = _200 * _158;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _208 = isnan(_202);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _214 = _210 || _212;
    float _216 = in.m_49.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_49.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _170;
    if (!_214)
    {
        discard_fragment();
    }
    float _230 = _103 * _176;
    float _232 = _103 * _220;
    float _234 = _103 * _226;
    if (!_214)
    {
        out.m_54.x = _230;
        out.m_54.y = _232;
        out.m_54.z = _234;
        out.m_54.w = _182;
        return out;
    }
    float _236 = in.m_56.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_56.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_56.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _103 * _240;
    float _256 = _103 * _246;
    float _258 = _103 * _252;
    float _260 = _254 * _254;
    float _262 = fma(_256, _256, _260);
    float _264 = fma(_258, _258, _262);
    float _266 = rsqrt(_264);
    float _268 = _256 * _266;
    float _270 = _254 * _266;
    float _272 = _258 * _266;
    float _274 = abs(_268);
    float _276 = abs(_270);
    float _278 = precise::max(_274, _276);
    float _280 = abs(_272);
    float _282 = precise::max(_280, _278);
    float _284 = 1.0 / _282;
    float _286 = _268 * _284;
    float _288 = _270 * _284;
    float _290 = -_284;
    float _292 = _272 * _290;
    float3 _780 = float3(_286, _288, _292);
    float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_780, float3(0.0), isnan(_780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_780, float3(0.0), isnan(_780)), level(0.0)).xyz;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = _296.z;
    float _304 = in.m_58.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_58.z;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_58.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_60.z;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_60.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_60.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_62.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_62.y;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_62.z;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_62.w;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    bool _364 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_364)
    {
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _368 = _170 + _366;
        _228 = _368;
    }
    float _370 = _228;
    float _372 = _370;
    if (_364)
    {
        float _374 = _370 * 8.0;
        float _376 = precise::clamp(_374, 0.0, 1.0);
        _372 = _376;
    }
    float _378 = _372;
    float _380 = _103 * _308;
    float _382 = _103 * _314;
    float _384 = _103 * _326;
    float _386 = _103 * _332;
    float _388 = _103 * _350;
    float _390 = _103 * _356;
    float _392 = fma(_298, 0.20999999344348907470703125, _380);
    float _394 = _103 * _320;
    float _396 = fma(_302, 0.20999999344348907470703125, _382);
    float _398 = _103 * _338;
    float _400 = _392 + _386;
    float _402 = fma(_300, 0.20999999344348907470703125, _394);
    float _404 = _396 + _384;
    float _406 = 0.0 + _202;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _103 * _344;
    float _412 = _402 + _398;
    float _414 = _103 * _362;
    float _416 = _230 * _400;
    float _418 = _234 * _404;
    float _420 = _232 * _412;
    float _422 = _408;
    if (_364)
    {
        float _424 = _408 * _378;
        _422 = _424;
    }
    float _426 = _422;
    float _428 = fma(_416, _414, _410);
    float _430 = fma(_418, _414, _390);
    float _432 = fma(_420, _414, _388);
    float _434 = 0.0 + _426;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    out.m_54.x = _428;
    out.m_54.y = _432;
    out.m_54.z = _430;
    out.m_54.w = _436;
    return out;
}

