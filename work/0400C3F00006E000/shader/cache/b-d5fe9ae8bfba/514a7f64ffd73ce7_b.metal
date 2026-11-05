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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    float2 _412 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).x;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _56;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_66;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_74;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_74)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    uint _106 = min(_104, 2u);
    int _108 = int(_106) << 2;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    bool _118 = as_type<int>(_116) == 416;
    if (!_118)
    {
        bool _120 = as_type<int>(_116) == 688;
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
            float _126 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _150;
            _162 = _154;
            _164 = _152;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _190;
            _162 = _194;
            _164 = _192;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _222;
            _162 = _226;
            _164 = _224;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _76 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _240 = float(int(_104));
    float _242 = 1.0 / _230;
    float _244 = _76 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _246 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _238);
    float _248 = _76 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _250 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _244);
    float _252 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _246);
    float _254 = rint(_240);
    float _256 = precise::max(_254, 0.0);
    uint _258 = uint(_256);
    uint _260 = clamp(_258, 0u, 65535u);
    float _262 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _250);
    float _264 = _252 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _266 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _248);
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _270 = _262 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _272 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _266);
    float _274 = 1.0 / _264;
    float _276 = _242 * _232;
    float _278 = _242 * _234;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _286 = _242 * _236;
    float _288 = fma(_280, _284, _276);
    float _290 = -_284;
    float _292 = fma(_280, _290, _276);
    float _294 = fma(_280, _268, _286);
    float _296 = -_268;
    float _298 = fma(_280, _296, _286);
    float _300 = _270 * _274;
    float _302 = _282 * _274;
    float3 _931 = float3(_276, _294, float(int(_260)));
    float3 _935 = select(_931, float3(0.0), isnan(_931));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _935.xy, uint(rint(_935.z)), _280);
    float3 _944 = float3(_288, _294, float(int(_260)));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _946.xy, uint(rint(_946.z)), _280);
    float3 _955 = float3(_292, _294, float(int(_260)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _957.xy, uint(rint(_957.z)), _280);
    float3 _966 = float3(_288, _286, float(int(_260)));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _968.xy, uint(rint(_968.z)), _280);
    float3 _977 = float3(_276, _286, float(int(_260)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _979.xy, uint(rint(_979.z)), _280);
    float2 _985 = float2(_302, _300);
    float2 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_985, float2(0.0), isnan(_985))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_985, float2(0.0), isnan(_985))).xy;
    float _318 = _316.x;
    float _320 = _316.y;
    float3 _1000 = float3(_292, _286, float(int(_260)));
    float3 _1002 = select(_1000, float3(0.0), isnan(_1000));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1002.xy, uint(rint(_1002.z)), _280);
    float3 _1011 = float3(_288, _298, float(int(_260)));
    float3 _1013 = select(_1011, float3(0.0), isnan(_1011));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1013.xy, uint(rint(_1013.z)), _280);
    float3 _1022 = float3(_276, _298, float(int(_260)));
    float3 _1024 = select(_1022, float3(0.0), isnan(_1022));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1024.xy, uint(rint(_1024.z)), _280);
    float3 _1033 = float3(_292, _298, float(int(_260)));
    float3 _1035 = select(_1033, float3(0.0), isnan(_1033));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1035.xy, uint(rint(_1035.z)), _280);
    float _330 = _76 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _332 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _330);
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _332);
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _338 = precise::min(_336, 1.0);
    float _340 = -_66;
    float _342 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _344 = _340 + _342;
    float _346 = -_66;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _350 = _346 + _348;
    float _352 = _344 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _306 + _304;
    float _358 = _356 + _308;
    float _360 = -_318;
    float _362 = fma(_360, _318, _320);
    float _364 = -_318;
    float _366 = _338 + _364;
    float _368 = _358 + _310;
    float _370 = fma(_366, _366, _362);
    float _372 = _368 + _312;
    bool _374 = _366 <= 0.001000000047497451305389404296875;
    float _376 = float(_374);
    float _378 = _372 + _322;
    float _380 = 1.0 / _370;
    float _382 = _378 + _324;
    float _384 = _362 * _380;
    float _386 = _382 + _326;
    float _388 = _350 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = precise::max(_384, _376);
    float _394 = _386 + _328;
    float _396 = precise::min(_392, 1.0);
    float _398 = fma(_394, 0.111111111938953399658203125, _354);
    float _400 = _396 + _390;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _398;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _400;
    return out;
}

