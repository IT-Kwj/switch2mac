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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    sampler fp_t_tcb_ASmplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn4)]];
    float4 m_31 [[user(locn5), flat]];
    float4 m_29 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_29.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_29.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.x;
    float _65 = 1.0 / _49;
    float _67 = _65 * _55;
    float _69 = _65 * _61;
    float _71 = fma(_63, (*spvDescriptorSet0.fp_c9)._m0[191].x, _67);
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c9)._m0[191].x, _69);
    float2 _460 = float2(_71, _73);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_460, float2(0.0), isnan(_460))).w;
    float _77 = in.m_33.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _65 * _81;
    float _97 = _65 * _87;
    float _99 = in.m_35.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _75 * _95;
    float _107 = _65 * _93;
    float _109 = _97 * _105;
    float _111 = 0.0 + _109;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _113 * _107;
    bool _119 = _115 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _121 = isnan(_115);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _127 = _123 || _125;
    float _129 = in.m_39.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    if (!_127)
    {
        discard_fragment();
    }
    float _135 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _137 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _135;
    float _139 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _141 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _139;
    float _143 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _145 = _143 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _147 = 1.0 / _141;
    float _149 = _65 * _133;
    float _151 = 1.0 / _145;
    float _153 = 0.0 + _149;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _159 = _155 + _157;
    float _161 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _163 = _155 + _161;
    float _165 = _159 * _147;
    float _167 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _169 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _167;
    float _171 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _173 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _171;
    float _175 = fma(_137, _165, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _177 = fma(_169, _165, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _179 = fma(_173, _165, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _181 = _163 * _151;
    float _183 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _185 = _183 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _187 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _189 = _187 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _191 = _155 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _193 = isnan(_155);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _205 = _203 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _207 = _155 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _209 = isnan(_155);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = fma(_185, _181, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _221 = fma(_189, _181, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _223 = -_201;
    float _225 = _223 + 1.0;
    float _227 = fma(_205, _181, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _229 = _217 * _225;
    float _231 = -_217;
    float _233 = _231 + 1.0;
    float _235 = _177 * _229;
    float _237 = _179 * _229;
    float _239 = _175 * _229;
    float _241 = fma(_233, (*spvDescriptorSet0.fp_c9)._m0[107].x, _235);
    float _243 = fma(_233, (*spvDescriptorSet0.fp_c9)._m0[107].y, _237);
    float _245 = fma(_233, (*spvDescriptorSet0.fp_c9)._m0[107].z, _239);
    bool _247 = _155 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _249 = isnan(_155);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _155 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _261 = isnan(_155);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_257;
    float _273 = _271 + 1.0;
    float _275 = _201 * _273;
    float _277 = fma(_219, _275, _241);
    float _279 = fma(_227, _275, _243);
    float _281 = fma(_221, _275, _245);
    float _283 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _285 = _155 + _283;
    float _287 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _289 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _287;
    float _291 = 1.0 / _289;
    float _293 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _295 = _155 + _293;
    bool _297 = _155 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _299 = isnan(_155);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = _285 * _291;
    float _311 = -_269;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _317 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _315;
    float _319 = _257 * _313;
    float _321 = fma(_317, _309, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _325 = _323 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _327 = fma(_321, _319, _277);
    float _329 = 1.0 / _325;
    float _331 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _333 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _331;
    float _335 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _337 = _335 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _339 = fma(_333, _309, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _341 = fma(_339, _319, _279);
    float _343 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _345 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _343;
    float _347 = fma(_345, _309, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _349 = _295 * _329;
    float _351 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _353 = _351 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _355 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _357 = _355 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _359 = fma(_347, _319, _281);
    float _361 = in.m_35.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_35.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = -_307;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _349, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _379 = fma(_337, _349, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _381 = fma(_357, _349, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _383 = _269 * _375;
    float _385 = fma(_377, _383, _327);
    float _387 = fma(_379, _383, _341);
    float _389 = fma(_381, _383, _359);
    float _391 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[111].x, _385);
    float _393 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[111].y, _387);
    float _395 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[111].z, _389);
    float _397 = _65 * _365;
    float _399 = _65 * _371;
    float _401 = _65 * _103;
    float _403 = _393 + _397;
    float _405 = _391 + _399;
    float _407 = _395 + _401;
    if (!_127)
    {
        out.m_42.x = _405;
        out.m_42.y = _403;
        out.m_42.z = _407;
        out.m_42.w = _109;
        return out;
    }
    float _409 = 0.0 + _115;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    out.m_42.x = _405;
    out.m_42.y = _403;
    out.m_42.z = _407;
    out.m_42.w = _411;
    return out;
}

