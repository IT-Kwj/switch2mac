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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_37.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _331 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_331, float2(0.0), isnan(_331))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _63 * _81;
    float _97 = _63 * _87;
    float _99 = _63 * _93;
    float _101 = _95 * _95;
    float _103 = fma(_97, _97, _101);
    float _105 = fma(_99, _99, _103);
    float _107 = rsqrt(_105);
    float _109 = _107 * (*spvDescriptorSet0.fp_c4)._m0[7].w;
    float _111 = _97 * _109;
    float _113 = _99 * _109;
    float _115 = _111 * _111;
    float _117 = _113 * _113;
    float _119 = (*spvDescriptorSet0.fp_c4)._m0[5].w + (-220.0);
    float _121 = _115 + _117;
    float _123 = precise::max(0.0, _119);
    float _125 = sqrt(_121);
    float _127 = -_109;
    float _129 = -_123;
    float _131 = fma(_95, _127, _129);
    bool _135 = _125 > (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _137 = _123;
    float _139 = _131;
    float _141 = _115;
    float _143 = _117;
    float _145 = _113;
    if (!_135)
    {
        _137 = _111;
    }
    float _147 = _137;
    bool _149 = !_135;
    float _151 = _147;
    if (!_149)
    {
        float _153 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _155 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _157 = _125 + _155;
        float _159 = _131 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _161 = rsqrt(_121);
        float _163 = _157 * _153;
        float _165 = _163 * 0.15915493667125701904296875;
        float _167 = _165 * 6.283185482025146484375;
        float _169 = sin(_167);
        float _171 = _165 * 6.283185482025146484375;
        float _173 = cos(_171);
        float _175 = fma(_169, _159, (*spvDescriptorSet0.fp_c3)._m0[5].x);
        float _177 = _161 * _175;
        float _179 = _173 + (-1.0);
        float _181 = _113 * _177;
        float _183 = _179 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _185 = _111 * _177;
        float _187 = _181 * _181;
        float _189 = fma(_131, _173, _183);
        float _191 = _185 * _185;
        _139 = _189;
        _141 = _191;
        _143 = _187;
        _151 = _185;
        _145 = _181;
    }
    float _193 = _139;
    float _195 = _141;
    float _197 = _143;
    float _199 = _151;
    float _201 = _145;
    float _203 = fma(_193, _193, _195);
    float _205 = _203 + _197;
    float _207 = rsqrt(_205);
    float _209 = _207 * _193;
    float _211 = _207 * _199;
    float _213 = _207 * _201;
    float _215 = _209 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _217 = -_215;
    float _219 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[1].x, _217);
    float _221 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[1].z, _219);
    float _223 = fma(_221, -0.5, 0.5);
    float _225 = fma(_221, 0.5, 0.5);
    float _227 = fma(_225, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _229 = sqrt(_223);
    float _231 = fma(_225, _227, -0.212114393711090087890625);
    float _233 = fma(_225, _231, 1.570728778839111328125);
    float _235 = fma(_209, -0.5, 0.5);
    float _237 = _229 * 0.636619746685028076171875;
    float _239 = -_233;
    float _241 = fma(_237, _239, 1.0);
    float _243 = fma(_73, 2.0, -1.0);
    float _245 = fma(_75, 2.0, -1.0);
    float _247 = fma(_243, (*spvDescriptorSet0.fp_c5)._m0[0].x, _65);
    float _249 = fma(_245, (*spvDescriptorSet0.fp_c5)._m0[0].y, _67);
    float2 _601 = float2(_241, _235);
    float4 _252 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).xyzw;
    float _254 = _252.x;
    float _256 = _252.y;
    float _258 = _252.z;
    float _260 = _252.w;
    float2 _617 = float2(_247, _249);
    float4 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_617, float2(0.0), isnan(_617))).xyzw;
    float _264 = _262.x;
    float _266 = _262.y;
    float _268 = _262.z;
    float _270 = _262.w;
    float _272 = _260 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _278 = _254 + _276;
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _282 = _256 + _280;
    float _284 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _286 = _258 + _284;
    float _288 = fma(_274, _278, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _290 = fma(_274, _282, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _292 = fma(_274, _286, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _294 = fma(_288, _270, _264);
    float _296 = fma(_290, _270, _266);
    float _298 = fma(_292, _270, _268);
    out.m_42.x = _294;
    out.m_42.y = _296;
    out.m_42.z = _298;
    out.m_42.w = 1.0;
    return out;
}

