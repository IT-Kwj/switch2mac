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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_33 [[user(locn3), flat]];
    float4 m_43 [[user(locn4)]];
    float4 m_35 [[user(locn5), flat]];
    float4 m_31 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = 1.0 / _53;
    float _71 = _69 * _59;
    float _73 = _69 * _65;
    float _75 = _71 * _67;
    float _77 = _73 * _67;
    float2 _488 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_488, float2(0.0), isnan(_488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_488, float2(0.0), isnan(_488))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_35.x;
    float _89 = in.m_31.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_31.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _87 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _103 = _69 * _93;
    float _105 = _69 * _99;
    float _107 = fma(_83, _101, _103);
    float _109 = fma(_85, _101, _105);
    float2 _541 = float2(_107, _109);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_541, float2(0.0), isnan(_541))).w;
    float _113 = in.m_37.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _69 * _117;
    float _133 = _69 * _123;
    float _135 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _137 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _135;
    float _139 = in.m_39.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _111 * _131;
    float _147 = _69 * _129;
    float _149 = _133 * _145;
    float _151 = 0.0 + _149;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 * _147;
    bool _159 = _155 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _161 = isnan(_155);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _167 = _163 || _165;
    float _169 = in.m_43.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    if (!_167)
    {
        discard_fragment();
    }
    float _175 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _177 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _175;
    float _179 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _181 = _179 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _183 = 1.0 / _177;
    float _185 = _69 * _173;
    float _187 = 1.0 / _181;
    float _189 = 0.0 + _185;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _195 = _191 + _193;
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _199 = _191 + _197;
    float _201 = _195 * _183;
    float _203 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _205 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _203;
    float _207 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _209 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _207;
    float _211 = fma(_137, _201, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _213 = fma(_205, _201, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _215 = fma(_209, _201, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _217 = _199 * _187;
    float _219 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _221 = _219 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _225 = _223 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _227 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _229 = isnan(_191);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _241 = _239 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _243 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _245 = isnan(_191);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = fma(_221, _217, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _257 = fma(_225, _217, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _259 = -_237;
    float _261 = _259 + 1.0;
    float _263 = fma(_241, _217, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _265 = _253 * _261;
    float _267 = -_253;
    float _269 = _267 + 1.0;
    float _271 = _213 * _265;
    float _273 = _215 * _265;
    float _275 = _211 * _265;
    float _277 = fma(_269, (*spvDescriptorSet0.fp_c9)._m0[107].x, _271);
    float _279 = fma(_269, (*spvDescriptorSet0.fp_c9)._m0[107].y, _273);
    float _281 = fma(_269, (*spvDescriptorSet0.fp_c9)._m0[107].z, _275);
    bool _283 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _285 = isnan(_191);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _297 = isnan(_191);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_293;
    float _309 = _307 + 1.0;
    float _311 = _237 * _309;
    float _313 = fma(_255, _311, _277);
    float _315 = fma(_263, _311, _279);
    float _317 = fma(_257, _311, _281);
    float _319 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _321 = _191 + _319;
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _325 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _323;
    float _327 = 1.0 / _325;
    float _329 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _331 = _191 + _329;
    bool _333 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _335 = isnan(_191);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _321 * _327;
    float _347 = -_305;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _353 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _351;
    float _355 = _293 * _349;
    float _357 = fma(_353, _345, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _359 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _361 = _359 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _363 = fma(_357, _355, _313);
    float _365 = 1.0 / _361;
    float _367 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _369 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _367;
    float _371 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _373 = _371 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _375 = fma(_369, _345, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _377 = fma(_375, _355, _315);
    float _379 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _381 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _379;
    float _383 = fma(_381, _345, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _385 = _331 * _365;
    float _387 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _389 = _387 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _393 = _391 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _395 = fma(_383, _355, _317);
    float _397 = in.m_39.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_39.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = -_343;
    float _411 = _409 + 1.0;
    float _413 = fma(_389, _385, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _415 = fma(_373, _385, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _417 = fma(_393, _385, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _419 = _305 * _411;
    float _421 = fma(_413, _419, _363);
    float _423 = fma(_415, _419, _377);
    float _425 = fma(_417, _419, _395);
    float _427 = fma(_343, (*spvDescriptorSet0.fp_c9)._m0[111].x, _421);
    float _429 = fma(_343, (*spvDescriptorSet0.fp_c9)._m0[111].y, _423);
    float _431 = fma(_343, (*spvDescriptorSet0.fp_c9)._m0[111].z, _425);
    float _433 = _69 * _401;
    float _435 = _69 * _407;
    float _437 = _69 * _143;
    float _439 = _429 + _433;
    float _441 = _427 + _435;
    float _443 = _431 + _437;
    if (!_167)
    {
        out.m_46.x = _441;
        out.m_46.y = _439;
        out.m_46.z = _443;
        out.m_46.w = _149;
        return out;
    }
    float _445 = 0.0 + _155;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    out.m_46.x = _441;
    out.m_46.y = _439;
    out.m_46.z = _443;
    out.m_46.w = _447;
    return out;
}

