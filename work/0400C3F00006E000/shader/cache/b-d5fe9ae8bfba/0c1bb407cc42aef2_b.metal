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
    float2 _263 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _280 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_280, float2(0.0), isnan(_280)), int2(0), component::x).xyzw;
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
    int _117 = as_type<int>(_110);
    int _119 = as_type<int>(_108);
    int _121 = as_type<int>(_69);
    int _123 = as_type<int>(_84);
    if (!_114)
    {
        _117 = 0;
        _119 = 0;
    }
    int _125 = _117;
    int _127 = _119;
    if (!_114)
    {
        _121 = 0;
        _123 = 0;
    }
    int _129 = _121;
    int _131 = _123;
    if (!_114)
    {
        out.m_34.x = as_type<float>(_125);
        out.m_34.y = as_type<float>(_127);
        out.m_34.z = as_type<float>(_129);
        out.m_34.w = as_type<float>(_131);
        return out;
    }
    float _133 = _78 + _80;
    float _135 = -_78;
    float _137 = _74 + _135;
    float _139 = -_80;
    float _141 = _76 + _139;
    float _143 = _74 + _133;
    float _145 = _137 + _141;
    float _147 = -_141;
    float _149 = _137 + _147;
    float _151 = _76 + _143;
    float _153 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _155 = abs(_145);
    float _157 = abs(_149);
    float _159 = precise::min(_155, _157);
    float _161 = fma(_151, _153, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _163 = precise::max(_161, _159);
    float _165 = 1.0 / _163;
    float _167 = _145 * _165;
    float _169 = _149 * _165;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _173 = precise::max(_167, _171);
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _177 = precise::max(_169, _175);
    float _179 = precise::min(_173, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _181 = precise::min(_177, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _183 = -_179;
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _189 = -_181;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float _193 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float2 _489 = float2(_185, _191);
    float4 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_489, float2(0.0), isnan(_489))).xyzw;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _195.w;
    float2 _505 = float2(_187, _193);
    float4 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).xyzw;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _205.w;
    float _215 = _197 + _207;
    float _217 = _199 + _209;
    float _219 = _201 + _211;
    float _221 = _203 + _213;
    float _223 = _215 * 0.5;
    float _225 = _217 * 0.5;
    float _227 = _219 * 0.5;
    float _229 = _221 * 0.5;
    out.m_34.x = _223;
    out.m_34.y = _225;
    out.m_34.z = _227;
    out.m_34.w = _229;
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
    float2 _263 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _280 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_280, float2(0.0), isnan(_280)), int2(0), component::x).xyzw;
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
    int _117 = as_type<int>(_110);
    int _119 = as_type<int>(_108);
    int _121 = as_type<int>(_69);
    int _123 = as_type<int>(_84);
    if (!_114)
    {
        _117 = 0;
        _119 = 0;
    }
    int _125 = _117;
    int _127 = _119;
    if (!_114)
    {
        _121 = 0;
        _123 = 0;
    }
    int _129 = _121;
    int _131 = _123;
    if (!_114)
    {
        out.m_34.x = as_type<float>(_125);
        out.m_34.y = as_type<float>(_127);
        out.m_34.z = as_type<float>(_129);
        out.m_34.w = as_type<float>(_131);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _133 = _78 + _80;
    float _135 = -_78;
    float _137 = _74 + _135;
    float _139 = -_80;
    float _141 = _76 + _139;
    float _143 = _74 + _133;
    float _145 = _137 + _141;
    float _147 = -_141;
    float _149 = _137 + _147;
    float _151 = _76 + _143;
    float _153 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _155 = abs(_145);
    float _157 = abs(_149);
    float _159 = precise::min(_155, _157);
    float _161 = fma(_151, _153, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _163 = precise::max(_161, _159);
    float _165 = 1.0 / _163;
    float _167 = _145 * _165;
    float _169 = _149 * _165;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _173 = precise::max(_167, _171);
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _177 = precise::max(_169, _175);
    float _179 = precise::min(_173, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _181 = precise::min(_177, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _183 = -_179;
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _189 = -_181;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float _193 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float2 _489 = float2(_185, _191);
    float4 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_489, float2(0.0), isnan(_489))).xyzw;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _195.w;
    float2 _505 = float2(_187, _193);
    float4 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).xyzw;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _205.w;
    float _215 = _197 + _207;
    float _217 = _199 + _209;
    float _219 = _201 + _211;
    float _221 = _203 + _213;
    float _223 = _215 * 0.5;
    float _225 = _217 * 0.5;
    float _227 = _219 * 0.5;
    float _229 = _221 * 0.5;
    out.m_34.x = _223;
    out.m_34.y = _225;
    out.m_34.z = _227;
    out.m_34.w = _229;
    return main0_out_u{as_type<uint4>(out.m_34)};
}

