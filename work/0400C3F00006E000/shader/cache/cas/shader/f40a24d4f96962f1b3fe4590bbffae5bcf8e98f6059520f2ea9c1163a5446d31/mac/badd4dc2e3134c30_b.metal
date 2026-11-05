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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _378;
    _378.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_73, _75));
    _378.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_73, _75));
    float _77 = _378.x;
    float _79 = _77 * 256.0;
    int _82 = int(_79);
    float _84 = float(uint(_82));
    float _86 = _84 * 0.00390625;
    float _88 = precise::min(_86, 2.0);
    float2 _398 = float2(_73, _75);
    float4 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398)), level(_88)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398)), level(_88)).xyzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = _91.w;
    float _101 = in.m_37.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_39.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_35.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _71 * _105;
    float _121 = _71 * _111;
    float _123 = in.m_35.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _71 * _117;
    float _131 = _129 + 0.300000011920928955078125;
    float _133 = _71 * _127;
    float _135 = _99 * _119;
    float _137 = 0.0 + _135;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _139 * _121;
    bool _145 = _141 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _147 = isnan(_141);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _153 = _149 || _151;
    if (!_153)
    {
        discard_fragment();
    }
    float2 _493 = float2(_133, _131);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_493, float2(0.0), isnan(_493))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float2 _507 = float2(_133, _129);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_507, float2(0.0), isnan(_507))).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = in.m_41.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_43.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _93 + _95;
    float _187 = _185 * _185;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _71 * _177;
    float _193 = _189 * _191;
    float _195 = _159 * _159;
    float _197 = _161 * _161;
    float _199 = _163 * _163;
    float _201 = _169 * _169;
    float _203 = _95 * _195;
    float _205 = _95 * _197;
    float _207 = _95 * _199;
    float _209 = _167 * _167;
    float _211 = _171 * _171;
    float _213 = fma(_201, _93, _205);
    float _215 = _71 * _183;
    float _217 = fma(_209, _93, _203);
    float _219 = fma(_211, _93, _207);
    float _221 = fma(_97, _213, _193);
    float _223 = fma(_97, _217, _193);
    float _225 = fma(_97, _219, _193);
    float _227 = _221 * _215;
    float _229 = _223 * _215;
    float _231 = _225 * _215;
    if (!_153)
    {
        out.m_46.x = _229;
        out.m_46.y = _227;
        out.m_46.z = _231;
        out.m_46.w = _135;
        return out;
    }
    float _233 = _227 * 0.715200006961822509765625;
    float _235 = in.m_48.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_48.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_48.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_229, 0.2125999927520751953125, _233);
    float _255 = in.m_48.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_231, 0.072200000286102294921875, _253);
    bool _263 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _265 = 1.0 / _261;
    float _267 = _265 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_269, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _273 = _71 * _239;
    float _275 = _71 * _245;
    float _277 = _271 * _273;
    float _279 = 0.0 + _141;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _71 * _251;
    float _285 = _71 * _259;
    float _287 = fma(_231, _277, _275);
    float _289 = fma(_229, _277, _283);
    float _291 = fma(_227, _277, _285);
    float _293 = _275;
    if (!_263)
    {
        _293 = _281;
    }
    float _295 = _293;
    bool _297 = !_263;
    float _299 = _295;
    if (!_297)
    {
        float _301 = in.m_50.w;
        float _303 = gl_FragCoord.w;
        float _305 = _301 * _303;
        float _307 = in.m_50.z;
        float _309 = gl_FragCoord.w;
        float _311 = _307 * _309;
        float _313 = _71 * _305;
        float _315 = _71 * _311;
        float _317 = 1.0 / _313;
        float _319 = _315 * _317;
        float _321 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _323 = fma(_319, (*spvDescriptorSet0.fp_c8)._m0[30].w, _321);
        float _325 = 1.0 / _323;
        float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _331 = fma(_325, _327, _329);
        float _333 = _331 * 8.0;
        float _335 = precise::clamp(_333, 0.0, 1.0);
        float _337 = _281 * _335;
        _299 = _337;
    }
    float _339 = _299;
    float _341 = 0.0 + _339;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    out.m_46.x = _289;
    out.m_46.y = _291;
    out.m_46.z = _287;
    out.m_46.w = _343;
    return out;
}

