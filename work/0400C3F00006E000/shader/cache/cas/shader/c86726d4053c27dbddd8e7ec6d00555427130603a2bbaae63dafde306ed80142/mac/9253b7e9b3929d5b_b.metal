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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _487 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_487, float2(0.0), isnan(_487))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_44.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _80 * _101;
    float _117 = _80 * _107;
    float _119 = in.m_40.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_40.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_42.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_40.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_42.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _80 * _135;
    float _151 = _80 * _141;
    float _153 = -_115;
    float _155 = _95 + _153;
    float _157 = _155 * 4.0;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _117 * _159;
    float _163 = _80 * _113;
    float _165 = 0.0 + _161;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _167 * _163;
    bool _173 = _169 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _175 = isnan(_169);
    bool _177 = _173 || _175;
    bool _179 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _181 = _177 || _179;
    float _183 = in.m_42.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    if (!_181)
    {
        discard_fragment();
    }
    float _189 = _80 * _129;
    float _191 = _80 * _123;
    float _193 = _80 * _147;
    float _195 = -_149;
    float _197 = _191 + _195;
    float _199 = -_193;
    float _201 = _151 + _199;
    float _203 = fma(_91, _197, _149);
    float _205 = _80 * _187;
    float _207 = -_205;
    float _209 = _189 + _207;
    float _211 = fma(_89, _209, _205);
    float _213 = fma(_93, _201, _193);
    if (!_181)
    {
        out.m_47.x = _211;
        out.m_47.y = _203;
        out.m_47.z = _213;
        out.m_47.w = _161;
        return out;
    }
    float _215 = in.m_49.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_49.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_49.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _80 * _219;
    float _235 = _80 * _225;
    float _237 = _80 * _231;
    float _239 = _233 * _233;
    float _241 = in.m_51.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = fma(_235, _235, _239);
    float _249 = fma(_237, _237, _247);
    float _251 = rsqrt(_249);
    float _253 = _235 * _251;
    float _255 = _233 * _251;
    float _257 = _237 * _251;
    float _259 = _80 * _245;
    float _261 = abs(_253);
    float _263 = abs(_255);
    float _265 = precise::max(_261, _263);
    float _267 = precise::min(_259, 1.0);
    float _269 = abs(_257);
    float _271 = precise::max(_269, _265);
    float _273 = 1.0 / _271;
    float _275 = -_273;
    float _277 = _257 * _275;
    float _279 = _253 * _273;
    float _281 = _255 * _273;
    float3 _769 = float3(_279, _281, _277);
    float3 _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_769, float3(0.0), isnan(_769)), level(_267)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_769, float3(0.0), isnan(_769)), level(_267)).xyz;
    float _287 = _285.x;
    float _289 = _285.y;
    float _291 = _285.z;
    float _293 = in.m_53.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_53.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_53.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_55.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_55.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_55.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_57.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_57.w;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_57.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_57.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = _80 * _297;
    float _355 = _80 * _303;
    float _357 = _80 * _309;
    bool _359 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _361 = fma(_287, 0.20999999344348907470703125, _355);
    float _363 = fma(_291, 0.20999999344348907470703125, _357);
    float _365 = fma(_289, 0.20999999344348907470703125, _353);
    float _367 = _80 * _315;
    float _369 = _80 * _321;
    float _371 = _80 * _327;
    float _373 = _361 + _367;
    float _375 = _363 + _369;
    float _377 = _365 + _371;
    float _379 = 0.0 + _169;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _211 * _373;
    float _385 = _213 * _375;
    float _387 = _203 * _377;
    float _389 = _80 * _333;
    float _391 = _80 * _339;
    float _393 = _80 * _345;
    float _395 = _80 * _351;
    float _397 = fma(_383, _391, _389);
    float _399 = fma(_387, _391, _393);
    float _401 = fma(_385, _391, _395);
    float _403 = _389;
    if (!_359)
    {
        _403 = _381;
    }
    float _405 = _403;
    bool _407 = !_359;
    float _409 = _405;
    if (!_407)
    {
        float _411 = in.m_59.w;
        float _413 = gl_FragCoord.w;
        float _415 = _411 * _413;
        float _417 = in.m_59.z;
        float _419 = gl_FragCoord.w;
        float _421 = _417 * _419;
        float _423 = _80 * _415;
        float _425 = _80 * _421;
        float _427 = 1.0 / _423;
        float _429 = _425 * _427;
        float _431 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _433 = fma(_429, (*spvDescriptorSet0.fp_c8)._m0[30].w, _431);
        float _435 = 1.0 / _433;
        float _437 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _439 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _441 = fma(_435, _437, _439);
        float _443 = _441 * 8.0;
        float _445 = precise::clamp(_443, 0.0, 1.0);
        float _447 = _381 * _445;
        _409 = _447;
    }
    float _449 = _409;
    float _451 = 0.0 + _449;
    float _453 = precise::clamp(_451, 0.0, 1.0);
    out.m_47.x = _397;
    out.m_47.y = _399;
    out.m_47.z = _401;
    out.m_47.w = _453;
    return out;
}

