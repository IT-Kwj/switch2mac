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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _390 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _54;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_64;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = in.m_38.x;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _64 * _106;
    bool _118 = as_type<int>(_114) == 416;
    if (!_118)
    {
        bool _120 = as_type<int>(_114) == 688;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _154;
            _162 = _152;
            _164 = _150;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _194;
            _162 = _192;
            _164 = _190;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _226;
            _162 = _224;
            _164 = _222;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _240 = 1.0 / _230;
    float _242 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _244 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _246 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[15].x, _238);
    float _248 = float(int(_100));
    float _250 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[12].x, _242);
    float _252 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _246);
    float _254 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _250);
    float _256 = rint(_248);
    float _258 = precise::max(_256, 0.0);
    uint _260 = uint(_258);
    uint _262 = clamp(_260, 0u, 65535u);
    float _264 = _252 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _266 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _244);
    float _268 = _254 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _270 = _240 * _232;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _266);
    float _276 = 1.0 / _264;
    float _278 = _240 * _234;
    float _280 = _272 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _282 = _274 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _284 = _240 * _236;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _288 = _280 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _290 = fma(_288, -0.5, _278);
    float _292 = _268 * _276;
    float _294 = _282 * _276;
    float _296 = fma(_286, 0.5, _284);
    float _298 = fma(_286, -0.5, _284);
    float _300 = fma(_288, 0.5, _278);
    float2 _901 = float2(_292, _294);
    float2 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_901, float2(0.0), isnan(_901))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_901, float2(0.0), isnan(_901))).xy;
    float _306 = _304.x;
    float _308 = _304.y;
    float3 _917 = float3(_298, _300, float(int(_262)));
    float3 _921 = select(_917, float3(0.0), isnan(_917));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _921.xy, uint(rint(_921.z)), _272);
    float3 _930 = float3(_296, _300, float(int(_262)));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _932.xy, uint(rint(_932.z)), _272);
    float3 _941 = float3(_296, _290, float(int(_262)));
    float3 _943 = select(_941, float3(0.0), isnan(_941));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _943.xy, uint(rint(_943.z)), _272);
    float3 _952 = float3(_298, _290, float(int(_262)));
    float3 _954 = select(_952, float3(0.0), isnan(_952));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _954.xy, uint(rint(_954.z)), _272);
    float _318 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _320 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[14].x, _318);
    float _322 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _320);
    float _324 = _322 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _326 = precise::min(_324, 1.0);
    float _328 = -_64;
    float _330 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _332 = _328 + _330;
    float _334 = -_306;
    float _336 = fma(_334, _306, _308);
    float _338 = -_306;
    float _340 = _326 + _338;
    float _342 = fma(_340, _340, _336);
    bool _344 = _340 <= 0.001000000047497451305389404296875;
    float _346 = float(_344);
    float _348 = _312 + _310;
    float _350 = 1.0 / _342;
    float _352 = _348 + _314;
    float _354 = _336 * _350;
    float _356 = -_64;
    float _358 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _360 = _356 + _358;
    float _362 = precise::max(_354, _346);
    float _364 = _360 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _352 + _316;
    float _370 = _332 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _372 = precise::clamp(_370, 0.0, 1.0);
    float _374 = precise::min(_362, 1.0);
    float _376 = fma(_368, 0.25, _366);
    float _378 = _374 + _372;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _376;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _378;
    return out;
}

