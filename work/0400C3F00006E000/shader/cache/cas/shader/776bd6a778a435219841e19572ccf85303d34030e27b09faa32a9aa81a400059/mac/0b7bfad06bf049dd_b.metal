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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float _81 = -(*spvDescriptorSet0.fp_c3)._m0[32].z;
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[1].x, _73);
    float _85 = -(*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _87 = fma(_85, (*spvDescriptorSet0.fp_c4)._m0[1].x, _73);
    float _89 = fma((*spvDescriptorSet0.fp_c3)._m0[32].y, (*spvDescriptorSet0.fp_c4)._m0[1].x, _73);
    float _91 = fma((*spvDescriptorSet0.fp_c3)._m0[32].z, (*spvDescriptorSet0.fp_c4)._m0[1].x, _73);
    float2 _344 = float2(_83, _75);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _364 = float2(_87, _75);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float2 _380 = float2(_73, _75);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_380, float2(0.0), isnan(_380))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _396 = float2(_89, _75);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _412 = float2(_91, _75);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float2 _428 = float2(_77, _79);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_428, float2(0.0), isnan(_428))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float _154 = _96 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _156 = _102 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _158 = _98 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _160 = _100 * (*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _162 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].y, _154);
    float _164 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].y, _156);
    float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].y, _158);
    float _168 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[33].y, _160);
    float _170 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[33].x, _162);
    float _172 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[33].x, _164);
    float _174 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].x, _166);
    float _176 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[33].x, _168);
    float _178 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[33].y, _170);
    float _180 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[33].y, _172);
    float _182 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[33].y, _174);
    float _184 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[33].y, _176);
    float _186 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[33].z, _180);
    float _188 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[33].z, _182);
    float _190 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[33].z, _178);
    float _192 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[33].z, _184);
    float _194 = precise::min(_188, _186);
    float _196 = precise::min(_190, _186);
    float _198 = precise::min(_192, _186);
    float _200 = -_194;
    float _202 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[31].w, _188);
    float _204 = -_196;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[31].w, _190);
    float _208 = -_198;
    float _210 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[31].w, _192);
    float _212 = _202 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _214 = _206 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _218 = _146 * _152;
    float _220 = precise::min(_212, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _222 = _148 * _152;
    float _224 = precise::min(_214, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _226 = _150 * _152;
    float _228 = precise::min(_216, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _230 = precise::max(0.0, _220);
    float _232 = precise::max(0.0, _224);
    float _234 = precise::max(0.0, _228);
    float _236 = _230 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _238 = _232 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _240 = _234 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _242 = fma(_222, _236, _188);
    float _244 = fma(_218, _238, _190);
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _250 = fma(_226, _240, _192);
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _254 = fma(_218, _246, _244);
    float _256 = fma(_222, _248, _242);
    float _258 = fma(_226, _252, _250);
    out.m_38.x = _254;
    out.m_38.y = _256;
    out.m_38.z = _258;
    out.m_38.w = _186;
    return out;
}

