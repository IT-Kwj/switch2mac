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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texturecube<float> fp_t_tcb_1E [[id(4)]];
    sampler fp_t_tcb_1ESmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_1ESmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_34 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_34.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_34.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _60;
    float _76 = _74 * _66;
    float _78 = _74 * _72;
    float2 _505 = float2(_76, _78);
    float4 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).xyzw;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float _89 = _81.w;
    float _91 = in.m_36.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_38.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_40.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _74 * _95;
    float _111 = _74 * _101;
    float _113 = _74 * _107;
    float _115 = in.m_38.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_38.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_42.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_42.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_36.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_36.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_36.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _74 * _131;
    float _159 = _89 * _109;
    float _161 = _111 * _159;
    float _163 = 0.0 + _161;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _165 * _113;
    bool _171 = _167 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _179 = _175 || _177;
    float _181 = in.m_38.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_42.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    if (!_179)
    {
        discard_fragment();
    }
    float _193 = _83 * _83;
    float _195 = _85 * _85;
    float _197 = _87 * _87;
    float _199 = _74 * _185;
    float _201 = _74 * _125;
    float _203 = _74 * _191;
    float _205 = _74 * _119;
    float _207 = _74 * _137;
    float _209 = -_157;
    float _211 = _201 + _209;
    float _213 = -_203;
    float _215 = _199 + _213;
    float _217 = -_207;
    float _219 = _205 + _217;
    float _221 = fma(_195, _211, _157);
    float _223 = fma(_193, _215, _203);
    float _225 = _74 * _143;
    float _227 = fma(_197, _219, _207);
    float _229 = _74 * _149;
    float _231 = _74 * _155;
    float _233 = _223 * _225;
    float _235 = _221 * _229;
    float _237 = _227 * _231;
    if (!_179)
    {
        out.m_45.x = _233;
        out.m_45.y = _235;
        out.m_45.z = _237;
        out.m_45.w = _161;
        return out;
    }
    float _239 = in.m_47.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _74 * _243;
    bool _247 = _245 != 1.0;
    bool _249 = isnan(_245);
    bool _251 = _247 || _249;
    bool _253 = isnan(1.0);
    bool _255 = _251 || _253;
    bool _257 = !_255;
    if (!_257)
    {
        float _259 = gl_FragCoord.x;
        float _261 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _263 = _259 / _261;
        float _265 = gl_FragCoord.y;
        float _267 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _269 = _265 / _267;
        float _271 = _245 * 256.0;
        float _273 = trunc(_271);
        int _276 = int(_273);
        uint _279 = uint(int(uint(_276) >> uint(7)));
        int _281 = int(_279) + _276;
        float _283 = trunc(_263);
        int _285 = int(_283);
        float _287 = trunc(_269);
        int _289 = int(_287);
        int _291 = _285 + 2;
        int _293 = _291 >> 1;
        uint _295 = uint(int(uint(_289) >> uint(1)));
        int _297 = _293 ^ int(_295);
        int _299 = _297 << 16;
        int _301 = _299 ^ _293;
        int _303 = 983055 & _301;
        int _305 = _303 << 6;
        int _307 = _305 + _303;
        int _309 = _307 & 13369548;
        uint _311 = uint(int(uint(_309) >> uint(3)));
        int _313 = _309 | int(_311);
        int _315 = _313 & 5570560;
        int _317 = _313 & 85;
        uint _319 = uint(int(uint(_315) >> uint(15)));
        int _321 = int(_319) + _317;
        bool _323 = uint(_281) > uint(_321);
        if (!_323)
        {
            discard_fragment();
        }
        if (!_323)
        {
            out.m_45.x = _233;
            out.m_45.y = _235;
            out.m_45.z = _237;
            out.m_45.w = _167;
            return out;
        }
    }
    float _325 = in.m_49.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_49.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_49.z;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_47.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _74 * _329;
    float _351 = _74 * _335;
    float _353 = _74 * _341;
    float _355 = _349 * _349;
    float _357 = fma(_351, _351, _355);
    float _359 = fma(_353, _353, _357);
    float _361 = rsqrt(_359);
    float _363 = _351 * _361;
    float _365 = _349 * _361;
    float _367 = _353 * _361;
    float _369 = _74 * _347;
    float _371 = abs(_363);
    float _373 = abs(_365);
    float _375 = precise::max(_371, _373);
    float _377 = abs(_367);
    float _379 = precise::max(_377, _375);
    float _381 = 1.0 / _379;
    float _383 = _363 * _381;
    float _385 = -_381;
    float _387 = _367 * _385;
    float _389 = precise::min(_369, 1.0);
    float _391 = _365 * _381;
    float3 _964 = float3(_383, _391, _387);
    float3 _395 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_964, float3(0.0), isnan(_964)), level(_389)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_964, float3(0.0), isnan(_964)), level(_389)).xyz;
    float _397 = _395.x;
    float _399 = _395.y;
    float _401 = _395.z;
    float _403 = in.m_51.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_51.y;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_51.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_53.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_53.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_53.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = _74 * _407;
    float _441 = _74 * _413;
    float _443 = _74 * _419;
    float _445 = _74 * _425;
    float _447 = _74 * _431;
    float _449 = _74 * _437;
    float _451 = fma(_397, 0.20999999344348907470703125, _439);
    float _453 = fma(_399, 0.20999999344348907470703125, _441);
    float _455 = fma(_401, 0.20999999344348907470703125, _443);
    float _457 = _451 + _445;
    float _459 = _453 + _447;
    float _461 = _455 + _449;
    float _463 = _233 * _457;
    float _465 = _235 * _459;
    float _467 = _237 * _461;
    float _469 = 0.0 + _167;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    out.m_45.x = _463;
    out.m_45.y = _465;
    out.m_45.z = _467;
    out.m_45.w = _471;
    return out;
}

