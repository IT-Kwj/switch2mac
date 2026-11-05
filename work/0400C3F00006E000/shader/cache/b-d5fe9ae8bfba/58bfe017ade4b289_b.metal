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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_40 [[user(locn6), flat]];
    float4 m_55 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = 1.0 / _66;
    float _110 = rint(_68);
    float _112 = precise::max(_110, 0.0);
    uint _115 = uint(_112);
    uint _117 = clamp(_115, 0u, 65535u);
    float _119 = rint(_70);
    float _121 = precise::max(_119, 0.0);
    uint _123 = uint(_121);
    uint _125 = clamp(_123, 0u, 65535u);
    float _127 = _108 * _76;
    float _129 = _108 * _82;
    float _131 = _108 * _88;
    float _133 = _108 * _94;
    float _135 = _108 * _100;
    float _137 = _108 * _106;
    float3 _585 = float3(_131, _129, float(int(_117)));
    float3 _589 = select(_585, float3(0.0), isnan(_585));
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _589.xy, uint(rint(_589.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _589.xy, uint(rint(_589.z))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float3 _606 = float3(_127, _133, float(int(_125)));
    float3 _608 = select(_606, float3(0.0), isnan(_606));
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _608.xy, uint(rint(_608.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _608.xy, uint(rint(_608.z))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float2 _623 = float2(_135, _137);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_623, float2(0.0), isnan(_623))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float _170 = in.m_46.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_48.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _108 * _174;
    float _184 = _108 * _180;
    float _186 = in.m_46.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_50.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_50.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _148 * _158;
    float _206 = _204 * _168;
    float _208 = _206 * _182;
    float _210 = 0.0 + _208;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _212 * _184;
    bool _218 = _214 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _220 = isnan(_214);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _226 = _222 || _224;
    float _228 = in.m_50.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_46.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_46.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    if (!_226)
    {
        discard_fragment();
    }
    float _246 = _144 * _154;
    float _248 = _142 * _152;
    float _250 = _146 * _156;
    float _252 = _108 * _196;
    float _254 = _246 * _164;
    float _256 = _108 * _190;
    float _258 = _108 * _202;
    float _260 = _248 * _162;
    float _262 = _250 * _166;
    float _264 = _108 * _232;
    float _266 = _108 * _238;
    float _268 = _108 * _244;
    float _270 = -_264;
    float _272 = _256 + _270;
    float _274 = -_252;
    float _276 = _266 + _274;
    float _278 = -_258;
    float _280 = _268 + _278;
    float _282 = fma(_260, _272, _264);
    float _284 = fma(_254, _276, _252);
    float _286 = fma(_262, _280, _258);
    if (!_226)
    {
        out.m_53.x = _282;
        out.m_53.y = _284;
        out.m_53.z = _286;
        out.m_53.w = _208;
        return out;
    }
    float _288 = in.m_55.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = _108 * _292;
    bool _296 = _294 != 1.0;
    bool _298 = isnan(_294);
    bool _300 = _296 || _298;
    bool _302 = isnan(1.0);
    bool _304 = _300 || _302;
    bool _306 = !_304;
    if (!_306)
    {
        float _308 = gl_FragCoord.x;
        float _310 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _312 = _308 / _310;
        float _314 = gl_FragCoord.y;
        float _316 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _318 = _314 / _316;
        float _320 = _294 * 256.0;
        float _322 = trunc(_320);
        int _325 = int(_322);
        float _327 = trunc(_312);
        int _329 = int(_327);
        float _331 = trunc(_318);
        int _333 = int(_331);
        int _335 = _329 + 2;
        int _337 = _335 >> 1;
        uint _339 = uint(int(uint(_333) >> uint(1)));
        int _341 = _337 ^ int(_339);
        int _343 = _341 << 16;
        int _345 = _343 ^ _337;
        int _347 = 983055 & _345;
        int _349 = _347 << 6;
        int _351 = _349 + _347;
        int _353 = _351 & 13369548;
        uint _355 = uint(int(uint(_353) >> uint(3)));
        int _357 = _353 | int(_355);
        uint _359 = uint(int(uint(_325) >> uint(7)));
        int _361 = int(_359) + _325;
        int _363 = _357 & 5570560;
        int _365 = _357 & 85;
        uint _367 = uint(int(uint(_363) >> uint(15)));
        int _369 = int(_367) + _365;
        bool _371 = uint(_361) > uint(_369);
        if (!_371)
        {
            discard_fragment();
        }
        if (!_371)
        {
            out.m_53.x = _282;
            out.m_53.y = _284;
            out.m_53.z = _286;
            out.m_53.w = _214;
            return out;
        }
    }
    float _373 = _284 * 0.715200006961822509765625;
    float _375 = in.m_57.w;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_57.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_57.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = fma(_282, 0.2125999927520751953125, _373);
    float _395 = in.m_57.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = fma(_286, 0.072200000286102294921875, _393);
    bool _403 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _405 = 1.0 / _401;
    float _407 = _405 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = fma(_409, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _413 = _108 * _379;
    float _415 = _108 * _385;
    float _417 = _411 * _413;
    float _419 = 0.0 + _214;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _108 * _391;
    float _425 = _108 * _399;
    float _427 = fma(_286, _417, _415);
    float _429 = fma(_282, _417, _423);
    float _431 = fma(_284, _417, _425);
    float _433 = _415;
    if (!_403)
    {
        _433 = _421;
    }
    float _435 = _433;
    bool _437 = !_403;
    float _439 = _435;
    if (!_437)
    {
        float _441 = in.m_59.w;
        float _443 = gl_FragCoord.w;
        float _445 = _441 * _443;
        float _447 = in.m_59.z;
        float _449 = gl_FragCoord.w;
        float _451 = _447 * _449;
        float _453 = _108 * _445;
        float _455 = _108 * _451;
        float _457 = 1.0 / _453;
        float _459 = _455 * _457;
        float _461 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _463 = fma(_459, (*spvDescriptorSet0.fp_c8)._m0[30].w, _461);
        float _465 = 1.0 / _463;
        float _467 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _469 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _471 = fma(_465, _467, _469);
        float _473 = _471 * 8.0;
        float _475 = precise::clamp(_473, 0.0, 1.0);
        float _477 = _421 * _475;
        _439 = _477;
    }
    float _479 = _439;
    float _481 = 0.0 + _479;
    float _483 = precise::clamp(_481, 0.0, 1.0);
    out.m_53.x = _429;
    out.m_53.y = _431;
    out.m_53.z = _427;
    out.m_53.w = _483;
    return out;
}

