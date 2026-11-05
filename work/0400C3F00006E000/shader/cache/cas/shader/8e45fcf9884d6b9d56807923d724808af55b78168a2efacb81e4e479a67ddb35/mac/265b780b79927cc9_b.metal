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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float2 _271 = float2(_73, _75);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_271, float2(0.0), isnan(_271))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _290 = float2(_77, _79);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_290, float2(0.0), isnan(_290))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_290, float2(0.0), isnan(_290))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float _102 = in.m_35.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_35.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_35.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_35.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    int _127 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _131 = _127 != 0;
    float _133 = _84 * _90;
    float _135 = _86 * _90;
    float _137 = precise::max(_100, _90);
    float _139 = _88 * _90;
    float _141 = _137;
    if (_131)
    {
        float _143 = precise::min(_100, _90);
        _141 = _143;
    }
    float _145 = _141;
    float _147 = -_94;
    float _149 = _147 + 1.0;
    float _151 = _133 * _149;
    float _153 = -_133;
    float _155 = _153 + 1.0;
    float _157 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _159 = _71 * _106;
    float _161 = -_96;
    float _163 = _161 + 1.0;
    float _165 = -_98;
    float _167 = _165 + 1.0;
    float _169 = fma(_94, _155, _151);
    float _171 = _157 * _159;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _135 * _163;
    float _177 = -_135;
    float _179 = _177 + 1.0;
    float _181 = _139 * _167;
    float _183 = -_139;
    float _185 = _183 + 1.0;
    bool _187 = _173 != 0.0;
    bool _189 = isnan(_173);
    bool _191 = _187 || _189;
    bool _193 = isnan(0.0);
    bool _195 = _191 || _193;
    float _197 = fma(_96, _179, _175);
    float _199 = fma(_98, _185, _181);
    float _201 = _71 * _112;
    float _203 = _71 * _118;
    float _205 = _71 * _124;
    float _207 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _209 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _211 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _213 = _207 * _201;
    float _215 = _209 * _203;
    float _217 = _211 * _205;
    if (_195)
    {
        out.m_38.x = _213;
        out.m_38.y = _215;
        out.m_38.z = _217;
        out.m_38.w = _173;
        return out;
    }
    discard_fragment();
    return out;
}

