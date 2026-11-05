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
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
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
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float2 _277 = float2(_71, _73);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float2 _296 = float2(_75, _77);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_296, float2(0.0), isnan(_296))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    int _101 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _105 = _101 != 0;
    bool _107 = _82 >= 0.5;
    bool _109 = isnan(_82);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.5);
    bool _115 = _111 || _113;
    float _117 = _84 * 2.0;
    float _119 = precise::max(_88, _98);
    float _121 = -_92;
    float _123 = _121 + 1.0;
    float _125 = _119;
    if (_105)
    {
        float _127 = precise::min(_88, _98);
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _82 * 2.0;
    bool _133 = _84 >= 0.5;
    bool _135 = isnan(_84);
    bool _137 = _133 || _135;
    bool _139 = isnan(0.5);
    bool _141 = _137 || _139;
    float _143 = _94 * _117;
    bool _145 = _86 >= 0.5;
    bool _147 = isnan(_86);
    bool _149 = _145 || _147;
    bool _151 = isnan(0.5);
    bool _153 = _149 || _151;
    float _155 = _92 * _131;
    float _157 = -_131;
    float _159 = _157 + 2.0;
    float _161 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = -_94;
    float _167 = _165 + 1.0;
    float _169 = -_117;
    float _171 = _169 + 2.0;
    float _173 = _155;
    float _175 = _143;
    if (_115)
    {
        float _177 = -_159;
        float _179 = fma(_177, _123, 1.0);
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _86 * 2.0;
    bool _185 = _163 != 0.0;
    bool _187 = isnan(_163);
    bool _189 = _185 || _187;
    bool _191 = isnan(0.0);
    bool _193 = _189 || _191;
    if (_141)
    {
        float _195 = -_171;
        float _197 = fma(_195, _167, 1.0);
        _175 = _197;
    }
    float _199 = _175;
    float _201 = -_96;
    float _203 = _201 + 1.0;
    float _205 = -_183;
    float _207 = _205 + 2.0;
    float _209 = _96 * _183;
    float _211 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _213 = _209;
    if (_153)
    {
        float _215 = -_207;
        float _217 = fma(_215, _203, 1.0);
        _213 = _217;
    }
    float _219 = _213;
    float _221 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _223 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    if (_193)
    {
        out.m_36.x = _221;
        out.m_36.y = _211;
        out.m_36.z = _223;
        out.m_36.w = _163;
        return out;
    }
    discard_fragment();
    return out;
}

