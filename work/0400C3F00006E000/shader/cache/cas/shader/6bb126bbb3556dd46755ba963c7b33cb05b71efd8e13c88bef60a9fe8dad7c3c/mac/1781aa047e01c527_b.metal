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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_35 [[user(locn3), flat]];
    float4 m_33 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _290 = float2(_69, _71);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_290, float2(0.0), isnan(_290))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_290, float2(0.0), isnan(_290))).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = in.m_35.x;
    float _83 = in.m_33.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_33.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _81 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _97 = _81 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _99 = _67 * _87;
    float _101 = _67 * _93;
    float _103 = fma(_95, _77, _99);
    float _105 = fma(_97, _79, _101);
    float2 _347 = float2(_103, _105);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_347, float2(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_347, float2(0.0), isnan(_347))).w;
    float _109 = in.m_37.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_41.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _67 * _113;
    float _129 = _67 * _119;
    float _131 = -_127;
    float _133 = _107 + _131;
    float _135 = _67 * _125;
    float _137 = _129 * _133;
    float _139 = 0.0 + _137;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _141 * _135;
    bool _147 = _143 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _149 = isnan(_143);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _155 = _151 || _153;
    float _157 = in.m_43.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_43.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    if (!_155)
    {
        discard_fragment();
    }
    float _169 = _67 * _161;
    float _171 = _67 * _167;
    float2 _440 = float2(_169, _171);
    float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_440, float2(0.0), isnan(_440))).xyz;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = in.m_37.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_37.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_37.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_39.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_39.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_39.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = _67 * _187;
    float _221 = _67 * _193;
    float _223 = _67 * _199;
    float _225 = _67 * _205;
    float _227 = _67 * _211;
    float _229 = _67 * _217;
    float _231 = -_225;
    float _233 = _223 + _231;
    float _235 = -_227;
    float _237 = _219 + _235;
    float _239 = -_229;
    float _241 = _221 + _239;
    float _243 = _177 * _177;
    float _245 = _179 * _179;
    float _247 = _181 * _181;
    float _249 = fma(_243, _233, _225);
    float _251 = fma(_245, _237, _227);
    float _253 = fma(_247, _241, _229);
    if (!_155)
    {
        out.m_46.x = _249;
        out.m_46.y = _251;
        out.m_46.z = _253;
        out.m_46.w = _137;
        return out;
    }
    float _255 = 0.0 + _143;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    out.m_46.x = _249;
    out.m_46.y = _251;
    out.m_46.z = _253;
    out.m_46.w = _257;
    return out;
}

