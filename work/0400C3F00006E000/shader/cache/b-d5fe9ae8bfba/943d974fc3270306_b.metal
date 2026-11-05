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
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _219 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _236 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_236, float2(0.0), isnan(_236)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = _67 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = precise::min(_74, _80);
    float _86 = precise::min(_76, _78);
    float _88 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _90 = precise::max(_74, _80);
    float _92 = precise::max(_76, _78);
    float _94 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = precise::min(_84, _86);
    float _98 = precise::max(_90, _92);
    float _100 = precise::min(_94, _96);
    float _102 = precise::max(_94, _98);
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = -_100;
    float _108 = _106 + _102;
    float _110 = precise::max(_104, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _114 = _108 > _110;
    int _117 = as_type<int>(_57);
    if (!_114)
    {
        _117 = 0;
    }
    int _119 = _117;
    bool _121 = !_114;
    int _123 = _119;
    if (!_121)
    {
        float _125 = _78 + _80;
        float _127 = -_78;
        float _129 = _74 + _127;
        float _131 = -_80;
        float _133 = _76 + _131;
        float _135 = _74 + _125;
        float _137 = _129 + _133;
        float _139 = -_133;
        float _141 = _129 + _139;
        float _143 = _76 + _135;
        float _145 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _147 = fma(_143, _145, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _149 = abs(_137);
        float _151 = abs(_141);
        float _153 = precise::min(_149, _151);
        float _155 = precise::max(_147, _153);
        float _157 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _159 = 1.0 / _155;
        float _161 = _141 * _159;
        float _163 = _137 * _159;
        float _165 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _167 = precise::max(_161, _165);
        float _169 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _171 = precise::max(_163, _169);
        float _173 = precise::min(_167, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _175 = precise::min(_171, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _177 = _173 * _173;
        float _179 = fma(_175, _175, _177);
        float _181 = sqrt(_179);
        float _183 = _181 * _157;
        _123 = as_type<int>(_183);
    }
    int _185 = _123;
    out.m_34.x = as_type<float>(_185);
    out.m_34.y = as_type<float>(_185);
    out.m_34.z = as_type<float>(_185);
    out.m_34.w = as_type<float>(_185);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _219 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _236 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_236, float2(0.0), isnan(_236)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = _67 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = precise::min(_74, _80);
    float _86 = precise::min(_76, _78);
    float _88 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _90 = precise::max(_74, _80);
    float _92 = precise::max(_76, _78);
    float _94 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = precise::min(_84, _86);
    float _98 = precise::max(_90, _92);
    float _100 = precise::min(_94, _96);
    float _102 = precise::max(_94, _98);
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = -_100;
    float _108 = _106 + _102;
    float _110 = precise::max(_104, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _114 = _108 > _110;
    int _117 = as_type<int>(_57);
    if (!_114)
    {
        _117 = 0;
    }
    int _119 = _117;
    bool _121 = !_114;
    int _123 = _119;
    if (!_121)
    {
        float _125 = _78 + _80;
        float _127 = -_78;
        float _129 = _74 + _127;
        float _131 = -_80;
        float _133 = _76 + _131;
        float _135 = _74 + _125;
        float _137 = _129 + _133;
        float _139 = -_133;
        float _141 = _129 + _139;
        float _143 = _76 + _135;
        float _145 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _147 = fma(_143, _145, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _149 = abs(_137);
        float _151 = abs(_141);
        float _153 = precise::min(_149, _151);
        float _155 = precise::max(_147, _153);
        float _157 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _159 = 1.0 / _155;
        float _161 = _141 * _159;
        float _163 = _137 * _159;
        float _165 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _167 = precise::max(_161, _165);
        float _169 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _171 = precise::max(_163, _169);
        float _173 = precise::min(_167, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _175 = precise::min(_171, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _177 = _173 * _173;
        float _179 = fma(_175, _175, _177);
        float _181 = sqrt(_179);
        float _183 = _181 * _157;
        _123 = as_type<int>(_183);
    }
    int _185 = _123;
    out.m_34.x = as_type<float>(_185);
    out.m_34.y = as_type<float>(_185);
    out.m_34.z = as_type<float>(_185);
    out.m_34.w = as_type<float>(_185);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

