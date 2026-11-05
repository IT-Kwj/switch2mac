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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _298;
    _298.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_63, _65));
    _298.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_63, _65));
    float _67 = _298.x;
    float _69 = _67 * 256.0;
    int _72 = int(_69);
    float _74 = in.m_31.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_31.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _61 * _78;
    float _88 = _61 * _84;
    float _90 = fma(_86, 0.75, -0.75);
    float _92 = fma(_88, 0.75, -0.75);
    float _94 = _90 * 0.707106769084930419921875;
    float _96 = -_94;
    float _98 = fma(_92, 0.707106769084930419921875, _96);
    float _100 = fma(_92, 0.707106769084930419921875, _94);
    float _102 = _100 + 1.0;
    float _104 = float(uint(_72));
    float _106 = _104 * 0.00390625;
    float _108 = precise::min(_106, 2.0);
    float _110 = _98 + 1.0;
    float2 _360 = float2(_63, _65);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_360, float2(0.0), isnan(_360)), level(_108)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_360, float2(0.0), isnan(_360)), level(_108)).w;
    float2 _372 = float2(_110, _102);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_372, float2(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_372, float2(0.0), isnan(_372))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float _125 = in.m_33.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_35.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_37.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _61 * _129;
    float _145 = fma(_143, 0.23999999463558197021484375, 0.00999999977648258209228515625);
    float _147 = _61 * _135;
    float _149 = _61 * _141;
    float _151 = in.m_33.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_33.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_35.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_35.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _61 * _161;
    float _177 = _61 * _167;
    bool _181 = _112 >= _145;
    bool _183 = isnan(_112);
    bool _185 = _181 || _183;
    bool _187 = isnan(_145);
    bool _189 = _185 || _187;
    float _191 = float(_189);
    float _193 = _123 + _191;
    float _195 = _147 * _193;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _149;
    bool _201 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _203 = isnan(_199);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _209 = _205 || _207;
    float _211 = in.m_35.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_33.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    if (!_209)
    {
        discard_fragment();
    }
    float _223 = _119 * _119;
    float _225 = _61 * _173;
    float _227 = -_223;
    float _229 = _227 + 1.0;
    float _231 = _175 * _229;
    float _233 = _61 * _215;
    float _235 = _61 * _221;
    float _237 = _117 * _117;
    float _239 = _121 * _121;
    float _241 = _61 * _155;
    float _243 = fma(_223, _177, _231);
    float _245 = -_237;
    float _247 = _245 + 1.0;
    float _249 = -_239;
    float _251 = _249 + 1.0;
    float _253 = _235 * _247;
    float _255 = _241 * _251;
    float _257 = fma(_237, _233, _253);
    float _259 = fma(_239, _225, _255);
    if (!_209)
    {
        out.m_40.x = _257;
        out.m_40.y = _243;
        out.m_40.z = _259;
        out.m_40.w = _197;
        return out;
    }
    float _261 = 0.0 + _199;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    out.m_40.x = _257;
    out.m_40.y = _243;
    out.m_40.z = _259;
    out.m_40.w = _263;
    return out;
}

