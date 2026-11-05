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
    float4 m_36 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
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
    float2 _393 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _410 = float2(_59, _61);
    float4 _74 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_410, float2(0.0), isnan(_410)), int2(0), component::x).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = precise::min(_76, _82);
    float _88 = precise::min(_78, _80);
    float _90 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _92 = precise::max(_76, _82);
    float _94 = precise::max(_78, _80);
    float _96 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].z, _90);
    float _98 = precise::min(_86, _88);
    float _100 = precise::max(_92, _94);
    float _102 = precise::min(_96, _98);
    float _104 = precise::max(_96, _100);
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = -_102;
    float _110 = _108 + _104;
    float _112 = precise::max(_106, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _116 = _110 > _112;
    int _119 = as_type<int>(_110);
    int _121 = as_type<int>(_112);
    int _123 = as_type<int>(_106);
    int _125 = as_type<int>(_88);
    if (!_116)
    {
        _119 = 0;
        _121 = 0;
    }
    int _127 = _119;
    int _129 = _121;
    if (!_116)
    {
        _123 = 0;
        _125 = 0;
    }
    int _131 = _123;
    int _133 = _125;
    if (!_116)
    {
        out.m_34.x = as_type<float>(_127);
        out.m_34.y = as_type<float>(_129);
        out.m_34.z = as_type<float>(_131);
        out.m_34.w = as_type<float>(_133);
        return out;
    }
    float _135 = -_80;
    float _137 = _76 + _135;
    float _139 = -_82;
    float _141 = _78 + _139;
    float _143 = in.m_36.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_36.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_36.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = -_141;
    float _163 = _137 + _161;
    float _165 = _137 + _141;
    float _167 = in.m_36.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _163 * _163;
    float _175 = fma(_165, _165, _173);
    float _177 = _175 + 0.00260416674427688121795654296875;
    float _179 = rsqrt(_177);
    float _181 = _57 * _147;
    float _183 = _57 * _153;
    float _185 = _57 * _159;
    float _187 = _165 * _179;
    float _189 = _163 * _179;
    float _191 = _57 * _171;
    float _193 = -_181;
    float _195 = fma(_187, _193, _59);
    float _197 = fma(_187, _181, _59);
    float _199 = abs(_187);
    float _201 = abs(_189);
    float _203 = precise::min(_199, _201);
    float _205 = _203 * 2.0;
    float _207 = 1.0 / _205;
    float _209 = _207 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _211 = -_183;
    float _213 = fma(_189, _211, _61);
    float _215 = _209 * 0.5;
    float _217 = fma(_187, _215, 0.5);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_189, _215, 0.5);
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_189, _183, _61);
    float _227 = _219 + (-0.5);
    float _229 = _223 + (-0.5);
    float _231 = -_185;
    float _233 = fma(_227, _231, _59);
    float _235 = fma(_227, _185, _59);
    float _237 = -_191;
    float _239 = fma(_229, _237, _61);
    float _241 = fma(_229, _191, _61);
    float2 _671 = float2(_195, _213);
    float4 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).xyzw;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = _243.w;
    float2 _687 = float2(_197, _225);
    float4 _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).xyzw;
    float _255 = _253.x;
    float _257 = _253.y;
    float _259 = _253.z;
    float _261 = _253.w;
    float2 _703 = float2(_233, _239);
    float4 _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).xyzw;
    float _265 = _263.x;
    float _267 = _263.y;
    float _269 = _263.z;
    float _271 = _263.w;
    float2 _719 = float2(_235, _241);
    float4 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_719, float2(0.0), isnan(_719))).xyzw;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    float _281 = _273.w;
    float _283 = _247 + _257;
    float _285 = _245 + _255;
    float _287 = _249 + _259;
    float _289 = _251 + _261;
    float _291 = _267 + _277;
    float _293 = _265 + _275;
    float _295 = _269 + _279;
    float _297 = _271 + _281;
    float _299 = _283 + _291;
    float _301 = _285 + _293;
    float _303 = _287 + _295;
    float _305 = _289 + _297;
    float _307 = _299 * 0.25;
    float _309 = _301 * 0.25;
    float _311 = _303 * 0.25;
    float _313 = _289 * 0.5;
    float _315 = _307 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _317 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[2].x, _315);
    float _319 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[2].z, _317);
    bool _321 = _319 >= _100;
    bool _323 = isnan(_319);
    bool _325 = _321 || _323;
    bool _327 = isnan(_100);
    bool _329 = _325 || _327;
    bool _331 = _98 < _319;
    bool _333 = !_329;
    bool _335 = _331 && _333;
    int _337 = as_type<int>(_309);
    int _339 = as_type<int>(_307);
    int _341 = as_type<int>(_311);
    int _343 = as_type<int>(_313);
    if (!_335)
    {
        float _345 = _285 * 0.5;
        _337 = as_type<int>(_345);
    }
    int _347 = _337;
    if (!_335)
    {
        float _349 = _283 * 0.5;
        _339 = as_type<int>(_349);
    }
    int _351 = _339;
    if (!_335)
    {
        float _353 = _287 * 0.5;
        _341 = as_type<int>(_353);
    }
    int _355 = _341;
    if (_335)
    {
        float _357 = _305 * 0.25;
        _343 = as_type<int>(_357);
    }
    int _359 = _343;
    out.m_34.x = as_type<float>(_347);
    out.m_34.y = as_type<float>(_351);
    out.m_34.z = as_type<float>(_355);
    out.m_34.w = as_type<float>(_359);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _393 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _410 = float2(_59, _61);
    float4 _74 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_410, float2(0.0), isnan(_410)), int2(0), component::x).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = precise::min(_76, _82);
    float _88 = precise::min(_78, _80);
    float _90 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _92 = precise::max(_76, _82);
    float _94 = precise::max(_78, _80);
    float _96 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].z, _90);
    float _98 = precise::min(_86, _88);
    float _100 = precise::max(_92, _94);
    float _102 = precise::min(_96, _98);
    float _104 = precise::max(_96, _100);
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = -_102;
    float _110 = _108 + _104;
    float _112 = precise::max(_106, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _116 = _110 > _112;
    int _119 = as_type<int>(_110);
    int _121 = as_type<int>(_112);
    int _123 = as_type<int>(_106);
    int _125 = as_type<int>(_88);
    if (!_116)
    {
        _119 = 0;
        _121 = 0;
    }
    int _127 = _119;
    int _129 = _121;
    if (!_116)
    {
        _123 = 0;
        _125 = 0;
    }
    int _131 = _123;
    int _133 = _125;
    if (!_116)
    {
        out.m_34.x = as_type<float>(_127);
        out.m_34.y = as_type<float>(_129);
        out.m_34.z = as_type<float>(_131);
        out.m_34.w = as_type<float>(_133);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _135 = -_80;
    float _137 = _76 + _135;
    float _139 = -_82;
    float _141 = _78 + _139;
    float _143 = in.m_36.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_36.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_36.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = -_141;
    float _163 = _137 + _161;
    float _165 = _137 + _141;
    float _167 = in.m_36.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _163 * _163;
    float _175 = fma(_165, _165, _173);
    float _177 = _175 + 0.00260416674427688121795654296875;
    float _179 = rsqrt(_177);
    float _181 = _57 * _147;
    float _183 = _57 * _153;
    float _185 = _57 * _159;
    float _187 = _165 * _179;
    float _189 = _163 * _179;
    float _191 = _57 * _171;
    float _193 = -_181;
    float _195 = fma(_187, _193, _59);
    float _197 = fma(_187, _181, _59);
    float _199 = abs(_187);
    float _201 = abs(_189);
    float _203 = precise::min(_199, _201);
    float _205 = _203 * 2.0;
    float _207 = 1.0 / _205;
    float _209 = _207 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _211 = -_183;
    float _213 = fma(_189, _211, _61);
    float _215 = _209 * 0.5;
    float _217 = fma(_187, _215, 0.5);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_189, _215, 0.5);
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_189, _183, _61);
    float _227 = _219 + (-0.5);
    float _229 = _223 + (-0.5);
    float _231 = -_185;
    float _233 = fma(_227, _231, _59);
    float _235 = fma(_227, _185, _59);
    float _237 = -_191;
    float _239 = fma(_229, _237, _61);
    float _241 = fma(_229, _191, _61);
    float2 _671 = float2(_195, _213);
    float4 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).xyzw;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = _243.w;
    float2 _687 = float2(_197, _225);
    float4 _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).xyzw;
    float _255 = _253.x;
    float _257 = _253.y;
    float _259 = _253.z;
    float _261 = _253.w;
    float2 _703 = float2(_233, _239);
    float4 _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).xyzw;
    float _265 = _263.x;
    float _267 = _263.y;
    float _269 = _263.z;
    float _271 = _263.w;
    float2 _719 = float2(_235, _241);
    float4 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_719, float2(0.0), isnan(_719))).xyzw;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    float _281 = _273.w;
    float _283 = _247 + _257;
    float _285 = _245 + _255;
    float _287 = _249 + _259;
    float _289 = _251 + _261;
    float _291 = _267 + _277;
    float _293 = _265 + _275;
    float _295 = _269 + _279;
    float _297 = _271 + _281;
    float _299 = _283 + _291;
    float _301 = _285 + _293;
    float _303 = _287 + _295;
    float _305 = _289 + _297;
    float _307 = _299 * 0.25;
    float _309 = _301 * 0.25;
    float _311 = _303 * 0.25;
    float _313 = _289 * 0.5;
    float _315 = _307 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _317 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[2].x, _315);
    float _319 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[2].z, _317);
    bool _321 = _319 >= _100;
    bool _323 = isnan(_319);
    bool _325 = _321 || _323;
    bool _327 = isnan(_100);
    bool _329 = _325 || _327;
    bool _331 = _98 < _319;
    bool _333 = !_329;
    bool _335 = _331 && _333;
    int _337 = as_type<int>(_309);
    int _339 = as_type<int>(_307);
    int _341 = as_type<int>(_311);
    int _343 = as_type<int>(_313);
    if (!_335)
    {
        float _345 = _285 * 0.5;
        _337 = as_type<int>(_345);
    }
    int _347 = _337;
    if (!_335)
    {
        float _349 = _283 * 0.5;
        _339 = as_type<int>(_349);
    }
    int _351 = _339;
    if (!_335)
    {
        float _353 = _287 * 0.5;
        _341 = as_type<int>(_353);
    }
    int _355 = _341;
    if (_335)
    {
        float _357 = _305 * 0.25;
        _343 = as_type<int>(_357);
    }
    int _359 = _343;
    out.m_34.x = as_type<float>(_347);
    out.m_34.y = as_type<float>(_351);
    out.m_34.z = as_type<float>(_355);
    out.m_34.w = as_type<float>(_359);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

