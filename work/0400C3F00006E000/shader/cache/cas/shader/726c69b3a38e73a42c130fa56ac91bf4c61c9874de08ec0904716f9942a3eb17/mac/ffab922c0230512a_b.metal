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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
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
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _57;
    float _103 = _101 * _63;
    float _105 = _101 * _69;
    float _107 = _101 * _75;
    float _109 = _101 * _81;
    float _111 = 1.0 / _103;
    float _113 = _101 * _87;
    float _115 = _101 * _93;
    float _117 = _101 * _99;
    float _119 = _105 * _111;
    float _121 = _107 * _111;
    float2 _489 = float2(_119, _121);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_489, float2(0.0), isnan(_489))).x;
    float2 _500 = float2(_109, _113);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _516 = float2(_115, _117);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float _146 = in.m_37.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_43.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_45.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _101 * _150;
    float _172 = _170 * _111;
    float _174 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = _101 * _156;
    float _182 = 1.0 / _178;
    float _184 = in.m_41.z;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_43.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _198 = fma(_123, (*spvDescriptorSet0.fp_c8)._m0[30].w, _196);
    float _200 = _101 * _162;
    float _202 = 1.0 / _198;
    float _204 = -_180;
    float _206 = fma(_134, _144, _204);
    float _208 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _210 = _182 * _208;
    float _212 = _101 * _168;
    float _214 = _200 * _206;
    float _216 = 0.0 + _214;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _222 = -_210;
    float _224 = fma(_202, _220, _222);
    float _226 = _224 * _174;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _218 * _228;
    float _232 = _230 * _212;
    bool _236 = _232 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _238 = isnan(_232);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _244 = _240 || _242;
    float _246 = in.m_41.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_43.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_41.y;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_43.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _210;
    if (!_244)
    {
        discard_fragment();
    }
    float _272 = _128 * _128;
    float _274 = _130 * _130;
    float _276 = _101 * _194;
    float _278 = _272 * _138;
    float _280 = _274 * _140;
    float _282 = _132 * _132;
    float _284 = _101 * _188;
    float _286 = -_276;
    float _288 = _284 + _286;
    float _290 = _101 * _250;
    float _292 = _101 * _256;
    float _294 = _101 * _262;
    float _296 = _101 * _268;
    float _298 = _282 * _142;
    float _300 = -_292;
    float _302 = _290 + _300;
    float _304 = -_296;
    float _306 = _294 + _304;
    float _308 = fma(_298, _288, _276);
    float _310 = fma(_278, _302, _292);
    float _312 = fma(_280, _306, _296);
    if (!_244)
    {
        out.m_48.x = _310;
        out.m_48.y = _312;
        out.m_48.z = _308;
        out.m_48.w = _214;
        return out;
    }
    float _314 = _312 * 0.715200006961822509765625;
    float _316 = in.m_50.w;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_50.x;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_50.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = fma(_310, 0.2125999927520751953125, _314);
    float _336 = in.m_50.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = fma(_308, 0.072200000286102294921875, _334);
    bool _344 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _346 = 1.0 / _342;
    float _348 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_344)
    {
        float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _352 = _210 + _350;
        _270 = _352;
    }
    float _354 = _270;
    float _356 = _346 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma(_358, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _362 = _101 * _320;
    if (_344)
    {
        float _364 = _354 * 8.0;
        float _366 = precise::clamp(_364, 0.0, 1.0);
        _348 = _366;
    }
    float _368 = _348;
    float _370 = _101 * _326;
    float _372 = _101 * _332;
    float _374 = _360 * _362;
    float _376 = 0.0 + _232;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = _101 * _340;
    float _382 = fma(_310, _374, _370);
    float _384 = _378;
    if (_344)
    {
        float _386 = _378 * _368;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_312, _374, _372);
    float _392 = fma(_308, _374, _380);
    float _394 = 0.0 + _388;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    out.m_48.x = _382;
    out.m_48.y = _390;
    out.m_48.z = _392;
    out.m_48.w = _396;
    return out;
}

