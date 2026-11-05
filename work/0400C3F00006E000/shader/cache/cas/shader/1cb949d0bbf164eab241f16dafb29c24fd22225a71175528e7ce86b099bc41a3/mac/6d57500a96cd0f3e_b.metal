#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _352 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_352, float2(0.0), isnan(_352))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = _55 * _76;
    float _80 = _66 * _78;
    float _82 = _64 * _78;
    float _84 = _68 * _78;
    float _86 = _80 * 0.586600005626678466796875;
    bool _90 = _80 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _92 = isnan(_80);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _98 = _94 || _96;
    bool _100 = _82 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _102 = isnan(_82);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _108 = _104 || _106;
    float _110 = fma(_82, 0.29890000820159912109375, _86);
    bool _112 = !_98;
    float _114 = _112 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _116 = !_108;
    float _118 = _116 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _120 = fma(_84, 0.1143999993801116943359375, _110);
    bool _122 = _84 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _124 = isnan(_84);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _130 = _126 || _128;
    float _132 = _120 * (-1.44269502162933349609375);
    bool _134 = !_108;
    float _136 = _134 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _138 = !_130;
    float _140 = _138 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _142 = exp2(_132);
    float _144 = fma(_82, _136, _118);
    bool _146 = !_98;
    float _148 = _146 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _150 = fma(_80, _148, _114);
    bool _152 = !_130;
    float _154 = _152 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _156 = 1.0 / _144;
    float _158 = -_142;
    float _160 = _158 + 1.0;
    float _162 = fma(_84, _154, _140);
    float _164 = 1.0 / _150;
    bool _166 = !_98;
    float _168 = _166 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _170 = _160 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _172 = isnan(_160);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _178 = _174 || _176;
    bool _180 = !_98;
    float _182 = _180 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _184 = 1.0 / _162;
    float _186 = fma(_80, _168, _182);
    bool _188 = !_108;
    float _190 = _188 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _192 = !_108;
    float _194 = _192 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _196 = !_130;
    float _198 = _196 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _200 = !_130;
    float _202 = _200 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _204 = _80;
    if (!_178)
    {
        _204 = _160;
    }
    float _206 = _204;
    bool _208 = !_178;
    float _210 = _206;
    if (!_208)
    {
        float _212 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _214 = _160 + _212;
        float _216 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _218 = spvFAdd(_216, 1.00000095367431640625);
        float _220 = 1.0 / _218;
        float _222 = _214 * _220;
        float _224 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _228 = -_222;
        float _230 = _228 + 1.0;
        float _232 = _226 * _220;
        float _234 = _232 + (-1.0);
        float _236 = abs(_230);
        float _238 = log2(_236);
        float _240 = _232 * _222;
        float _242 = _238 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _244 = exp2(_242);
        float _246 = fma(_234, _244, 1.0);
        float _248 = 1.0 / _246;
        float _250 = _240 * _248;
        float _252 = fma(_218, _250, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _210 = _252;
    }
    float _254 = _210;
    float _256 = -_160;
    float _258 = _256 + _254;
    float _260 = fma(_82, _190, _194);
    float _262 = _186 * _164;
    float _264 = fma(_84, _198, _202);
    float _266 = _258 + 1.0;
    float _268 = _260 * _156;
    float _270 = _262 * 0.586600005626678466796875;
    float _272 = _264 * _184;
    float _274 = abs(_266);
    float _276 = log2(_274);
    float _278 = fma(_268, 0.29890000820159912109375, _270);
    float _280 = fma(_272, 0.1143999993801116943359375, _278);
    float _282 = spvFAdd(_280, 9.9999999747524270787835121154785e-07);
    float _284 = 1.0 / _282;
    float _286 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _288 = exp2(_286);
    float _290 = fma(_268, _284, -1.0);
    float _292 = fma(_262, _284, -1.0);
    float _294 = fma(_272, _284, -1.0);
    float _296 = fma(_288, _290, 1.0);
    float _298 = fma(_288, _292, 1.0);
    float _300 = fma(_288, _294, 1.0);
    float _302 = _296 * _254;
    float _304 = _298 * _254;
    float _306 = _300 * _254;
    float _308 = precise::max(0.0, _302);
    float _310 = precise::max(0.0, _304);
    float _312 = precise::max(0.0, _306);
    float _314 = precise::min(_308, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _316 = precise::min(_310, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _318 = precise::min(_312, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _314;
    out.m_34.y = _316;
    out.m_34.z = _318;
    out.m_34.w = _70;
    return out;
}

