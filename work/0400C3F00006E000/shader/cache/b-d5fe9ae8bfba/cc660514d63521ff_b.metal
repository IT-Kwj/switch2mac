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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _91 * _97;
    float _101 = _93 * _97;
    float _103 = _87 * _85;
    float2 _407 = float2(_99, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_407, float2(0.0), isnan(_407))).x;
    float2 _418 = float2(_103, _95);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).w;
    float _109 = in.m_37.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_45.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _87 * _113;
    float _135 = _133 * _97;
    float _137 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _139 = fma(_135, (*spvDescriptorSet0.fp_c8)._m0[30].w, _137);
    float _141 = 1.0 / _139;
    float _143 = _87 * _119;
    float _145 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _147 = _141 * _145;
    float _149 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _151 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _149);
    float _153 = -_143;
    float _155 = _107 + _153;
    float _157 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _159 = _87 * _125;
    float _161 = _155 * _159;
    float _163 = 1.0 / _151;
    float _165 = 0.0 + _161;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _171 = -_147;
    float _173 = fma(_163, _169, _171);
    float _175 = _173 * _157;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _87 * _131;
    float _181 = _167 * _177;
    float _183 = _181 * _179;
    bool _187 = _183 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _189 = isnan(_183);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _195 = _191 || _193;
    float _197 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    bool _201 = _199 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _203 = isnan(_199);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = _183;
    if (!_195)
    {
        discard_fragment();
    }
    bool _215 = _199 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _217 = isnan(_199);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -_211;
    float _229 = _227 + 1.0;
    bool _231 = _199 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _233 = isnan(_199);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = _225 * _229;
    float _245 = -_225;
    float _247 = _245 + 1.0;
    float _249 = _243 * (*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _251 = _243 * (*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _253 = _243 * (*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _255 = fma(_247, (*spvDescriptorSet0.fp_c9)._m0[107].x, _249);
    float _257 = fma(_247, (*spvDescriptorSet0.fp_c9)._m0[107].y, _251);
    float _259 = fma(_247, (*spvDescriptorSet0.fp_c9)._m0[107].z, _253);
    float _261 = -_241;
    float _263 = _261 + 1.0;
    float _265 = _211 * _263;
    float _267 = fma(_265, (*spvDescriptorSet0.fp_c9)._m0[108].x, _255);
    float _269 = fma(_265, (*spvDescriptorSet0.fp_c9)._m0[108].y, _257);
    float _271 = fma(_265, (*spvDescriptorSet0.fp_c9)._m0[108].z, _259);
    float _273 = fma(_241, (*spvDescriptorSet0.fp_c9)._m0[109].x, _267);
    float _275 = fma(_241, (*spvDescriptorSet0.fp_c9)._m0[109].y, _269);
    float _277 = fma(_241, (*spvDescriptorSet0.fp_c9)._m0[109].z, _271);
    float _279 = (*spvDescriptorSet0.fp_c9)._m0[191].x + 1.0;
    float _281 = _273 * _279;
    float _283 = _275 * _279;
    float _285 = _277 * _279;
    float _287 = _273;
    if (!_195)
    {
        out.m_48.x = _281;
        out.m_48.y = _283;
        out.m_48.z = _285;
        out.m_48.w = _161;
        return out;
    }
    float _289 = _283 * 0.715200006961822509765625;
    float _291 = fma(_281, 0.2125999927520751953125, _289);
    float _293 = fma(_285, 0.072200000286102294921875, _291);
    bool _295 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _297 = 1.0 / _293;
    float _299 = 0.0 + _183;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _301;
    if (_295)
    {
        float _305 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _307 = _147 + _305;
        _287 = _307;
    }
    float _309 = _287;
    float _311 = _297 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    if (_295)
    {
        float _315 = _309 * 8.0;
        float _317 = precise::clamp(_315, 0.0, 1.0);
        _213 = _317;
    }
    float _319 = _213;
    float _321 = fma(_313, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_295)
    {
        float _323 = _301 * _319;
        _303 = _323;
    }
    float _325 = _303;
    float _327 = _281 * _321;
    float _329 = _283 * _321;
    float _331 = _285 * _321;
    float _333 = 0.0 + _325;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    out.m_48.x = _327;
    out.m_48.y = _329;
    out.m_48.z = _331;
    out.m_48.w = _335;
    return out;
}

