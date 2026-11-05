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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _89 * _89;
    float _97 = fma(_91, _91, _95);
    float _99 = fma(_93, _93, _97);
    float _101 = rsqrt(_99);
    float _103 = _89 * _101;
    float _105 = _91 * _101;
    float _107 = _93 * _101;
    float _109 = _103 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _113 = _87 * _85;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].x, _109);
    float _117 = _87 * _79;
    float _119 = fma(_111, 0.5, 0.5);
    float _121 = fma(_107, (*spvDescriptorSet0.fp_c5)._m0[2].z, _115);
    float _123 = fma(_121, 0.5, 0.5);
    float2 _439 = float2(_117, _113);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_439, float2(0.0), isnan(_439))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _458 = float2(_123, _119);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_458, float2(0.0), isnan(_458))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = 0.0 + _111;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = in.m_43.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = abs(_154);
    float _164 = log2(_162);
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _168 = _166 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _170 = _164 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _172 = exp2(_170);
    float _174 = _87 * _150;
    bool _178 = _111 >= _174;
    float _180 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _182 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[12].z, _180);
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = _174;
    float _188 = (*spvDescriptorSet0.fp_c4)._m0[12].z;
    if (!_178)
    {
        _186 = 0.0;
    }
    float _190 = _186;
    float _192 = 0.0;
    float _194 = _190;
    if (!_178)
    {
        _188 = 0.0;
        _192 = 0.0;
    }
    float _196 = _188;
    float _198 = _192;
    bool _200 = !_178;
    float _202 = _198;
    float _204 = _196;
    if (!_200)
    {
        float _206 = in.m_45.x;
        float _208 = gl_FragCoord.w;
        float _210 = _206 * _208;
        float _212 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _214 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _212;
        float _216 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _218 = 1.0 / _214;
        float _220 = log2(_216);
        float _222 = _87 * _210;
        float _224 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _226 = _222 + _224;
        float _228 = _226 * _218;
        float _230 = _220 * 0.1155245304107666015625;
        float _232 = sqrt(_228);
        float2 _589 = float2(_230, _232);
        float3 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).xyz;
        float _238 = _236.x;
        float _240 = _236.y;
        float _242 = _236.z;
        _202 = _238;
        _204 = _240;
        _194 = _242;
    }
    float _244 = _202;
    float _246 = _204;
    float _248 = _194;
    float _250 = _138 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _252 = _140 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _254 = _142 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _256 = fma(_172, _168, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _258 = _250 * _244;
    float _260 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _262 = _250 + _260;
    float _264 = _252 * _246;
    float _266 = _144 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _272 = _252 + _270;
    float _274 = _254 * _248;
    float _276 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _278 = _254 + _276;
    float _280 = _184 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _282 = fma(_268, _262, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _284 = fma(_268, _272, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _286 = fma(_268, _278, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _288 = _87 * _160;
    float _290 = fma(_258, _280, _282);
    float _292 = fma(_264, _280, _284);
    float _294 = fma(_274, _280, _286);
    float _296 = _290 * _134;
    float _298 = _292 * _134;
    float _300 = _294 * _134;
    float _302 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[13].y, _296);
    float _304 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[13].y, _298);
    float _306 = fma(_132, (*spvDescriptorSet0.fp_c4)._m0[13].y, _300);
    float _308 = _256 * _288;
    float _310 = -_302;
    float _312 = _310 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _314 = -_304;
    float _316 = _314 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _318 = -_306;
    float _320 = _318 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _322 = fma(_308, _312, _302);
    float _324 = fma(_308, _316, _304);
    float _326 = fma(_308, _320, _306);
    out.m_48.x = _322;
    out.m_48.y = _324;
    out.m_48.z = _326;
    out.m_48.w = 1.0;
    return out;
}

