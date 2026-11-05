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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = _65 * _63;
    float2 _378 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _395 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_395, float2(0.0), isnan(_395)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_395, float2(0.0), isnan(_395)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _411 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _426 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _441 = float2(_71, _73);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _128 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
    float _130 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _132 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
    float _136 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
    float _138 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
    float _140 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _142 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _144 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _146 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _140);
    float _148 = precise::min(_136, _138);
    float _150 = precise::min(_142, _144);
    float _152 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].z, _146);
    float _154 = precise::max(_136, _138);
    float _156 = precise::max(_142, _144);
    float _158 = precise::min(_148, _150);
    float _160 = precise::max(_154, _156);
    float _162 = precise::min(_152, _158);
    float _164 = precise::max(_152, _160);
    float _166 = _160 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _168 = -_162;
    float _170 = _168 + _164;
    float _172 = precise::max(_166, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _176 = _170 > _172;
    int _179 = as_type<int>(_170);
    int _181 = as_type<int>(_172);
    int _183 = as_type<int>(_166);
    int _185 = as_type<int>(_150);
    if (!_176)
    {
        _179 = 0;
        _181 = 0;
    }
    int _187 = _179;
    int _189 = _181;
    if (!_176)
    {
        _183 = 0;
        _185 = 0;
    }
    int _191 = _183;
    int _193 = _185;
    if (!_176)
    {
        out.m_32.x = as_type<float>(_187);
        out.m_32.y = as_type<float>(_189);
        out.m_32.z = as_type<float>(_191);
        out.m_32.w = as_type<float>(_193);
        return out;
    }
    float _195 = _136 + _142;
    float _197 = -_142;
    float _199 = _197 + _138;
    float _201 = -_136;
    float _203 = _201 + _144;
    float _205 = _138 + _195;
    float _207 = _199 + _203;
    float _209 = -_203;
    float _211 = _199 + _209;
    float _213 = _144 + _205;
    float _215 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _217 = abs(_207);
    float _219 = abs(_211);
    float _221 = precise::min(_217, _219);
    float _223 = fma(_213, _215, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _225 = precise::max(_223, _221);
    float _227 = 1.0 / _225;
    float _229 = _207 * _227;
    float _231 = _211 * _227;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _235 = precise::max(_229, _233);
    float _237 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _239 = precise::max(_231, _237);
    float _241 = precise::min(_235, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _243 = precise::min(_239, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _245 = -_241;
    float _247 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _249 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _251 = -_243;
    float _253 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float _255 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float2 _705 = float2(_247, _253);
    float4 _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_705, float2(0.0), isnan(_705))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_705, float2(0.0), isnan(_705))).xyzw;
    float _259 = _257.x;
    float _261 = _257.y;
    float _263 = _257.z;
    float _265 = _257.w;
    float2 _721 = float2(_249, _255);
    float4 _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_721, float2(0.0), isnan(_721))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_721, float2(0.0), isnan(_721))).xyzw;
    float _269 = _267.x;
    float _271 = _267.y;
    float _273 = _267.z;
    float _275 = _267.w;
    float _277 = -_263;
    float _279 = _277 + _273;
    float _281 = -_259;
    float _283 = _281 + _269;
    float _285 = -_261;
    float _287 = _285 + _271;
    float _289 = -_265;
    float _291 = _289 + _275;
    float _293 = fma(_279, 0.5, _263);
    float _295 = fma(_283, 0.5, _259);
    float _297 = fma(_287, 0.5, _261);
    float _299 = fma(_291, 0.5, _265);
    float _301 = -_293;
    float _303 = _116 + _301;
    float _305 = -_295;
    float _307 = _112 + _305;
    float _309 = -_297;
    float _311 = _114 + _309;
    float _313 = -_299;
    float _315 = _118 + _313;
    float _317 = fma(_303, 0.3499999940395355224609375, _293);
    float _319 = fma(_307, 0.3499999940395355224609375, _295);
    float _321 = fma(_311, 0.3499999940395355224609375, _297);
    float _323 = fma(_315, 0.3499999940395355224609375, _299);
    out.m_32.x = _319;
    out.m_32.y = _321;
    out.m_32.z = _317;
    out.m_32.w = _323;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = _65 * _63;
    float2 _378 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _395 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_395, float2(0.0), isnan(_395)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_395, float2(0.0), isnan(_395)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _411 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _426 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _441 = float2(_71, _73);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _128 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
    float _130 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _132 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
    float _136 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
    float _138 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
    float _140 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _142 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _144 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _146 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _140);
    float _148 = precise::min(_136, _138);
    float _150 = precise::min(_142, _144);
    float _152 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].z, _146);
    float _154 = precise::max(_136, _138);
    float _156 = precise::max(_142, _144);
    float _158 = precise::min(_148, _150);
    float _160 = precise::max(_154, _156);
    float _162 = precise::min(_152, _158);
    float _164 = precise::max(_152, _160);
    float _166 = _160 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _168 = -_162;
    float _170 = _168 + _164;
    float _172 = precise::max(_166, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _176 = _170 > _172;
    int _179 = as_type<int>(_170);
    int _181 = as_type<int>(_172);
    int _183 = as_type<int>(_166);
    int _185 = as_type<int>(_150);
    if (!_176)
    {
        _179 = 0;
        _181 = 0;
    }
    int _187 = _179;
    int _189 = _181;
    if (!_176)
    {
        _183 = 0;
        _185 = 0;
    }
    int _191 = _183;
    int _193 = _185;
    if (!_176)
    {
        out.m_32.x = as_type<float>(_187);
        out.m_32.y = as_type<float>(_189);
        out.m_32.z = as_type<float>(_191);
        out.m_32.w = as_type<float>(_193);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _195 = _136 + _142;
    float _197 = -_142;
    float _199 = _197 + _138;
    float _201 = -_136;
    float _203 = _201 + _144;
    float _205 = _138 + _195;
    float _207 = _199 + _203;
    float _209 = -_203;
    float _211 = _199 + _209;
    float _213 = _144 + _205;
    float _215 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _217 = abs(_207);
    float _219 = abs(_211);
    float _221 = precise::min(_217, _219);
    float _223 = fma(_213, _215, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _225 = precise::max(_223, _221);
    float _227 = 1.0 / _225;
    float _229 = _207 * _227;
    float _231 = _211 * _227;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _235 = precise::max(_229, _233);
    float _237 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _239 = precise::max(_231, _237);
    float _241 = precise::min(_235, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _243 = precise::min(_239, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _245 = -_241;
    float _247 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _249 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _251 = -_243;
    float _253 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float _255 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float2 _705 = float2(_247, _253);
    float4 _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_705, float2(0.0), isnan(_705))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_705, float2(0.0), isnan(_705))).xyzw;
    float _259 = _257.x;
    float _261 = _257.y;
    float _263 = _257.z;
    float _265 = _257.w;
    float2 _721 = float2(_249, _255);
    float4 _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_721, float2(0.0), isnan(_721))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_721, float2(0.0), isnan(_721))).xyzw;
    float _269 = _267.x;
    float _271 = _267.y;
    float _273 = _267.z;
    float _275 = _267.w;
    float _277 = -_263;
    float _279 = _277 + _273;
    float _281 = -_259;
    float _283 = _281 + _269;
    float _285 = -_261;
    float _287 = _285 + _271;
    float _289 = -_265;
    float _291 = _289 + _275;
    float _293 = fma(_279, 0.5, _263);
    float _295 = fma(_283, 0.5, _259);
    float _297 = fma(_287, 0.5, _261);
    float _299 = fma(_291, 0.5, _265);
    float _301 = -_293;
    float _303 = _116 + _301;
    float _305 = -_295;
    float _307 = _112 + _305;
    float _309 = -_297;
    float _311 = _114 + _309;
    float _313 = -_299;
    float _315 = _118 + _313;
    float _317 = fma(_303, 0.3499999940395355224609375, _293);
    float _319 = fma(_307, 0.3499999940395355224609375, _295);
    float _321 = fma(_311, 0.3499999940395355224609375, _297);
    float _323 = fma(_315, 0.3499999940395355224609375, _299);
    out.m_32.x = _319;
    out.m_32.y = _321;
    out.m_32.z = _317;
    out.m_32.w = _323;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

