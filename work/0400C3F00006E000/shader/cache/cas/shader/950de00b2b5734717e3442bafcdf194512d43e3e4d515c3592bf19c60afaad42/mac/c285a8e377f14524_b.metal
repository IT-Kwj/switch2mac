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
    float2 _357 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _374 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_374, float2(0.0), isnan(_374)), int2(0), component::x).xyzw;
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
    int _117 = as_type<int>(_108);
    int _119 = as_type<int>(_110);
    int _121 = as_type<int>(_104);
    int _123 = as_type<int>(_86);
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
    float _187 = -_179;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[1].z, _57);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].z, _57);
    float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _195 = -_181;
    float _197 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[1].w, _59);
    float _199 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].w, _59);
    float _201 = -_181;
    float _203 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float _205 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float2 _607 = float2(_189, _197);
    float4 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).xyzw;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    float _215 = _207.w;
    float2 _623 = float2(_191, _199);
    float4 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).xyzw;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = _217.w;
    float2 _639 = float2(_185, _203);
    float4 _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).xyzw;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    float _235 = _227.w;
    float2 _655 = float2(_193, _205);
    float4 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).xyzw;
    float _239 = _237.x;
    float _241 = _237.y;
    float _243 = _237.z;
    float _245 = _237.w;
    float _247 = _211 + _221;
    float _249 = _209 + _219;
    float _251 = _231 + _241;
    float _253 = _229 + _239;
    float _255 = _213 + _223;
    float _257 = _233 + _243;
    float _259 = _247 + _251;
    float _261 = _249 + _253;
    float _263 = _215 + _225;
    float _265 = _255 + _257;
    float _267 = _259 * 0.25;
    float _269 = _261 * 0.25;
    float _271 = _265 * 0.25;
    float _273 = _267 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _275 = _235 + _245;
    float _277 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[2].x, _273);
    float _279 = _263 + _275;
    float _281 = _263 * 0.5;
    float _283 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[2].z, _277);
    bool _285 = _283 > _98;
    bool _287 = isnan(_283);
    bool _289 = _285 || _287;
    bool _291 = isnan(_98);
    bool _293 = _289 || _291;
    bool _295 = _96 <= _283;
    bool _297 = !_293;
    bool _299 = _295 && _297;
    int _301 = as_type<int>(_269);
    int _303 = as_type<int>(_267);
    int _305 = as_type<int>(_271);
    int _307 = as_type<int>(_281);
    if (!_299)
    {
        float _309 = _249 * 0.5;
        _301 = as_type<int>(_309);
    }
    int _311 = _301;
    if (!_299)
    {
        float _313 = _247 * 0.5;
        _303 = as_type<int>(_313);
    }
    int _315 = _303;
    if (!_299)
    {
        float _317 = _255 * 0.5;
        _305 = as_type<int>(_317);
    }
    int _319 = _305;
    if (_299)
    {
        float _321 = _279 * 0.25;
        _307 = as_type<int>(_321);
    }
    int _323 = _307;
    out.m_34.x = as_type<float>(_311);
    out.m_34.y = as_type<float>(_315);
    out.m_34.z = as_type<float>(_319);
    out.m_34.w = as_type<float>(_323);
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
    float2 _357 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _374 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_374, float2(0.0), isnan(_374)), int2(0), component::x).xyzw;
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
    int _117 = as_type<int>(_108);
    int _119 = as_type<int>(_110);
    int _121 = as_type<int>(_104);
    int _123 = as_type<int>(_86);
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
    float _187 = -_179;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[1].z, _57);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].z, _57);
    float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _195 = -_181;
    float _197 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[1].w, _59);
    float _199 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].w, _59);
    float _201 = -_181;
    float _203 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float _205 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float2 _607 = float2(_189, _197);
    float4 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).xyzw;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    float _215 = _207.w;
    float2 _623 = float2(_191, _199);
    float4 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).xyzw;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = _217.w;
    float2 _639 = float2(_185, _203);
    float4 _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).xyzw;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    float _235 = _227.w;
    float2 _655 = float2(_193, _205);
    float4 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).xyzw;
    float _239 = _237.x;
    float _241 = _237.y;
    float _243 = _237.z;
    float _245 = _237.w;
    float _247 = _211 + _221;
    float _249 = _209 + _219;
    float _251 = _231 + _241;
    float _253 = _229 + _239;
    float _255 = _213 + _223;
    float _257 = _233 + _243;
    float _259 = _247 + _251;
    float _261 = _249 + _253;
    float _263 = _215 + _225;
    float _265 = _255 + _257;
    float _267 = _259 * 0.25;
    float _269 = _261 * 0.25;
    float _271 = _265 * 0.25;
    float _273 = _267 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _275 = _235 + _245;
    float _277 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[2].x, _273);
    float _279 = _263 + _275;
    float _281 = _263 * 0.5;
    float _283 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[2].z, _277);
    bool _285 = _283 > _98;
    bool _287 = isnan(_283);
    bool _289 = _285 || _287;
    bool _291 = isnan(_98);
    bool _293 = _289 || _291;
    bool _295 = _96 <= _283;
    bool _297 = !_293;
    bool _299 = _295 && _297;
    int _301 = as_type<int>(_269);
    int _303 = as_type<int>(_267);
    int _305 = as_type<int>(_271);
    int _307 = as_type<int>(_281);
    if (!_299)
    {
        float _309 = _249 * 0.5;
        _301 = as_type<int>(_309);
    }
    int _311 = _301;
    if (!_299)
    {
        float _313 = _247 * 0.5;
        _303 = as_type<int>(_313);
    }
    int _315 = _303;
    if (!_299)
    {
        float _317 = _255 * 0.5;
        _305 = as_type<int>(_317);
    }
    int _319 = _305;
    if (_299)
    {
        float _321 = _279 * 0.25;
        _307 = as_type<int>(_321);
    }
    int _323 = _307;
    out.m_34.x = as_type<float>(_311);
    out.m_34.y = as_type<float>(_315);
    out.m_34.z = as_type<float>(_319);
    out.m_34.w = as_type<float>(_323);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

