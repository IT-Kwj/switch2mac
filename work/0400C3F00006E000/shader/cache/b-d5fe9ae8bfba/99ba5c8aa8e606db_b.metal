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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_39 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = _77 * _75;
    float _85 = 1.0 / _79;
    float _87 = _81 * _85;
    float _89 = _83 * _85;
    float2 _425 = float2(_87, _89);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_425, float2(0.0), isnan(_425))).x;
    float _93 = in.m_37.y;
    float _95 = in.m_39.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _101);
    float _111 = in.m_37.x;
    float _113 = in.m_35.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _109);
    float _121 = (*spvDescriptorSet0.fp_c10)._m0[5].y * (*spvDescriptorSet0.fp_c10)._m0[5].y;
    float _123 = in.m_37.z;
    float _125 = (*spvDescriptorSet0.fp_c10)._m0[5].z * (*spvDescriptorSet0.fp_c10)._m0[5].z;
    float _127 = fma((*spvDescriptorSet0.fp_c10)._m0[4].y, (*spvDescriptorSet0.fp_c10)._m0[4].y, _121);
    float _129 = sqrt(_119);
    float _131 = in.m_39.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = fma((*spvDescriptorSet0.fp_c10)._m0[6].y, (*spvDescriptorSet0.fp_c10)._m0[6].y, _127);
    float _139 = fma((*spvDescriptorSet0.fp_c10)._m0[4].z, (*spvDescriptorSet0.fp_c10)._m0[4].z, _125);
    float _141 = sqrt(_137);
    float _143 = fma((*spvDescriptorSet0.fp_c10)._m0[6].z, (*spvDescriptorSet0.fp_c10)._m0[6].z, _139);
    float _145 = in.m_41.x;
    float _147 = in.m_41.y;
    float _149 = sqrt(_143);
    float _151 = _111 * _129;
    float _153 = _93 * _141;
    float _155 = in.m_41.z;
    float _157 = _153 * _153;
    float _159 = _123 * _149;
    float _161 = fma(_151, _151, _157);
    float _163 = fma(_159, _159, _161);
    float _165 = _77 * _99;
    float _167 = _165 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _169 = sqrt(_163);
    float _171 = _147 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _173 = _77 * _107;
    float _175 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[1].x, _171);
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[1].x, _167);
    float _179 = _77 * _117;
    float _181 = _77 * _135;
    float _183 = in.m_43.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _179 * _85;
    float _191 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[1].z, _177);
    float _193 = in.m_45.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _169 + _169;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = fma(_155, (*spvDescriptorSet0.fp_c8)._m0[1].z, _175);
    float _207 = 1.0 / _199;
    float _209 = -_205;
    float _211 = _191 + _209;
    float _213 = _211 + _169;
    float _215 = 1.0 / _203;
    float _217 = _213 * _207;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _219 * _219;
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _225 = _215 * _223;
    float _227 = in.m_45.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _235 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
    float _237 = fma(_221, (*spvDescriptorSet0.fp_c9)._m0[194].z, _225);
    float _239 = _77 * _197;
    float _241 = _77 * _187;
    float _243 = 1.0 / _235;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = -_237;
    float _249 = fma(_243, _245, _247);
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = _239 * _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _255 * _241;
    bool _261 = _257 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _263 = isnan(_257);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _269 = _265 || _267;
    float _271 = in.m_45.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_45.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    if (!_269)
    {
        discard_fragment();
    }
    float _283 = _77 * _275;
    float _285 = _77 * _281;
    float _287 = _77 * _231;
    if (!_269)
    {
        out.m_48.x = _285;
        out.m_48.y = _283;
        out.m_48.z = _287;
        out.m_48.w = _255;
        return out;
    }
    float _289 = _283 * 0.715200006961822509765625;
    float _291 = in.m_50.w;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_50.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_50.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = fma(_285, 0.2125999927520751953125, _289);
    float _311 = in.m_50.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = fma(_287, 0.072200000286102294921875, _309);
    bool _319 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _321 = 1.0 / _317;
    float _323 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_319)
    {
        float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _327 = _225 + _325;
        _323 = _327;
    }
    float _329 = _323;
    float _331 = _321 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = fma(_333, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _337 = _77 * _295;
    float _339 = _77 * _301;
    float _341 = _335 * _337;
    float _343 = 0.0 + _257;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = _337;
    float _349 = _345;
    if (_319)
    {
        float _351 = _329 * 8.0;
        float _353 = precise::clamp(_351, 0.0, 1.0);
        _347 = _353;
    }
    float _355 = _347;
    float _357 = _77 * _307;
    float _359 = _77 * _315;
    float _361 = fma(_285, _341, _339);
    if (_319)
    {
        float _363 = _345 * _355;
        _349 = _363;
    }
    float _365 = _349;
    float _367 = fma(_283, _341, _357);
    float _369 = fma(_287, _341, _359);
    float _371 = 0.0 + _365;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    out.m_48.x = _361;
    out.m_48.y = _367;
    out.m_48.z = _369;
    out.m_48.w = _373;
    return out;
}

