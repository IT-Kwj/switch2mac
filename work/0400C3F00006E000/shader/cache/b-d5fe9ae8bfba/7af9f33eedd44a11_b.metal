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
    float _47 = in.m_31.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.x;
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
    float2 _259 = float2(_75, _73);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_259, float2(0.0), isnan(_259))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _278 = float2(_77, _79);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_278, float2(0.0), isnan(_278))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_278, float2(0.0), isnan(_278))).xyzw;
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
    float _133 = -_84;
    float _135 = fma(_133, _90, 1.000010013580322265625);
    float _137 = -_86;
    float _139 = fma(_137, _90, 1.000010013580322265625);
    float _141 = -_88;
    float _143 = fma(_141, _90, 1.000010013580322265625);
    float _145 = precise::max(_100, _90);
    float _147 = 1.0 / _135;
    float _149 = _145;
    if (_131)
    {
        float _151 = precise::min(_100, _90);
        _149 = _151;
    }
    float _153 = _149;
    float _155 = _71 * _112;
    float _157 = 1.0 / _143;
    float _159 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _161 = _71 * _106;
    float _163 = 1.0 / _139;
    float _165 = _94 * _147;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _159 * _161;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _175 = _171 != 0.0;
    bool _177 = isnan(_171);
    bool _179 = _175 || _177;
    bool _181 = isnan(0.0);
    bool _183 = _179 || _181;
    float _185 = _98 * _157;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _71 * _118;
    float _191 = _173 * _155;
    float _193 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _195 = _96 * _163;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _71 * _124;
    float _201 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _203 = _193 * _199;
    float _205 = _201 * _189;
    if (_183)
    {
        out.m_38.x = _191;
        out.m_38.y = _205;
        out.m_38.z = _203;
        out.m_38.w = _171;
        return out;
    }
    discard_fragment();
    return out;
}

