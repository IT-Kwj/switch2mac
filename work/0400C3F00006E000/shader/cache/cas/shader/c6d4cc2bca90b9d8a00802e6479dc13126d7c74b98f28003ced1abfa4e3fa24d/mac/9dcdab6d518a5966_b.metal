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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _57;
    float _91 = _89 * _63;
    float _93 = _89 * _69;
    float _95 = _89 * _75;
    float _97 = _89 * _81;
    float _99 = 1.0 / _91;
    float _101 = _89 * _87;
    float _103 = _93 * _99;
    float _105 = _95 * _99;
    float2 _468 = float2(_103, _105);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_468, float2(0.0), isnan(_468))).x;
    float2 _479 = float2(_97, _101);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_479, float2(0.0), isnan(_479))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_479, float2(0.0), isnan(_479))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = in.m_35.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_43.w;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _146 = _89 * _124;
    float _148 = _146 * _99;
    float _150 = in.m_45.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _158 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _156);
    float _160 = _89 * _130;
    float _162 = 1.0 / _158;
    float _164 = in.m_43.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _89 * _154;
    float _172 = in.m_41.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_43.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_39.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_39.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_39.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _118 * _160;
    float _208 = _89 * _136;
    float _210 = _89 * _142;
    float _212 = 1.0 / _204;
    float _214 = _208 * _206;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _218 = _162 * _216;
    float _220 = _210 * _214;
    float _222 = 0.0 + _220;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _228 = -_218;
    float _230 = fma(_212, _226, _228);
    float _232 = _230 * _144;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _224 * _234;
    float _238 = _236 * _170;
    bool _242 = _238 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _244 = isnan(_238);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _250 = _246 || _248;
    float _252 = in.m_41.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_43.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_41.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _218;
    if (!_250)
    {
        discard_fragment();
    }
    float _272 = _89 * _168;
    float _274 = _89 * _176;
    float _276 = _89 * _256;
    float _278 = _89 * _262;
    float _280 = _89 * _268;
    float _282 = _89 * _182;
    float _284 = -_278;
    float _286 = _276 + _284;
    float _288 = -_272;
    float _290 = _280 + _288;
    float _292 = -_282;
    float _294 = _274 + _292;
    float _296 = fma(_112, _286, _278);
    float _298 = fma(_114, _290, _272);
    float _300 = fma(_116, _294, _282);
    float _302 = _89 * _188;
    float _304 = _89 * _194;
    float _306 = _89 * _200;
    float _308 = _296 * _302;
    float _310 = _298 * _304;
    float _312 = _300 * _306;
    float _314 = _272;
    if (!_250)
    {
        out.m_48.x = _308;
        out.m_48.y = _310;
        out.m_48.z = _312;
        out.m_48.w = _220;
        return out;
    }
    float _316 = _310 * 0.715200006961822509765625;
    float _318 = in.m_50.w;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_50.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_50.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = fma(_308, 0.2125999927520751953125, _316);
    float _338 = in.m_50.z;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = fma(_312, 0.072200000286102294921875, _336);
    bool _346 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _348 = 1.0 / _344;
    if (_346)
    {
        float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _352 = _218 + _350;
        _270 = _352;
    }
    float _354 = _270;
    if (_346)
    {
        float _356 = _354 * 8.0;
        float _358 = precise::clamp(_356, 0.0, 1.0);
        _314 = _358;
    }
    float _360 = _314;
    float _362 = _348 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = fma(_364, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _368 = _89 * _322;
    float _370 = _89 * _328;
    float _372 = _89 * _334;
    float _374 = _366 * _368;
    float _376 = 0.0 + _238;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = _89 * _342;
    float _382 = fma(_308, _374, _370);
    float _384 = _378;
    if (_346)
    {
        float _386 = _378 * _360;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_310, _374, _372);
    float _392 = fma(_312, _374, _380);
    float _394 = 0.0 + _388;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    out.m_48.x = _382;
    out.m_48.y = _390;
    out.m_48.z = _392;
    out.m_48.w = _396;
    return out;
}

