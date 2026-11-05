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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_39.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_43.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_43.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _59;
    float _105 = _103 * _65;
    float _107 = _103 * _71;
    float _109 = _103 * _77;
    float _111 = _103 * _83;
    float _113 = 1.0 / _105;
    float _115 = _103 * _89;
    float _117 = _103 * _95;
    float _119 = _103 * _101;
    float _121 = _107 * _113;
    float _123 = _109 * _113;
    float2 _458 = float2(_123, _121);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float2 _469 = float2(_111, _119);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_469, float2(0.0), isnan(_469))).x;
    float2 _477 = float2(_115, _117);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float _140 = in.m_39.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_45.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_47.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _103 * _144;
    float _160 = _158 * _113;
    float _162 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _164 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _166 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _164);
    float _168 = 1.0 / _166;
    float _170 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _172 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _170);
    float _174 = 1.0 / _172;
    float _176 = _138 * _127;
    float _178 = _103 * _150;
    float _180 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _182 = _168 * _180;
    float _184 = _176 * _178;
    float _186 = 0.0 + _184;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _192 = -_182;
    float _194 = fma(_174, _190, _192);
    float _196 = _194 * _162;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _103 * _156;
    float _202 = _188 * _198;
    float _204 = _202 * _200;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _216 = _212 || _214;
    float _218 = in.m_43.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_43.w;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _182;
    float _232 = _136;
    if (!_216)
    {
        discard_fragment();
    }
    float _234 = _103 * _222;
    float _236 = _103 * _228;
    float2 _632 = float2(_234, _236);
    float3 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_632, float2(0.0), isnan(_632))).xyz;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _240.z;
    float _248 = in.m_45.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_45.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_45.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_49.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_49.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_49.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _103 * _252;
    float _286 = _103 * _258;
    float _288 = _103 * _264;
    float _290 = _103 * _270;
    float _292 = _103 * _276;
    float _294 = _103 * _282;
    float _296 = -_290;
    float _298 = _284 + _296;
    float _300 = -_292;
    float _302 = _286 + _300;
    float _304 = -_294;
    float _306 = _288 + _304;
    float _308 = _132 * _242;
    float _310 = _134 * _244;
    float _312 = _136 * _246;
    float _314 = fma(_308, _298, _290);
    float _316 = fma(_310, _302, _292);
    float _318 = fma(_312, _306, _294);
    if (!_216)
    {
        out.m_52.x = _314;
        out.m_52.y = _316;
        out.m_52.z = _318;
        out.m_52.w = _184;
        return out;
    }
    float _320 = _316 * 0.715200006961822509765625;
    float _322 = fma(_314, 0.2125999927520751953125, _320);
    float _324 = fma(_318, 0.072200000286102294921875, _322);
    bool _326 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _328 = 1.0 / _324;
    float _330 = 0.0 + _204;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _332;
    if (_326)
    {
        float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _338 = _182 + _336;
        _230 = _338;
    }
    float _340 = _230;
    float _342 = _328 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    if (_326)
    {
        float _346 = _340 * 8.0;
        float _348 = precise::clamp(_346, 0.0, 1.0);
        _232 = _348;
    }
    float _350 = _232;
    float _352 = fma(_344, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_326)
    {
        float _354 = _332 * _350;
        _334 = _354;
    }
    float _356 = _334;
    float _358 = _314 * _352;
    float _360 = _316 * _352;
    float _362 = _318 * _352;
    float _364 = 0.0 + _356;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    out.m_52.x = _358;
    out.m_52.y = _360;
    out.m_52.z = _362;
    out.m_52.w = _366;
    return out;
}

