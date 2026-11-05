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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _288 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_288, float2(0.0), isnan(_288))).x;
    float2 _300 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_300, float2(0.0), isnan(_300))).x;
    float2 _308 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_39.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_41.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _65 * _90;
    float _112 = _65 * _96;
    float _114 = _65 * _102;
    float _116 = _110 * _110;
    float _118 = fma(_112, _112, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _110 * _122;
    float _126 = _112 * _122;
    float _128 = _114 * _122;
    float _130 = _65 * _108;
    float _132 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _134 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[2].x, _132);
    float _136 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[2].z, _134);
    float _138 = -_71;
    float _140 = fma(_138, _130, 1.0);
    float _142 = 1.0 / _140;
    float _144 = _142 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[7].x, _146);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = -_150;
    float _154 = _152 + 1.0;
    float _156 = fma(_136, 0.5, 0.5);
    float _158 = abs(_154);
    float _160 = log2(_158);
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _164 = _162 + 1.0;
    float _166 = _160 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _164, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _456 = float2(_156, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_456, float2(0.0), isnan(_456))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _160 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _188 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = exp2(_184);
    float _194 = -_190;
    float _196 = _194 + 1.0;
    float _198 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _200 = abs(_196);
    float _202 = log2(_200);
    float _204 = _202 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _206 = exp2(_204);
    float _208 = -_192;
    float _210 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _212 = _73 * _210;
    float _214 = -_206;
    float _216 = fma(_198, _214, _198);
    float _218 = _73 * _216;
    float _220 = -_78;
    float _222 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = -_80;
    float _226 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _224);
    float _228 = -_82;
    float _230 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _228);
    float _232 = fma(_212, _222, _78);
    float _234 = fma(_212, _226, _80);
    float _236 = fma(_212, _230, _82);
    float _238 = -_232;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _242 = -_234;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _246 = -_236;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _250 = fma(_218, _240, _232);
    float _252 = fma(_218, _244, _234);
    float _254 = fma(_218, _248, _236);
    out.m_44.x = _250;
    out.m_44.y = _252;
    out.m_44.z = _254;
    out.m_44.w = _84;
    return out;
}

