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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _109 = _101 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _111 = _85 * _83;
    float _113 = fma(_103, (*spvDescriptorSet0.fp_c5)._m0[2].x, _107);
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].z, _113);
    float _117 = fma(_115, -0.5, 0.5);
    float _119 = fma(_115, 0.5, 0.5);
    float _121 = fma(_109, 0.5, 0.5);
    float _123 = fma(_119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _125 = sqrt(_117);
    float _127 = fma(_119, _123, -0.212114393711090087890625);
    float _129 = fma(_119, _127, 1.570728778839111328125);
    float _131 = _125 * 0.636619746685028076171875;
    float _133 = -_129;
    float _135 = fma(_131, _133, 1.0);
    float _137 = _85 * _77;
    float2 _432 = float2(_137, _111);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float2(0.0), isnan(_432))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _451 = float2(_135, _121);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_451, float2(0.0), isnan(_451))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_41.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _168 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[12].z, _166);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _85 * _164;
    bool _176 = _109 >= _172;
    float _178 = _115;
    float _180 = _172;
    if (!_176)
    {
        _178 = 0.0;
    }
    float _182 = _178;
    float _184 = 0.0;
    float _186 = _182;
    if (!_176)
    {
        _184 = 0.0;
        _180 = 0.0;
    }
    float _188 = _184;
    float _190 = _180;
    bool _192 = !_176;
    float _194 = _190;
    float _196 = _188;
    if (!_192)
    {
        float _198 = in.m_43.x;
        float _200 = gl_FragCoord.w;
        float _202 = _198 * _200;
        float _204 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _206 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _204;
        float _208 = fma(_109, 350.80767822265625, 53.62115478515625);
        float _210 = 1.0 / _206;
        float _212 = log2(_208);
        float _214 = _85 * _202;
        float _216 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _218 = _214 + _216;
        float _220 = _212 * 0.1155245304107666015625;
        float _222 = _218 * _210;
        float _224 = sqrt(_222);
        float2 _552 = float2(_220, _224);
        float3 _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_552, float2(0.0), isnan(_552))).xyz;
        float _230 = _228.x;
        float _232 = _228.y;
        float _234 = _228.z;
        _194 = _232;
        _186 = _234;
        _196 = _230;
    }
    float _236 = _194;
    float _238 = _186;
    float _240 = _196;
    float _242 = _152 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _244 = _154 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _246 = _156 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _248 = _158 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _254 = _242 + _252;
    float _256 = _244 * _236;
    float _258 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _260 = _244 + _258;
    float _262 = _246 * _238;
    float _264 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _266 = _246 + _264;
    float _268 = _242 * _240;
    float _270 = _170 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _272 = fma(_250, _254, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _274 = fma(_250, _260, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _276 = fma(_250, _266, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _278 = fma(_268, _270, _272);
    float _280 = fma(_256, _270, _274);
    float _282 = fma(_262, _270, _276);
    float _284 = _278 * _148;
    float _286 = _280 * _148;
    float _288 = _282 * _148;
    float _290 = fma(_142, (*spvDescriptorSet0.fp_c4)._m0[13].y, _284);
    float _292 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[13].y, _286);
    float _294 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _288);
    out.m_46.x = _290;
    out.m_46.y = _292;
    out.m_46.z = _294;
    out.m_46.w = 1.0;
    return out;
}

