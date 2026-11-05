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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _257 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_257, float2(0.0), isnan(_257))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_257, float2(0.0), isnan(_257))).x;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = precise::max(_91, _95);
    float _99 = precise::max(_97, _87);
    bool _103 = _99 != 0.0;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    float _113 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = precise::min(_115, _119);
    bool _123 = !_111;
    if (!_123)
    {
        float _125 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _127 = fma(_99, _125, 1.0);
        float _129 = log2(_127);
        float _131 = _129 + (-1.0);
        float2 _371 = float2(_59, _61);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_371, float2(0.0), isnan(_371)), level(_131)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_371, float2(0.0), isnan(_371)), level(_131)).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float _143 = 0.0 + _129;
        float _145 = precise::clamp(_143, 0.0, 1.0);
        float _147 = fma(_85, _145, _83);
        float _149 = _139 * 0.586600005626678466796875;
        float _151 = fma(_137, 0.29890000820159912109375, _149);
        float _153 = _121 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _155 = fma(_141, 0.1143999993801116943359375, _151);
        float _157 = -_137;
        float _159 = _157 + _155;
        float _161 = -_139;
        float _163 = _161 + _155;
        float _165 = -_141;
        float _167 = _165 + _155;
        float _169 = fma(_153, _159, _137);
        float _171 = fma(_153, _163, _139);
        float _173 = fma(_153, _167, _141);
        float _175 = -_169;
        float _177 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[13].x, _175);
        float _179 = -_171;
        float _181 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[13].y, _179);
        float _183 = -_173;
        float _185 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].z, _183);
        float _187 = fma(_121, _177, _169);
        float _189 = fma(_121, _181, _171);
        float _191 = 1.0 / _147;
        float _193 = fma(_121, _185, _173);
        float _195 = _145 * _187;
        float _197 = _145 * _189;
        float _199 = _145 * _193;
        float _201 = -_195;
        float _203 = _201 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _205 = -_197;
        float _207 = _205 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _209 = -_199;
        float _211 = _209 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _213 = fma(_83, _203, _195);
        float _215 = fma(_83, _207, _197);
        float _217 = fma(_83, _211, _199);
        float _219 = _213 * _191;
        float _221 = _215 * _191;
        float _223 = _217 * _191;
        out.m_36.x = _219;
        out.m_36.y = _221;
        out.m_36.z = _223;
        out.m_36.w = _147;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _83;
    return out;
}

