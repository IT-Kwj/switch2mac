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
    float4 m_46 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _59;
    float _93 = _91 * _65;
    float _95 = _91 * _71;
    float _97 = _93 * _93;
    float _99 = fma(_95, _95, _97);
    float _101 = sqrt(_99);
    float _103 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _105 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _103;
    float _107 = 1.0 / _105;
    float _109 = _101 * 2.0;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = -_111;
    float _115 = _113 + 1.0;
    float _117 = precise::max(_115, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _119 = precise::min(_117, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _121 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _123 = _119 + _121;
    float _125 = _123 * _107;
    float _127 = _91 * _77;
    float _129 = _91 * _83;
    float _131 = _91 * _89;
    float _133 = _125 * _127;
    float _135 = _129 * _133;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _137 * _131;
    bool _143 = _139 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _145 = isnan(_139);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _151 = _147 || _149;
    float _153 = in.m_37.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_37.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_37.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_35.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_35.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_35.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    if (!_151)
    {
        discard_fragment();
    }
    float _189 = _125 * _125;
    float _191 = -_189;
    float _193 = _191 + 1.0;
    float _195 = _91 * _157;
    float _197 = _91 * _163;
    float _199 = _91 * _169;
    float _201 = _195 * _193;
    float _203 = _197 * _193;
    float _205 = _199 * _193;
    float _207 = _91 * _175;
    float _209 = _91 * _181;
    float _211 = _91 * _187;
    float _213 = fma(_189, _207, _203);
    float _215 = fma(_189, _209, _201);
    float _217 = fma(_189, _211, _205);
    if (!_151)
    {
        out.m_42.x = _213;
        out.m_42.y = _215;
        out.m_42.z = _217;
        out.m_42.w = _137;
        return out;
    }
    float _219 = in.m_44.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_44.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_44.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _91 * _223;
    float _239 = _91 * _229;
    float _241 = _91 * _235;
    float _243 = _237 * _237;
    float _245 = fma(_239, _239, _243);
    float _247 = fma(_241, _241, _245);
    float _249 = rsqrt(_247);
    float _251 = _239 * _249;
    float _253 = _237 * _249;
    float _255 = _241 * _249;
    float _257 = abs(_251);
    float _259 = abs(_253);
    float _261 = precise::max(_257, _259);
    float _263 = abs(_255);
    float _265 = precise::max(_263, _261);
    float _267 = 1.0 / _265;
    float _269 = -_267;
    float _271 = _255 * _269;
    float _273 = _251 * _267;
    float _275 = _253 * _267;
    float3 _769 = float3(_273, _275, _271);
    float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_769, float3(0.0), isnan(_769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_769, float3(0.0), isnan(_769)), level(0.0)).xyz;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = in.m_46.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_46.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_46.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_48.y;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_48.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_48.x;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_50.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_50.w;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_50.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_50.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    bool _347 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _349 = _91 * _291;
    float _351 = _91 * _297;
    float _353 = _91 * _303;
    float _355 = fma(_283, 0.20999999344348907470703125, _351);
    float _357 = fma(_285, 0.20999999344348907470703125, _353);
    float _359 = fma(_281, 0.20999999344348907470703125, _349);
    float _361 = _91 * _309;
    float _363 = _91 * _315;
    float _365 = _91 * _321;
    float _367 = _355 + _361;
    float _369 = _357 + _363;
    float _371 = _359 + _365;
    float _373 = _91 * _333;
    float _375 = _215 * _367;
    float _377 = _217 * _369;
    float _379 = _213 * _371;
    float _381 = 0.0 + _139;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _91 * _327;
    float _387 = _91 * _339;
    float _389 = _91 * _345;
    float _391 = fma(_379, _373, _385);
    float _393 = fma(_375, _373, _387);
    float _395 = fma(_377, _373, _389);
    float _397 = _385;
    if (!_347)
    {
        _397 = _383;
    }
    float _399 = _397;
    bool _401 = !_347;
    float _403 = _399;
    if (!_401)
    {
        float _405 = in.m_52.w;
        float _407 = gl_FragCoord.w;
        float _409 = _405 * _407;
        float _411 = in.m_52.z;
        float _413 = gl_FragCoord.w;
        float _415 = _411 * _413;
        float _417 = _91 * _409;
        float _419 = _91 * _415;
        float _421 = 1.0 / _417;
        float _423 = _419 * _421;
        float _425 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _427 = fma(_423, (*spvDescriptorSet0.fp_c8)._m0[30].w, _425);
        float _429 = 1.0 / _427;
        float _431 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _433 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _435 = fma(_429, _431, _433);
        float _437 = _435 * 8.0;
        float _439 = precise::clamp(_437, 0.0, 1.0);
        float _441 = _383 * _439;
        _403 = _441;
    }
    float _443 = _403;
    float _445 = 0.0 + _443;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    out.m_42.x = _391;
    out.m_42.y = _393;
    out.m_42.z = _395;
    out.m_42.w = _447;
    return out;
}

