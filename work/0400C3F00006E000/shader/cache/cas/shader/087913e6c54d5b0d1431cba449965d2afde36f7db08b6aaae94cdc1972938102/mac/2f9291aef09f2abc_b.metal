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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
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
    float2 _319 = float2(_73, _75);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_319, float2(0.0), isnan(_319))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _338 = float2(_77, _79);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_338, float2(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_338, float2(0.0), isnan(_338))).xyzw;
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
    float _133 = precise::max(_90, _100);
    float _135 = _133;
    if (_131)
    {
        float _137 = precise::min(_90, _100);
        _135 = _137;
    }
    float _139 = _135;
    float _141 = _84 * 2.0;
    bool _143 = _86 >= 0.5;
    bool _145 = isnan(_86);
    bool _147 = _143 || _145;
    bool _149 = isnan(0.5);
    bool _151 = _147 || _149;
    bool _153 = _84 >= 0.5;
    bool _155 = isnan(_84);
    bool _157 = _153 || _155;
    bool _159 = isnan(0.5);
    bool _161 = _157 || _159;
    float _163 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _165 = _86 * 2.0;
    float _167 = _88 * 2.0;
    float _169 = -_98;
    float _171 = _169 + 1.0;
    bool _173 = _88 >= 0.5;
    bool _175 = isnan(_88);
    bool _177 = _173 || _175;
    bool _179 = isnan(0.5);
    bool _181 = _177 || _179;
    float _183 = _94 * _141;
    float _185 = _98 * _167;
    float _187 = _71 * _106;
    float _189 = -_94;
    float _191 = _189 + 1.0;
    float _193 = -_141;
    float _195 = _193 + 2.0;
    float _197 = -_167;
    float _199 = _197 + 2.0;
    float _201 = _163 * _187;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _96 * _165;
    float _207 = _183;
    float _209 = _185;
    float _211 = _205;
    if (_161)
    {
        float _213 = -_195;
        float _215 = fma(_213, _191, 1.0);
        _207 = _215;
    }
    float _217 = _207;
    float _219 = -_96;
    float _221 = _219 + 1.0;
    float _223 = -_165;
    float _225 = _223 + 2.0;
    bool _227 = _203 != 0.0;
    bool _229 = isnan(_203);
    bool _231 = _227 || _229;
    bool _233 = isnan(0.0);
    bool _235 = _231 || _233;
    if (_181)
    {
        float _237 = -_199;
        float _239 = fma(_237, _171, 1.0);
        _209 = _239;
    }
    float _241 = _209;
    if (_151)
    {
        float _243 = -_225;
        float _245 = fma(_243, _221, 1.0);
        _211 = _245;
    }
    float _247 = _211;
    float _249 = _71 * _112;
    float _251 = _71 * _118;
    float _253 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _255 = _71 * _124;
    float _257 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _259 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _261 = _253 * _249;
    float _263 = _257 * _251;
    float _265 = _259 * _255;
    if (_235)
    {
        out.m_38.x = _261;
        out.m_38.y = _263;
        out.m_38.z = _265;
        out.m_38.w = _203;
        return out;
    }
    discard_fragment();
    return out;
}

