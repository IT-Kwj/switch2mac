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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = _55 + (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _63 = _57 + _61;
    float2 _434 = float2(_55, _57);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _77 = _55 + _75;
    float2 _457 = float2(_59, _57);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_457, float2(0.0), isnan(_457))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _57 + (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float2 _475 = float2(_77, _57);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float2 _489 = float2(_55, _63);
    float3 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_489, float2(0.0), isnan(_489))).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float2 _503 = float2(_55, _87);
    float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _81 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _115 = -_73;
    float _117 = _115 + _85;
    float _119 = -_71;
    float _121 = _119 + _93;
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _125 = _103 + _123;
    float _127 = -_71;
    float _129 = _127 + _101;
    float _131 = -_71;
    float _133 = _131 + _83;
    float _135 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _137 = _91 + _135;
    float _139 = -_73;
    float _141 = _139 + _125;
    float _143 = _117 * _129;
    float _145 = -_73;
    float _147 = _145 + _95;
    float _149 = -_69;
    float _151 = _149 + _99;
    float _153 = -_69;
    float _155 = _153 + _113;
    float _157 = -_143;
    float _159 = fma(_133, _141, _157);
    float _161 = -_69;
    float _163 = _161 + _137;
    float _165 = _147 * _151;
    float _167 = _155 * _141;
    float _169 = _133 * _151;
    float _171 = _121 * _141;
    float _173 = -_165;
    float _175 = fma(_163, _141, _173);
    float _177 = -_167;
    float _179 = fma(_117, _151, _177);
    float _181 = _111 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _183 = -_69;
    float _185 = _183 + _107;
    float _187 = -_169;
    float _189 = fma(_155, _129, _187);
    bool _193 = _175 >= 0.0;
    bool _195 = isnan(_175);
    bool _197 = _193 || _195;
    bool _199 = isnan(0.0);
    bool _201 = _197 || _199;
    float _203 = -_73;
    float _205 = _203 + _181;
    bool _207 = _179 >= 0.0;
    bool _209 = isnan(_179);
    bool _211 = _207 || _209;
    bool _213 = isnan(0.0);
    bool _215 = _211 || _213;
    float _217 = _163 * _129;
    bool _219 = !_201;
    float _221 = -_175;
    float _223 = _219 ? _221 : _175;
    float _225 = _163 * _205;
    bool _227 = !_215;
    float _229 = -_179;
    float _231 = _227 ? _229 : _179;
    float _233 = -_171;
    float _235 = fma(_147, _129, _233);
    float _237 = -_71;
    float _239 = _237 + _109;
    float _241 = -_225;
    float _243 = fma(_147, _185, _241);
    float _245 = -_217;
    float _247 = fma(_121, _151, _245);
    float _249 = _231 + _223;
    float _251 = _117 * _185;
    bool _253 = !_215;
    float _255 = -_159;
    float _257 = _253 ? _255 : _159;
    float _259 = _147 * _239;
    bool _261 = !_215;
    float _263 = -_189;
    float _265 = _261 ? _263 : _189;
    float _267 = -_251;
    float _269 = fma(_155, _205, _267);
    bool _271 = _243 >= 0.0;
    bool _273 = isnan(_243);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.0);
    bool _279 = _275 || _277;
    float _281 = _121 * _185;
    bool _283 = !_201;
    float _285 = -_235;
    float _287 = _283 ? _285 : _235;
    float _289 = -_259;
    float _291 = fma(_121, _205, _289);
    bool _293 = !_201;
    float _295 = -_247;
    float _297 = _293 ? _295 : _247;
    float _299 = _133 * _205;
    bool _301 = !_279;
    float _303 = -_243;
    float _305 = _301 ? _303 : _243;
    float _307 = -_281;
    float _309 = fma(_163, _239, _307);
    bool _311 = _269 >= 0.0;
    bool _313 = isnan(_269);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = _155 * _239;
    float _323 = -_299;
    float _325 = fma(_117, _239, _323);
    bool _327 = !_279;
    float _329 = -_291;
    float _331 = _327 ? _329 : _291;
    float _333 = _257 + _287;
    bool _335 = !_319;
    float _337 = -_269;
    float _339 = _335 ? _337 : _269;
    float _341 = _305 + _249;
    float _343 = -_321;
    float _345 = fma(_133, _185, _343);
    bool _347 = !_279;
    float _349 = -_309;
    float _351 = _347 ? _349 : _309;
    float _353 = _265 + _297;
    bool _355 = !_319;
    float _357 = -_325;
    float _359 = _355 ? _357 : _325;
    float _361 = _331 + _333;
    float _363 = _339 + _341;
    bool _365 = !_319;
    float _367 = -_345;
    float _369 = _365 ? _367 : _345;
    float _371 = _351 + _353;
    float _373 = _359 + _361;
    float _375 = _363 * _363;
    float _377 = _369 + _371;
    float _379 = fma(_373, _373, _375);
    float _381 = fma(_377, _377, _379);
    float _383 = rsqrt(_381);
    float _385 = _373 * _383;
    float _387 = _363 * _383;
    float _389 = _377 * _383;
    out.m_32.x = _385;
    out.m_32.y = _387;
    out.m_32.z = _389;
    out.m_32.w = _71;
    return out;
}

