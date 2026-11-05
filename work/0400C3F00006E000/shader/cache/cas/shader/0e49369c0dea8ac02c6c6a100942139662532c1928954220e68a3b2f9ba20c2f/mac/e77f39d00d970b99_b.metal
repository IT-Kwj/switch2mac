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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2), flat]];
    float4 m_35 [[user(locn3), flat]];
    float4 m_45 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_33 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _79 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _77);
    float _81 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _79);
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _85 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _93 = _85 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _95 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[2].x, _91);
    float _97 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _99 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _101 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[2].z, _95);
    float _103 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _97);
    float _105 = _85 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _107 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _99);
    float _109 = _101 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _111 = in.m_35.x;
    float _113 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[0].x, _105);
    float _115 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _107);
    float _117 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[1].x, _93);
    float _119 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _103);
    float _121 = 1.0 / _109;
    float _123 = _115 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _125 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[1].z, _117);
    float _127 = in.m_37.x;
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[0].z, _113);
    float _131 = _81 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _133 = _125 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _135 = in.m_37.y;
    float _137 = _119 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _139 = _129 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = _123 * _121;
    float _143 = -_131;
    float _145 = fma(_133, _141, _143);
    float _147 = -_137;
    float _149 = fma(_139, _141, _147);
    float _151 = _145 * _145;
    float _153 = -_111;
    float _155 = _153 + 1.0;
    float _157 = fma(_149, _149, _151);
    float _159 = _155 * _155;
    float _161 = sqrt(_157);
    float _163 = fma(_159, 0.300000011920928955078125, _127);
    float _165 = fma(_159, 0.300000011920928955078125, _135);
    float _167 = _163 * 0.4000000059604644775390625;
    float _169 = _165 * (-0.0500000007450580596923828125);
    float _171 = _161 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _173 = fma(_171, 0.0500000007450580596923828125, _167);
    float _175 = fma(_171, 0.02999999932944774627685546875, _169);
    float2 _527 = float2(0.0, _173);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_527, float2(0.0), isnan(_527))).w;
    float2 _536 = float2(0.0, _175);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_536, float2(0.0), isnan(_536))).w;
    float _181 = in.m_39.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_39.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_41.x;
    float _195 = in.m_43.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_45.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _83 * _185;
    float _209 = _83 * _191;
    float _211 = in.m_47.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = 1.0 / _193;
    float _219 = _207 + (-0.5);
    float _221 = _209 + (-0.5);
    float _223 = _219 * _219;
    float _225 = fma(_221, _221, _223);
    float _227 = sqrt(_225);
    float _229 = _227 * 2.22222232818603515625;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_231, -2.0, 3.0);
    float _235 = _231 * _231;
    float _237 = _233 * _235;
    float _239 = _161 * _217;
    float _241 = _83 * _199;
    float _243 = -_241;
    float _245 = _243 + 1.0;
    float _247 = _177 + _179;
    float _249 = _247 * 0.5;
    bool _253 = _249 >= _245;
    bool _255 = isnan(_249);
    bool _257 = _253 || _255;
    bool _259 = isnan(_245);
    bool _261 = _257 || _259;
    float _263 = _83 * _215;
    float _265 = _83 * _205;
    bool _267 = _239 < 0.800000011920928955078125;
    bool _269 = _267 && _261;
    float _271 = float(_269);
    float _273 = _271 * _263;
    float _275 = _273 * _237;
    float _277 = 0.0 + _275;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _279 * _265;
    bool _283 = _281 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _285 = isnan(_281);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _291 = _287 || _289;
    if (!_291)
    {
        discard_fragment();
    }
    if (!_291)
    {
        out.m_50.x = (*spvDescriptorSet0.fp_c9)._m0[107].x;
        out.m_50.y = (*spvDescriptorSet0.fp_c9)._m0[107].y;
        out.m_50.z = (*spvDescriptorSet0.fp_c9)._m0[107].z;
        out.m_50.w = _275;
        return out;
    }
    float _293 = 0.0 + _281;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    out.m_50.x = (*spvDescriptorSet0.fp_c9)._m0[107].x;
    out.m_50.y = (*spvDescriptorSet0.fp_c9)._m0[107].y;
    out.m_50.z = (*spvDescriptorSet0.fp_c9)._m0[107].z;
    out.m_50.w = _295;
    return out;
}

