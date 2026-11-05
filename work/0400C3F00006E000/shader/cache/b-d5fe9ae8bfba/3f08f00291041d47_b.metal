#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_30 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_36 [[user(locn3)]];
    float4 m_32 [[user(locn4)]];
    float4 m_28 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_28.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_28.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_28.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_30.w;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_32.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_34.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _48;
    float _88 = _86 * _54;
    float _90 = _86 * _60;
    float _92 = _86 * _66;
    float _94 = _88 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _96 = _88 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _98 = _88 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _100 = _88 * (*spvDescriptorSet0.fp_c8)._m0[3].y;
    float _102 = fma(_90, (*spvDescriptorSet0.fp_c8)._m0[1].x, _94);
    float _104 = fma(_90, (*spvDescriptorSet0.fp_c8)._m0[0].x, _96);
    float _106 = fma(_90, (*spvDescriptorSet0.fp_c8)._m0[2].x, _98);
    float _108 = fma(_90, (*spvDescriptorSet0.fp_c8)._m0[3].x, _100);
    float _110 = fma(_92, (*spvDescriptorSet0.fp_c8)._m0[1].z, _102);
    float _112 = fma(_92, (*spvDescriptorSet0.fp_c8)._m0[0].z, _104);
    float _114 = fma(_92, (*spvDescriptorSet0.fp_c8)._m0[2].z, _106);
    float _116 = fma(_92, (*spvDescriptorSet0.fp_c8)._m0[3].z, _108);
    float _118 = _110 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _120 = _112 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _122 = _114 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _124 = _116 + (*spvDescriptorSet0.fp_c8)._m0[3].w;
    float _126 = _118 * (*spvDescriptorSet0.fp_c8)._m0[4].y;
    float _128 = _118 * (*spvDescriptorSet0.fp_c8)._m0[5].y;
    float _130 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[4].x, _126);
    float _132 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[5].x, _128);
    float _134 = fma(_122, (*spvDescriptorSet0.fp_c8)._m0[4].z, _130);
    float _136 = fma(_122, (*spvDescriptorSet0.fp_c8)._m0[5].z, _132);
    float _138 = fma(_124, (*spvDescriptorSet0.fp_c8)._m0[4].w, _134);
    float _140 = fma(_124, (*spvDescriptorSet0.fp_c8)._m0[5].w, _136);
    float _142 = abs(_138);
    float _144 = abs(_140);
    float _146 = precise::max(_142, _144);
    bool _150 = _146 >= 16.0;
    float _152 = _140;
    float _154 = _138;
    int _157 = as_type<int>(_146);
    if (_150)
    {
        float _159 = _140 * 0.0625;
        _152 = _159;
    }
    float _161 = _152;
    if (_150)
    {
        float _163 = _138 * 0.0625;
        _154 = _163;
    }
    float _165 = _154;
    float _167 = abs(_161);
    bool _169 = _167 != 0.0;
    bool _171 = isnan(_167);
    bool _173 = _169 || _171;
    bool _175 = isnan(0.0);
    bool _177 = _173 || _175;
    float _179 = abs(_165);
    bool _181 = _179 == 0.0;
    float _183 = abs(_165);
    bool _185 = _183 == 0.0;
    bool _187 = !_177;
    bool _189 = _185 && _187;
    bool _191 = false;
    if (_189)
    {
        bool _193 = as_type<int>(_165) >= 0;
        _191 = _193;
    }
    bool _195 = _191;
    int _197 = _195 ? (-1) : 0;
    if (_189)
    {
        int _199 = _195 ? 0 : 1078530011;
        _157 = _199;
    }
    int _201 = _157;
    int _203 = _201;
    if (_189)
    {
        int _205 = int(0x80000000) & as_type<int>(_161);
        int _207 = _201 | _205;
        _203 = _207;
    }
    int _209 = _203;
    bool _211 = !_177;
    bool _213 = _211 && _181;
    int _215 = _209;
    float _217 = as_type<float>(_209);
    if (!_213)
    {
        float _219 = abs(_161);
        bool _221 = _219 != as_type<float>(0x7f800000u /* inf */);
        bool _223 = isnan(_219);
        bool _225 = _221 || _223;
        bool _227 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _229 = _225 || _227;
        float _231 = abs(_165);
        bool _233 = _231 == as_type<float>(0x7f800000u /* inf */);
        float _235 = abs(_165);
        bool _237 = _235 == as_type<float>(0x7f800000u /* inf */);
        bool _239 = !_229;
        bool _241 = _237 && _239;
        if (_241)
        {
            bool _243 = as_type<int>(_165) >= 0;
            _197 = _243 ? (-1) : 0;
        }
        int _245 = _197;
        if (_241)
        {
            _215 = 1075235812;
        }
        int _247 = _215;
        int _249 = _247;
        if (_241)
        {
            int _251 = ~_245;
            int _253 = (_251 != 0) ? _247 : 1061752795;
            _249 = _253;
        }
        int _255 = _249;
        float _257 = as_type<float>(_255);
        if (_241)
        {
            int _259 = int(0x80000000) & as_type<int>(_161);
            int _261 = _255 | _259;
            _257 = as_type<float>(_261);
        }
        float _263 = _257;
        bool _265 = !_229;
        bool _267 = _265 && _233;
        _217 = _263;
        if (!_267)
        {
            float _269 = abs(_161);
            float _271 = abs(_165);
            float _273 = precise::max(_269, _271);
            float _275 = abs(_161);
            float _277 = abs(_165);
            float _279 = precise::min(_275, _277);
            float _281 = 1.0 / _273;
            float _283 = abs(_161);
            float _285 = abs(_165);
            bool _287 = _283 > _285;
            bool _289 = as_type<int>(_165) >= 0;
            float _291 = _279 * _281;
            float _293 = abs(_161);
            float _295 = abs(_165);
            float _297 = _293 + _295;
            int _299 = as_type<int>(_161) & int(0x80000000);
            float _301 = _291 * _291;
            bool _303 = _297 > as_type<float>(0x7f800000u /* inf */);
            bool _305 = isnan(_297);
            bool _307 = _303 || _305;
            bool _309 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _311 = _307 || _309;
            float _313 = _301 + 11.33538818359375;
            float _315 = fma(_301, _313, 28.84246826171875);
            float _317 = fma(_301, _315, 19.6966705322265625);
            float _319 = fma(_301, -0.82336294651031494140625, -5.674867153167724609375);
            float _321 = fma(_301, _319, -6.565555095672607421875);
            float _323 = 1.0 / _317;
            float _325 = _301 * _321;
            float _327 = _291 * _325;
            float _329 = fma(_327, _323, _291);
            float _331 = _329;
            _217 = _297;
            if (_287)
            {
                float _333 = -_329;
                float _335 = _333 + 1.57079637050628662109375;
                _331 = _335;
            }
            float _337 = _331;
            int _339 = as_type<int>(_337);
            if (!_289)
            {
                float _341 = -_337;
                float _343 = _341 + 3.1415927410125732421875;
                _339 = as_type<int>(_343);
            }
            int _345 = _339;
            if (!_311)
            {
                int _347 = _299 | _345;
                _217 = as_type<float>(_347);
            }
        }
    }
    float _349 = _217;
    float _351 = _349 * 512.0;
    float _353 = in.m_36.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _86 * _72;
    float _361 = _86 * _78;
    float _363 = _351 * 0.15915493667125701904296875;
    float _365 = _359 * _361;
    float _367 = _86 * _84;
    float _369 = _363 * 6.283185482025146484375;
    float _371 = sin(_369);
    float _373 = _365 * _367;
    float _375 = fma(_371, 0.5, 0.5);
    float _377 = _375 * _375;
    float _379 = _86 * _357;
    float _381 = _373 * _377;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _383 * _379;
    bool _387 = _385 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _389 = isnan(_385);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _395 = _391 || _393;
    float _397 = in.m_30.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_30.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_30.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    if (!_395)
    {
        discard_fragment();
    }
    float _415 = _86 * _401;
    float _417 = _86 * _407;
    float _419 = _86 * _413;
    if (!_395)
    {
        out.m_39.x = _415;
        out.m_39.y = _417;
        out.m_39.z = _419;
        out.m_39.w = _383;
        return out;
    }
    float _421 = _417 * 0.715200006961822509765625;
    bool _423 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _425 = 0.0 + _385;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = fma(_415, 0.2125999927520751953125, _421);
    float _431 = fma(_419, 0.072200000286102294921875, _429);
    float _433 = 1.0 / _431;
    float _435 = _433 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = fma(_437, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _441 = _415 * _439;
    float _443 = _417 * _439;
    float _445 = _419 * _439;
    float _447 = _439;
    if (!_423)
    {
        _447 = _427;
    }
    float _449 = _447;
    bool _451 = !_423;
    float _453 = _449;
    if (!_451)
    {
        float _455 = in.m_41.w;
        float _457 = gl_FragCoord.w;
        float _459 = _455 * _457;
        float _461 = in.m_41.z;
        float _463 = gl_FragCoord.w;
        float _465 = _461 * _463;
        float _467 = _86 * _459;
        float _469 = _86 * _465;
        float _471 = 1.0 / _467;
        float _473 = _469 * _471;
        float _475 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _477 = fma(_473, (*spvDescriptorSet0.fp_c8)._m0[30].w, _475);
        float _479 = 1.0 / _477;
        float _481 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _483 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _485 = fma(_479, _481, _483);
        float _487 = _485 * 8.0;
        float _489 = precise::clamp(_487, 0.0, 1.0);
        float _491 = _427 * _489;
        _453 = _491;
    }
    float _493 = _453;
    float _495 = 0.0 + _493;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    out.m_39.x = _441;
    out.m_39.y = _443;
    out.m_39.z = _445;
    out.m_39.w = _497;
    return out;
}

