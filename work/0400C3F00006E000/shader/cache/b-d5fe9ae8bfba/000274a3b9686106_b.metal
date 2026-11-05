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
    texturecube<float> fp_t_tcb_1E [[id(3)]];
    sampler fp_t_tcb_1ESmplr [[id(4)]];
    sampler fp_t_tcb_1ESmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _61;
    float _95 = _93 * _67;
    float _97 = _93 * _73;
    float _99 = _95 * _95;
    float _101 = fma(_97, _97, _99);
    float _103 = sqrt(_101);
    float _105 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _107 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _105;
    float _109 = 1.0 / _107;
    float _111 = _103 * 2.0;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = precise::max(_117, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _121 = precise::min(_119, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _123 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _125 = _121 + _123;
    float _127 = _125 * _109;
    float _129 = _93 * _79;
    float _131 = _93 * _85;
    float _133 = _93 * _91;
    float _135 = _127 * _129;
    float _137 = _131 * _135;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _139 * _133;
    bool _145 = _141 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _147 = isnan(_141);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _153 = _149 || _151;
    float _155 = in.m_37.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_37.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_37.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_35.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_35.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_35.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    if (!_153)
    {
        discard_fragment();
    }
    float _191 = _127 * _127;
    float _193 = -_191;
    float _195 = _193 + 1.0;
    float _197 = _93 * _159;
    float _199 = _93 * _165;
    float _201 = _93 * _171;
    float _203 = _197 * _195;
    float _205 = _199 * _195;
    float _207 = _201 * _195;
    float _209 = _93 * _177;
    float _211 = _93 * _183;
    float _213 = _93 * _189;
    float _215 = fma(_191, _209, _205);
    float _217 = fma(_191, _211, _203);
    float _219 = fma(_191, _213, _207);
    if (!_153)
    {
        out.m_42.x = _215;
        out.m_42.y = _217;
        out.m_42.z = _219;
        out.m_42.w = _139;
        return out;
    }
    float _221 = in.m_44.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_44.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_44.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_46.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _93 * _225;
    float _247 = _93 * _231;
    float _249 = _93 * _237;
    float _251 = _93 * _243;
    float _253 = _245 * _245;
    float _255 = fma(_247, _247, _253);
    float _257 = fma(_249, _249, _255);
    float _259 = rsqrt(_257);
    float _261 = _247 * _259;
    float _263 = _245 * _259;
    float _265 = _249 * _259;
    float _267 = abs(_261);
    float _269 = abs(_263);
    float _271 = precise::max(_267, _269);
    float _273 = abs(_265);
    float _275 = precise::max(_273, _271);
    float _277 = 1.0 / _275;
    float _279 = _263 * _277;
    float _281 = -_277;
    float _283 = _265 * _281;
    float _285 = precise::min(_251, 1.0);
    float _287 = _261 * _277;
    float3 _793 = float3(_287, _279, _283);
    float3 _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_793, float3(0.0), isnan(_793)), level(_285)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_793, float3(0.0), isnan(_793)), level(_285)).xyz;
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float _299 = in.m_48.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_48.y;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_48.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_50.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_50.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_50.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_52.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_52.w;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_52.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_52.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    bool _359 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _361 = _93 * _303;
    float _363 = _93 * _309;
    float _365 = _93 * _315;
    float _367 = fma(_295, 0.20999999344348907470703125, _363);
    float _369 = fma(_297, 0.20999999344348907470703125, _365);
    float _371 = fma(_293, 0.20999999344348907470703125, _361);
    float _373 = _93 * _321;
    float _375 = _93 * _327;
    float _377 = _93 * _333;
    float _379 = _367 + _373;
    float _381 = _369 + _375;
    float _383 = _371 + _377;
    float _385 = _93 * _345;
    float _387 = _217 * _379;
    float _389 = _219 * _381;
    float _391 = _215 * _383;
    float _393 = 0.0 + _141;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _93 * _339;
    float _399 = _93 * _351;
    float _401 = _93 * _357;
    float _403 = fma(_391, _385, _397);
    float _405 = fma(_387, _385, _399);
    float _407 = fma(_389, _385, _401);
    float _409 = _397;
    if (!_359)
    {
        _409 = _395;
    }
    float _411 = _409;
    bool _413 = !_359;
    float _415 = _411;
    if (!_413)
    {
        float _417 = in.m_54.w;
        float _419 = gl_FragCoord.w;
        float _421 = _417 * _419;
        float _423 = in.m_54.z;
        float _425 = gl_FragCoord.w;
        float _427 = _423 * _425;
        float _429 = _93 * _421;
        float _431 = _93 * _427;
        float _433 = 1.0 / _429;
        float _435 = _431 * _433;
        float _437 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _439 = fma(_435, (*spvDescriptorSet0.fp_c8)._m0[30].w, _437);
        float _441 = 1.0 / _439;
        float _443 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _445 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _447 = fma(_441, _443, _445);
        float _449 = _447 * 8.0;
        float _451 = precise::clamp(_449, 0.0, 1.0);
        float _453 = _395 * _451;
        _415 = _453;
    }
    float _455 = _415;
    float _457 = 0.0 + _455;
    float _459 = precise::clamp(_457, 0.0, 1.0);
    out.m_42.x = _403;
    out.m_42.y = _405;
    out.m_42.z = _407;
    out.m_42.w = _459;
    return out;
}

