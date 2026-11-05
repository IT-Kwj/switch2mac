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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _383 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_383, float2(0.0), isnan(_383))).w;
    float _69 = in.m_33.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _61 * _73;
    float _83 = _61 * _79;
    float _85 = in.m_31.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _61 * _89;
    float _93 = _67 * _81;
    float _95 = 0.0 + _93;
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = _97 * _83;
    bool _103 = _99 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _111 = _107 || _109;
    float _113 = in.m_31.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    if (!_111)
    {
        discard_fragment();
    }
    float _119 = _61 * _117;
    float2 _467 = float2(_119, _91);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_467, float2(0.0), isnan(_467))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_467, float2(0.0), isnan(_467))).w;
    float _123 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _125 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _123;
    float _127 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _129 = _127 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _131 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _133 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _131;
    float _135 = 1.0 / _125;
    float _137 = 1.0 / _129;
    float _139 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _141 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _139;
    float _143 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _145 = _143 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _147 = 1.0 / _133;
    float _149 = 0.0 + _121;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _155 = _151 + _153;
    float _157 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _159 = _151 + _157;
    bool _161 = _151 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _163 = isnan(_151);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _169 = _165 || _167;
    float _171 = float(_169);
    float _173 = _155 * _135;
    float _175 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _177 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _175;
    float _179 = _159 * _137;
    float _181 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _183 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _181;
    float _185 = fma(_141, _173, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _187 = fma(_177, _173, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _189 = in.m_37.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_37.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_37.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _209 = _151 + _207;
    float _211 = fma(_183, _173, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _213 = _151 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _215 = isnan(_151);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -_171;
    float _227 = _225 + 1.0;
    float _229 = _209 * _147;
    bool _231 = _151 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _233 = isnan(_151);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _247 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _249 = _247 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _251 = _151 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _253 = isnan(_151);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_223;
    float _265 = _263 + 1.0;
    float _267 = -_241;
    float _269 = _267 + 1.0;
    float _271 = fma(_249, _179, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _273 = fma(_145, _179, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _275 = _241 * _265;
    float _277 = _261 * _227;
    float _279 = _171 * _269;
    float _281 = -_261;
    float _283 = _281 + 1.0;
    float _285 = _185 * _277;
    float _287 = _187 * _277;
    float _289 = _211 * _277;
    float _291 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _293 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _291;
    float _295 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _297 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _295;
    float _299 = fma(_245, _179, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _301 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _303 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _301;
    float _305 = fma(_283, (*spvDescriptorSet0.fp_c9)._m0[107].x, _285);
    float _307 = fma(_283, (*spvDescriptorSet0.fp_c9)._m0[107].y, _287);
    float _309 = fma(_283, (*spvDescriptorSet0.fp_c9)._m0[107].z, _289);
    float _311 = fma(_293, _229, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _313 = fma(_297, _229, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _315 = fma(_303, _229, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _317 = fma(_273, _279, _305);
    float _319 = fma(_299, _279, _307);
    float _321 = fma(_271, _279, _309);
    float _323 = _61 * _199;
    float _325 = fma(_311, _275, _317);
    float _327 = fma(_313, _275, _319);
    float _329 = fma(_315, _275, _321);
    float _331 = _61 * _193;
    float _333 = _61 * _205;
    float _335 = fma(_223, (*spvDescriptorSet0.fp_c9)._m0[110].x, _325);
    float _337 = fma(_223, (*spvDescriptorSet0.fp_c9)._m0[110].y, _327);
    float _339 = fma(_223, (*spvDescriptorSet0.fp_c9)._m0[110].z, _329);
    float _341 = _335 + _331;
    float _343 = _337 + _323;
    float _345 = _339 + _333;
    if (!_111)
    {
        out.m_40.x = _341;
        out.m_40.y = _343;
        out.m_40.z = _345;
        out.m_40.w = _93;
        return out;
    }
    float _347 = 0.0 + _99;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    out.m_40.x = _341;
    out.m_40.y = _343;
    out.m_40.z = _345;
    out.m_40.w = _349;
    return out;
}

